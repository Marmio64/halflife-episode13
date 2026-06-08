#define PHRASE_COOLDOWN (3 SECONDS)

/datum/outfit/deployment_loadout/intruder/solid
	faction = REBEL_DEPLOYMENT_FACTION
	name = "Solid Crab"
	display_name = "Solid Crab"
	desc = "One of the PLF's greatest assets. A master of CQC and stealth. Smoking is hazardous to your health."

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	mask = /obj/item/cigarette/halflife
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/solid
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/milvest/solid
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	l_pocket = /obj/item/storage/fancy/cigarettes/halflife
	r_pocket = /obj/item/lighter
	gloves = /obj/item/clothing/gloves/color/black
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection/solid

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/solid_tranq
	)

	combat_music = 'hl13/sound/music/combat/bigshell.ogg' //i like this alert theme more than encounter tbh

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/intruder_decoy)

	extra_end = 5
	extra_dex = 5
	extra_str = 10

/datum/outfit/deployment_loadout/intruder/solid/pre_equip(mob/living/carbon/human/H)
	.=..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_QUIET_STEPS, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_THE_INTRUDER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_SKITTISH, OUTFIT_TRAIT)

	H.setdeploymentfaction(REBEL_DEPLOYMENT_FACTION)

/datum/outfit/deployment_loadout/intruder/solid/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor(COLOR_BLACK, update = FALSE)
	H.skin_tone = "caucasian2"
	H.set_hairstyle("Business Hair", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.update_body(0)
	H.fully_replace_character_name(H.real_name,"Solid Crab")
	H.death_sound = 'hl13/sound/effects/snakedeath.ogg'
	H.tired_rate = 0
	H.remove_quirk(/datum/quirk/claustrophobia)


	var/list/spawn_locs = list()
	for(var/X in GLOB.the_hidden)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))

	var/datum/martial_art/cqc/bigboss = new
	bigboss.teach(H)
	var/datum/action/cooldown/spell/touch/holdup/loot = new
	loot.Grant(H)
	var/obj/item/organ/tongue/solid/new_tongue = new()
	new_tongue.Insert(H)

	H.dna.species.stunmod = 0.25
	H.mind?.adjust_experience(/datum/skill/scavenging, 2500)

/obj/item/clothing/head/costume/snakeeater/solid
	name = "Sneaking Bandana"
	desc = "A blue bandana. You look quite solid with this bandana on, but unfortunately it doesn't provide infinite ammo."

/obj/item/clothing/glasses/thermal/eyepatch/solid
	name = "Sneaking Eyepatch"
	desc = "An eyepatch equipped with a radar system developed by Lambda, allowing the user to track enemy movements. Can be jammed by the enemy easily when on alert."
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE

/obj/item/clothing/glasses/thermal/eyepatch/solid/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EYES)) //for flashbangs. Won't completely stop them, but protects hearing and reduces stun time

/obj/item/clothing/glasses/thermal/eyepatch/solid/process()
	if(GLOB.alert_cooldown >= 1 SECONDS)
		vision_flags = 0
		var/mob/living/carbon/human/hooman = loc
		if(hooman.glasses == src)
			hooman.update_sight()
	else
		vision_flags = SEE_MOBS
		var/mob/living/carbon/human/hooman = loc
		if(hooman.glasses == src)
			hooman.update_sight()

/obj/item/clothing/suit/armor/halflife/milvest/solid
	name = "Sneaking Suit"
	desc = "Provides decent armor without slowing you down."
	slowdown = -0.4 //you're pretty quick when you need to be, but low dexterity doesn't let you run for very long

/obj/item/clothing/shoes/jackboots/civilprotection/solid
	name = "Sneaking Shoes"
	desc = "Snug and secure black boots worn by civil protection forces. It's been modified to suppress your footsteps."
	squeaks = FALSE

/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid
	desc = "A small and light 9mm pistol which is often used as a metropolice standard carry. Unlike most found in the city, nearly every part of this gun has been expertly crafted and customized. Where'd you get something like this...?"
	projectile_damage_multiplier = 2.5

/obj/item/storage/belt/civilprotection/polish_resistance/solid
	desc = "Heavy duty belt for containing metrocop standard gear. Can also carry rations. Can't carry large magazines."

