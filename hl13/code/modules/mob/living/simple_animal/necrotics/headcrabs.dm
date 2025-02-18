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
