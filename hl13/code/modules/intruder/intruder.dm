#define PHRASE_COOLDOWN (3 SECONDS)

/obj/item/hl2/loadout_picker/intruder/the_intruder/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/intruder/solid/crab,
			/datum/outfit/deployment_loadout/intruder/solid/raiden,
			/datum/outfit/deployment_loadout/intruder/solid/old,
			/datum/outfit/deployment_loadout/intruder/solid/bigboss,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/intruder/the_intruder/consume_use(datum/outfit/deployment_loadout/outfit_choice, mob/living/user)
	if(outfit_choice == /datum/outfit/deployment_loadout/intruder/solid/crab)
		GLOB.crab_character = "solid"
	if(outfit_choice == /datum/outfit/deployment_loadout/intruder/solid/old)
		GLOB.crab_character = "old"
	if(outfit_choice == /datum/outfit/deployment_loadout/intruder/solid/bigboss)
		GLOB.crab_character = "bigboss"
	if(outfit_choice == /datum/outfit/deployment_loadout/intruder/solid/raiden)
		GLOB.crab_character = "raiden"
	..()

/datum/outfit/deployment_loadout/intruder/solid
	weapon_specialties = WEAPON_CAT_ALL
	var/sus_venter = FALSE

/datum/outfit/deployment_loadout/intruder/solid/blank
	faction = REBEL_DEPLOYMENT_FACTION
	name = "BLANK OPERATIVE"

	mask = /obj/item/clothing/mask/balaclava/protective
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset

	l_hand = /obj/item/hl2/loadout_picker/intruder/the_intruder

	sus_venter = TRUE

/datum/outfit/deployment_loadout/intruder/solid/crab
	faction = REBEL_DEPLOYMENT_FACTION
	name = "Solid Crab"
	display_name = "Solid Crab"
	desc = "One of the PLF's greatest assets. A master of CQC and stealth, known for his incredible willpower. Smoking is hazardous to your health."

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/solid
	mask = /obj/item/cigarette/halflife
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/milvest/solid
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	l_pocket = /obj/item/storage/fancy/cigarettes/halflife
	r_pocket = /obj/item/lighter
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset

	r_hand = /obj/item/choice_beacon/intruder_snake_loadout

	combat_music = 'hl13/sound/music/combat/tanker.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/intruder_decoy, /datum/action/cooldown/spell/intruder_heal)

	extra_end = 10
	extra_dex = 5
	extra_str = 10

/datum/outfit/deployment_loadout/intruder/solid/crab/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor(COLOR_BLACK, update = FALSE)
	H.skin_tone = "caucasian2"
	H.set_hairstyle("Business Hair", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.update_body(1)
	H.fully_replace_character_name(H.real_name,"Solid Crab")
	H.death_sound = 'hl13/sound/effects/snakedeath.ogg'
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/solid/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)

/datum/outfit/deployment_loadout/intruder/solid/raiden
	faction = REBEL_DEPLOYMENT_FACTION
	name = "Gor-den"
	display_name = "Gor-den"
	desc = "A non-existant operative of a non-existant organization, originally sharing a codename with Crab before undergoing this mission. Better than Solid Crab with blades, and far more agile. Might even become a cool cyborg ninja in the future."

	glasses = /obj/item/clothing/glasses/thermal/solid
	uniform = /obj/item/clothing/under/citizen/rebel/raiden
	suit = /obj/item/clothing/suit/halflife/invis_grunt_harness
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset
	back = /obj/item/katana/raiden

	r_hand = /obj/item/choice_beacon/intruder_snake_loadout

	combat_music = 'hl13/sound/music/combat/bigshell.ogg' //i like this alert theme more than encounter tbh

	spells_to_add = list(/datum/action/cooldown/mob_cooldown/halflife/cartwheel, /datum/action/cooldown/spell/conjure_item/intruder_decoy/raiden)

	extra_end = 10
	extra_dex = 8
	extra_str = 10

/datum/outfit/deployment_loadout/intruder/solid/raiden/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#dab57f", update = FALSE)
	H.skin_tone = "caucasian2"
	H.set_hairstyle("Curls", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.update_body(1)
	H.fully_replace_character_name(H.real_name,"Gor-den")
	H.death_sound = 'hl13/sound/voice/solid/spydeath.ogg'
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/solid/raiden/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)

/datum/outfit/deployment_loadout/intruder/solid/old
	faction = REBEL_DEPLOYMENT_FACTION
	name = "Old Crab"
	display_name = "Old Crab"
	desc = "Formerly one of the PLF's greatest assets. You have access to a special suit with camouflage capabilities, but age seems to have slowed you down quite a bit."

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	mask = /obj/item/cigarette/halflife
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/milvest/solid/old
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	l_pocket = /obj/item/storage/fancy/cigarettes/halflife
	r_pocket = /obj/item/lighter
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset

	r_hand = /obj/item/choice_beacon/intruder_snake_loadout

	combat_music = 'hl13/sound/music/combat/middleeastalert.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/intruder_decoy/old)

	extra_end = 10
	extra_dex = 5
	extra_str = 10

