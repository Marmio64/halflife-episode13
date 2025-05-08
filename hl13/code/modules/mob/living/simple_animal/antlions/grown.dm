//antlions
/mob/living/simple_animal/hostile/halflife/antlion
	name = "Antlion"
	desc = "A large green bug filled to the brim with razer sharp armaments."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "antlion"
	icon_living = "antlion"
	icon_dead = "antlion_dead"
	icon_gib = "antlion_gib"
	faction = list(FACTION_ANTLION)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 50
	health = 50
	harm_intent_damage = 10
	melee_damage_lower = 12
	melee_damage_upper = 15
	wound_bonus = -20
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_SLASH
	ranged = 1 //for leaping
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'hl13/sound/creatures/antlion/attack_single1.ogg'
	combat_mode = TRUE
	minbodytemp = 0
	speed = -1
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1)
	butcher_difficulty = 40
	footstep_type = FOOTSTEP_MOB_ANTLION
	death_sound = 'hl13/sound/creatures/antlion/pain2.ogg'
	var/charging = FALSE
	var/revving_charge = FALSE
	var/dash_speed = 1
	var/dash_delay = 10
	var/delaysound = 'hl13/sound/creatures/antlion/fly1.ogg'
	var/leapsound = 'hl13/sound/creatures/antlion/land1.ogg'
	var/soundvary = FALSE
	var/aggro_sound = list('hl13/sound/creatures/antlion/pain1.ogg', 'hl13/sound/creatures/antlion/pain2.ogg')
	var/idle_sounds = list('hl13/sound/creatures/antlion/idle1.ogg','hl13/sound/creatures/antlion/idle2.ogg', ,'hl13/sound/creatures/antlion/idle3.ogg', ,'hl13/sound/creatures/antlion/idle4.ogg', ,'hl13/sound/creatures/antlion/idle5.ogg' )
	var/spawn_sound

/mob/living/simple_animal/hostile/halflife/antlion/digsound
	spawn_sound = 'hl13/sound/creatures/antlion/digup1.ogg'

/mob/living/simple_animal/hostile/halflife/antlion/OpenFire()
	if(charging)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(prob(50)) //antlions wont always use their charge
		ranged_cooldown = world.time + ranged_cooldown_time
	if(get_dist(src, target) <= 7)
		charge()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/antlion/Initialize(mapload, wizard_summoned)
	. = ..()
	if(spawn_sound)
		playsound(src, spawn_sound, 30, soundvary)

/mob/living/simple_animal/hostile/halflife/antlion/proc/charge(atom/chargeat = target, delay = dash_delay)
	if(!chargeat)
		return
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, 2)
	if(!T)
		return
	charging = TRUE
	revving_charge = TRUE
	walk(src, 0)
	setDir(dir)
	if(delaysound)
		playsound(src, delaysound, 40, soundvary)
	SLEEP_CHECK_DEATH(delay, src)
	revving_charge = FALSE
	walk_towards(src, T, dash_speed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * dash_speed, src)
	walk(src, 0) // cancel the movement
	charging = FALSE
	playsound(src, leapsound, 40, soundvary)

/mob/living/simple_animal/hostile/halflife/antlion/Move()
	if(revving_charge)
		return FALSE
	..()

/mob/living/simple_animal/hostile/halflife/antlion/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(40))
		var/chosen_sound = pick(aggro_sound)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/antlion/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/antlion/spawn_gibs()
	new /obj/effect/decal/antlionblood(drop_location(), src, get_static_viruses())
