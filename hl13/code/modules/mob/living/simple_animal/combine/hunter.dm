/mob/living/simple_animal/hostile/halflife/hunter
	name = "Hunter"
	desc = "A large tripod synth. Armored, and deadly."
	icon = 'hl13/icons/mob/halflife_tall.dmi'
	icon_state = "hunter"
	icon_living = "hunter"
	icon_dead = "hunter_dead"
	faction = list(FACTION_COMBINE)
	mob_biotypes = MOB_ORGANIC
	stat_attack = UNCONSCIOUS
	maxHealth = 350
	health = 350
	harm_intent_damage = 25
	melee_damage_lower = 18
	melee_damage_upper = 24
	sharpness = SHARP_EDGED
	wound_bonus = 0
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'hl13/sound/creatures/hunter/hunter_skewer1.ogg'
	combat_mode = TRUE
	minbodytemp = 0
	status_flags = CANPUSH
	footstep_type = FOOTSTEP_MOB_HUNTER
	speed = -1
	death_sound = 'hl13/sound/creatures/hunter/hunter_die3.ogg'
	var/aggro_sound = list('hl13/sound/creatures/hunter/hunter_foundenemy1.ogg', 'hl13/sound/creatures/hunter/hunter_foundenemy2.ogg', 'hl13/sound/creatures/hunter/hunter_foundenemy3.ogg', 'hl13/sound/creatures/hunter/hunter_pain.ogg')
	var/idle_sounds = list('hl13/sound/creatures/hunter/hunter_idle1.ogg', 'hl13/sound/creatures/hunter/hunter_idle2.ogg', 'hl13/sound/creatures/hunter/hunter_idle3.ogg', 'hl13/sound/creatures/hunter/hunter_scan.ogg')

	robust_searching = TRUE

	ranged = 1
	ranged_cooldown_time = 25
	rapid = 3
	retreat_distance = 2
	minimum_distance = 4
	projectilesound = 'hl13/sound/creatures/hunter/hunter_fire1.ogg'
	casingtype = /obj/item/ammo_casing/caseless/flechette
	lighting_cutoff_blue = 25
	lighting_cutoff = 25

	var/charge_cooldown = 0
	var/charge_cooldown_time = 10 SECONDS

	var/playstyle_string = span_notice("You are a Hunter, a large synth designed for protecting striders and hunting down malignants in a swift manner. You can fire bursts of flechettes by clicking, and can Alt-Click to charge at an enemy to send them flying.")

	cmode_music = 'hl13/sound/music/combat/huntingparty.ogg' //practically a requirement

/mob/living/simple_animal/hostile/halflife/hunter/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		var/chosen_sound = pick(aggro_sound)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/hunter/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(10))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/hunter/proc/hunter_charge(move_dir, times_ran)
	if(times_ran >= 5)
		return
	var/turf/T = get_step(get_turf(src), move_dir)
	if(T.density)
		return
	for(var/obj/structure/window/W in T.contents)
		return
	for(var/obj/machinery/door/D in T.contents)
		return
	for(var/obj/structure/halflife/fence/F in T.contents)
		return
	for(var/obj/machinery/turnstile/S in T.contents)
		return
	forceMove(T)
	playsound(src,'hl13/sound/creatures/hunter/hunter_footstep1.ogg', 200, 1)
	var/list/hit_things = list()
	var/throwtarget = get_edge_target_turf(src, move_dir)
	for(var/mob/living/L in T.contents - hit_things - src)
		hit_things += L
		visible_message(span_boldwarning("[src] slams into [L]!"))
		to_chat(L, span_userdanger("[src] slams into you, sending you flying!"))
		L.safe_throw_at(throwtarget, 5, 1, src)
		L.Paralyze(20)
		L.adjustBruteLoss(30)
		playsound(src,'hl13/sound/creatures/hunter/hunter_chargehit.ogg', 200, 1)
	addtimer(CALLBACK(src, PROC_REF(hunter_charge), move_dir, (times_ran + 1)), 2)

/mob/living/simple_animal/hostile/halflife/hunter/proc/hunter_begincharge(target)
	if(charge_cooldown + charge_cooldown_time > world.time)
		to_chat(src, span_warning("Your charge ability is still on cooldown!"))
		return

	charge_cooldown = world.time
	var/dir_to_target = get_dir(get_turf(src), get_turf(target))
	setDir(dir_to_target)
	playsound(src,'hl13/sound/creatures/hunter/hunter_charge.ogg', 200, 1)
	visible_message(span_boldwarning("[src] prepares to charge!"))
	addtimer(CALLBACK(src, PROC_REF(hunter_charge), dir_to_target, 0), 5)

/mob/living/simple_animal/hostile/halflife/hunter/AltClickOn(atom/target)
	hunter_begincharge(target)

/mob/living/simple_animal/hostile/halflife/hunter/Login()
	..()
	to_chat(src, playstyle_string)
