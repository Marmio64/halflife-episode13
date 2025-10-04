/mob/living/basic/halflife/zombie
	name = "Zombie"
	desc = "The shambling husk of something that was once human, now parasitized by a headcrab and twisted into a terrible monster."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_XENIAN
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/sheet/cloth = 1)
	maxHealth = 100
	health = 100
	obj_damage = 14
	melee_damage_lower = 18
	melee_damage_upper = 23
	sharpness = SHARP_EDGED
	wound_bonus = -15
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'hl13/sound/creatures/zombieattack.ogg'
	combat_mode = TRUE
	status_flags = CANPUSH
	speed = 1.75
	death_sound = 'hl13/sound/creatures/zombiedeath.ogg'
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombie
	initial_language_holder = /datum/language_holder/zombie
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT //allows playing dead
	basic_mob_flags = FLAMMABLE_MOB
	var/no_crab_state = "zombie_dead_nocrab"
	var/crabless_possible = TRUE
	var/headcrabspawn = /mob/living/basic/halflife/headcrab
	var/headcrabspawn_chance = 25
	var/idle_sound_chance = 18
	var/sound_vary = FALSE
	var/fungalheal = FALSE
	var/idle_sounds = list('hl13/sound/creatures/zombiesound.ogg', 'hl13/sound/creatures/zombiesound2.ogg', 'hl13/sound/creatures/zombiesound3.ogg', 'hl13/sound/creatures/zombiesound4.ogg')

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!
	lighting_cutoff_red = 25
	lighting_cutoff = 25

	fire_stack_decay_rate = -1
	damage_coeff = list(BRUTE = 1, BURN = 2, TOX = 1, STAMINA = 1, OXY = 1)

/mob/living/basic/halflife/zombie/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, sound_vary, -3)
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
	icon_living = "zombine"
	icon_dead = "zombine_dead"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/kevlar = 3)
	maxHealth = 140
	health = 140
	attack_sound = 'hl13/sound/creatures/zombineattack.ogg'
	death_sound = 'hl13/sound/creatures/zombinedeath.ogg'
	crabless_possible = FALSE
	idle_sounds = list('hl13/sound/creatures/zombinesound1.ogg', 'hl13/sound/creatures/zombinesound2.ogg', 'hl13/sound/creatures/zombinesound3.ogg', 'hl13/sound/creatures/zombinesound4.ogg')
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombine

/mob/living/basic/halflife/zombie/zombine/slow
	speed = 2

/mob/living/basic/halflife/zombie/zombine/elite
	name = "Elite Zombine"
	desc = "A shambling combine soldier, taken over by a parasitic head crab. Capable of running and is equipped with heavy elite combine armor."
	icon_state = "elite"
	icon_living = "elite"
	icon_dead = "elite_dead"
	maxHealth = 200
	health = 200

/// Returns a list of actions and blackboard keys to pass into `grant_actions_by_list`.
/mob/living/basic/halflife/zombie/zombine/proc/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/zombine_grenade = BB_HALFLIFE_GRENADE_ABILITY,
		/datum/action/cooldown/mob_cooldown/halflife/jump/zombine = BB_HALFLIFE_JUMP_ABILITY,
	)
	return innate_abilities

/mob/living/basic/halflife/zombie/zombine/Initialize(mapload)
	. = ..()
	grant_actions_by_list(get_innate_abilities())
	AddComponent(/datum/component/ai_target_timer)
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_ZOMBINE)

/datum/action/cooldown/mob_cooldown/halflife/zombine_grenade
	name = "Arm Grenade"
	desc = "Take out a grenade arm it, briefly stunning yourself afterwards. The explosion will be fatal to you, and heavily injure all nearby."
	cooldown_time = 10 SECONDS
	shared_cooldown = NONE
	///telegraph time before activating
	var/wind_up_time = 0.65 SECONDS
	var/detonation_time = 3.5 SECONDS
	click_to_activate = FALSE
	///what sound to play as telegraph?
	var/sound_cue = 'sound/items/weapons/armbomb.ogg'
	var/user_noise = 'hl13/sound/creatures/zombine_readygrenade1.ogg'