/datum/outfit/deployment_loadout/intruder/solid/old/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#ddddddbb", update = FALSE)
	H.set_facial_haircolor("#ddddddbb", update = FALSE)
	H.skin_tone = "caucasian2"
	H.set_hairstyle("Business Hair", update = TRUE)
	H.set_facial_hairstyle("Moustache (Selleck)", update = TRUE)
	H.update_body(1)
	H.fully_replace_character_name(H.real_name,"Old Crab")
	H.death_sound = 'hl13/sound/voice/solid/oldsnakedeath.ogg'
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/solid/old/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)
	//H.dna.add_mutation(/datum/mutation/human/chameleon/changeling)

/datum/outfit/deployment_loadout/intruder/solid/bigboss
	faction = REBEL_DEPLOYMENT_FACTION
	name = "Naked Crab"
	display_name = "Naked Crab"
	desc = "Why is Crab's dead mentor available as an option? Don't think too hard about it. Not much difference between you and your successor, besides being kinda evil compared to him."

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/bigboss
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	l_pocket = /obj/item/cigarette/cigar
	r_pocket = /obj/item/lighter
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset

	r_hand = /obj/item/choice_beacon/intruder_snake_loadout

	combat_music = 'hl13/sound/music/combat/battleinthebase.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/intruder_decoy/bigboss, /datum/action/cooldown/spell/conjure_item/random_intruder)

	extra_end = 10
	extra_dex = 5
	extra_str = 10

/datum/outfit/deployment_loadout/intruder/solid/bigboss/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#663300", update = FALSE)
	H.set_facial_haircolor("#663300", update = FALSE)
	H.skin_tone = "caucasian2"
	H.set_hairstyle("Combover", update = TRUE)
	H.set_facial_hairstyle("Beard (Cropped Fullbeard)", update = TRUE)
	H.update_body(1)
	H.fully_replace_character_name(H.real_name,"Naked Crab")
	H.death_sound = 'hl13/sound/effects/snakedeath.ogg' //couldnt find an isolated version of the mgs3 death scream
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/solid/bigboss/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)

/datum/outfit/deployment_loadout/intruder/solid/pre_equip(mob/living/carbon/human/H)
	.=..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_QUIET_STEPS, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FREERUNNING, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_THE_INTRUDER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_SKITTISH, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_GRABRESISTANCE, OUTFIT_TRAIT) //prevents instant aggro grab cqc chicanery, have a real fight between boss and intruder

	REMOVE_TRAIT(H, TRAIT_INTRUDER_GUARD, OUTFIT_TRAIT)

	H.setdeploymentfaction(REBEL_DEPLOYMENT_FACTION)

/datum/outfit/deployment_loadout/intruder/solid/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.fully_replace_character_name(H.real_name,"Unknown Operative")
	H.tired_rate = 0
	H.remove_quirk(/datum/quirk/claustrophobia)
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)


	if(sus_venter)
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
	var/datum/action/cooldown/spell/touch/remove_mask/unmask = new
	unmask.Grant(H)

	H.dna.species.stunmod = 0.25
	H.mind?.adjust_experience(/datum/skill/scavenging, 2500)

//////// clothing/gear for the operators

/obj/item/clothing/head/costume/snakeeater/solid
	name = "Sneaking Bandana"
	desc = "A blue bandana. You look quite solid with this bandana on, but unfortunately it doesn't provide infinite ammo."
	armor_type = /datum/armor/kevlararmor

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
		vision_flags = SEE_MOBS|SEE_TURFS|SEE_OBJS
		var/mob/living/carbon/human/hooman = loc
		if(hooman.glasses == src)
			hooman.update_sight()

/obj/item/clothing/glasses/thermal/solid
	name = "Implanted Radar"
	desc = "A radar system developed by Lambda implanted directly into your eye, allowing the user to track enemy movements. Can be jammed by the enemy easily when on alert."
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE
	icon_state = "invis_grunt_harness" //this will look weird but i just dont care enough and its an invisible (reference) icon when worn so
	worn_icon_state = "invis_grunt_harness"
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

/obj/item/clothing/glasses/thermal/solid/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EYES)) //for flashbangs. Won't completely stop them, but protects hearing and reduces stun time

/obj/item/clothing/glasses/thermal/solid/process()
	if(GLOB.alert_cooldown >= 1 SECONDS)
		vision_flags = 0
		var/mob/living/carbon/human/hooman = loc
		if(hooman.glasses == src)
			hooman.update_sight()
	else
		vision_flags = SEE_MOBS|SEE_TURFS|SEE_OBJS
		var/mob/living/carbon/human/hooman = loc
		if(hooman.glasses == src)
			hooman.update_sight()

