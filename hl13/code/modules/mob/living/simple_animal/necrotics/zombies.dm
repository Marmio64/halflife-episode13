//Simple animals are being deprecated slowly, these are on the chopping block

/mob/living/simple_animal/hostile/halflife/zombie
	name = "Zombie"
	desc = "A shambling human, taken over by a parasitic head crab."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_XENIAN
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/sheet/cloth = 1)
	maxHealth = 120
	health = 120
	speak_chance = 1
	speak = list("G-GOD HELP ME!","OH G-GOD!","K-KILL ME!")
	harm_intent_damage = 10
	melee_damage_lower = 16
	melee_damage_upper = 18
	sharpness = SHARP_EDGED
	wound_bonus = -15
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'hl13/sound/creatures/zombieattack.ogg'
	combat_mode = TRUE
	minbodytemp = 0
	status_flags = CANPUSH
	move_to_delay = 5
	death_sound = 'hl13/sound/creatures/zombiedeath.ogg'

	initial_language_holder = /datum/language_holder/zombie

	var/no_crab_state = "zombie_dead_nocrab"
	var/crabless_possible = TRUE
	var/headcrabspawn = /mob/living/basic/halflife/headcrab
	var/idle_sound_chance = 20
	var/sound_vary = TRUE
	var/fungalheal = FALSE
	var/aggro_sound = 'hl13/sound/creatures/zombieaggro.ogg'
	var/idle_sounds = list('hl13/sound/creatures/zombiesound.ogg', 'hl13/sound/creatures/zombiesound2.ogg', 'hl13/sound/creatures/zombiesound3.ogg')

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!

/mob/living/simple_animal/hostile/halflife/zombie/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		playsound(src, aggro_sound, 50, sound_vary)

/mob/living/simple_animal/hostile/halflife/zombie/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, sound_vary)
	//If there is fungal infestation on the ground, and the zombie can heal off of it, do so
	if(fungalheal)
		if(locate(/obj/structure/alien/weeds) in src.loc)
			adjustHealth(-maxHealth*0.05)


/mob/living/simple_animal/hostile/halflife/zombie/death(gibbed)
	if(prob(25) && crabless_possible) //25% chance to spawn a headcrab on death
		icon_dead = no_crab_state
		icon_state = no_crab_state
		new headcrabspawn(get_turf(src))
	..()

/mob/living/simple_animal/hostile/halflife/zombie/poison
	name = "Poison Zombie"
	desc = "A bloated, fleshy human taken over by a parasitic poison headcrab."
	icon_state = "poisonzombie"
	icon_living = "poisonzombie"
	icon_dead = "poisonzombie_dead"
	maxHealth = 150
	health = 150
	move_to_delay = 7
	speed = 1.6
	speak = list("Mrrrraaaaghhhhh...","ggg-ggrrahhh...","P-p...o...he-l..")
	death_sound = 'hl13/sound/creatures/poison/pz_die1.ogg'
	crabless_possible = FALSE
	aggro_sound = 'hl13/sound/creatures/poison/pz_alert1.ogg'
	idle_sounds = list('hl13/sound/creatures/poison/pz_breathe_loop1.ogg')
	sound_vary = FALSE
	ranged_cooldown_time = 60
	ranged = 1
	var/crabs_left = 3
	var/nowthrowing = FALSE
	var/revving_throw = FALSE
	var/brood_type = /mob/living/basic/halflife/headcrab/poison

/mob/living/simple_animal/hostile/halflife/zombie/poison/OpenFire()
	if(nowthrowing)
		return
	if(crabs_left < 1)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		throwcrab()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/zombie/poison/proc/throwcrab(atom/throwat = target, delay = 10)
	if(!throwat)
		return
	var/throwturf = get_turf(throwat)
	if(!throwturf)
		return
	var/dir = get_dir(src, throwturf)
	var/turf/T = get_ranged_target_turf(throwturf, dir, 2)
	if(!T)
		return
	nowthrowing = TRUE
	revving_throw = TRUE
	walk(src, 0)
	setDir(dir)
	playsound(src, 'hl13/sound/creatures/poison/pz_warn1.ogg', 40, sound_vary)
	SLEEP_CHECK_DEATH(delay, src)
	revving_throw = FALSE
	playsound(src, 'hl13/sound/creatures/poison/pz_throw3.ogg', 40, sound_vary)
	var/mob/living/basic/halflife/headcrab/poison/P = new brood_type(src.loc)
	P.throw_at(T, 4)
	SLEEP_CHECK_DEATH(delay, src)
	nowthrowing = FALSE
	crabs_left--

/mob/living/simple_animal/hostile/halflife/zombie/poison/Move()
	if(revving_throw || nowthrowing)
		return FALSE
	..()
