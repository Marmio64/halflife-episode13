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
	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE)
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

/obj/effect/mob_spawn/corpse/human/plf_veteran
	name = "PLF Veteran"
	hairstyle = "Business Hair 3"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/plf_veteran

/datum/outfit/plf_veteran
	name = "PLF Veteran Corpse"

	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	uniform = /obj/item/clothing/under/syndicate/camo/halflife
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/color/black

/mob/living/basic/trooper/rebel/mp7/follower
	name = "Rebel Soldier Follower"
	desc = "The symbol of resistance. Follows orders from his superiors."
	var/list/pet_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/follow,
		/datum/pet_command/scatter,
	)

/mob/living/basic/trooper/rebel/mp7/follower/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/obeys_commands, pet_commands)

/mob/living/basic/trooper/rebel/mp7/plf
	name = "PLF Soldier"
	desc = "A symbol of the Polish Resistance, proudly wielding an MP7."

	maxHealth = 150
	health = 150

	ranged_cooldown = 1.75 SECONDS

	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/plf_infantry
	loot = list(/obj/effect/mob_spawn/corpse/human/plf_trooper)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/plf_trooper

/mob/living/basic/trooper/rebel/mp7/plf/boss
	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE, FACTION_ANTLION, FACTION_HEADCRAB)
	speed = 0

/mob/living/basic/trooper/rebel/mp7/plf/boss/blu
	name = "BLU Soldier"
	faction = list(FACTION_COMBINE)
	color = "#0077ff"

/mob/living/basic/trooper/rebel/mp7/plf/boss/red
	name = "RED Soldier"
	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE)
	color = "#ff0000"

/obj/effect/mob_spawn/corpse/human/plf_trooper
	name = "PLF Trooper"
	hairstyle = "Business Hair 3"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/plf_trooper_corpse

/datum/outfit/plf_trooper_corpse
	name = "PLF Soldier Corpse"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/poland
	mask = /obj/item/clothing/mask/gas/hl2/military
	uniform = /obj/item/clothing/under/syndicate/camo/halflife
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	accessory = /obj/item/clothing/accessory/armband/plf

/mob/living/basic/trooper/rebel/mp7/veteran
	name = "PLF Veteran"
	desc = "A towering revenant left from a nation supposedly long-gone, wading through a sea of the dead, clad in dirty-green armour adorned with the white-red banner of the Polish Free State."

	loot = list(/obj/effect/mob_spawn/corpse/human/plf_veteran)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/plf_veteran
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/plf_veteran
	r_hand = /obj/item/gun/ballistic/automatic/ak47
	maxHealth = 400
	health = 400

	casingtype = /obj/item/ammo_casing/n762
	projectilesound = "hl13/sound/weapons/ak47fire.ogg"
	burst_shots = 3

	ranged_cooldown = 1.75 SECONDS

	speed = 1.25

/mob/living/basic/trooper/rebel/mp7/veteran/boss
	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE, FACTION_ANTLION, FACTION_HEADCRAB)

/mob/living/basic/trooper/rebel/mp7/veteran/boss/blu
	name = "BLU Veteran"
	faction = list(FACTION_COMBINE)
	color = "#0077ff"

/mob/living/basic/trooper/rebel/mp7/veteran/boss/red
	name = "RED Veteran"
	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE)
	color = "#ff0000"

// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
/datum/ai_planning_subtree/random_speech/rebelsoldier
	speech_chance = 4
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

/datum/ai_planning_subtree/random_speech/plfsoldier
	speech_chance = 4
	speak = list(
		"When this is all over, I am gonna mate.",
		"I need a pierogi.",
		"The Free State stands.",
		"Poland is not yet dead.",
		"Any spare rations?",
		"On and on and on.",
		"I can't remember the last time I had, well, anything.",
		"Shouldn't we be doing something?",
		"Oh, that's gotta hurt.",
		"I've got my little corner and I'm sticking to it.",
		"The war has to end someday.",
		"I can't remember the last time I had a shower.",
		"Things are looking up for a change.",
		"They're never gonna make a stalker out of me.",
		"Finally, change is in the air!",
		"We'll evict the imperialists someday.",
		"I think I ate something bad.",
		"I'm gonna stay and hold down this spot.",
	)

/datum/ai_controller/basic_controller/trooper/ranged/burst/plf_infantry
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/plfsoldier,
	)

/datum/ai_planning_subtree/random_speech/plfveteran
	speech_chance = 4
	speak = list(
		"We march onwards!",
		"Together, comrades!",
		"The Free State stands!",
		"Poland is not yet dead!",
		"We shall not fail!",
		"The momentum is ours!",
		"No cost is too great!",
		"What the alien force has taken from us, we retrieve!",
		"To arms, comrades!",
		"On to war!",
		"The liberation will come!",
		"No mercy for the traitors!",
		"No mercy for the imperialists!",
		"We shall not falter!",
		"Check your ammunition, comrades!",
	)
/datum/ai_controller/basic_controller/trooper/ranged/burst/plf_veteran
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/plfveteran,
	)
