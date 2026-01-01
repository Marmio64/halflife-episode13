/obj/projectile/bullet/c9mm/usp
	name = "9mm bullet"
	damage = 17
	embed_type = /datum/embed_data/bullet_c9mm

/obj/projectile/bullet/c9mm/usp/makeshift
	name = "9mm makeshift bullet"
	damage = 15

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

/obj/projectile/bullet/a20mm
	name = "20mm grenade"
	icon_state = "bolter"
	damage = 35
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
	damage = 20 //the damage will come from the heavy explosion
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
