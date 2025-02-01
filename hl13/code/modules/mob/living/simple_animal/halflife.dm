/mob/living/simple_animal/hostile/halflife
	ai_idles = FALSE
	wander = 0 //Might reduce costs associated with them

/mob/living/simple_animal/hostile/halflife/zombie
	name = "Zombie"
	desc = "A shambling human, taken over by a parasitic head crab."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_XENIAN
	maxHealth = 120
	health = 120
	speak_chance = 1
	speak = list("G-GOD HELP ME!","OH G-GOD!","K-KILL ME!")
	harm_intent_damage = 10
	melee_damage_lower = 16
	melee_damage_upper = 19
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
	var/headcrabspawn = /mob/living/simple_animal/hostile/halflife/headcrab
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

/mob/living/simple_animal/hostile/halflife/zombie/zombine
	name = "Zombine"
	desc = "A shambling combine soldier, taken over by a parasitic head crab."
	icon_state = "zombine"
	icon_living = "zombie"
	icon_dead = "zombine_dead"
	maxHealth = 160
	health = 160
	speak = list("S-Sector, nnnot... secur-e-e...","B-Biotics-s...","O-Over...watch... r-r-reserve...")
	attack_sound = 'hl13/sound/creatures/zombineattack.ogg'
	death_sound = 'hl13/sound/creatures/zombinedeath.ogg'
	crabless_possible = FALSE
	aggro_sound = 'hl13/sound/creatures/zombineaggro.ogg'
	idle_sounds = list('hl13/sound/creatures/zombinesound1.ogg', 'hl13/sound/creatures/zombinesound2.ogg', 'hl13/sound/creatures/zombinesound3.ogg', 'hl13/sound/creatures/zombinesound4.ogg')

/mob/living/simple_animal/hostile/halflife/zombie/fast
	name = "Fast Zombie"
	desc = "A terrifying skinless human, taken over by a parasitic head crab."
	icon_state = "fastzombie"
	icon_living = "fastzombie"
	icon_dead = "fastzombie_dead"
	maxHealth = 80
	health = 80
	speak_chance = 0
	melee_damage_lower = 5
	melee_damage_upper = 9
	rapid_melee = 4 //attacks quite fast
	attack_sound = 'hl13/sound/creatures/fastzombieattack.ogg'
	combat_mode = TRUE
	move_to_delay = 3
	speed = -1
	ranged = 1 //for jumping
	death_sound = 'hl13/sound/creatures/fastzombiedeath.ogg'
	no_crab_state = "fastzombie_nocrab"
	idle_sound_chance = 100
	sound_vary = FALSE
	aggro_sound = 'hl13/sound/creatures/fastzombiealert.ogg'
	idle_sounds = list('hl13/sound/creatures/fastzombie_breath.ogg', 'hl13/sound/creatures/fastzombiesound1.ogg', 'hl13/sound/creatures/fastzombiesound2.ogg', 'hl13/sound/creatures/fastzombiesound3.ogg')
	butcher_results = list(/obj/item/stack/sheet/sinew = 2)
	var/charging = FALSE
	var/revving_charge = FALSE
	var/dash_speed = 1

/mob/living/simple_animal/hostile/halflife/zombie/fast/OpenFire()
	if(charging)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		charge()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/zombie/fast/proc/charge(atom/chargeat = target, delay = 5)
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
	SLEEP_CHECK_DEATH(delay, src)
	revving_charge = FALSE
	playsound(src, 'hl13/sound/creatures/fastzombieleap.ogg', 40, sound_vary)
	walk_towards(src, T, dash_speed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * dash_speed, src)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/halflife/zombie/fast/Move()
	if(revving_charge)
		return FALSE
	..()

