/mob/living/basic/citizen
	name = "Citizen"
	desc = "A smelly, raving bluesuit who may have drank one too many cans of breen water."
	blood_volume = BLOOD_VOLUME_NORMAL
	icon = 'icons/mob/simple/simple_human.dmi'
	speed = 0
	ai_controller = /datum/ai_controller/basic_controller/citizen
	maxHealth = 120
	health = 120
	obj_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 12
	death_sound = 'hl13/sound/voice/human/scream/malescream_8.ogg'
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/items/weapons/genhit1.ogg'

	basic_mob_flags = DEL_ON_DEATH

	///The spawner we use to create our look
	var/spawner_path = /obj/effect/mob_spawn/corpse/human/citizen
	///Our species to create our look
	var/species_path = /datum/species/human
	///The loot we drop when we die
	var/loot = list(/obj/effect/mob_spawn/corpse/human/citizen)
	///Weapon path, for visuals
	var/held_weapon_visual = null

/mob/living/basic/citizen/brick
	obj_damage = 17
	melee_damage_lower = 16
	melee_damage_upper = 19
	attack_verb_continuous = "clobbers"
	attack_verb_simple = "clobber"
	attack_sound = 'hl13/sound/halflifeweapons/meleesounds/genericblunt_hit.ogg'
	held_weapon_visual = /obj/item/stack/sheet/halflife/brick

/mob/living/basic/citizen/Initialize(mapload)
	. = ..()
	apply_dynamic_human_appearance(src, species_path = species_path, mob_spawn_path = spawner_path, r_hand = held_weapon_visual)

	AddElement(/datum/element/footstep, FOOTSTEP_MOB_SHOE)
	AddElement(/datum/element/ai_flee_while_injured)

	AddElement(/datum/element/ai_retaliate)
	if(LAZYLEN(loot))
		loot = string_list(loot)
		AddElement(/datum/element/death_drops, loot)

/obj/effect/mob_spawn/corpse/human/citizen
	name = "Citizen"
	outfit = /datum/outfit/citizen

/obj/effect/mob_spawn/corpse/human/refugee
	name = "Refugee"
	outfit = /datum/outfit/generic_refugee

/datum/outfit/citizen
	name = "Citizen Corpse"

	uniform = /obj/item/clothing/under/citizen
	shoes = /obj/item/clothing/shoes/boots

/datum/outfit/generic_refugee
	name = "Refugee Corpse"

	uniform = /obj/item/clothing/under/citizen/refugee
	shoes = /obj/item/clothing/shoes/boots

// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
/datum/ai_planning_subtree/random_speech/citizen
	speech_chance = 7
	speak = list(
		"They're always departing but they never arrive...",
		"No one ever gets on but they're always...",
		"Don't drink the water. They put something in it to make you forget. I don't even remember how I got here.",
		"Just one more can, just one more can...",
		"I'm working up the nerve to go on.",
		"Word to the wise: keep it to yourself.",
		"What... what time is it...?",
		"It was only a matter of time, it was only a matter of time...",
		"We can't be seen talking to each other.",
		"If you're looking for a place to stay, you better keep going.",
		"I've got my little corner and I'm sticking to it.",
		"This is all I have left, please... just leave me alone...",
		"I can't remember the last time I had a shower...",
		"To think, all I used to wanna do is sell insurance...",
		"I think I ate something bad...",
	)

/datum/ai_controller/basic_controller/citizen
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_nearest_target_to_flee,
		/datum/ai_planning_subtree/flee_target,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/citizen,
	)
