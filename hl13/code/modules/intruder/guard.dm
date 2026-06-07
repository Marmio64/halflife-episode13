#define PHRASE_COOLDOWN (5 SECONDS)

/datum/outfit/deployment_loadout/intruder/guard
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Conscript Guard"
	display_name = "Conscript Guard"
	desc = "One of the many conscripts stationed at Zewnetrzny Raj, armed with an ID-tagged M4A1 and a cheaply made balaclava."
	id_name = "Guard"
	id = /obj/item/card/id/combine_tdm
	accessory = /obj/item/clothing/accessory/combine_dogtags

	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/guard
	suit_store = /obj/item/gun/ballistic/automatic/m4a1/intruder //War has changed... ID tagged soldiers carry ID tagged weapons.
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/balaclava/protective/guard

	back = /obj/item/storage/backpack/halflife/satchel/military

	belt = /obj/item/flashlight/seclite/guard

	l_pocket = /obj/item/hl2/intruder_radio

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 2,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_dex = -2
	extra_str = -2
	extra_per = -3

	nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES, ITEM_SLOT_ID)

/datum/outfit/deployment_loadout/intruder/guard/pre_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	. = ..()

	if(visuals_only) //stops the visual dummy from the admin equip menu from doing stuff like adding a guard spawned number to the total
		return

	H.tired_rate = rand(12,14) //around 3 minutes on average for slowness to kick in
	H.setdeploymentfaction(COMBINE_DEPLOYMENT_FACTION)

	GLOB.guards_spawned++

	H.add_quirk(/datum/quirk/claustrophobia)

	to_chat(H, span_notice("You are a guard! Listen to orders from people in blue berets and find and kill the intruder known as Solid Crab!"))
	to_chat(H, span_notice("While on patrol, look for useful items to keep, and head to a break room for some coffee whenever you get tired."))
	to_chat(H, span_notice("Lastly, keep an eye out for double agents! They're dressed in the same uniform as you, but using your alert radio on them can tell you if they're a traitor or not! Be wary, guessing wrong will make your radio blow up, and even if you guess right your radio will effectively become useless due to a long cooldown."))

	ADD_TRAIT(H, TRAIT_NO_FOV_EFFECT, OUTFIT_TRAIT) //so you cant see snakes steps walking up to you

	var/guard_preparedness = 0 //Guards are better prepared the more alerts there are, or if you've been killing a lot of their friends. Try to be nonlethal as the intruder maybe, and you know, avoid getting caught.

	guard_preparedness += (GLOB.alert_phases - GLOB.false_alerts)
	guard_preparedness += SSticker.tdm_combine_deaths

	if(3 < guard_preparedness)
		extra_dex = 2
		extra_str = 2
	if(6 < guard_preparedness)
		extra_end = 3
		extra_per = 2
	if(9 < guard_preparedness)
		H.dna.species.stunmod = 0.75
		extra_end = 6
		extra_str = 5
	if(12 < guard_preparedness)
		suit_store = /obj/item/gun/ballistic/automatic/m4a1/intruder/buffed
		suit = /obj/item/clothing/suit/armor/halflife/kevlar
	if(15 < guard_preparedness)
		extra_dex = 6
		extra_per = 4
		head = /obj/item/clothing/head/helmet/halflife/military

/obj/item/clothing/suit/armor/halflife/kevlar/guard
	slowdown = 0.25

/obj/item/clothing/mask/balaclava/protective/guard
	desc = "You don't want to get in trouble with your superiors by removing this, but it's pretty hard to see out of these things... what was that noise? If you see a fellow guard not wearing their balaclava, you may want to kill them on sight."
	actions_types = null //to prevent pulling it up
	modifies_speech = TRUE
	voice_change = TRUE
	actions_types = list(/datum/action/item_action/footprints, /datum/action/item_action/box, /datum/action/item_action/who, /datum/action/item_action/noise)

	COOLDOWN_DECLARE(balaclava_cooldown)

	var/fused = TRUE //is the mask fused to the user?

	var/static/list/guard_voicelines = list(
		"footprints are these" = 'hl13/sound/voice/solid/footprints.ogg', //in case people dont know grammar i'll leave out the whose
		"What was that noise" = 'hl13/sound/voice/solid/noise.ogg',
		"Whos that" = 'hl13/sound/voice/solid/whosthat.ogg',
		"Just a box" = 'hl13/sound/voice/solid/justabox.ogg',
		"I heard something" = 'hl13/sound/voice/solid/heardsomething.ogg',
		"hahaha" = 'hl13/sound/voice/solid/hahaha.ogg',
	)