/mob/living/simple_animal/hostile/halflife/zombie/fungal
	name = "Fungal Zombie"
	desc = "A shambling human, taken over by a parasitic head crab. This one is covered in a spreading fungal infection."
	icon_state = "fungalzombie"
	icon_living = "fungalzombie"
	icon_dead = "fungalzombie_dead"
	no_crab_state = "fungalzombie_nocrab"
	maxHealth = 160
	health = 160
	fungalheal = TRUE
	move_to_delay = 6
	headcrabspawn = /mob/living/simple_animal/hostile/halflife/headcrab/armored
	var/datum/action/cooldown/spell/conjure/xenfloor/infest

/mob/living/simple_animal/hostile/halflife/zombie/fungal/Initialize(mapload)
	. = ..()
	infest = new(src)
	infest.Grant(src)

/mob/living/simple_animal/hostile/halflife/zombie/poison
	name = "Poison Zombie"
	desc = "A bloated, fleshy human taken over by a parasitic poison headcrab."
	icon_state = "poisonzombie"
	icon_living = "poisonzombie"
	icon_dead = "poisonzombie_dead"
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
	var/brood_type = /mob/living/simple_animal/hostile/halflife/headcrab/poison

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
	var/mob/living/simple_animal/hostile/halflife/headcrab/poison/P = new brood_type(src.loc)
	P.charge(T)
	SLEEP_CHECK_DEATH(delay, src)
	nowthrowing = FALSE
	crabs_left--

/mob/living/simple_animal/hostile/halflife/zombie/poison/Move()
	if(revving_throw || nowthrowing)
		return FALSE
	..()



//leaping headcrabs
/mob/living/simple_animal/hostile/halflife/headcrab
	name = "Headcrab"
	desc = "A parasitic headcrab."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	stat_attack = UNCONSCIOUS //braains
	maxHealth = 30
	health = 30
	harm_intent_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 10
	wound_bonus = 0
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_BITE
	ranged = 1 //for leaping
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'hl13/sound/creatures/headcrabbite.ogg'
	combat_mode = TRUE
	minbodytemp = 0
	move_to_delay = 8
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/headcrabdeath.ogg'
	var/charging = FALSE
	var/revving_charge = FALSE
	var/dash_speed = 1
	var/dash_delay = 5
	var/delaysound
	var/leapsound = 'hl13/sound/creatures/headcrableap.ogg'
	var/soundvary = TRUE

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!

/mob/living/simple_animal/hostile/halflife/headcrab/OpenFire()
	if(charging)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		charge()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/headcrab/proc/charge(atom/chargeat = target, delay = dash_delay)
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
	playsound(src, leapsound, 40, soundvary)
	walk_towards(src, T, dash_speed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * dash_speed, src)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/halflife/headcrab/Move()
	if(revving_charge)
		return FALSE
	..()

/mob/living/simple_animal/hostile/halflife/headcrab/armored
	name = "Armored Headcrab"
	desc = "A parasitic headcrab with a hardened fungal carapace."
	icon_state = "armoredheadcrab"
	icon_living = "armoredheadcrab"
	icon_dead = "armoredheadcrab_dead"
	maxHealth = 60
	health = 60
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1, /obj/item/stack/sheet/animalhide/goliath_hide = 1)

/mob/living/simple_animal/hostile/halflife/headcrab/poison
	name = "Poison Headcrab"
	desc = "An extra large and dark headcrab, with pronounced fangs."
	icon_state = "poisonheadcrab"
	icon_living = "poisonheadcrab"
	icon_dead = "poisonheadcrab_dead"
	maxHealth = 45
	health = 45
	dash_delay = 10
	soundvary = FALSE

	rapid_melee = 0.2 // attacks rather slow

	death_sound = 'hl13/sound/creatures/poison/ph_death.ogg'
	attack_sound = 'hl13/sound/creatures/poison/ph_poisonbite.ogg'
	delaysound = 'hl13/sound/creatures/poison/ph_scream.ogg'
	leapsound = 'hl13/sound/creatures/poison/ph_jump.ogg'

	var/poison_type = /datum/reagent/toxin/headcrab_venom
	var/poison_per_attack = 6

	var/aggro_sound = 'hl13/sound/creatures/poison/ph_rattle.ogg'
	var/idle_sounds = list('hl13/sound/creatures/poison/ph_talk1.ogg', 'hl13/sound/creatures/poison/ph_talk2.ogg', 'hl13/sound/creatures/poison/ph_talk3.ogg')

