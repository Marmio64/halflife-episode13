/obj/projectile/bullet/c9mm/usp
	name = "9mm bullet"
	damage = 15
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
	damage = 9
	wound_bonus = 5
	bare_wound_bonus = 5
	wound_falloff_tile = -2.5 // low damage + additional dropoff will already curb wounding potential anything past point blank

/obj/projectile/bullet/c46x30mm/mp7
	name = "4.6x30mm bullet"
	damage = 8
	wound_bonus = 15
	bare_wound_bonus = 10
	embed_falloff_tile = -4
	icon_state = "bullet_small"

// 5.56mm (m4a1)

/obj/projectile/bullet/a556
	name = "5.56mm bullet"
	damage = 17
	wound_bonus = -10
	armour_penetration = 15
	icon_state = "bullet_large"