/obj/item/clothing/mask/balaclava/protective/guard/Initialize()
	. = ..()
	AddComponent(/datum/component/clothing_fov_visor, FOV_270_DEGREES)
	if(fused)
		ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

/obj/item/clothing/mask/balaclava/protective/guard/handle_speech(mob/living/carbon/source, mob/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in guard_voicelines)
		if(findtext(full_message, lines))
			playsound(source, guard_voicelines[lines], 50, FALSE)
			return // only play the first.

/obj/item/clothing/mask/balaclava/protective/guard/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/footprints))
		footprints()
	if(istype(action, /datum/action/item_action/box))
		box()
	if(istype(action, /datum/action/item_action/who))
		who()
	if(istype(action, /datum/action/item_action/noise))
		noise()
	if(istype(action, /datum/action/item_action/adjust_mask))
		adjust_mask()

/datum/action/item_action/footprints
	name = "Whose footprints are these?"

/obj/item/clothing/mask/balaclava/protective/guard/verb/footprints()
	set category = "Object"
	set name = "Whose footprints are these?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, balaclava_cooldown))
		return

	COOLDOWN_START(src, balaclava_cooldown, PHRASE_COOLDOWN)

	usr.say("Whose footprints are these?", forced = src.name)

/datum/action/item_action/box
	name = "Just a box..."

/obj/item/clothing/mask/balaclava/protective/guard/verb/box()
	set category = "Object"
	set name = "Just a box..."
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, balaclava_cooldown))
		return

	COOLDOWN_START(src, balaclava_cooldown, PHRASE_COOLDOWN)

	usr.say("Just a box...", forced = src.name)

/datum/action/item_action/who
	name = "Whos that?!"

/obj/item/clothing/mask/balaclava/protective/guard/verb/who()
	set category = "Object"
	set name = "Whos that?!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, balaclava_cooldown))
		return

	COOLDOWN_START(src, balaclava_cooldown, PHRASE_COOLDOWN)

	usr.say("Whos that?!", forced = src.name)

/datum/action/item_action/noise
	name = "What was that noise?"

/obj/item/clothing/mask/balaclava/protective/guard/verb/noise()
	set category = "Object"
	set name = "What was that noise?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, balaclava_cooldown))
		return

	COOLDOWN_START(src, balaclava_cooldown, PHRASE_COOLDOWN)

	usr.say("What was that noise?", forced = src.name)

/datum/action/item_action/adjust_mask
	name = "Adjust Mask"

/obj/item/clothing/mask/balaclava/protective/guard/verb/adjust_mask()
	set category = "Object"
	set name = "Adjust Mask"
	set src in usr
	if(!isliving(usr) || !can_use(usr))
		return

	adjust_visor()

/obj/item/clothing/mask/balaclava/protective/guard/double_agent
	desc = "This hard to see balaclava disguises your identity as a double agent."

/obj/item/clothing/head/beret/durathread/unitednations/guard
	name = "Squad Leader Beret"
	desc = "An old blue beret, given to squad leaders at Zewnetrzny Raj. It is made with kevlar, and thus provides a small amount of protection to the head. You're too proud to take it off."

/obj/item/clothing/head/beret/durathread/unitednations/guard/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

/obj/item/flashlight/seclite/guard
	name = "battery-powered combine maglite"
	desc = "A heavy and robust combine made flashlight. Needs to have it's battery replaced once in a while. Maybe a squad leader has some to spare, or there might be some around the base?"
	var/fuel = 60 SECONDS

/obj/item/flashlight/seclite/guard/examine(mob/user)
	. = ..()
	. += span_notice("You'd say this flashlight has about [fuel/10] seconds of charge remaining.")

/obj/item/flashlight/seclite/guard/process(seconds_per_tick)
	if(fuel > 0)
		fuel -= 1 SECONDS
	check_fuel()

