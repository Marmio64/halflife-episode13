/obj/projectile/bullet/c9mm/usp
	name = "9mm bullet"
	damage = 17
	embed_type = /datum/embed_data/bullet_c9mm

/obj/projectile/bullet/c9mm/usp/tranq
	name = "9mm tranq bullet"
	damage = 0 //non-lethal
	sharpness = NONE
	embed_type = null
	icon_state = "rubber"
	projectile_piercing = NONE

/obj/projectile/bullet/c9mm/usp/tranq/on_hit(atom/target, blocked = null, pierce_hit)
	. = ..()
	var/tranq_tiredness = 750 - (blocked*10) //guard armor will do 25%, so reduced tiredness gain by 250
	if(iscarbon(target))
		var/mob/living/carbon/C = target

		if(tranq_tiredness <= 50)
			C.visible_message(span_notice("The [src] fails to penetrate [target]'s thick armor and bounces off uselessly."))
			return

		if(HAS_TRAIT(C, TRAIT_THE_INTRUDER) && prob(80))
			C.say("You're pretty good!", forced = C.name)
			return

		if(HAS_TRAIT(C, TRAIT_INTRUDER_OCELOT) && prob(80))
			C.say("I'm disappointed!", forced = C.name)
			return

		C.adjust_tiredness(tranq_tiredness)

		if(TIREDNESS_SLEEPY_THRESHOLD <= C.tiredness) //if after the tranq shot they are sleepy, they go sleep sleep
			C.SetSleeping(25 SECONDS)

/obj/projectile/bullet/c9mm/usp/makeshift
	name = "9mm makeshift bullet"
	damage = 15

/obj/projectile/bullet/c9mm/usp/armor_piercing
	name = "9mm armor-piercing bullet"
	damage = 18
	armour_penetration = 25

/obj/projectile/bullet/c9mm/usp/rubber
	name = "9mm rubber bullet"
	damage = 10
	stamina = 15
	wound_bonus = 10
	bare_wound_bonus = 5 //oof ouch
	sharpness = NONE
	embed_type = null
	ricochets_max = 2
	ricochet_chance = 80
	icon_state = "rubber"

/obj/projectile/bullet/pellet/shotgun_buckshot/halflife
	name = "buckshot pellet"
	damage = 11
	wound_bonus = -20
	bare_wound_bonus = 5
	wound_falloff_tile = -2.5 // low damage + additional dropoff will already curb wounding potential anything past point blank

/obj/projectile/bullet/c46x30mm/mp7
	name = "4.6x30mm bullet"
	damage = 9
	wound_bonus = 15
	bare_wound_bonus = 10
	embed_falloff_tile = -4
	icon_state = "bullet_small"

/obj/projectile/bullet/c46x30mm/mp7/rubber
	name = "4.6x30mm rubber bullet"
	damage = 5
	stamina = 8
	wound_bonus = 10
	bare_wound_bonus = 5 //oof ouch
	sharpness = NONE
	embed_type = null
	ricochets_max = 2
	ricochet_chance = 80
	icon_state = "rubber"

/obj/projectile/bullet/a20mm
	name = "20mm grenade"
	icon_state = "bolter"
	damage = 35
	speed = 1.5
	armor_flag = BOMB
	wound_bonus = -100
	embed_type = null
	shrapnel_type = null

/obj/projectile/bullet/a20mm/on_hit(atom/target, blocked = 0, pierce_hit)
	..()
	explosion(target, devastation_range = 0, light_impact_range = 2, flame_range = 0, adminlog = FALSE, explosion_cause = src)
	return BULLET_ACT_HIT

// 5.56mm (m4a1)

/obj/projectile/bullet/a556
	name = "5.56mm bullet"
	damage = 18
	wound_bonus = -10
	armour_penetration = 15
	icon_state = "bullet_large"

/obj/projectile/bullet/rocket/hl13
	damage = 25 //the damage will come from the heavy explosion
	wound_bonus = -10
	speed = 0.25
	var/max_speed = 3
	var/speed_increase_per_tile = 0.5

/obj/projectile/bullet/rocket/hl13/reduce_range()
	..()
	if(speed < max_speed)
		speed += speed_increase_per_tile

/obj/projectile/bullet/rocket/hl13/do_boom(atom/target, random_crit_gib = FALSE)
	if(!isliving(target)) //if the target isn't alive, so is a wall or something
		explosion(target, heavy_impact_range = 2, light_impact_range = 4, flame_range = 0, flash_range = 0, explosion_cause = src)
	else
		explosion(target, heavy_impact_range = 2, light_impact_range = 4, flame_range = 0, flash_range = 0,  explosion_cause = src)
		if(random_crit_gib)
			var/mob/living/gibbed_dude = target
			new /obj/effect/temp_visual/crit(get_turf(gibbed_dude))
			gibbed_dude.gib(DROP_ALL_REMAINS)

/obj/projectile/bullet/rocket/hl13/on_hit(atom/target, blocked = 0, pierce_hit)
	if(istype(target, /mob/living/simple_animal/hostile/halflife/hunter)) //bonus direct damage vs hunters
		damage = 100 //165 total damage
	. = ..()

/obj/projectile/bullet/shotgun_beanbag_halflife
	name = "beanbag slug"
	damage = 28 //beanbags still fucking hurt
	stamina = 50
	wound_bonus = -30
	bare_wound_bonus = 5 //oof ouch
	sharpness = NONE
	embed_type = null
	ricochets_max = 2
	ricochet_chance = 80
	icon_state = "rubber"
