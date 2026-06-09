#define PHRASE_COOLDOWN (3 SECONDS)

//Bullsquids are proud creatures... they prefer to hunt alone

/datum/outfit/deployment_loadout/intruder/bullsquid
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Revolver Bullsquid"
	desc = "A mercenary, originally part of an small elite black ops unit Pre-War, currently on the Combine's payroll. Known for his adeptness with a revolver and advanced interrogation techniques. He's been bested by Solid Crab a few times before, and now he's looking to settle the score."

	uniform = /obj/item/clothing/under/halflife/labor_lead/bullsquid
	suit = /obj/item/clothing/suit/jacket/det_suit/bullsquid
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/holster/bullsquid
	gloves = /obj/item/clothing/gloves/color/brown

	l_pocket = /obj/item/ammo_box/colta357 //12 shots... (he'll get a conjure as well i suppose though). no radio either, see comment above
	r_pocket = /obj/item/ammo_box/colta357

	combat_music = 'hl13/sound/music/combat/duel.ogg'

/datum/outfit/deployment_loadout/intruder/bullsquid/pre_equip(mob/living/carbon/human/H)
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NICE_SHOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	RegisterSignal(H, COMSIG_MOB_FIRED_GUN, PROC_REF(reduce_spread))
	RegisterSignal(H, COMSIG_PROJECTILE_FIRER_BEFORE_FIRE, PROC_REF(apply_ricochet))

/datum/outfit/deployment_loadout/intruder/bullsquid/proc/reduce_spread(mob/user, obj/item/gun/gun_fired, target, params, zone_override, list/bonus_spread_values)
	SIGNAL_HANDLER
	bonus_spread_values[MIN_BONUS_SPREAD_INDEX] -= 50
	bonus_spread_values[MAX_BONUS_SPREAD_INDEX] -= 50

/datum/outfit/deployment_loadout/intruder/bullsquid/proc/apply_ricochet(mob/user, obj/projectile/projectile, datum/fired_from, atom/clicked_atom) //despite preferring a revolver, he seems to be capable of doing his ricochet trick with any firearm (like the makarov in mgs3), so i'll allow it unless it proves to be too good
	SIGNAL_HANDLER
	projectile.ricochets_max += 5
	projectile.min_ricochets += 2
	projectile.ricochet_auto_aim_range = 50
	projectile.ricochet_auto_aim_angle = 6
	projectile.ricochet_incidence_leeway = 0
	projectile.accuracy_falloff = 0
	projectile.ricochet_shoots_firer = FALSE

/datum/outfit/deployment_loadout/intruder/bullsquid/post_equip(mob/living/carbon/human/H)
	H.set_haircolor("#DDDDDD", update = FALSE)
	H.set_facial_haircolor("#DDDDDD", update = FALSE)
	H.skin_tone = "caucasian1"
	H.set_hairstyle("Feather", update = TRUE)
	H.set_facial_hairstyle("Moustache (Selleck)", update = TRUE)
	H.update_body(0)
	H.fully_replace_character_name(H.real_name,"Revolver Bullsquid")
	H.death_sound = 'hl13/sound/voice/solid/ocelotdeath.ogg'

	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/bullsquid/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)
	for(var/obj/item/item in H.get_all_gear()) //this probably isnt the best way to do it but its the one i found that actually worked
		if(istype(item, /obj/item/clothing/head/) || istype(item, /obj/item/clothing/mask) || istype(item, /obj/item/storage/backpack/) || istype(item, /obj/item/gun/ballistic/automatic/m4a1/))
			qdel(item)

/obj/item/clothing/under/halflife/labor_lead/bullsquid
	name = "gunslinger's outfit"
	desc = "A pretty good, old and dusty suit. Smells like cordite... and Solid Crab's death."

/obj/item/clothing/suit/jacket/det_suit/bullsquid
	name = "gunslinger's trenchcoat"
	desc = "A trenchcoat that's been moderately reinforced with kevlar. Wearing this makes you feel like a true Son of Colossal Cell Lead." //like the terrorists led by Liquid Crab, not actually a son of Colossal Cell Lead
	armor_type = /datum/armor/milvest //same amount of armor as Crab
	repairable_by = /obj/item/stack/kevlar

/obj/item/storage/belt/holster/bullsquid
	name = "gunslinger's shoulder holsters"
	desc = "Twelve shots... you've got twelve shots while wearing this."

/obj/item/storage/belt/holster/bullsquid/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL

/obj/item/storage/belt/holster/bullsquid/PopulateContents()
	generate_items_inside(list(
		/obj/item/gun/ballistic/revolver/coltpython/well_crafted = 2,
	), src)

/obj/item/organ/tongue/bullsquid
	actions_types = list(/datum/action/item_action/prettygood, /datum/action/item_action/disappointed, /datum/action/item_action/draw, /datum/action/item_action/settlethis, /datum/action/item_action/ocelothiding)
	COOLDOWN_DECLARE(ocelot_cooldown)
	modifies_speech = TRUE
	var/static/list/ocelot_voicelines = list(
		"re pretty good" = 'hl13/sound/voice/solid/ocelotgood.ogg',
		"m disappointed" = 'hl13/sound/voice/solid/ocelotdisappointed.ogg',
		"Draw" = 'hl13/sound/voice/solid/ocelotdraw.ogg',
		"t you want to settle this" = 'hl13/sound/voice/solid/ocelotsettle.ogg',
		"Hiding won" = 'hl13/sound/voice/solid/ocelothiding.ogg', //i hate that i can't use '
	)

/obj/item/organ/tongue/bullsquid/proc/can_use(mob/user)
	return istype(user) && !user.incapacitated

/obj/item/organ/tongue/bullsquid/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/settlethis))
		settlethis()
	if(istype(action, /datum/action/item_action/disappointed))
		disappointed()
	if(istype(action, /datum/action/item_action/draw))
		draw()
	if(istype(action, /datum/action/item_action/prettygood))
		prettygood()
	if(istype(action, /datum/action/item_action/ocelothiding))
		ocelothiding()

/obj/item/organ/tongue/bullsquid/modify_speech(datum/source, list/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in ocelot_voicelines)
		if(findtext(full_message, lines))
			playsound(source, ocelot_voicelines[lines], 50, FALSE)
			return // only play the first.

/datum/action/item_action/settlethis
	name = "Don't you want to settle this?"

/obj/item/organ/tongue/bullsquid/verb/settlethis()
	set category = "Object"
	set name = "Don't you want to settle this?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Don't you want to settle this?", forced = src.name)

/datum/action/item_action/disappointed
	name = "I'm disappointed!"

/obj/item/organ/tongue/bullsquid/verb/disappointed()
	set category = "Object"
	set name = "I'm disappointed!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("I'm disappointed!", forced = src.name)

/datum/action/item_action/draw
	name = "Draw!!"

/obj/item/organ/tongue/bullsquid/verb/draw()
	set category = "Object"
	set name = "Draw!!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Draw!!", forced = src.name)

/datum/action/item_action/prettygood
	name = "You're pretty good!"

/obj/item/organ/tongue/bullsquid/verb/prettygood()
	set category = "Object"
	set name = "You're pretty good!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("You're pretty good!", forced = src.name)

/datum/action/item_action/ocelothiding
	name = "Hiding won't help you!"

/obj/item/organ/tongue/bullsquid/verb/ocelothiding()
	set category = "Object"
	set name = "Hiding won't help you!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Hiding won't help you!", forced = src.name)

#undef PHRASE_COOLDOWN