/obj/item/flashlight/seclite/guard/proc/check_fuel(seconds_per_tick)
	if(45 SECONDS < fuel)
		set_light_range(4)
		set_light_power(0.55)
		update_brightness()
	else if(30 SECONDS < fuel)
		set_light_range(4)
		set_light_power(0.5)
		update_brightness()
	else if(15 SECONDS < fuel)
		set_light_range(3)
		set_light_power(0.4)
		update_brightness()
	else if(0 < fuel)
		set_light_range(2)
		set_light_power(0.3)
		update_brightness()

	if(!fuel || !light_on)
		set_light_range(0)
		set_light_power(0)
		set_light_on(FALSE)
		STOP_PROCESSING(SSobj, src)

/obj/item/flashlight/seclite/guard/toggle_light(mob/user)
	playsound(src, light_on ? sound_off : sound_on, 40, TRUE)
	if(!COOLDOWN_FINISHED(src, disabled_time))
		if(user)
			balloon_alert(user, "disrupted!")
		set_light_on(FALSE)
		update_brightness()
		update_item_action_buttons()
		return FALSE
	if(fuel == 0)
		if(user)
			balloon_alert(user, "no charge!")
		set_light_on(FALSE)
		update_brightness()
		update_item_action_buttons()
		return FALSE
	var/old_light_on = light_on
	set_light_on(!light_on)
	update_brightness()
	update_item_action_buttons()
	return light_on != old_light_on // If the value of light_on didn't change, return false. Otherwise true.

/obj/item/flashlight/seclite/guard/attack_self(mob/user)
	check_fuel()
	START_PROCESSING(SSobj, src)
	return toggle_light(user)

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

/obj/item/hl2/intruder_radio/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if (!iscarbon(interacting_with) || !can_report)
		to_chat(user, span_userdanger("They're not reportable, or an alert is currently active and is blocking the radio."))
		return ITEM_INTERACT_BLOCKING

	var/mob/living/carbon/carbie = interacting_with
	to_chat(user, span_notice("You point the alert radio at [carbie] and use it's secondary function to try to find out if they're a spy. If they aren't the device will overload and blow up! Make sure you guess right. Guessing right also will still put the radio on a very long cooldown."))

	if(do_after(user, 5 SECONDS, src))
		if(carbie.deployment_faction == REBEL_DEPLOYMENT_FACTION)
			to_chat(user, span_userdanger("[carbie] is a filthy traitor! Kill them!"))
			to_chat(user, span_userdanger("You stand unmoving in shock at the sight of such a traitor!"))
			personal_cooldown = 5 MINUTES
			user.Stun(2 SECONDS)
		else
			to_chat(user, span_green("Looks like they aren't a traitor! But... your radio is quickly overheating...!"))
			to_chat(user, span_userdanger("[src] explodes!"))
			playsound(src,'sound/effects/explosion/explosion1.ogg',40,TRUE)
			user.flash_act(1, 1)
			user.adjustBruteLoss(80)
			user.adjustFireLoss(80)
			user.Paralyze(10 SECONDS)
			qdel(src)


/obj/item/hl2/intruder_radio/interact(mob/user)
	. = ..()

	if(!iscarbon(user))
		to_chat(user, span_warning("You don't know how this thing works...")) //non carbon
		return

	var/mob/living/carbon/carbie = user

	if(carbie.deployment_faction != COMBINE_DEPLOYMENT_FACTION)
		to_chat(user, span_warning("It would be incredibly stupid for you to raise an alert in a stealth mission.")) //only person besides guards would be snake so funny line
		return

	if(!can_report)
		to_chat(user, span_warning("You cannot report again yet!"))
		return

	intruder_detected = FALSE
	for(var/mob/living/hooman in view(7, user))
		if(HAS_TRAIT(hooman, TRAIT_THE_INTRUDER))
			intruder_detected = TRUE

	var/alert_time = 1 SECONDS

	if(TIREDNESS_SLEEPY_THRESHOLD < carbie.tiredness)
		to_chat(user, span_notice("You're so tired, it is hard to use this radio..."))
		alert_time = 3 SECONDS

	if(do_after(user, alert_time, src) && intruder_detected)
		GLOB.alert_phases++
		user.do_alert_animation()
		playsound(loc, 'hl13/sound/effects/alert.ogg', 50, FALSE, -5)
		to_chat(user, span_notice("Alert phase has been activated and will end in one minute."))
	else
		to_chat(user, span_warning("You failed to report anything out of the ordinary. You will be able to report again in 20 seconds."))
		personal_cooldown = 20 SECONDS
		can_report = FALSE

/obj/item/radio/headset/no_drop/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

#undef PHRASE_COOLDOWN