/datum/action/cooldown/mob_cooldown/halflife/zombine_grenade/Activate(atom/target)
	StartCooldown()
	target.icon_state = "[initial(target.icon_state)]_grenade"
	target.visible_message(span_boldwarning("[target] arms a grenade!"))
	playsound(target, sound_cue, 50, FALSE)
	playsound(target, user_noise, 50, FALSE)

	if(isliving(target))
		var/mob/living/M = target
		M.Stun(wind_up_time, ignore_canstun = TRUE) //give a tiny amount of time for nearby people to run for it
	addtimer(CALLBACK(src, PROC_REF(grenade_explosion), target), detonation_time)
	return TRUE

/datum/action/cooldown/mob_cooldown/halflife/zombine_grenade/proc/grenade_explosion(atom/target)
	explosion(target, 0, 2, 3, 0)
	if(isliving(target))
		var/mob/living/M = target
		M.gib()

/datum/action/cooldown/mob_cooldown/halflife/jump/zombine
	name = "Charge"
	desc = "Charge towards the enemy!"
	shared_cooldown = MOB_SHARED_COOLDOWN_1
	times_to_attack = 1
	jump_speed = 0.6
	cooldown_time = 9 SECONDS
	sound_cue = 'hl13/sound/creatures/zombine_charge.ogg'

/mob/living/basic/halflife/zombie/zombie_grunt
	name = "Zombified Grunt"
	desc = "A mobile zombie which has speed rivalling that of a fast zombie, without the frailty."
	icon_state = "grunt"
	icon_living = "grunt"
	icon_dead = "grunt_dead"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/kevlar = 1)
	speed = 1
	attack_sound = 'hl13/sound/creatures/zombineattack.ogg'
	death_sound = 'hl13/sound/creatures/zombinedeath.ogg'
	crabless_possible = FALSE
	idle_sounds = list('hl13/sound/creatures/zombinesound1.ogg', 'hl13/sound/creatures/zombinesound2.ogg', 'hl13/sound/creatures/zombinesound3.ogg', 'hl13/sound/creatures/zombinesound4.ogg')
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombie_grunt

/mob/living/basic/halflife/zombie/fungal
	name = "Fungal Zombie"
	desc = "A shambling humanoid figure hosting a colony of fungal growths upon its flesh."
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
	desc = "A terrifying skinless creature with visible bones that is puppeted by a headcrab."
	icon_state = "fastzombie"
	icon_living = "fastzombie"
	icon_dead = "fastzombie_dead"
	no_crab_state = "fastzombie_nocrab"
	maxHealth = 75
	health = 75
	speed = 0
	melee_attack_cooldown = 0.7 SECONDS
	melee_damage_lower = 7
	melee_damage_upper = 8
	sound_vary = FALSE
	butcher_results = list(/obj/item/stack/sheet/sinew = 2, /obj/item/food/meat/slab/halflife/zombie = 1)
	attack_sound = 'hl13/sound/creatures/fastzombie/fastzombieattack.ogg'
	death_sound = 'hl13/sound/creatures/fastzombie/fastzombiedeath.ogg'
	idle_sound_chance = 100
	idle_sounds = list('hl13/sound/creatures/fastzombie/fastzombie_breath.ogg', 'hl13/sound/creatures/fastzombie/fastzombiesound1.ogg', 'hl13/sound/creatures/fastzombie/fastzombiesound2.ogg', 'hl13/sound/creatures/fastzombie/fastzombiesound3.ogg')
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/fastzombie
	headcrabspawn = /mob/living/basic/halflife/headcrab/fast

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
	///what sound to play on a succesful attack?
	var/attack_sound = null
	var/jump_speed = 1
	var/jump_range = 7

