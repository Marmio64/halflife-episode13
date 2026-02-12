/mob/living/basic/halflife/barnacle
	name = "Barnacle"
	desc = "A large mass of flesh on the ceiling, with a gaping mouth filled with teeth. A tongue trails down from it, ready to snatch onto passerbys."
	icon = 'hl13/icons/mob/barnacle.dmi'
	icon_state = "barnacle_tongue_down_idle"
	icon_living = "barnacle_tongue_down_idle"
	icon_dead = "barnacle_dead"
	faction = list(FACTION_XEN_FAUNA)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 60
	health = 60
	obj_damage = 16
	melee_damage_lower = 30
	melee_damage_upper = 35
	sharpness = SHARP_EDGED
	wound_bonus = -90
	attack_vis_effect = ATTACK_EFFECT_BITE
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'hl13/sound/creatures/barnacle/attack.ogg'
	combat_mode = TRUE
	density = FALSE
	butcher_results = list(/obj/item/food/meat/slab/xen = 1)
	death_sound = 'hl13/sound/creatures/barnacle/die.ogg'
	ai_controller = /datum/ai_controller/basic_controller/barnacle

	initial_language_holder = /datum/language_holder/zombie
	lighting_cutoff_green = 15
	lighting_cutoff = 35

	var/hidden = TRUE
	var/prey = null

	alpha = 75

	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, STAMINA = 0.5, OXY = 0.5) //resistant to damage when not biting someone

	can_buckle_to = FALSE


/mob/living/basic/halflife/barnacle/examine(mob/user)
	. = ..()
	if(isliving(user) && hidden)
		var/mob/living/living_user = user
		if(do_after(living_user, 3 SECONDS, target = src))
			if(prob((living_user.get_stat_level(STATKEY_PER))*5)) //5% chance per perception point
				to_chat(living_user, span_green("You notice the [src.name] up above!"))
				toggle_hide() //discovered!
			else
				to_chat(living_user, span_notice("It looks like something is there, but you cant quite tell..."))
		return

/mob/living/basic/halflife/barnacle/proc/toggle_hide()
	if(hidden)
		hidden = FALSE
		alpha = 255
	else
		hidden = TRUE
		alpha = 75

/mob/living/basic/halflife/barnacle/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(on_tried_move)) //dont move
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)
	RegisterSignal(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(pre_attack))

	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, STAMINA = 0.5, OXY = 0.5)
	hidden = TRUE
	alpha = 75

/mob/living/basic/halflife/barnacle/proc/on_entered(datum/source, AM as mob|obj)
	SIGNAL_HANDLER
	if(!stat && isliving(AM) && !prey)
		var/mob/living/L = AM
		if(L.mob_size > MOB_SIZE_TINY)
			start_feeding(L)

/// Called when the mob tries to move
/mob/living/basic/halflife/barnacle/proc/on_tried_move(mob/living/source)
	SIGNAL_HANDLER
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

///The barnacle ensnares a target with their tongue to start eating it
/mob/living/basic/halflife/barnacle/proc/start_feeding(mob/living/target_mob)
	var/target_dodge_chance = (target_mob.get_stat_level(STATKEY_PER) - 10) * 2 //2% chance for every dex and perception point above 10 for you to dodge a barnacle's tongue when grabbed
	target_dodge_chance += (target_mob.get_stat_level(STATKEY_DEX) - 10) * 2
	if(prob(target_dodge_chance))
		to_chat(target_mob, "<span class='warning'>You see a thin green tongue infront of you and just barely dodge it in time!</span>")
		return FALSE

	prey = target_mob
	ai_controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET] = target_mob //incase we were targeting someone else before, swap our attention to what we have in our mouth right now
	if(hidden)
		toggle_hide()
	target_mob.Immobilize(20 SECONDS, ignore_canstun = TRUE)
	layer = MOB_ABOVE_PIGGYBACK_LAYER //always appear above the target mob, no matter the direction
	target_mob.visible_message(span_danger("[name] latches onto [target_mob]!"), \
					span_userdanger("[name] latches onto [target_mob]!"))
	if(stat != DEAD)
		icon_state = "barnacle_tongue_up"
	playsound(src, 'hl13/sound/creatures/barnacle/latch.ogg', 50, TRUE)
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 1, STAMINA = 1, OXY = 1) //weak while chewing on someone, to give them a chance

///stop feeding
/mob/living/basic/halflife/barnacle/proc/stop_feeding(silent = FALSE, mob/living/target_mob)
	target_mob = prey
	if(!target_mob)
		if(stat != DEAD)
			icon_state = "barnacle_tongue_down_idle"
		else
			icon_state = "barnacle_dead"
		return

	if(!silent)
		visible_message(span_warning("[src] lets go of [target_mob]!"), span_notice("You let go of [target_mob]"))
	layer = initial(layer)
	playsound(src, 'hl13/sound/creatures/barnacle/digest.ogg', 50, TRUE)
	target_mob.SetImmobilized(1 SECONDS)
	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, STAMINA = 0.5, OXY = 0.5)
	prey = null
	if(stat != DEAD)
		if(!hidden)
			toggle_hide()
		icon_state = "barnacle_tongue_down"
		sleep(5 SECONDS)
		if(stat != DEAD)
			icon_state = "barnacle_tongue_down_idle"

/// Before we attack something, check if we want to do something else instead
/mob/living/basic/halflife/barnacle/proc/pre_attack(mob/living/source, atom/target)
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
/mob/living/basic/halflife/barnacle/proc/try_eat(atom/movable/food)
	balloon_alert(src, "devouring...")
	if (do_after(src, 4 SECONDS, target = food))
		if(isliving(food))
			var/mob/living/livvy = food
			livvy.gib(DROP_ALL_REMAINS)
			if(ishuman(food))
				adjust_health(-maxHealth)
			else
				adjust_health(-maxHealth*0.5)
			stop_feeding()

/mob/living/basic/halflife/barnacle/death(gibbed)
	..()
	stop_feeding()

////ai stuff//////////

/datum/ai_controller/basic_controller/barnacle
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_TARGET_MINIMUM_STAT = DEAD,
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/barnacle,
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/barnacle/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(!ishuman(target))
		return ..()

	var/mob/living/living_target = target
	if(!living_target.IsImmobilized()) //only attack people who are immobilized
		return

	return ..()

/datum/ai_controller/basic_controller/barnacle/CancelActions()
	..()
	if(QDELETED(pawn))
		return

	var/mob/living/basic/halflife/barnacle/barnacle_pawn = pawn
	barnacle_pawn.stop_feeding()
