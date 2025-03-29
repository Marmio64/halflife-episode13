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
	melee_damage_lower = 12
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

