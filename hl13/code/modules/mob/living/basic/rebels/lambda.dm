/// rebel troopers
/mob/living/basic/trooper/rebel/mp7
	name = "Rebel Soldier"
	desc = "The symbol of resistance."
	blood_volume = BLOOD_VOLUME_NORMAL
	loot = list(/obj/effect/mob_spawn/corpse/human/rebelsoldier)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/rebelsoldier
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/rebel
	r_hand = /obj/item/gun/ballistic/automatic/mp7
	maxHealth = 120
	health = 120
	death_sound = 'hl13/sound/voice/human/scream/malescream_8.ogg'
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c46x30mm/mp7
	/// Sound to play when firing weapon
	var/projectilesound = 'hl13/sound/weapons/smgfire.ogg'
	/// number of burst shots
	var/burst_shots = 4
	/// Time between taking shots
	var/ranged_cooldown = 2 SECONDS

/mob/living/basic/trooper/rebel/mp7/Initialize(mapload)
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

/obj/effect/mob_spawn/corpse/human/rebelsoldier
	name = "Rebel Soldier"
	hairstyle = "Business Hair 3"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/rebelsoldier

/datum/outfit/rebelsoldier
	name = "Rebel Soldier Corpse"

	head = /obj/item/clothing/head/beanie/black
	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
/datum/ai_planning_subtree/random_speech/rebelsoldier
	speech_chance = 5
	speak = list(
		"When this is all over, I am gonna mate.",
		"Sometimes, I dream about cheese.",
		"Lemme get out of your way.",
		"Here, take this medkit.",
		"Here, take this ammo.",
		"I'm not even gonna tell you to shut up.",
		"I can't remember the last time I had, well, anything.",
		"Shouldn't we be doing something?",
		"If you dare say 'That's gotta hurt,' I'll kill you.",
		"I've got my little corner and I'm sticking to it.",
		"I don't think this war's ever gonna end.",
		"I can't remember the last time I had a shower.",
		"I'm not a betting man, but the odds are not good.",
		"Looks to me like things are getting worse, not better.",
		"They're never gonna make a stalker out of me.",
		"Finally, change is in the air!",
		"This is bullshit!",
		"I think I ate something bad.",
		"I'm gonna stay and hold down this spot.",
	)

/datum/ai_controller/basic_controller/trooper/ranged/burst/rebel
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/rebelsoldier,
	)