/datum/action/cooldown/mob_cooldown/halflife/jump/fast_zombie
	cooldown_time = 5 SECONDS
	sound_cue = 'hl13/sound/creatures/fastzombie/fastzombieleap.ogg'
	attack_sound = 'hl13/sound/creatures/fastzombie/fz_frenzy1.ogg'

/datum/action/cooldown/mob_cooldown/halflife/jump/Activate(atom/target)
	if(owner.CanReach(target))
		attack_combo(target)
		StartCooldown()
		return TRUE

	addtimer(CALLBACK(src, PROC_REF(launch_towards_target), target), wind_up_time)
	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/launch_towards_target(atom/target)
	if(sound_cue)
		playsound(owner, sound_cue, 50, FALSE)
	var/turf/target_turf = get_turf(target)

	if(!target_turf.is_blocked_turf())
		owner.throw_at(target = target_turf, range = jump_range, speed = jump_speed, spin = FALSE, callback = CALLBACK(src, PROC_REF(attack_combo), target))
		return

	var/list/open_turfs = list()

	for(var/turf/possible_turf in get_adjacent_open_turfs(target))
		if(possible_turf.is_blocked_turf())
			continue
		open_turfs += possible_turf

	if(!length(open_turfs))
		return

	var/turf/final_turf = get_closest_atom(/turf, open_turfs, owner)
	owner.throw_at(target = final_turf, range = 7, speed = jump_speed, spin = FALSE, callback = CALLBACK(src, PROC_REF(attack_combo), target))

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/attack_combo(atom/target)
	if(!owner.CanReach(target))
		return FALSE

	for(var/i in 0 to (times_to_attack - 1))
		addtimer(CALLBACK(src, PROC_REF(attack_target), target), i * attack_interval)

	if(attack_sound)
		playsound(owner, attack_sound, 50, FALSE)

/datum/action/cooldown/mob_cooldown/halflife/jump/proc/attack_target(atom/target)
	if(!owner.CanReach(target) || owner.stat == DEAD)
		return
	var/mob/living/basic/basic_owner = owner
	basic_owner.melee_attack(target, ignore_cooldown = TRUE)

/mob/living/basic/halflife/zombie/freshly_crabbed
	icon_state = "headcrabhead"
	basic_mob_flags = DEL_ON_DEATH
	headcrabspawn_chance = 100
	maxHealth = 120 //not decayed, a bit tougher
	health = 120
	sharpness = 0 //no claws yet
	/// The dead body we have inside
	var/mob/living/carbon/human/corpse

/mob/living/basic/halflife/zombie/freshly_crabbed/fast
	speed = 1.25
	headcrabspawn = /mob/living/basic/halflife/headcrab/fast

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

/mob/living/basic/halflife/zombie/poison
	name = "Poison Zombie"
	desc = "A bloated, foul shell of something once human. A colony of parasitic poison headcrabs have taken control of them."
	icon_state = "poisonzombie"
	icon_living = "poisonzombie"
	icon_dead = "poisonzombie_dead"
	maxHealth = 150
	health = 150
	speed = 1.85
	death_sound = 'hl13/sound/creatures/poison/pz_die1.ogg'
	crabless_possible = FALSE
	idle_sounds = list('hl13/sound/creatures/poison/pz_breathe_loop1.ogg')
	sound_vary = FALSE
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/poisonzombie

/mob/living/basic/halflife/zombie/poison/slow
	speed = 2

/// Returns a list of actions and blackboard keys to pass into `grant_actions_by_list`.
/mob/living/basic/halflife/zombie/poison/proc/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/throw_headcrab = BB_HALFLIFE_HEADCRABTHROW_ABILITY,
	)
	return innate_abilities

/mob/living/basic/halflife/zombie/poison/Initialize(mapload)
	. = ..()
	grant_actions_by_list(get_innate_abilities())