/obj/item/storage/belt/civilprotection/polish_resistance/solid/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 14
	atom_storage.max_total_storage = 24
	atom_storage.set_holdable(list(
		/obj/item/ammo_casing/shotgun,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/flashlight/seclite,
		/obj/item/food/donut,
		/obj/item/grenade,
		/obj/item/holosign_creator/security,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/magazine/solid_tranq,
		/obj/item/hl2/deployable_box,
		/obj/item/stack/medical/gauze,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/reagent_containers/pill/patch/medkit/ration, //RATION HOLDER RATION HOLDER RATION HOLDER
	))

/obj/item/storage/belt/civilprotection/polish_resistance/solid/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/knife/combat, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/grenade/decoy, src)
	SSwardrobe.provide_type(/obj/item/grenade/decoy, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/backpack/halflife/satchel/civilprotection/solid
	name = "Weapons Bag"
	desc = "A relatively small bag designed to carry firearms."

/obj/item/storage/backpack/halflife/satchel/civilprotection/solid/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 3 //enough room for all of snakes weapons
	atom_storage.set_holdable(list(
		/obj/item/gun/ballistic/automatic/pistol, //should include the tranq and the usp
		/obj/item/gun/ballistic/automatic/m4a1, //he can carry the locked guns but why would he, other than to deny the enemy?
	))
	atom_storage.exception_hold = typecacheof(list(/obj/item/gun/ballistic/automatic/m4a1))

/obj/item/reagent_containers/pill/patch/medkit/ration
	name = "Ration"
	desc = "A ration. If this were some kind of stealth game, this would probably heal you up..."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "seafood"
	apply_sound = 'hl13/sound/items/ration.ogg'

/obj/item/reagent_containers/pill/patch/medkit/ration/interact_with_atom(atom/target, mob/living/user, list/modifiers)
	self_delay = 3.5 SECONDS

	if(ishuman(target))
		var/mob/living/carbon/human/target_human = target
		if(HAS_TRAIT(target_human, TRAIT_THE_INTRUDER))
			self_delay = 1 SECONDS //crab is trained in the arts of eating

	..()


/obj/item/grenade/decoy
	name = "noise decoy grenade"
	icon_state = "decoy"
	desc = "A device that looks like a grenade. When it 'detonates', it'll emulate the sound of a burst of a rifle, in order to confuse people."
	inhand_icon_state = "decoy"
	icon = 'hl13/icons/obj/grenade.dmi'
	det_time = 35
	do_arm_sound = FALSE

/obj/item/grenade/decoy/detonate(mob/living/lanced_by)
	. = ..()
	if(!.)
		return

	update_mob()
	var/flashbang_turf = get_turf(src)
	if(!flashbang_turf)
		return
	do_sparks(rand(5, 9), FALSE, src)
	playsound(flashbang_turf, "sound/items/weapons/gun/rifle/shot.ogg", 80, TRUE, 8, 0.9)
	sleep(rand(0.25 SECONDS,0.8 SECONDS))
	playsound(flashbang_turf, "sound/items/weapons/gun/rifle/shot.ogg", 80, TRUE, 8, 0.9)
	sleep(rand(0.25 SECONDS,0.8 SECONDS))
	playsound(flashbang_turf, "sound/items/weapons/gun/rifle/shot.ogg", 80, TRUE, 8, 0.9)
	sleep(rand(0.4 SECONDS,1.2 SECONDS))
	playsound(flashbang_turf, "sound/items/weapons/gun/rifle/shot.ogg", 80, TRUE, 8, 0.9)
	sleep(rand(0.25 SECONDS,0.8 SECONDS))
	qdel(src)

/datum/action/cooldown/spell/conjure_item/intruder_decoy
	name = "Summon Decoy Mannequin"
	desc = "Quickly deploy a decoy that somewhat resembles you on initial inspection. Useful for simple distractions. It will automatically fall apart after about 16 seconds, and has a long cooldown."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "cloak"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 45 SECONDS
	item_type = /obj/item/cardboard_cutout/solid_crab

/obj/item/cardboard_cutout/solid_crab
	starting_cutout = "Solid Crab"

/obj/item/cardboard_cutout/solid_crab/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 16 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(random_speech)), rand(5 SECONDS, 10 SECONDS))

/obj/item/cardboard_cutout/solid_crab/proc/random_speech()
	if(prob(50))
		if(prob(50))
			say("You're pretty good...")
			playsound(src, 'hl13/sound/voice/solid/snakegood.ogg', 50, FALSE)
		else
			say("Kept you waiting, huh?")
			playsound(src, 'hl13/sound/voice/solid/snakewaiting.ogg', 50, FALSE)

/datum/cardboard_cutout/solid_crab
	name = "Solid Crab"
	applied_name = "Solid Crab"
	applied_desc = "You're pretty good..."
	mob_spawner = /obj/effect/mob_spawn/corpse/human/solid_crab_look

