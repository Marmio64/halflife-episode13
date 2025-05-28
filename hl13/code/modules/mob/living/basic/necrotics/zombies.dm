/mob/living/basic/halflife/zombie
	name = "Zombie"
	desc = "A shambling human, taken over by a parasitic head crab."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_XENIAN
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/sheet/cloth = 1)
	maxHealth = 100
	health = 100
	obj_damage = 15
	melee_damage_lower = 16
	melee_damage_upper = 19
	sharpness = SHARP_EDGED
	wound_bonus = -15
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'hl13/sound/creatures/zombieattack.ogg'
	combat_mode = TRUE
	status_flags = CANPUSH
	speed = 1.7
	death_sound = 'hl13/sound/creatures/zombiedeath.ogg'
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombie
	initial_language_holder = /datum/language_holder/zombie
	var/no_crab_state = "zombie_dead_nocrab"
	var/crabless_possible = TRUE
	var/headcrabspawn = /mob/living/basic/halflife/headcrab
	var/headcrabspawn_chance = 25
	var/idle_sound_chance = 20
	var/sound_vary = TRUE
	var/fungalheal = FALSE
	var/idle_sounds = list('hl13/sound/creatures/zombiesound.ogg', 'hl13/sound/creatures/zombiesound2.ogg', 'hl13/sound/creatures/zombiesound3.ogg')

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!
	lighting_cutoff_red = 25
	lighting_cutoff = 8

/mob/living/basic/halflife/zombie/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, sound_vary)
	//If there is fungal infestation on the ground, and the zombie can heal off of it, do so
	if(fungalheal)
		if(locate(/obj/structure/alien/weeds) in src.loc)
			adjust_health(-maxHealth*0.05)


/mob/living/basic/halflife/zombie/death(gibbed)
	if(prob(headcrabspawn_chance) && crabless_possible) //25% chance to spawn a headcrab on death by default
		icon_dead = no_crab_state
		icon_state = no_crab_state
		new headcrabspawn(get_turf(src))
	..()

/mob/living/basic/halflife/zombie/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_SHOE)

/mob/living/basic/halflife/zombie/zombine
	name = "Zombine"
	desc = "A shambling combine soldier, taken over by a parasitic head crab. Capable of running and is heavily armored."
	icon_state = "zombine"
	icon_living = "zombie"
	icon_dead = "zombine_dead"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/kevlar = 3)
	maxHealth = 140
	health = 140
	speed = 1.5
	attack_sound = 'hl13/sound/creatures/zombineattack.ogg'
	death_sound = 'hl13/sound/creatures/zombinedeath.ogg'
	crabless_possible = FALSE
	idle_sounds = list('hl13/sound/creatures/zombinesound1.ogg', 'hl13/sound/creatures/zombinesound2.ogg', 'hl13/sound/creatures/zombinesound3.ogg', 'hl13/sound/creatures/zombinesound4.ogg')
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombine

/mob/living/basic/halflife/zombie/fungal
	name = "Fungal Zombie"
	desc = "A shambling human, taken over by a parasitic head crab. This one is covered in a spreading fungal infection."
	icon_state = "fungalzombie"
	icon_living = "fungalzombie"
	icon_dead = "fungalzombie_dead"
	no_crab_state = "fungalzombie_nocrab"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/sheet/animalhide/goliath_hide = 1, /obj/item/stack/sheet/cloth = 1)
	maxHealth = 140
	health = 140
	speed = 1.85
	headcrabspawn = /mob/living/basic/halflife/headcrab/armored
	fungalheal = TRUE
	var/datum/action/cooldown/spell/conjure/xenfloor/infest

/mob/living/basic/halflife/zombie/fungal/Initialize(mapload)
	. = ..()
	infest = new(src)
	infest.Grant(src)

/mob/living/basic/halflife/zombie/fast
	name = "Fast Zombie"
	desc = "A terrifying skinless human, taken over by a parasitic head crab."
	icon_state = "fastzombie"
	icon_living = "fastzombie"
	icon_dead = "fastzombie_dead"
	no_crab_state = "fastzombie_nocrab"
	maxHealth = 75
	health = 75
	speed = 0
	melee_attack_cooldown = 0.7 SECONDS
	melee_damage_lower = 5
	melee_damage_upper = 6
	sound_vary = FALSE
	butcher_results = list(/obj/item/stack/sheet/sinew = 2, /obj/item/food/meat/slab/halflife/zombie = 1)
	attack_sound = 'hl13/sound/creatures/fastzombieattack.ogg'
	death_sound = 'hl13/sound/creatures/fastzombiedeath.ogg'
	idle_sound_chance = 100
	idle_sounds = list('hl13/sound/creatures/fastzombie_breath.ogg', 'hl13/sound/creatures/fastzombiesound1.ogg', 'hl13/sound/creatures/fastzombiesound2.ogg', 'hl13/sound/creatures/fastzombiesound3.ogg')
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/fastzombie

/// Returns a list of actions and blackboard keys to pass into `grant_actions_by_list`.
/mob/living/basic/halflife/zombie/fast/proc/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/jump/fast_zombie = BB_HALFLIFE_JUMP_ABILITY,
	)
	return innate_abilities

/mob/living/basic/halflife/zombie/fast/Initialize(mapload)
	. = ..()
	grant_actions_by_list(get_innate_abilities())

