#define TENTACLE_PATCH 1
#define SPAWN_CHILDREN 2
#define RAGE 3
#define CALL_CHILDREN 4
#define HERALD_TRISHOT 5

/mob/living/simple_animal/hostile/asteroid/elite/gonarch
	name = "gonarch"
	desc = "A massive monstrous creature that is completely alien in appearence. The sac dangling upon it churns with intensity, with creatures visibly pushing against it from within."
	gender = FEMALE
	faction = list(FACTION_HEADCRAB)
	icon = 'hl13/icons/mob/gonarch.dmi'
	icon_state = "gonarch"
	icon_living = "gonarch"
	icon_aggro = "gonarch"
	icon_dead = "gonarch_dead"
	icon_gib = "syndicate_gib"
	pixel_x = -32
	base_pixel_x = -16
	health_doll_icon = "broodmother"
	maxHealth = 1200
	health = 1200
	obj_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 20
	armour_penetration = 30
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	attack_verb_continuous = "beats down on"
	attack_verb_simple = "beat down on"
	attack_sound = 'hl13/sound/creatures/gonarch/attack.ogg'
	death_sound = 'hl13/sound/creatures/gonarch/die.ogg'
	throw_message = "does nothing to the plated hide of the"
	speed = 2
	move_to_delay = 5
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	death_message = "falls over with a final cry!"

	attack_action_types = list(/datum/action/innate/elite_attack/gonarch_charge,
								/datum/action/innate/elite_attack/spawn_children_gonarch,
								/datum/action/innate/elite_attack/rage_gonarch,
								/datum/action/innate/elite_attack/gonarch_trishot,
								/datum/action/innate/elite_attack/call_children_gonarch)

	COOLDOWN_DECLARE(random_tentacle)
	var/list/mob/living/basic/halflife/headcrab/baby/children_list = list()
	var/charging = FALSE

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/Move()
	if(charging)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_GONARCH)

/datum/action/innate/elite_attack/gonarch_charge
	name = "Charge"
	button_icon_state = "tentacle_patch"
	chosen_message = span_boldwarning("You are now attempting to charge forward.")
	chosen_attack_num = TENTACLE_PATCH

/datum/action/innate/elite_attack/gonarch_trishot
	name = "Triple Shot"
	button_icon_state = "herald_trishot"
	chosen_message = span_boldwarning("You are now firing three acid blasts in your chosen direction.")
	chosen_attack_num = HERALD_TRISHOT

/datum/action/innate/elite_attack/spawn_children_gonarch
	name = "Spawn Children"
	button_icon_state = "spawn_children"
	chosen_message = span_boldwarning("You will spawn two children at your location to assist you in combat. You can have up to 8.")
	chosen_attack_num = SPAWN_CHILDREN

/datum/action/innate/elite_attack/rage_gonarch
	name = "Rage"
	button_icon_state = "rage"
	chosen_message = span_boldwarning("You will temporarily increase your movement speed.")
	chosen_attack_num = RAGE

/datum/action/innate/elite_attack/call_children_gonarch
	name = "Call Children"
	button_icon_state = "call_children"
	chosen_message = span_boldwarning("You will summon your children to your location.")
	chosen_attack_num = CALL_CHILDREN

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/OpenFire()
	if(client)
		switch(chosen_attack)
			if(TENTACLE_PATCH)
				legionnaire_charge(target)
			if(HERALD_TRISHOT)
				herald_trishot(target)
			if(SPAWN_CHILDREN)
				spawn_children()
			if(RAGE)
				rage()
			if(CALL_CHILDREN)
				call_children()
		return
	var/aiattack = rand(1,4)
	switch(aiattack)
		if(TENTACLE_PATCH)
			legionnaire_charge(target)
		if(HERALD_TRISHOT)
			herald_trishot(target)
		if(SPAWN_CHILDREN)
			spawn_children()
		if(RAGE)
			rage()
		if(CALL_CHILDREN)
			call_children()

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/legionnaire_charge(target)
	ranged_cooldown = world.time + 6.0 SECONDS
	charging = TRUE
	var/dir_to_target = get_dir(get_turf(src), get_turf(target))
	var/turf/T = get_step(get_turf(src), dir_to_target)
	for(var/i in 1 to 6)
		//new /obj/effect/temp_visual/dragon_swoop/legionnaire(T)
		T = get_step(T, dir_to_target)
	playsound(src, 'hl13/sound/creatures/gonarch/pain.ogg', 75, FALSE)
	visible_message(span_boldwarning("[src] prepares to charge!"))
	addtimer(CALLBACK(src, PROC_REF(legionnaire_charge_2), dir_to_target, 0), 0.4 SECONDS)

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/legionnaire_charge_2(move_dir, times_ran)
	if(times_ran >= 6)
		charging = FALSE
		return
	var/turf/T = get_step(get_turf(src), move_dir)
	if(ismineralturf(T))
		var/turf/closed/mineral/M = T
		M.gets_drilled()
	if(T.density)
		charging = FALSE
		return
	for(var/obj/structure/window/W in T.contents)
		charging = FALSE
		return
	for(var/obj/machinery/door/D in T.contents)
		if(D.density)
			charging = FALSE
			return
	forceMove(T)
	playsound(src,'sound/effects/bang.ogg', 100, 1)
	var/list/hit_things = list()
	var/throwtarget = get_edge_target_turf(src, move_dir)
	for(var/mob/living/trample_target in T.contents - hit_things - src)
		hit_things += trample_target
		if(faction_check_atom(trample_target))
			continue
		visible_message(span_boldwarning("[src] tramples and kicks [trample_target]!"))
		to_chat(trample_target, span_userdanger("[src] tramples you and kicks you away!"))
		trample_target.safe_throw_at(throwtarget, 10, 1, src)
		trample_target.Paralyze(20)
		trample_target.adjustBruteLoss(melee_damage_upper/2)
	addtimer(CALLBACK(src, PROC_REF(legionnaire_charge_2), move_dir, (times_ran + 1)), 0.7)