/mob/living/simple_animal/hostile/halflife/headcrab/poison/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		playsound(src, aggro_sound, 50, soundvary)

/mob/living/simple_animal/hostile/halflife/headcrab/poison/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(20))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, soundvary)

/mob/living/simple_animal/hostile/halflife/headcrab/poison/AttackingTarget()
	..()
	if(isliving(target))
		var/mob/living/L = target
		if(target.reagents)
			L.reagents.add_reagent(poison_type, poison_per_attack)


/mob/living/simple_animal/hostile/halflife/hunter
	name = "Hunter"
	desc = "A large tripod synth. Armored, and deadly."
	icon = 'hl13/icons/mob/halflife_large.dmi'
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
	if(prob(15))
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
	melee_damage_lower = 14
	melee_damage_upper = 19
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

//antlions
/mob/living/simple_animal/hostile/halflife/antlion_worker
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
	harm_intent_damage = 10
	melee_damage_lower = 12
	melee_damage_upper = 19
	wound_bonus = -20
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_SLASH
	ranged = 1
	retreat_distance = 3
	minimum_distance = 4
	projectiletype = /obj/projectile/acidspray
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'hl13/sound/creatures/antlion/attack_single1.ogg'
	combat_mode = TRUE
	minbodytemp = 0
	speed = -0.8
	move_to_delay = 4
	loot = list(/obj/effect/decal/cleanable/insectguts = 1)
	butcher_results = list(/obj/item/food/meat/slab/xen = 1)
	butcher_difficulty = 75
	footstep_type = FOOTSTEP_MOB_ANTLION
	death_sound = 'hl13/sound/creatures/antlion_worker/antlion_burst.ogg'
	var/soundvary = FALSE
	var/fire_delay = 10
	var/aggro_sound = list('hl13/sound/creatures/antlion/pain1.ogg', 'hl13/sound/creatures/antlion/pain2.ogg')
	var/idle_sounds = list('hl13/sound/creatures/antlion/idle1.ogg','hl13/sound/creatures/antlion/idle2.ogg', ,'hl13/sound/creatures/antlion/idle3.ogg', ,'hl13/sound/creatures/antlion/idle4.ogg', ,'hl13/sound/creatures/antlion/idle5.ogg' )

/mob/living/simple_animal/hostile/halflife/antlion_worker/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(40))
		var/chosen_sound = pick(aggro_sound)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/antlion_worker/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/antlion_worker/spawn_gibs()
	new /obj/effect/decal/antlionblood(drop_location(), src, get_static_viruses())

/mob/living/simple_animal/hostile/halflife/antlion_worker/OpenFire(atom/A)
	playsound(src, 'hl13/sound/creatures/antlion_worker/antlion_prefire.ogg', 50, FALSE)
	sleep(10)
	Shoot(A)
	ranged_cooldown = world.time + ranged_cooldown_time

/obj/projectile/acidspray
	name = "acid spray"
	icon_state = "acidspray"
	damage = 40
	damage_type = BURN
	hitsound = 'hl13/sound/creatures/antlion_worker/antlion_shoot.ogg'

/mob/living/simple_animal/hostile/halflife/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASSTABLE | PASSMOB
	combat_mode = TRUE
	mob_biotypes = MOB_ROBOTIC
	loot = list(/obj/item/circuitmaterial)
	health = 55
	maxHealth = 55
	rapid_melee = 2
	melee_damage_lower = 14
	melee_damage_upper = 18
	attack_vis_effect = ATTACK_EFFECT_SLASH
	wound_bonus = -15
	bare_wound_bonus = 15
	sharpness = SHARP_EDGED
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attack_verb_continuous = "cuts"
	attack_verb_simple = "cut"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	faction = list(FACTION_COMBINE)
	minbodytemp = 0
	mob_size = MOB_SIZE_TINY
	movement_type = FLYING
	move_to_delay = 2 //super fast spinny death machine
	limb_destroyer = 1
	speak_emote = list("states")
	bubble_icon = "syndibot"
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	death_message = "is smashed into pieces!"
	var/operating_power = 100
	var/low_power_melee_damage_lower = 6
	var/low_power_melee_damage_upper = 12