/datum/cardboard_cutout/solid_crab/get_name()
	return "Solid Crab"

/datum/outfit/solid_crab_cutout
	name = "Solid Crab Cardboard cutout"

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	mask = /obj/item/cigarette/halflife
	belt = /obj/item/storage/belt/civilprotection
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/milvest/solid
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	gloves = /obj/item/clothing/gloves/color/black

/obj/effect/mob_spawn/corpse/human/solid_crab_look
	name = "Solid Crab's Appearence"
	hairstyle = "Business Hair" //that other haircut looks ugly marmio
	haircolor = COLOR_BLACK
	facial_hairstyle = "Shaved"
	skin_tone = "caucasian2"
	outfit = /datum/outfit/solid_crab_cutout


/obj/item/hl2/deployable_box
	name = "deployable cardboard box"
	desc = "A large piece of folded cardboard. It can be used to make a box just large enough to fit someone in."
	icon_state = "sheet-card"
	inhand_icon_state = "sheet-card"
	icon = 'icons/obj/stack_objects.dmi'
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	pickup_sound = 'sound/items/handling/materials/cardboard_pick_up.ogg'
	drop_sound = 'sound/items/handling/materials/cardboard_drop.ogg'
	var/boxtype = /obj/structure/closet/cardboard

/obj/item/hl2/deployable_box/interact(mob/user)
	. = ..()
	if(!iscarbon(user))
		return
	if(istype(user.loc, /obj/structure/closet/cardboard))
		var/obj/structure/closet/cardboard/box = user.loc
		if(box.open())
			user.playsound_local(box, 'sound/misc/box_deploy.ogg', 50, TRUE)
		return
	//Box closing from here on out.
	if(!isturf(user.loc)) //Don't let the player use this to escape mechs/welded closets.
		to_chat(user, span_warning("You need more space to activate this implant!"))
		return
	var/box = new boxtype(user.drop_location())
	user.forceMove(box)
	user.playsound_local(box, 'sound/misc/box_deploy.ogg', 50, TRUE)
	qdel(src)

/obj/item/organ/tongue/solid
	actions_types = list(/datum/action/item_action/waiting, /datum/action/item_action/liquid, /datum/action/item_action/moron, /datum/action/item_action/prettygood)
	COOLDOWN_DECLARE(snake_cooldown)
	modifies_speech = TRUE
	var/static/list/snake_voicelines = list(
		"Kept you waiting, huh" = 'hl13/sound/voice/solid/snakewaiting.ogg',
		"Liquid" = 'hl13/sound/voice/solid/snakeliquid.ogg',
		"Moron" = 'hl13/sound/voice/solid/snakemoron.ogg',
		"pretty good" = 'hl13/sound/voice/solid/snakegood.ogg', //as far as i know i can't use ' in these so we'll just leave it at pretty good
	)

/obj/item/organ/tongue/solid/proc/can_use(mob/user)
	return istype(user) && !user.incapacitated

/obj/item/organ/tongue/solid/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/waiting))
		waiting()
	if(istype(action, /datum/action/item_action/liquid))
		liquid()
	if(istype(action, /datum/action/item_action/moron))
		moron()
	if(istype(action, /datum/action/item_action/prettygood))
		prettygood()

/obj/item/organ/tongue/solid/modify_speech(datum/source, list/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in snake_voicelines)
		if(findtext(full_message, lines))
			playsound(source, snake_voicelines[lines], 50, FALSE)
			return // only play the first.

/datum/action/item_action/waiting
	name = "Kept you waiting, huh?"

/obj/item/organ/tongue/solid/verb/waiting()
	set category = "Object"
	set name = "Kept you waiting, huh?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Kept you waiting, huh?", forced = src.name)

/datum/action/item_action/liquid
	name = "LIQUID!!"

/obj/item/organ/tongue/solid/verb/liquid()
	set category = "Object"
	set name = "LIQUID!!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("LIQUID!!", forced = src.name)

/datum/action/item_action/moron
	name = "Moron!"

/obj/item/organ/tongue/solid/verb/moron()
	set category = "Object"
	set name = "Moron!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Moron!", forced = src.name)

/datum/action/item_action/prettygood
	name = "You're pretty good..."

/obj/item/organ/tongue/solid/verb/prettygood()
	set category = "Object"
	set name = "You're pretty good..."
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("You're pretty good...", forced = src.name)

#undef PHRASE_COOLDOWN
