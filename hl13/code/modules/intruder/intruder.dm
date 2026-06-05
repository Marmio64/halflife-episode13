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

	combat_music = 'hl13/sound/music/combat/bigshell.ogg' //i like this alert theme more than encounter tbh

	extra_end = 5
	extra_dex = 5
	extra_str = 8

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
	H.fully_replace_character_name(H.real_name,"Solid Crab")

	var/list/spawn_locs = list()
	for(var/X in GLOB.the_hidden)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))

	var/datum/martial_art/cqc/bigboss = new
	bigboss.teach(H)

	H.dna.species.stunmod = 0.5
	H.mind?.adjust_experience(/datum/skill/scavenging, 1200)

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
	slowdown = -0.5 //you're pretty quick when you need to be, but low dexterity doesn't let you run for very long

/obj/item/clothing/shoes/jackboots/civilprotection/solid
	name = "Sneaking Shoes"
	desc = "Snug and secure black boots worn by civil protection forces. It's been modified to suppress your footsteps."
	squeaks = FALSE

/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid
	desc = "A small and light 9mm pistol which is often used as a metropolice standard carry. Unlike most found in the city, nearly every part of this gun has been expertly crafted and customized. Where'd you get something like this...?"
	projectile_damage_multiplier = 2.5

/obj/item/storage/belt/civilprotection/polish_resistance/solid
	desc = "Heavy duty belt for containing metrocop standard gear. Can also carry rations."

/obj/item/storage/belt/civilprotection/polish_resistance/solid/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 9
	atom_storage.set_holdable(list(
		/obj/item/ammo_box,
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
		/obj/item/ammo_box/colta357,
		/obj/item/ammo_box/magazine/ar2,
		/obj/item/stack/medical/gauze,
		/obj/item/storage/box/lethalshot,
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
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/pill/patch/medkit/ration
	name = "Ration"
	desc = "A ration. If this were some kind of stealth game, this would probably heal you up..."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "seafood"
	apply_sound = 'hl13/sound/items/ration.ogg'