/mob/living/simple_animal/hostile/halflife/viscerator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/swarming)

/mob/living/simple_animal/hostile/halflife/viscerator/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(operating_power < 1)
		//Viscerators will eventually run low on power and deal less damage.
		melee_damage_lower = low_power_melee_damage_lower
		melee_damage_upper = low_power_melee_damage_upper
	else
		operating_power--

/mob/living/simple_animal/hostile/halflife/viscerator/deathmatch
	health = 125
	maxHealth = 125
	melee_damage_lower = 25
	melee_damage_upper = 40

/mob/living/simple_animal/hostile/hl2bot
	var/radio_key = null //which channels can the bot listen to
	var/radio_channel = RADIO_CHANNEL_COMMON //The bot's default radio channel
	var/obj/item/radio/Radio //The bot's radio, for speaking to people.
	var/obj/machinery/camera/builtInCamera = null
	var/nocamera = FALSE //Should the bot have a built in camera or not?
	var/data_hud_type
	hud_possible = list(DIAG_STAT_HUD, DIAG_BOT_HUD, DIAG_HUD, DIAG_PATH_HUD = HUD_LIST_LIST) //Diagnostic HUD views

/mob/living/simple_animal/hostile/hl2bot/Initialize(mapload)
	. = ..()
	access_card = new /obj/item/card/id(src)
	access_card.access += ACCESS_SECURITY
	Radio = new/obj/item/radio(src)
	if(radio_key)
		Radio.keyslot = new radio_key
	Radio.subspace_transmission = TRUE
	Radio.canhear_range = 0 // anything greater will have the bot broadcast the channel as if it were saying it out loud.
	Radio.recalculateChannels()
	if(!nocamera && !builtInCamera)
		builtInCamera = new (src)
		builtInCamera.c_tag = real_name
		builtInCamera.network = list("ss13")
		builtInCamera.internal_light = FALSE

	//If a bot has its own HUD (for player bots), provide it.
	if(data_hud_type)
		var/datum/atom_hud/datahud = GLOB.huds[data_hud_type]
		datahud.show_to(src)

/mob/living/simple_animal/hostile/hl2bot/Destroy()
	qdel(Radio)
	qdel(access_card)
	return ..()

/mob/living/simple_animal/hostile/hl2bot/radio(message, list/message_mods = list(), list/spans, language)
	. = ..()
	if(. != 0)
		return

	if(message_mods[MODE_HEADSET])
		Radio.talk_into(src, message, , spans, language, message_mods)
		return REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] == MODE_DEPARTMENT)
		Radio.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
		return REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] in GLOB.radiochannels)
		Radio.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
		return REDUCE_RANGE

/mob/living/simple_animal/hostile/hl2bot/cityscanner
	name = "City Scanner"
	desc = "A flying machine built to scan the city for malcompliants."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "cityscanner"
	icon_living = "cityscanner"
	friendly_verb_continuous = "scans"
	friendly_verb_simple = "scan"
	loot = list(/obj/item/circuitmaterial)
	del_on_death = 1
	health = 60
	maxHealth = 60
	wander = 0
	speed = -0.33
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC
	speak_emote = list("beeps")
	speech_span = SPAN_ROBOT
	bubble_icon = "machine"
	movement_type = FLYING
	radio_key = /obj/item/encryptionkey/secbot //AI Priv + Security
	radio_channel = RADIO_CHANNEL_SECURITY //Security channel
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	data_hud_type = DATA_HUD_SECURITY_ADVANCED
	faction = list("neutral","silicon","combine")
	death_sound = 'hl13/sound/creatures/cityscanner/cbot_energyexplosion1.ogg'
	ranged = 1 //for flashing
	ranged_cooldown_time = 50
	light_power = 0.75
	light_range = 3
	var/idle_sound_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan_loop1.ogg')
	var/scan_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan1.ogg', 'hl13/sound/creatures/cityscanner/scanner_scan2.ogg')
	var/talk_sounds = list('hl13/sound/creatures/cityscanner/scanner_talk1.ogg', 'hl13/sound/creatures/cityscanner/scanner_talk2.ogg')