/obj/item/clothing/suit/armor/halflife/milvest/solid
	name = "Sneaking Suit"
	desc = "Provides decent armor without slowing you down."
	slowdown = -0.35 //you're pretty quick when you need to be, but low dexterity doesn't let you run for very long

/obj/item/clothing/suit/armor/halflife/milvest/solid/old
	name = "CrabCamo Suit"
	desc = "Does well at hiding your deteriorating body. Looming mortality aside, allows you to blend in with your environment, like a headcrab! ...okay, this one doesn't make much sense. Is it really necessary to name everything here after a xenian creature?"
	slowdown = -0.25

	var/min_alpha = 0 //how invisible we are capable of being. this will be raised during an alert

	//these two mostly just exist so that i can test values ingame, increase should be more than decrease so that he reveals quicker
	var/alpha_decrease = 30
	var/alpha_increase = 45

	var/turf/turfcamo

/obj/item/clothing/suit/armor/halflife/milvest/solid/old/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/item/clothing/suit/armor/halflife/milvest/solid/old/examine(mob/user)
	. = ..()
	if(turfcamo)
		. += span_notice("CrabCamo is currently set to: [turfcamo.icon_state].")

/obj/item/clothing/suit/armor/halflife/milvest/solid/old/process()
	if(GLOB.alert_cooldown >= 1 SECONDS)
		min_alpha = 60 //should still be pretty hard to spot
	else if (GLOB.caution_cooldown >= 1 SECONDS)
		min_alpha = 30
	else
		min_alpha = 0
	var/mob/living/carbon/human/hooman = loc
	for(var/mob/living/carbon/human/noticer in range(0, hooman))
		if(noticer != hooman)
			min_alpha = 120 //a lot more noticeable if you're standing right on top of him
	var/turf/currentturf = get_turf(hooman)
	if(HAS_TRAIT(hooman, TRAIT_UNDENSE) && hooman.stat == CONSCIOUS) //leaning against walls or crawling on the floor, only works if you're awake
		if(!turfcamo) //will only happen once, at the start of the game
			turfcamo = get_turf(hooman)
			playsound(hooman, 'hl13/sound/effects/camochange.ogg', 20, FALSE, -10) //quiet but not impossible to detect hopefully ill tweak it later
			to_chat(hooman, span_notice("Your CrabCamo begins to change to resemble the texture of [turfcamo.icon_state]."))
		if(istype(currentturf, turfcamo))
			hooman.alpha = max(hooman.alpha - alpha_decrease, min_alpha)
		else
			hooman.alpha = max(hooman.alpha, 120)
			turfcamo = get_turf(hooman)
			playsound(hooman, 'hl13/sound/effects/camochange.ogg', 20, FALSE, -10)
			to_chat(hooman, span_notice("Your CrabCamo begins to change to resemble the texture of [turfcamo.icon_state]."))
	else if(turfcamo)
		if(istype(currentturf, turfcamo))
			hooman.alpha = max(hooman.alpha - alpha_decrease, 120) //still somewhat effective if you already have the camo of the turf you're on
		else
			hooman.alpha = min(hooman.alpha + alpha_increase, 255)
	else
		hooman.alpha = min(hooman.alpha + alpha_increase, 255)

/obj/item/clothing/suit/armor/halflife/kevlar/bigboss
	desc = "A much better kevlar vest than what your opponents are equipped with. Provides decent armor without slowing you down."
	slowdown = -0.35
	armor_type = /datum/armor/milvest

/obj/item/clothing/under/citizen/rebel/raiden
	name = "Skull Suit"
	desc = "Considerably less armored than Crab's suit, but allows for more agility and movement. Resembles the human skeleton."
	slowdown = -0.5
	icon_state = "raiden"
	armor_type = /datum/armor/armoredvest_upgraded
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|HEAD //since his armor sucks bad he can have it everywhere

/obj/item/clothing/shoes/jackboots/civilprotection/solid
	name = "Sneaking Shoes"
	desc = "Snug and secure black boots worn by civil protection forces. It's been modified to suppress your footsteps."
	squeaks = FALSE

/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid
	desc = "A small and light 9mm pistol which is often used as a metropolice standard carry. Unlike most found in the city, nearly every part of this gun has been expertly crafted and customized. Where'd you get something like this...?"
	projectile_damage_multiplier = 2.5

/obj/item/gun/ballistic/automatic/pistol/usp/solid
	desc = "A small and light 9mm pistol which is often used as a metropolice standard carry. Unlike most found in the city, nearly every part of this gun has been expertly crafted and customized. Where'd you get something like this...?"
	projectile_damage_multiplier = 2.5
	spawnwithmagazine = FALSE //OSP

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
		/obj/item/reagent_containers/hypospray/medipen/adrenaline_inhaler,
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

