/mob/living/basic/halflife/bullsquid
	name = "Bullsquid"
	desc = "A large alien creature that somewhat resembles a malformed squid with legs. It has a massive mouth filled with razor sharp teeth that have acid dripping on them."
	icon = 'hl13/icons/mob/halflife_large.dmi'
	icon_state = "bullsquid"
	icon_living = "bullsquid"
	icon_dead = "bullsquid_dead"
	faction = list(FACTION_XEN_FAUNA)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 150
	health = 150
	obj_damage = 16
	melee_damage_lower = 22
	melee_damage_upper = 25
	sharpness = SHARP_EDGED
	wound_bonus = -20
	attack_vis_effect = ATTACK_EFFECT_BITE
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'hl13/sound/creatures/bullsquid/attackgrowl3.ogg'
	combat_mode = TRUE
	speed = 0.5
	butcher_results = list(/obj/item/food/meat/slab/xen = 2)
	death_sound = 'hl13/sound/creatures/bullsquid/die1.ogg'
	ai_controller = /datum/ai_controller/basic_controller/bullsquid
	var/soundvary = FALSE
	var/idle_sounds = list('hl13/sound/creatures/bullsquid/idle1.ogg','hl13/sound/creatures/bullsquid/idle2.ogg', ,'hl13/sound/creatures/bullsquid/idle3.ogg', ,'hl13/sound/creatures/bullsquid/idle4.ogg', ,'hl13/sound/creatures/bullsquid/idle5.ogg' )
	var/spray_cooldown = 4 SECONDS

	initial_language_holder = /datum/language_holder/zombie
	lighting_cutoff_green = 15
	lighting_cutoff = 35

/mob/living/basic/halflife/bullsquid/chicken
	name = "Chicken Bullsquid"
	desc = "A large alien creature that somewhat resembles a malformed squid with legs. It has a massive mouth filled with razor sharp teeth that have acid dripping on them. This one has a sickly, pale look about it."
	icon_state = "bullsquid_chicken"
	icon_living = "bullsquid_chicken"
	icon_dead = "bullsquid_chicken_dead"

/mob/living/basic/halflife/bullsquid/fanged
	name = "Fanged Bullsquid"
	desc = "A large alien creature that somewhat resembles a malformed squid with legs. It has a massive mouth filled with razor sharp teeth that have acid dripping on them. This one has additional fangs about its mouth."
	icon_state = "bullsquid_fanged"
	icon_living = "bullsquid_fanged"
	icon_dead = "bullsquid_fanged_dead"
	melee_damage_lower = 24
	melee_damage_upper = 28

/mob/living/basic/halflife/bullsquid/blue
	name = "Blue Bullsquid"
	desc = "A large alien creature that somewhat resembles a malformed squid with legs. It has a massive mouth filled with razor sharp teeth that have acid dripping on them. This one has dangerous looking blue markings on it..."
	icon_state = "bullsquid_blue"
	icon_living = "bullsquid_blue"
	icon_dead = "bullsquid_blue_dead"

/mob/living/basic/halflife/bullsquid/blue/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/venomous, /datum/reagent/toxin/headcrab_venom, 5, injection_flags = NONE)

/mob/living/basic/halflife/bullsquid/zombie_faction
	faction = list(FACTION_HEADCRAB, FACTION_XEN_FAUNA)

/mob/living/basic/halflife/bullsquid/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)


/mob/living/basic/halflife/bullsquid/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		projectile_type = /obj/projectile/acidspray,\
		projectile_sound = 'hl13/sound/creatures/antlion_worker/antlion_prefire.ogg',\
		cooldown_time = spray_cooldown,\
	)

	AddElement(/datum/element/footstep, FOOTSTEP_MOB_CLAW)
	RegisterSignal(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(pre_attack))

/// Before we attack something, check if we want to do something else instead
/mob/living/basic/halflife/bullsquid/proc/pre_attack(mob/living/source, atom/target)
	SIGNAL_HANDLER
	if (target == src)
		return COMPONENT_HOSTILE_NO_ATTACK // Easy to misclick yourself, let's not
	if (!isliving(target))
		return
	var/mob/living/living_target = target
	if (living_target.stat != DEAD)
		return
	INVOKE_ASYNC(src, PROC_REF(try_eat), living_target)
	return COMPONENT_HOSTILE_NO_ATTACK

/// Try devouring
/mob/living/basic/halflife/bullsquid/proc/try_eat(atom/movable/food)
	balloon_alert(src, "devouring...")
	if (do_after(src, 3 SECONDS, target = food))
		if(isliving(food))
			var/mob/living/livvy = food
			livvy.gib(DROP_ALL_REMAINS)
			if(ishuman(food))
				adjust_health(-maxHealth*0.5)
			else
				adjust_health(-maxHealth*0.1)

/obj/effect/spawner/random/halflife/random_bullsquid
	name = "random bullsquid"
	spawn_loot_count = 1

	loot = list(
				/mob/living/basic/halflife/bullsquid = 2,
				/mob/living/basic/halflife/bullsquid/blue = 1,
				/mob/living/basic/halflife/bullsquid/fanged = 1,
				/mob/living/basic/halflife/bullsquid/chicken = 1,
				)

////////// AI stuff //////

/datum/ai_controller/basic_controller/bullsquid
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/bullsquid,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_planning_subtree/basic_ranged_attack_subtree/bullsquid
	ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack/bullsquid


/datum/ai_behavior/basic_ranged_attack/bullsquid
	action_cooldown = 4 SECONDS
	avoid_friendly_fire = TRUE
