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

/mob/living/simple_animal/hostile/halflife/zombie/fungal
	name = "Fungal Zombie"
	desc = "A shambling human, taken over by a parasitic head crab. This one is covered in a spreading fungal infection."
	icon_state = "fungalzombie"
	icon_living = "fungalzombie"
	icon_dead = "fungalzombie_dead"
	no_crab_state = "fungalzombie_nocrab"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 1, /obj/item/stack/sheet/animalhide/goliath_hide = 1, /obj/item/stack/sheet/cloth = 1)
	maxHealth = 160
	health = 160
	fungalheal = TRUE
	move_to_delay = 6
	headcrabspawn = /mob/living/basic/halflife/headcrab/armored
	var/datum/action/cooldown/spell/conjure/xenfloor/infest

/mob/living/simple_animal/hostile/halflife/zombie/fungal/Initialize(mapload)
	. = ..()
	infest = new(src)
	infest.Grant(src)

/mob/living/simple_animal/hostile/halflife/zombie/fungal/gonome
	name = "Fungal Gonome"
	desc = "A massive, grotesque abomination of flesh and fungas. A horror, which should not be."
	icon = 'hl13/icons/mob/halflife_large.dmi'
	icon_state = "gonome"
	icon_living = "gonome"
	icon_dead = "gonome_dead"
	melee_damage_lower = 30
	melee_damage_upper = 35
	harm_intent_damage = 25
	wound_bonus = -20
	move_to_delay = 4
	speak = list()
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 3, /obj/item/stack/sheet/animalhide/goliath_hide = 3)
	maxHealth = 475
	health = 475
	speak = list()
	crabless_possible = FALSE
	idle_sound_chance = 50
	lighting_cutoff_red = 30
	lighting_cutoff = 10

	footstep_type = FOOTSTEP_MOB_GONOME
	attack_sound = 'hl13/sound/creatures/gonome/attack_player.ogg'
	death_sound = 'hl13/sound/creatures/gonome/react_minor_scream_03.ogg'
	aggro_sound = 'hl13/sound/creatures/gonome/react_minor_scream_01.ogg'
	idle_sounds = list('hl13/sound/creatures/gonome/wander_breath_in_01.ogg', 'hl13/sound/creatures/gonome/wander_breath_in_02.ogg', 'hl13/sound/creatures/gonome/wander_breath_in_03.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_01.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_02.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_03.ogg')

/mob/living/simple_animal/hostile/halflife/zombie/poison
	name = "Poison Zombie"
	desc = "A bloated, fleshy human taken over by a parasitic poison headcrab."
	icon_state = "poisonzombie"
	icon_living = "poisonzombie"
	icon_dead = "poisonzombie_dead"
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 2)
	maxHealth = 160
	health = 160
	move_to_delay = 7
	speed = 1.2
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
	new brood_type(get_turf(src.loc))
	SLEEP_CHECK_DEATH(delay, src)
	nowthrowing = FALSE
	crabs_left--

/mob/living/simple_animal/hostile/halflife/zombie/poison/Move()
	if(revving_throw || nowthrowing)
		return FALSE
	..()
