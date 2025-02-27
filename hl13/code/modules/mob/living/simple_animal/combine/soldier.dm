/// Overwatch troopers
/mob/living/basic/trooper/combine/soldier
	name = "Overwatch Soldier"
	desc = "Deploy. Cauterize. Extract."
	faction = list(FACTION_COMBINE)
	loot = list(/obj/effect/mob_spawn/corpse/human/combinesoldier)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combinesoldier
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/combine
	r_hand = /obj/item/gun/ballistic/automatic/mp7
	maxHealth = 150
	health = 150
	death_sound = 'hl13/sound/voice/otavoicelines/die1.ogg'
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c46x30mm/mp7
	/// Sound to play when firing weapon
	var/projectilesound = 'hl13/sound/weapons/smgfire.ogg'
	/// number of burst shots
	var/burst_shots
	/// Time between taking shots
	var/ranged_cooldown = 0.2 SECONDS

/mob/living/basic/trooper/combine/soldier/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
	if (ranged_cooldown <= 1 SECONDS)
		AddComponent(/datum/component/ranged_mob_full_auto)

/obj/effect/mob_spawn/corpse/human/combinesoldier
	name = "Overwatch Soldier"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/combinesoldier

/datum/outfit/combinesoldier
	name = "Overwatch Soldier Corpse"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch

/mob/living/basic/trooper/combine/soldier/shotgunner
	name = "Overwatch Shotgunner"
	loot = list(/obj/effect/mob_spawn/corpse/human/combineshotgunner)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combineshotgunner
	r_hand = /obj/item/gun/ballistic/shotgun/spas12
	casingtype = /obj/item/ammo_casing/shotgun/buckshot/halflife
	projectilesound = "hl13/sound/weapons/shotgunfire.ogg"
	ranged_cooldown = 1.5 SECONDS
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/shotgunner/combine

/obj/effect/mob_spawn/corpse/human/combineshotgunner
	name = "Overwatch Shotgunner"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/combineshotgunner

/datum/outfit/combineshotgunner
	name = "Overwatch Shotgunner Corpse"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch

/mob/living/basic/trooper/combine/soldier/elite
	name = "Overwatch Elite"
	loot = list(/obj/effect/mob_spawn/corpse/human/combineelite)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combineelite
	r_hand = /obj/item/gun/ballistic/automatic/ar2
	casingtype = /obj/item/ammo_casing/caseless/pulse/ar2
	projectilesound = "hl13/sound/weapons/ar2fire.ogg"
	ranged_cooldown = 0.4 SECONDS
	maxHealth = 200
	health = 200

/obj/effect/mob_spawn/corpse/human/combineelite
	name = "Overwatch Elite"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/combineelite

/datum/outfit/combineelite
	name = "Overwatch Elite Corpse"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/elite
	suit = /obj/item/clothing/suit/armor/overwatch/elite
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch

/datum/ai_planning_subtree/random_speech/combinesoldier
	speech_chance = 10
	sound = list('hl13/sound/voice/otavoicelines/affirmative.ogg', 'hl13/sound/voice/otavoicelines/contact.ogg', 'hl13/sound/voice/otavoicelines/bodypackholding.ogg')

/datum/ai_controller/basic_controller/trooper/ranged/combine
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/combinesoldier,
	)

/datum/ai_controller/basic_controller/trooper/ranged/shotgunner/combine
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_shotgun,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/combinesoldier,
	)
