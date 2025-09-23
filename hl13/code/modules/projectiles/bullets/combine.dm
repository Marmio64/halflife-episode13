/obj/projectile/bullet/pulse/ar2
	name = "pulse round"
	icon_state = "pulse"
	damage = 17
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/ar2/fast
	speed = 4

/obj/projectile/bullet/pulse/lmg
	name = "pulse round"
	icon_state = "pulse"
	damage = 20
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/weak
	name = "pulse round"
	icon_state = "pulse"
	damage = 12
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/weak/fast
	speed = 4

/obj/projectile/bullet/pulse/very_weak
	name = "pulse round"
	icon_state = "pulse"
	damage = 8
	wound_bonus = -10
	armour_penetration = 0

/obj/projectile/bullet/pulse/heavy
	name = "heavy pulse round"
	icon_state = "pulse"
	damage = 50
	wound_bonus = -10
	armour_penetration = 35
	speed = 4

/obj/projectile/bullet/flechette
	name = "flechette"
	icon_state = "flechette"
	damage = 20
	wound_bonus = -10
	bare_wound_bonus = 5
	hitsound = 'hl13/sound/creatures/hunter/flechette_flesh_impact1.ogg'

/obj/projectile/bullet/pellet/shotgun_buckshot/pulse
	name = "pulseshot pellet"
	icon_state = "pulsepellet"
	damage = 19 //114 total damage
	armour_penetration = 20

/obj/projectile/bullet/pellet/shotgun_buckshot/antixen
	name = "anti-xen pellet"
	icon_state = "pulsepellet"
	damage = 5
	wound_bonus = 0
	bare_wound_bonus = 0
	wound_falloff_tile = -2.5 // low damage + additional dropoff will already curb wounding potential anything past point blank

/obj/projectile/bullet/pellet/shotgun_buckshot/antixen/on_hit(atom/target, blocked = 0, pierce_hit)
	if(isliving(target))
		var/mob/living/victim = target
		if(victim.mob_biotypes & MOB_XENIAN)
			damage *= 4

	return ..()

/obj/projectile/bullet/mining_slug
	name = "mining slug"
	icon_state = "pulse"
	damage = 25
	armour_penetration = 20
	wound_bonus = -25
	range = 14

/obj/projectile/bullet/mining_slug/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer, FALSE)
		if(range > 0)
			return BULLET_ACT_FORCE_PIERCE