/datum/action/cooldown/mob_cooldown/halflife/jump
	name = "Leap"
	desc = "Leap towards the enemy!"
	cooldown_time = 7 SECONDS
	shared_cooldown = NONE
	///telegraph time before jumping
	var/wind_up_time = 0.5 SECONDS
	///intervals between each of our attacks
	var/attack_interval = 0.4 SECONDS
	///how many times do we attack if we reach the target?
	var/times_to_attack = 2
	///what sound to play as telegraph?
	var/sound_cue = 'sound/items/weapons/thudswoosh.ogg'

/datum/action/cooldown/mob_cooldown/halflife/jump/fast_zombie
	sound_cue = 'hl13/sound/creatures/fastzombieleap.ogg'

/datum/action/cooldown/mob_cooldown/halflife/jump/Activate(atom/target)
	if(owner.CanReach(target))
		attack_combo(target)
		StartCooldown()
		return TRUE

	addtimer(CALLBACK(src, PROC_REF(launch_towards_target), target), wind_up_time)
	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/launch_towards_target(atom/target)
	playsound(owner, sound_cue, 50, FALSE)
	var/turf/target_turf = get_turf(target)

	if(!target_turf.is_blocked_turf())
		owner.throw_at(target = target_turf, range = 7, speed = 1, spin = FALSE, callback = CALLBACK(src, PROC_REF(attack_combo), target))
		return

	var/list/open_turfs = list()

	for(var/turf/possible_turf in get_adjacent_open_turfs(target))
		if(possible_turf.is_blocked_turf())
			continue
		open_turfs += possible_turf

	if(!length(open_turfs))
		return

	var/turf/final_turf = get_closest_atom(/turf, open_turfs, owner)
	owner.throw_at(target = final_turf, range = 7, speed = 1, spin = FALSE, callback = CALLBACK(src, PROC_REF(attack_combo), target))

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/attack_combo(atom/target)
	if(!owner.CanReach(target))
		return FALSE

	for(var/i in 0 to (times_to_attack - 1))
		addtimer(CALLBACK(src, PROC_REF(attack_target), target), i * attack_interval)

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/attack_target(atom/target)
	if(!owner.CanReach(target) || owner.stat == DEAD)
		return
	var/mob/living/basic/basic_owner = owner
	basic_owner.melee_attack(target, ignore_cooldown = TRUE)

/mob/living/basic/halflife/zombie/freshly_crabbed
	icon_state = "headcrabhead"
	basic_mob_flags = DEL_ON_DEATH
	headcrabspawn_chance = 100
	/// The dead body we have inside
	var/mob/living/carbon/human/corpse

/mob/living/basic/halflife/zombie/freshly_crabbed/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_PERMANENTLY_MORTAL, INNATE_TRAIT) // This mob doesn't function visually without a corpse and wouldn't respawn with one

/mob/living/basic/halflife/zombie/freshly_crabbed/death(gibbed)
	corpse?.forceMove(loc)
	return ..()

/mob/living/basic/halflife/zombie/freshly_crabbed/Exited(atom/movable/gone, direction)
	. = ..()
	if (gone != corpse)
		return
	corpse = null
	death()

/mob/living/basic/halflife/zombie/freshly_crabbed/Destroy()
	QDEL_NULL(corpse)
	return ..()

//Sets up our appearance
/mob/living/basic/halflife/zombie/freshly_crabbed/proc/set_up_zombie_appearance()
	copy_overlays(corpse, TRUE)
	var/mutable_appearance/blob_head_overlay = mutable_appearance('hl13/icons/mob/halflife.dmi', "headcrabhead")
	overlays += blob_head_overlay

/// Store a body so that we can drop it on death
/mob/living/basic/halflife/zombie/freshly_crabbed/proc/consume_corpse(mob/living/carbon/human/new_corpse)
	new_corpse.death()
	if(new_corpse.wear_suit)
		maxHealth += new_corpse.get_armor_rating(MELEE)
		health = maxHealth
	new_corpse.set_facial_hairstyle("Shaved", update = FALSE)
	new_corpse.set_hairstyle("Bald", update = TRUE)
	new_corpse.forceMove(src)
	corpse = new_corpse
	update_appearance(UPDATE_ICON)
	set_up_zombie_appearance()
	RegisterSignal(corpse, COMSIG_LIVING_REVIVE, PROC_REF(on_corpse_revived))

/// Dynamic changeling reentry
/mob/living/basic/halflife/zombie/freshly_crabbed/proc/on_corpse_revived()
	SIGNAL_HANDLER
	visible_message(span_boldwarning("[src] bursts from the inside!"))
	death()

// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
/datum/ai_planning_subtree/random_speech/halflife/zombine
	speech_chance = 2
	speak = list(
		"S-Sector, nnnot... secur-e-e...",
		"B-Biotics-s...",
		"O-Over...watch... r-r-reserve...",
	)

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombie
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/halflife/zombie,
	)

/datum/ai_planning_subtree/random_speech/halflife/zombie
	speech_chance = 2
	speak = list(
		"OH G-GOD!",
		"G-GOD HELP ME!",
		"K-KILL ME!",
	)

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombine
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/halflife/zombine,
	)

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/fastzombie
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/targeted_mob_ability/fastzombie_jump,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_planning_subtree/targeted_mob_ability/fastzombie_jump
	ability_key = BB_HALFLIFE_JUMP_ABILITY
