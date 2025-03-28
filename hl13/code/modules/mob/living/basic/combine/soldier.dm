/// Overwatch troopers
/mob/living/basic/trooper/combine/soldier
	name = "Overwatch Soldier"
	desc = "Deploy. Cauterize. Extract."
	blood_volume = BLOOD_VOLUME_NORMAL
	faction = list(FACTION_COMBINE)
	loot = list(/obj/effect/mob_spawn/corpse/human/combinesoldier)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combinesoldier
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/combine
	r_hand = /obj/item/gun/ballistic/automatic/mp7
	maxHealth = 160
	health = 160
	death_sound = 'hl13/sound/voice/otavoicelines/die1.ogg'
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c46x30mm/mp7
	/// Sound to play when firing weapon
	var/projectilesound = 'hl13/sound/weapons/smgfire.ogg'
	/// number of burst shots
	var/burst_shots
	/// Time between taking shots
	var/ranged_cooldown = 0.2 SECONDS

/mob/living/basic/trooper/combine/soldier/burst
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/combine
	burst_shots = 4
	ranged_cooldown = 2 SECONDS

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

// SHOTGUNER ------------------------------------------------------------------------
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

// GRUNT ------------------------

/mob/living/basic/trooper/combine/soldier/grunt
	name = "Overwatch Grunt"
	loot = list(/obj/effect/mob_spawn/corpse/human/combinegrunt)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combinegrunt
	r_hand = /obj/item/gun/ballistic/automatic/pulsesmg
	casingtype = /obj/item/ammo_casing/caseless/pulse/smg
	projectilesound = 'hl13/sound/weapons/pulsesmgfire.ogg'
	maxHealth = 125
	health = 125

/obj/effect/mob_spawn/corpse/human/combinegrunt
	name = "Overwatch Grunt"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/combinegrunt

/datum/outfit/combinegrunt
	name = "Overwatch Grunt Corpse"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt
	suit = null
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt
	back = /obj/item/tank/internals/oxygen/grunt

/mob/living/basic/trooper/combine/soldier/grunt/burst
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/combine
	burst_shots = 3
	ranged_cooldown = 2 SECONDS

// ELITE SOLDIER ------------------------------------
/mob/living/basic/trooper/combine/soldier/elite
	name = "Overwatch Elite"
	loot = list(/obj/effect/mob_spawn/corpse/human/combineelite)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/combineelite
	r_hand = /obj/item/gun/ballistic/automatic/ar2
	casingtype = /obj/item/ammo_casing/caseless/pulse/ar2
	projectilesound = "hl13/sound/weapons/ar2fire.ogg"
	ranged_cooldown = 0.4 SECONDS
	maxHealth = 220
	health = 220

/mob/living/basic/trooper/combine/soldier/elite/burst
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/combine
	burst_shots = 3
	ranged_cooldown = 2 SECONDS

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


// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
/datum/ai_planning_subtree/random_speech/combinesoldier
	speech_chance = 3
	sound = list('hl13/sound/voice/otaradio/off1.ogg', 'hl13/sound/voice/otaradio/off2.ogg', 'hl13/sound/voice/otaradio/off3.ogg')
	emote_see = list("squares their arm, and gestures to advance.", "holds a finger to their helmet radio.", "checks their firearm magazine.", "looks around.")
	speak = list(
		"Copy, Echo-1 holding.",
		"Blip on bioscanner read.",
		"Checking radials.",
		"Bodypack systems holding, confirmed secondary check.",
		"Copy, ready to sterilize.",
		"Stabilization is ago.",
		"Prepping extractors.",
		"Verdicts at full.",
		"Overwatch, may require reserve activation.",
		"Prepped for contact.",
	)

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

/datum/ai_controller/basic_controller/trooper/ranged/burst/combine
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/combinesoldier,
	)