/obj/item/storage/belt/civilprotection/polish_resistance/solid/belligerent/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 15
	atom_storage.max_total_storage = 26
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
		/obj/item/ammo_box/magazine/m4a1,
		/obj/item/hl2/deployable_box,
		/obj/item/stack/medical/gauze,
		/obj/item/reagent_containers/hypospray/medipen/adrenaline_inhaler,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/reagent_containers/pill/patch/medkit/ration, //RATION HOLDER RATION HOLDER RATION HOLDER
	))

/obj/item/storage/belt/civilprotection/polish_resistance/solid/belligerent/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/famas, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/famas, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/famas, src)
	SSwardrobe.provide_type(/obj/item/knife/combat, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/hypospray/medipen/oxycodone, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/hypospray/medipen/oxycodone, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/hypospray/medipen/oxycodone, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/solid/belligerent/empty/PopulateContents()
	SSwardrobe.provide_type(/obj/item/knife/combat, src) //im not a complete asshole
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/solid/phantom/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 16
	atom_storage.max_total_storage = 28

/obj/item/storage/belt/civilprotection/polish_resistance/solid/phantom/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/solid_tranq, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/solid_tranq, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/solid_tranq, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/hl2/deployable_box, src)
	SSwardrobe.provide_type(/obj/item/hl2/deployable_box, src)
	SSwardrobe.provide_type(/obj/item/hl2/deployable_box, src)
	SSwardrobe.provide_type(/obj/item/hl2/deployable_box, src)
	SSwardrobe.provide_type(/obj/item/hl2/deployable_box, src)
	SSwardrobe.provide_type(/obj/item/grenade/decoy, src)
	SSwardrobe.provide_type(/obj/item/grenade/decoy, src)
	SSwardrobe.provide_type(/obj/item/grenade/smokebomb, src)
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

/obj/item/storage/backpack/halflife/satchel/civilprotection/solid/tranq/PopulateContents()
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/pistol/solid_tranq, src)
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid, src)

/obj/item/storage/backpack/halflife/satchel/civilprotection/solid/tranq_only/PopulateContents()
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/pistol/solid_tranq, src)

/obj/item/storage/backpack/halflife/satchel/civilprotection/solid/m4a1/PopulateContents()
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/m4a1/famas/crab/suppressed, src)
	SSwardrobe.provide_type(/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid, src)

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

/obj/item/katana/raiden
	name = "HF Blade"
	desc = "A blade similar to the katana, which also allows you to more easily deflect bullets."
	block_chance = 50
	attack_speed = CLICK_CD_FAST //their USP still does more damage both per shot and DPS wise