/mob/living/simple_animal/hostile/hl2bot/cityscanner/binarycheck()
	return TRUE

/mob/living/simple_animal/hostile/hl2bot/cityscanner/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 20, FALSE)
		if(prob(15))
			chosen_sound = pick(scan_sounds)
			playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/hl2bot/cityscanner/OpenFire()
	playsound(src, 'hl13/sound/creatures/cityscanner/scanner_photo1.ogg', 40, FALSE)
	ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/hl2bot/cityscanner/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null, message_range = 7, datum/saymode/saymode, list/message_mods = list())
	..()
	if(stat)
		return
	var/chosen_sound = pick(talk_sounds)
	playsound(src, chosen_sound, 50, FALSE)

//antlion grub
/mob/living/simple_animal/halflife/grub
	name = "Antlion Grub"
	desc = "A large maggot filled with a green, glowing mass."
	icon = 'hl13/icons/mob/halflife.dmi'
	held_lh = 'icons/mob/inhands/animal_item_lefthand.dmi'
	held_rh = 'icons/mob/inhands/animal_item_righthand.dmi'
	icon_state = "grub"
	icon_living = "grub"
	icon_dead = "grub_dead"
	faction = list(FACTION_ANTLION)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 12
	health = 12
	wander = 0
	light_range = 2
	light_power = 1
	light_color = "#67ac65"
	minbodytemp = 0
	speed = -1
	loot = list(/obj/item/reagent_containers/pill/patch/grubnugget = 1, /obj/effect/decal/cleanable/insectguts = 1)
	can_be_held = TRUE
	held_state = "grub"
	death_sound = 'hl13/sound/creatures/grub/agrub_squish.ogg'
	density = FALSE
	//var/squish_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/grub/idle1.ogg','hl13/sound/creatures/grub/idle2.ogg', ,'hl13/sound/creatures/grub/idle3.ogg', ,'hl13/sound/creatures/grub/idle4.ogg')

/mob/living/simple_animal/halflife/grub/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(25))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

//commented out until i figure a way to make antlions not squash their own babies
/*
/mob/living/simple_animal/halflife/grub/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/squashable, \
		squash_chance = squish_chance, \
		squash_damage = 6, \
		squash_flags = SQUASHED_ALWAYS_IF_DEAD|SQUASHED_DONT_SQUASH_IN_CONTENTS, \
	)
*/


//Larry
/mob/living/simple_animal/halflife/larry
	name = "Larry"
	desc = "A supposedly debeaked headcrab. Unknown if approved by the combine, but it has been kept in the science lab for a while now."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 30
	health = 30
	attack_sound = 'hl13/sound/creatures/headcrabbite.ogg'
	minbodytemp = 0
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/headcrabdeath.ogg'

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!

//Harry
/mob/living/simple_animal/halflife/harry
	name = "Harry"
	desc = "A supposedly debeaked poison headcrab. Donated by the science lab to the factory."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "poisonheadcrab"
	icon_living = "poisonheadcrab"
	icon_dead = "poisonheadcrab_dead"
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 45
	health = 45
	attack_sound = 'hl13/sound/creatures/poison/ph_poisonbite.ogg'
	minbodytemp = 0
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/poison/ph_death.ogg'

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!