/obj/projectile/acidspray/gonarch
	damage = 10
	speed = 0.5
	object_damage = 5 //this adds onto the base damage, so a point blank blast of 9 projectiles can do up to 135 damage to structures

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/shoot_projectile(turf/marker, set_angle, is_teleshot, is_trishot)
	var/turf/startloc = get_turf(src)
	var/obj/projectile/acidspray/gonarch/H = null
	H = new /obj/projectile/acidspray/gonarch(startloc)
	H.aim_projectile(marker, startloc)
	H.firer = src
	if(target)
		H.original = target
	H.fire(set_angle)
	if(is_trishot)
		shoot_projectile(marker, set_angle + 15, FALSE, FALSE)
		shoot_projectile(marker, set_angle - 15, FALSE, FALSE)

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/herald_trishot(target)
	ranged_cooldown = world.time + 5 SECONDS
	playsound(get_turf(src), 'hl13/sound/creatures/gonarch/spit.ogg', 20, FALSE)
	icon_state = "gonarch_attack"
	charging = TRUE
	sleep(0.5 SECONDS)
	var/target_turf = get_turf(target)
	var/angle_to_target = get_angle(src, target_turf)
	shoot_projectile(target_turf, angle_to_target, FALSE, TRUE)
	addtimer(CALLBACK(src, PROC_REF(shoot_projectile), target_turf, angle_to_target, FALSE, TRUE), 0.2 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(shoot_projectile), target_turf, angle_to_target, FALSE, TRUE), 0.4 SECONDS)

	charging = FALSE
	if(stat != DEAD)
		icon_state = "gonarch"

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/spawn_children(target)
	ranged_cooldown = world.time + 40
	visible_message(span_boldwarning("[src] strains as it gives birth!"))
	playsound(get_turf(src), 'hl13/sound/creatures/gonarch/birth.ogg', 20, TRUE)
	for(var/i in 1 to 2)
		if(children_list.len >= 8)
			return
		var/mob/living/basic/halflife/headcrab/baby/new_child = new /mob/living/basic/halflife/headcrab/baby(loc)
		//new_child.GiveTarget(target)
		new_child.faction = faction.Copy()
		visible_message(span_boldwarning("[new_child] appears below [src]!"))
		register_child(new_child)

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/register_child(atom/child)
	children_list += child
	RegisterSignals(child, list(COMSIG_QDELETING, COMSIG_LIVING_DEATH), PROC_REF(remove_child))

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/remove_child(atom/source)
	SIGNAL_HANDLER

	children_list -= source
	UnregisterSignal(source, list(
		COMSIG_QDELETING,
		COMSIG_LIVING_DEATH,
	))



/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/rage()
	ranged_cooldown = world.time + 100
	playsound(src,'hl13/sound/creatures/gonarch/rage.ogg', 75, FALSE)
	visible_message(span_warning("[src] starts picking up speed!"))
	color = COLOR_RED
	set_varspeed(0)
	move_to_delay = 3
	addtimer(CALLBACK(src, PROC_REF(reset_rage)), 5 SECONDS)

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/reset_rage()
	color = COLOR_WHITE
	set_varspeed(2)
	move_to_delay = 5

/mob/living/simple_animal/hostile/asteroid/elite/gonarch/proc/call_children()
	ranged_cooldown = world.time + 60
	visible_message(span_warning("The ground shakes near [src]!"))
	var/list/directions = GLOB.cardinals.Copy() + GLOB.diagonals.Copy()
	for(var/mob/child in children_list)
		var/spawndir = pick_n_take(directions)
		var/turf/T = get_step(src, spawndir)
		if(T)
			child.forceMove(T)
			playsound(src, 'sound/effects/bamf.ogg', 100, 1)

#undef CALL_CHILDREN
#undef RAGE
#undef SPAWN_CHILDREN
#undef TENTACLE_PATCH
#undef HERALD_TRISHOT