/obj/item/grenade/decoy
	name = "noise decoy grenade"
	icon_state = "decoy"
	desc = "A device that looks like a grenade. When it 'detonates', it'll emit either loud bangs or use a recorder to play convincing combat sounds"
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

	if(prob(50))
		do_sparks(rand(5, 9), FALSE, src)
		playsound(flashbang_turf, "hl13/sound/weapons/famas.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.23 SECONDS,0.4 SECONDS))
		playsound(flashbang_turf, "hl13/sound/weapons/famas.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.23 SECONDS,0.4 SECONDS))
		playsound(flashbang_turf, "hl13/sound/weapons/famas.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.23 SECONDS,1.2 SECONDS))
		playsound(flashbang_turf, "hl13/sound/weapons/famas.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.23 SECONDS,0.8 SECONDS))
		if(prob(50))
			playsound(flashbang_turf, "hl13/sound/weapons/famas.ogg", 60, TRUE, 8, 0.9)
			sleep(rand(0.23 SECONDS,0.8 SECONDS))
		qdel(src)
	else if(prob(75))
		playsound(flashbang_turf, 'sound/items/weapons/cqchit1.ogg', 80, TRUE, 8, 0.9)
		sleep(rand(0.4 SECONDS,0.8 SECONDS))
		playsound(flashbang_turf, 'sound/items/weapons/cqchit1.ogg', 80, TRUE, 8, 0.9)
		sleep(rand(0.4 SECONDS,0.8 SECONDS))
		playsound(flashbang_turf, 'sound/items/weapons/slam.ogg', 80, TRUE, 8, 0.9)
		sleep(rand(0.25 SECONDS,0.8 SECONDS))
		qdel(src)
	else
		playsound(flashbang_turf, 'hl13/sound/voice/solid/snakewaiting.ogg', 50, FALSE, 8, 0.9)
		sleep(rand(0.4 SECONDS,0.7 SECONDS))
		playsound(flashbang_turf, "hl13/sound/weapons/tranqfire.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.2 SECONDS,0.4 SECONDS))
		playsound(flashbang_turf, "hl13/sound/weapons/tranqrack.ogg", 60, TRUE, 8, 0.9)
		sleep(rand(0.25 SECONDS,0.5 SECONDS))
		qdel(src)

/datum/action/cooldown/mob_cooldown/halflife/cartwheel
	name = "Cartwheel"
	desc = "A cartwheel which not only provides extra mobility, but allows you to go through enemies, knocking them down. Does a small (almost negligible) amount of damage to them as well."
	cooldown_time = 4 SECONDS

/datum/action/cooldown/mob_cooldown/halflife/cartwheel/proc/do_cartwheel(move_dir, times_ran)
	if(times_ran >= 5)
		return
	var/turf/T = get_step(get_turf(owner), move_dir)
	var/mob/living/livingowner = owner
	if(T.density)
		owner.safe_throw_at(get_turf(owner), 1, 1, src)
		livingowner.Paralyze(20)
		livingowner.adjustBruteLoss(5)
		playsound(owner,SFX_SWING_HIT,50,TRUE)
		return
	for(var/obj/structure/window/W in T.contents)
		owner.safe_throw_at(get_turf(owner), 1, 1, src)
		livingowner.Paralyze(20)
		livingowner.adjustBruteLoss(5)
		playsound(owner,SFX_SWING_HIT,50,TRUE)
		return
	for(var/obj/machinery/door/D in T.contents)
		if(D.density)
			owner.safe_throw_at(get_turf(owner), 1, 1, src)
			livingowner.Paralyze(20)
			livingowner.adjustBruteLoss(5)
			playsound(owner,SFX_SWING_HIT,50,TRUE)
			return
	for(var/obj/structure/halflife/fence/F in T.contents)
		owner.safe_throw_at(get_turf(owner), 1, 1, src)
		livingowner.Paralyze(20)
		livingowner.adjustBruteLoss(5)
		playsound(owner,SFX_SWING_HIT,50,TRUE)
		return
	for(var/obj/machinery/turnstile/S in T.contents)
		if(S.on)
			owner.safe_throw_at(get_turf(owner), 1, 1, src)
			livingowner.Paralyze(20)
			livingowner.adjustBruteLoss(5)
			playsound(owner,SFX_SWING_HIT,50,TRUE)
			return
	for(var/obj/effect/koth_grace_field/K in T.contents)
		owner.safe_throw_at(get_turf(owner), 1, 1, src)
		livingowner.Paralyze(20)
		livingowner.adjustBruteLoss(5)
		playsound(owner,SFX_SWING_HIT,50,TRUE)
		return
	owner.forceMove(T)
	var/list/hit_things = list()
	var/throwtarget = get_edge_target_turf(owner, move_dir)
	for(var/mob/living/L in T.contents - hit_things - owner)
		hit_things += L
		if(!L.body_position == LYING_DOWN)
			owner.visible_message(span_boldwarning("[owner] cartwheels through [L]!"))
			if(!HAS_TRAIT(L, TRAIT_INTRUDER_OCELOT))
				to_chat(L, span_userdanger("[owner] cartwheels through you, sending you to the ground!"))
				L.safe_throw_at(throwtarget, 1, 1, src)
				L.Paralyze(20)
				L.adjustBruteLoss(5) //barely any damage
			else
				to_chat(L, span_userdanger("[owner] cartwheels through you hard, but you manage to stay upright!"))
				L.adjustBruteLoss(15) //extra damage so it is still useful against the boss
			playsound(owner,SFX_SWING_HIT,50,TRUE)
	addtimer(CALLBACK(src, PROC_REF(do_cartwheel), move_dir, (times_ran + 1)), 1)

/datum/action/cooldown/mob_cooldown/halflife/cartwheel/proc/begin_cartwheel(target)
	var/dir_to_target = get_dir(get_turf(owner), get_turf(target))
	owner.setDir(dir_to_target)
	playsound(owner,'hl13/sound/effects/raidencartwheel.ogg', 50, FALSE)
	owner.visible_message(span_boldwarning("[owner] does a cartwheel!"))
	owner.emote("flip")
	addtimer(CALLBACK(src, PROC_REF(do_cartwheel), dir_to_target, 0), 1)

/datum/action/cooldown/mob_cooldown/halflife/cartwheel/Activate(atom/target)
	begin_cartwheel(target)
	StartCooldown()
	return TRUE

/datum/action/cooldown/spell/intruder_heal
	name = "Persevere"
	desc = "Muster the willpower to keep going, restoring your stamina and health. Makes an audible sound."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 120 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE

/datum/action/cooldown/spell/intruder_heal/cast(mob/living/cast_on)
	. = ..()
	cast_on.adjustStaminaLoss(-125)
	cast_on.adjustBruteLoss(-80)
	playsound(owner.loc, 'hl13/sound/effects/intruder_regen.ogg', 50, FALSE)

/datum/action/cooldown/spell/intruder_heal/New(Target) //starts on cooldown
	. = ..()
	StartCooldown()

/datum/action/cooldown/spell/conjure_item/random_intruder
	name = "Scrounge"
	desc = "Search your immediate environment for a free, random item."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 90 SECONDS
	item_type = /obj/effect/spawner/random/halflife/loot/intruder/crab/rare/guaranteed
	requires_hands = TRUE
	delete_old = FALSE

	sound = 'hl13/sound/effects/spawnration.ogg'
	sound_varies = FALSE

/datum/action/cooldown/spell/conjure_item/random_intruder/New(Target) //starts on cooldown
	. = ..()
	StartCooldown()

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

/datum/action/cooldown/spell/conjure_item/intruder_decoy/bigboss
	item_type = /obj/item/cardboard_cutout/solid_crab/bigboss

/datum/action/cooldown/spell/conjure_item/intruder_decoy/old
	item_type = /obj/item/cardboard_cutout/solid_crab/old

/datum/action/cooldown/spell/conjure_item/intruder_decoy/raiden
	item_type = /obj/item/cardboard_cutout/solid_crab/raiden

/obj/item/cardboard_cutout/solid_crab
	starting_cutout = "Solid Crab"
	var/crab_type = "Solid"

/obj/item/cardboard_cutout/solid_crab/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 16 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(random_speech)), rand(5 SECONDS, 10 SECONDS))

/obj/item/cardboard_cutout/solid_crab/proc/random_speech()
	if(crab_type == "Solid")
		if(prob(50))
			if(prob(50))
				say("You're pretty good...")
				playsound(src, 'hl13/sound/voice/solid/snakegood.ogg', 50, FALSE)
			else
				say("Kept you waiting, huh?")
				playsound(src, 'hl13/sound/voice/solid/snakewaiting.ogg', 50, FALSE)
	if(crab_type == "Old")
		if(prob(50))
			if(prob(50))
				say("Metal Gear?!")
				playsound(src, 'hl13/sound/voice/solid/oldmetalgear.ogg', 50, FALSE)
			else
				say("Just like old times...")
				playsound(src, 'hl13/sound/voice/solid/oldtimes.ogg', 50, FALSE)
	if(crab_type == "Raiden")
		if(prob(50))
			if(prob(50))
				say("I want you...")
				playsound(src, 'hl13/sound/voice/solid/raidenwantsyou.ogg', 50, FALSE)
			else
				say("Get real!")
				playsound(src, 'hl13/sound/voice/solid/raidenreal.ogg', 50, FALSE)

/obj/item/cardboard_cutout/solid_crab/bigboss
	starting_cutout = "Naked Crab"

/obj/item/cardboard_cutout/solid_crab/old
	starting_cutout = "Old Crab"
	crab_type = "Old"

/obj/item/cardboard_cutout/solid_crab/raiden
	starting_cutout = "Gor-den"
	crab_type = "Raiden"

/datum/cardboard_cutout/solid_crab
	name = "Solid Crab"
	applied_name = "Solid Crab"
	applied_desc = "You're pretty good..."
	mob_spawner = /obj/effect/mob_spawn/corpse/human/solid_crab_look

/datum/cardboard_cutout/solid_crab/get_name()
	return "Solid Crab"

/datum/cardboard_cutout/old_crab
	name = "Old Crab"
	applied_name = "Old Crab"
	applied_desc = "Just like old times..."
	mob_spawner = /obj/effect/mob_spawn/corpse/human/old_crab_look

/datum/cardboard_cutout/old_crab/get_name()
	return "Old Crab"

/datum/cardboard_cutout/naked_crab
	name = "Naked Crab"
	applied_name = "Naked Crab"
	applied_desc = "You're pretty good..."
	mob_spawner = /obj/effect/mob_spawn/corpse/human/naked_crab_look

/datum/cardboard_cutout/naked_crab/get_name()
	return "Naked Crab"

/datum/cardboard_cutout/gorden
	name = "Gor-den"
	applied_name = "Gor-den"
	applied_desc = "I want you..."
	mob_spawner = /obj/effect/mob_spawn/corpse/human/gorden_look

/datum/cardboard_cutout/gorden_crab/get_name()
	return "Gor-den"

/datum/outfit/solid_crab_cutout
	name = "Solid Crab Cardboard cutout"

	head = /obj/item/clothing/head/costume/snakeeater/solid
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

/datum/outfit/old_crab_cutout
	name = "Old Crab Cardboard cutout"

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	mask = /obj/item/cigarette/halflife
	belt = /obj/item/storage/belt/civilprotection
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/milvest/solid
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	gloves = /obj/item/clothing/gloves/color/black

/obj/effect/mob_spawn/corpse/human/old_crab_look
	name = "Old Crab's Appearence"
	hairstyle = "Business Hair"
	haircolor = "#ddddddbb"
	facial_haircolor = "#ddddddbb"
	facial_hairstyle = "Moustache (Selleck)"
	skin_tone = "caucasian2"
	outfit = /datum/outfit/old_crab_cutout

/datum/outfit/naked_crab_cutout
	name = "Naked Crab Cardboard cutout"

	head = /obj/item/clothing/head/costume/snakeeater/solid
	glasses = /obj/item/clothing/glasses/thermal/eyepatch/solid
	mask = /obj/item/cigarette/cigar
	belt = /obj/item/storage/belt/civilprotection
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/bigboss
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	gloves = /obj/item/clothing/gloves/fingerless

/obj/effect/mob_spawn/corpse/human/naked_crab_look
	name = "Naked Crab's Appearence"
	hairstyle = "Combover"
	haircolor = "#663300"
	facial_haircolor = "#663300"
	facial_hairstyle = "Beard (Cropped Fullbeard)"
	skin_tone = "caucasian2"
	outfit = /datum/outfit/naked_crab_cutout

/datum/outfit/gorden_cutout
	name = "Gor-den Cardboard cutout"

	uniform = /obj/item/clothing/under/citizen/rebel/raiden
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	belt = /obj/item/storage/belt/civilprotection
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/katana/raiden

/obj/effect/mob_spawn/corpse/human/gorden_look
	name = "Solid Crab's Appearence"
	hairstyle = "Curls"
	haircolor = "#dab57f"
	facial_hairstyle = "Shaved"
	skin_tone = "caucasian2"
	outfit = /datum/outfit/gorden_cutout

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
	var/boxtype = /obj/structure/closet/cardboard/solid/empty

/obj/item/hl2/deployable_box/interact(mob/user)
	. = ..()
	if(!iscarbon(user))
		return
	if(istype(user.loc, /obj/structure/closet/cardboard/solid/empty))
		var/obj/structure/closet/cardboard/solid/empty/box = user.loc
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
		"re pretty good" = 'hl13/sound/voice/solid/snakegood.ogg', //as far as i know i can't use ' in these so we'll just leave it at pretty good
	)
	var/static/list/old_voicelines = list(
		"Just like old times" = 'hl13/sound/voice/solid/oldtimes.ogg',
		"Liquid" = 'hl13/sound/voice/solid/oldliquid.ogg',
		"Sunlight" = 'hl13/sound/voice/solid/oldsunlight.ogg',
		"Metal Gear" = 'hl13/sound/voice/solid/oldmetalgear.ogg',
	)
	var/static/list/raiden_voicelines = list(
		"Get real" = 'hl13/sound/voice/solid/raidenreal.ogg',
		"Not a chance" = 'hl13/sound/voice/solid/raidenchance.ogg',
		"I want you" = 'hl13/sound/voice/solid/raidenwantsyou.ogg',
		"Whatever" = 'hl13/sound/voice/solid/raidenwhatever.ogg',
	)

	var/operativetype = "Solid"

/obj/item/organ/tongue/solid/old
	actions_types = list(/datum/action/item_action/oldtimes, /datum/action/item_action/liquid, /datum/action/item_action/sunlight, /datum/action/item_action/metalgear)
	operativetype = "Old"

/obj/item/organ/tongue/solid/bigboss
	actions_types = list(/datum/action/item_action/waiting, /datum/action/item_action/moron, /datum/action/item_action/prettygood)
	operativetype = "Big Boss"

/obj/item/organ/tongue/solid/raiden
	actions_types = list(/datum/action/item_action/getreal, /datum/action/item_action/nochance, /datum/action/item_action/iwantyou, /datum/action/item_action/whatever)
	operativetype = "Raiden"

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
	if(istype(action, /datum/action/item_action/oldtimes))
		oldtimes()
	if(istype(action, /datum/action/item_action/sunlight))
		sunlight()
	if(istype(action, /datum/action/item_action/metalgear))
		metalgear()
	if(istype(action, /datum/action/item_action/getreal))
		getreal()
	if(istype(action, /datum/action/item_action/nochance))
		nochance()
	if(istype(action, /datum/action/item_action/iwantyou))
		iwantyou()
	if(istype(action, /datum/action/item_action/whatever))
		whatever()

/obj/item/organ/tongue/solid/modify_speech(datum/source, list/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	if(operativetype == "Old")
		for(var/lines in old_voicelines)
			if(findtext(full_message, lines))
				playsound(source, old_voicelines[lines], 50, FALSE)
				return // only play the first.
	else if(operativetype == "Raiden")
		for(var/lines in raiden_voicelines)
			if(findtext(full_message, lines))
				playsound(source, raiden_voicelines[lines], 50, FALSE)
				return // only play the first.
	else
		for(var/lines in snake_voicelines)
			if(lines == "Liquid" && operativetype == "Big Boss")
				continue //big boss doesnt know liquid
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

/datum/action/item_action/oldtimes
	name = "Just like old times..."

/obj/item/organ/tongue/solid/verb/oldtimes()
	set category = "Object"
	set name = "Just like old times..."
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Just like old times...", forced = src.name)

/datum/action/item_action/sunlight
	name = "SUNLIGHT!!"

/obj/item/organ/tongue/solid/verb/sunlight()
	set category = "Object"
	set name = "SUNLIGHT!!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("SUNLIGHT!!", forced = src.name)

/datum/action/item_action/metalgear
	name = "Metal Gear?!"

/obj/item/organ/tongue/solid/verb/metalgear()
	set category = "Object"
	set name = "Metal Gear?!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Metal Gear?!", forced = src.name)

/datum/action/item_action/getreal
	name = "Get real!"

/obj/item/organ/tongue/solid/verb/getreal()
	set category = "Object"
	set name = "Get real!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Get real!", forced = src.name)

/datum/action/item_action/nochance
	name = "Not a chance!"

/obj/item/organ/tongue/solid/verb/nochance()
	set category = "Object"
	set name = "Not a chance!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Not a chance!", forced = src.name)

