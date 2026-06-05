/datum/outfit/deployment_loadout/intruder/guard
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Conscript Guard"
	display_name = "Conscript Guard"
	desc = "One of the many conscripts stationed at Zewnetrzny Raj, armed with an ID-tagged M4A1 and a cheaply made balaclava."

	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/guard
	suit_store = /obj/item/gun/ballistic/automatic/m4a1/intruder //War has changed... ID tagged soldiers carry ID tagged weapons.
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/balaclava/protective/guard

	back = /obj/item/storage/backpack/halflife/satchel/military

	belt = /obj/item/flashlight/seclite

	l_pocket = /obj/item/hl2/intruder_radio

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 2,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_dex = -2
	extra_str = -2

/datum/outfit/deployment_loadout/intruder/guard/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.setdeploymentfaction(COMBINE_DEPLOYMENT_FACTION)
	GLOB.guards_spawned++

	ADD_TRAIT(H, TRAIT_NO_FOV_EFFECT, OUTFIT_TRAIT) //so you cant see snakes steps walking up to you

	var/guard_preparedness = 0 //Guards are better prepared the more alerts there are, or if you've been killing a lot of their friends. Try to be nonlethal as the intruder maybe, and you know, avoid getting caught.

	guard_preparedness += (GLOB.alert_phases - GLOB.false_alerts)
	guard_preparedness += SSticker.tdm_combine_deaths

	if(4 < guard_preparedness)
		extra_dex = 3
		extra_str = 2
	if(9 < guard_preparedness)
		extra_end = 3
		extra_per = 2
	if(14 < guard_preparedness)
		H.dna.species.stunmod = 0.75
	if(19 < guard_preparedness)
		suit_store = /obj/item/gun/ballistic/automatic/m4a1/intruder/buffed
	if(24 < guard_preparedness)
		extra_end = 6
		extra_dex = 6
		extra_str = 5
		suit = /obj/item/clothing/suit/armor/halflife/kevlar

/obj/item/clothing/suit/armor/halflife/kevlar/guard
	slowdown = 0.25

/obj/item/clothing/mask/balaclava/protective/guard
	desc = "You don't want to get in trouble with your superiors by removing this, but it's pretty hard to see out of these things... what was that noise?"
	actions_types = null //to prevent pulling it up
	modifies_speech = TRUE

	var/static/list/guard_voicelines = list(
		"footprints are these" = 'hl13/sound/voice/solid/footprints.ogg', //in case people dont know grammar i'll leave out the whose
		"What was that noise" = 'hl13/sound/voice/solid/noise.ogg',
		"Whos that" = 'hl13/sound/voice/solid/whosthat.ogg',
		"Just a box" = 'hl13/sound/voice/solid/justabox.ogg',
	)

/obj/item/clothing/mask/balaclava/protective/guard/Initialize()
	. = ..()
	AddComponent(/datum/component/clothing_fov_visor, FOV_270_DEGREES)

/obj/item/clothing/mask/balaclava/protective/guard/handle_speech(mob/living/carbon/source, mob/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in guard_voicelines)
		if(findtext(full_message, lines))
			playsound(source, guard_voicelines[lines], 50, FALSE)
			return // only play the first.

/obj/item/clothing/head/beret/durathread/unitednations/guard
	name = "Squad Leader Beret"
	desc = "An old blue beret, given to squad leaders at Zewnetrzny Raj. It is made with kevlar, and thus provides a small amount of protection to the head. You're too proud to take it off."

/obj/item/clothing/head/beret/durathread/unitednations/guard/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

/obj/item/hl2/intruder_radio
	name = "Alert Radio"
	desc = "A special radio that can trigger an alert phase if an intruder is in your vicinity, allowing reinforcements to arrive and broadcasting your location to all guards. Does not function as an actual radio."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "loadout_picker"
	w_class = WEIGHT_CLASS_SMALL
	var/intruder_detected = FALSE
	var/can_report = TRUE
	var/personal_cooldown = 0

/obj/item/hl2/intruder_radio/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/item/hl2/intruder_radio/process()
	if(!can_report && personal_cooldown < 1 SECONDS && GLOB.alert_cooldown < 1 SECONDS)
		can_report = TRUE
	else if(can_report && GLOB.alert_cooldown >= 1 SECONDS)
		can_report = FALSE
	if(personal_cooldown >= 1 SECONDS)
		personal_cooldown -= 1 SECONDS

/obj/item/hl2/intruder_radio/interact(mob/user)
	. = ..()

	if(isliving(user))
		var/mob/living/livie = user
		if(livie.deployment_faction != COMBINE_DEPLOYMENT_FACTION)
			to_chat(user, span_warning("It would be incredibly stupid for you to raise an alert in a stealth mission.")) //only person besides guards would be snake so funny line
			return

	if(!can_report)
		to_chat(user, span_warning("You cannot report again yet!"))
		return

	intruder_detected = FALSE
	for(var/mob/living/hooman in view(7, user))
		if(hooman.deployment_faction == REBEL_DEPLOYMENT_FACTION)
			intruder_detected = TRUE

	if(do_after(user, 1 SECONDS, src) && intruder_detected)
		GLOB.alert_phases++
		user.do_alert_animation()
		playsound(loc, 'hl13/sound/effects/alert.ogg', 50, FALSE, -5)
		to_chat(user, span_notice("Alert phase has been activated and will end in one minute."))
	else
		to_chat(user, span_warning("You failed to report anything out of the ordinary. You will be able to report again in 20 seconds."))
		personal_cooldown = 20 SECONDS
		can_report = FALSE