/datum/action/cooldown/mob_cooldown/halflife/throw_headcrab
	name = "Throw Headcrab"
	desc = "Throw a headcrab at a target."
	cooldown_time = 10 SECONDS
	shared_cooldown = NONE
	///telegraph time before throwing
	var/wind_up_time = 0.35 SECONDS
	///what sound to play as telegraph?
	var/sound_cue = 'hl13/sound/creatures/poison/pz_warn1.ogg'
	var/throw_sound = 'hl13/sound/creatures/poison/pz_throw3.ogg'
	var/brood_type = /mob/living/basic/halflife/headcrab/poison
	var/crabs_left = 3

/datum/action/cooldown/mob_cooldown/halflife/throw_headcrab/Activate(atom/target)
	if(owner.CanReach(target))
		return

	if(crabs_left < 1)
		return

	crabs_left--

	playsound(owner, sound_cue, 50, FALSE)
	addtimer(CALLBACK(src, PROC_REF(launch_towards_target), target), wind_up_time)
	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/halflife/throw_headcrab/proc/launch_towards_target(atom/target)
	var/mob/living/basic/halflife/headcrab/poison/P = new brood_type(owner.loc)

	playsound(owner, throw_sound, 50, FALSE)
	var/turf/target_turf = get_turf(target)

	if(!target_turf.is_blocked_turf())
		P.throw_at(target_turf, range = 7, speed = 1, spin = FALSE, target)
		return

	var/list/open_turfs = list()

	for(var/turf/possible_turf in get_adjacent_open_turfs(target))
		if(possible_turf.is_blocked_turf())
			continue
		open_turfs += possible_turf

	if(!length(open_turfs))
		return

	var/turf/final_turf = get_closest_atom(/turf, open_turfs, owner)
	P.throw_at(target = final_turf, range = 7, speed = 1, spin = FALSE)










// AI STUFF THAT I PUT IN HERE CAUSE IM TOO LAZY TO MAKE ANOTHER FILE FOR IT --------------------------
// speech trees are going to be deactivated for now because 1: custom zombie language makes them not do anything and 2. they get spammed in dchat after a player possessing one dies
/datum/ai_planning_subtree/random_speech/halflife/zombine
	speech_chance = 2
	speak = list(
		"S-Sector, nnnot... secur-e-e...",
		"B-Biotics-s...",
		"O-Over...watch... r-r-reserve...",
	)

/datum/ai_planning_subtree/targeted_mob_ability/zombine_jump
	ability_key = BB_HALFLIFE_JUMP_ABILITY

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
		//datum/ai_planning_subtree/random_speech/halflife/zombie,
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
		/datum/ai_planning_subtree/targeted_mob_ability/zombine_jump,
		/datum/ai_planning_subtree/use_mob_ability/zombine_grenade,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		//datum/ai_planning_subtree/random_speech/halflife/zombine,
	)

/datum/ai_planning_subtree/use_mob_ability/zombine_grenade
	ability_key = BB_HALFLIFE_GRENADE_ABILITY

/datum/ai_planning_subtree/use_mob_ability/zombine_grenade/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if (!isliving(target))
		return // Don't do this if there's nothing hostile around for them to blow up on
	var/time_on_target = controller.blackboard[BB_BASIC_MOB_HAS_TARGET_TIME] || 0
	if (time_on_target < 4 SECONDS)
		return // We need to spend some time on a target first
	if (prob(99)) //makes exploding themself rare
		return
	return ..()

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/zombie_grunt
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		//datum/ai_planning_subtree/random_speech/halflife/zombine,
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

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/poisonzombie
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/targeted_mob_ability/headcrab_throw,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_planning_subtree/targeted_mob_ability/headcrab_throw
	ability_key = BB_HALFLIFE_HEADCRABTHROW_ABILITY


/// Dead zombie
/obj/effect/mob_spawn/corpse/zombie
	mob_type = /mob/living/basic/halflife/zombie
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "zombie_dead"