/datum/action/item_action/iwantyou
	name = "I want you..."

/obj/item/organ/tongue/solid/verb/iwantyou()
	set category = "Object"
	set name = "I want you..."
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("I want you...", forced = src.name)

/datum/action/item_action/whatever
	name = "Whatever!"

/obj/item/organ/tongue/solid/verb/whatever()
	set category = "Object"
	set name = "Whatever!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, snake_cooldown))
		return

	COOLDOWN_START(src, snake_cooldown, PHRASE_COOLDOWN)

	usr.say("Whatever!", forced = src.name)

#undef PHRASE_COOLDOWN

/obj/item/choice_beacon/intruder_snake_loadout
	name = "equipment delivery beacon"
	desc = "Your full gear was too heavy to bring in through the vents, so you'll be able to use this beacon to have your choice of gear teleported in. Only small items and a small amount of them are able to be teleported in without causing enough disturbances to alarm the Combine, thus making this one use."
	company_source = "Polish Liberation Front"
	company_message = span_bold("Request received and package is being teleported now, Crab!")
	w_class = WEIGHT_CLASS_TINY

/obj/item/choice_beacon/intruder_snake_loadout/generate_display_names()
	var/static/list/options
	if(!options)
		options = list()
		var/list/possible_options = list(
			/obj/item/storage/box/intruder_snake/classic,
			/obj/item/storage/box/intruder_snake/belligerent,
			/obj/item/storage/box/intruder_snake/phantom,
			/obj/item/storage/box/intruder_snake/osp,
		)
		for(var/obj/item/option as anything in possible_options)
			options[initial(option.name)] = option
	return options

