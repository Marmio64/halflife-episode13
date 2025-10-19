//antlions
/mob/living/basic/halflife/antlion_worker
	name = "Antlion Worker"
	desc = "A large green bug filled to the brim with razer sharp armaments."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "antlionworker"
	icon_living = "antlionworker"
	icon_dead = "antlionworker_dead"
	faction = list(FACTION_ANTLION)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 50
	health = 50
	obj_damage = 10
	melee_damage_lower = 13
	melee_damage_upper = 18
	wound_bonus = -20
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_SLASH
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'hl13/sound/creatures/antlion/attack_single1.ogg'
	combat_mode = TRUE
	speed = 0.8
	var/list/loot = list(/obj/effect/decal/cleanable/insectguts = 1)
	butcher_results = list(/obj/item/food/meat/slab/xen = 1)
	butcher_difficulty = 75
	death_sound = 'hl13/sound/creatures/antlion_worker/antlion_burst.ogg'
	ai_controller = /datum/ai_controller/basic_controller/antlion_worker
	var/soundvary = FALSE
	var/fire_delay = 10
	var/aggro_sound = list('hl13/sound/creatures/antlion/pain1.ogg', 'hl13/sound/creatures/antlion/pain2.ogg')
	var/idle_sounds = list('hl13/sound/creatures/antlion/idle1.ogg','hl13/sound/creatures/antlion/idle2.ogg', ,'hl13/sound/creatures/antlion/idle3.ogg', ,'hl13/sound/creatures/antlion/idle4.ogg', ,'hl13/sound/creatures/antlion/idle5.ogg' )

/mob/living/basic/halflife/antlion_worker/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/basic/halflife/antlion_worker/spawn_gibs()
	new /obj/effect/decal/antlionblood(drop_location(), src, get_static_viruses())

/mob/living/basic/halflife/antlion_worker/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		projectile_type = /obj/projectile/acidspray,\
		projectile_sound = 'hl13/sound/creatures/antlion_worker/antlion_prefire.ogg',\
		cooldown_time = 3 SECONDS,\
	)

	if(LAZYLEN(loot))
		loot = string_list(loot)
		AddElement(/datum/element/death_drops, loot)

	AddElement(/datum/element/footstep, FOOTSTEP_MOB_ANTLION)

/obj/projectile/acidspray
	name = "acid spray"
	icon_state = "acidspray"
	damage = 30
	speed = 1.5
	damage_type = BURN
	hitsound = 'hl13/sound/creatures/antlion_worker/antlion_shoot.ogg'

/mob/living/basic/halflife/antlion_worker/zombie_faction
	faction = list(FACTION_ANTLION, FACTION_HEADCRAB)

//antlions
/mob/living/basic/halflife/antlion_guard
	name = "Antlion Guard"
	desc = "A massive bug with thick skin and a stone-solid head for ramming with. It shakes the ground with every step."
	icon = 'hl13/icons/mob/halflife_large.dmi'
	icon_state = "guard"
	icon_living = "guard"
	icon_dead = "guard_dead"
	faction = list(FACTION_ANTLION)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 600
	health = 600
	speed = 0.8
	obj_damage = 60
	pixel_x = -8
	melee_damage_lower = 35
	melee_damage_upper = 40
	melee_attack_cooldown = 3 SECONDS
	wound_bonus = -20
	armour_penetration = 25
	attack_vis_effect = ATTACK_EFFECT_SMASH
	attack_verb_continuous = "smashes"
	attack_verb_simple = "smash"
	attack_sound = 'hl13/sound/creatures/antlion_guard/shove1.ogg'
	combat_mode = TRUE
	butcher_results = list(/obj/item/food/meat/slab/xen = 3)
	death_sound = 'hl13/sound/creatures/antlion_guard/antlion_guard_die1.ogg'
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/antlion_guard

	lighting_cutoff_green = 25
	lighting_cutoff = 25

	var/soundvary = FALSE
	var/idle_sounds = list('hl13/sound/creatures/antlion_guard/growl_idle.ogg')

/mob/living/basic/halflife/antlion_guard/zombie_faction
	faction = list(FACTION_ANTLION, FACTION_HEADCRAB)

/mob/living/basic/halflife/antlion_guard/weak
	maxHealth = 500
	health = 500
	melee_damage_lower = 25
	melee_damage_upper = 30

///Every hit throws people back
/mob/living/basic/halflife/antlion_guard/melee_attack(atom/target, list/modifiers, ignore_cooldown = FALSE)
	. = ..()

	if(!.)
		return
	if(!isliving(target))
		return
	var/mob/living/victim = target
	var/dir_to_target = get_dir(get_turf(src), get_turf(victim))
	var/throwtarget = get_edge_target_turf(src, dir_to_target)
	victim.safe_throw_at(throwtarget, 3, 1, src)

/mob/living/basic/halflife/antlion_guard/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/basic/halflife/antlion_guard/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_ANTLION)
	grant_actions_by_list(get_innate_abilities())

// Returns a list of actions and blackboard keys to pass into `grant_actions_by_list`.
/mob/living/basic/halflife/antlion_guard/proc/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/jump/antlion_guard = BB_HALFLIFE_JUMP_ABILITY,
	)
	return innate_abilities

/datum/action/cooldown/mob_cooldown/halflife/jump/antlion_guard
	name = "Charge"
	desc = "Charge towards the enemy!"
	wind_up_time = 0.65 SECONDS
	sound_cue = 'hl13/sound/creatures/antlion_guard/angry3.ogg'
	times_to_attack = 1
	jump_range = 9

//---------------------- AI STUFF -------------------

/datum/ai_controller/basic_controller/antlion_worker
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/antlion_worker,
	)

/datum/ai_planning_subtree/basic_ranged_attack_subtree/antlion_worker
	ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack/antlion_worker


/datum/ai_behavior/basic_ranged_attack/antlion_worker
	action_cooldown = 3 SECONDS
	required_distance = 3
	avoid_friendly_fire = TRUE

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/antlion_guard
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/targeted_mob_ability/antlion_guard_charge,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_planning_subtree/targeted_mob_ability/antlion_guard_charge
	ability_key = BB_HALFLIFE_JUMP_ABILITY