/obj/item/choice_beacon/intruder_snake_loadout/spawn_option(obj/item/storage/box/choice_path, mob/living/user)
	if(choice_path == /obj/item/storage/box/intruder_snake/osp)
		GLOB.osp_mode = TRUE
	if(choice_path == /obj/item/storage/box/intruder_snake/phantom)
		GLOB.crab_loadout = "phantom"
	if(choice_path == /obj/item/storage/box/intruder_snake/belligerent)
		GLOB.crab_loadout = "belligerent"
	var/obj/item/storage/just_a_box = new choice_path(user.loc)
	just_a_box.emptyStorage() //the box is just a vessel for easy transport and itemization, it serves no purpose afterwards
	qdel(just_a_box)

/obj/item/storage/box/intruder_snake/classic
	name = "Solid Operator - (ALL-ROUNDER, CLASSIC)"

/obj/item/storage/box/intruder_snake/classic/PopulateContents()
	new /obj/item/storage/belt/civilprotection/polish_resistance/solid(src)
	new /obj/item/storage/backpack/halflife/satchel/civilprotection/solid/tranq(src)

/obj/item/storage/box/intruder_snake/belligerent
	name = "Belligerent Operator - (LETHAL, LOUD)"

/obj/item/storage/box/intruder_snake/belligerent/PopulateContents()
	new /obj/item/storage/belt/civilprotection/polish_resistance/solid/belligerent(src)
	new /obj/item/storage/backpack/halflife/satchel/civilprotection/solid/m4a1(src)

/obj/item/storage/box/intruder_snake/phantom
	name = "Phantom Operator - (PURE STEALTH, NON-LETHAL)"

/obj/item/storage/box/intruder_snake/phantom/PopulateContents()
	new /obj/item/storage/belt/civilprotection/polish_resistance/solid/phantom(src)
	new /obj/item/storage/backpack/halflife/satchel/civilprotection/solid/tranq_only(src)

/obj/item/storage/box/intruder_snake/osp
	name = "Naked Operator - (!!HARDMODE!!, ON-SITE PROCUREMENT)"

/obj/item/storage/box/intruder_snake/osp/PopulateContents()
	new /obj/item/storage/belt/civilprotection/polish_resistance/solid/belligerent/empty(src) //upside to this loadout is that you get to carry famas mags for the low low cost of everything
	new /obj/item/storage/backpack/halflife/satchel/civilprotection/solid(src)
