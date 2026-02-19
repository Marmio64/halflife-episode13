/obj/projectile/bullet/pulse
	name = "pulse round"
	icon_state = "pulse"

/obj/projectile/bullet/pulse/ar2
	damage = 18
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/ar2/emplacement
	accuracy_falloff = 9 //accuracy drops off faster
	spread = 12

/obj/projectile/bullet/pulse/ar2/fast
	speed = 4

/obj/projectile/bullet/pulse/energyball
	hitsound = 'hl13/sound/weapons/energy_sing_flyby.ogg'
	hitsound_wall = 'hl13/sound/weapons/energy_sing_explosion.ogg'
	damage = 45
	wound_bonus = -40
	damage_type = BURN
	armor_flag = LASER
	armour_penetration = 80
	ricochets_max = 8
	min_ricochets = 6
	ricochet_chance = 80
	ricochet_incidence_leeway = 0
	projectile_piercing = PASSMOB
	max_pierces = 5
	icon_state = "darkenergy"

/obj/projectile/bullet/pulse/energyball/on_ricochet()
	. = ..()
	playsound(src, 'hl13/sound/weapons/energy_bounce.ogg', clamp(vol_by_damage() + (suppressed ? 0 : 20), 0, 100), TRUE, -1)

/obj/projectile/bullet/pulse/energyball/check_ricochet_flag(atom/target)
	if((target.flags_ricochet))
		return TRUE
	return FALSE

/obj/projectile/bullet/pulse/energyball/on_hit(atom/target, blocked = 0, pierce_hit)
	if(istype(target, /mob/living/simple_animal/hostile/halflife/hunter)) //bonus direct damage vs hunters
		damage = 90
	. = ..()

/obj/projectile/bullet/pulse/lmg
	damage = 24
	wound_bonus = -10
	armour_penetration = 25

/obj/projectile/bullet/pulse/weak
	damage = 12
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/smg
	damage = 12
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/turret
	damage = 10
	wound_bonus = -10
	armour_penetration = 20

/obj/projectile/bullet/pulse/turret/weak
	damage = 8

/obj/projectile/bullet/pulse/weak/fast
	speed = 4

/obj/projectile/bullet/pulse/very_weak
	damage = 8
	wound_bonus = -10
	armour_penetration = 0

//this increases in effectiveness as the bullet travels
/obj/projectile/bullet/pulse/heavy
	name = "heavy pulse round"
	damage = 30
	wound_bonus = -10
	armour_penetration = 32
	speed = 6
	accurate_range = 150

	var/max_distance_damage = 50 //reached after 10 tiles of travel
	var/damage_increase_per_tile = 2

	var/max_distance_armor_piercing = 80 //will get you through practically anything. Reached after 8 tiles of travel
	var/ap_increase_per_tile = 6

/obj/projectile/bullet/pulse/heavy/reduce_range()
	..()
	if(damage < max_distance_damage)
		damage += damage_increase_per_tile
	if(armour_penetration < max_distance_armor_piercing)
		armour_penetration += ap_increase_per_tile

/obj/projectile/bullet/flechette
	name = "flechette"
	icon_state = "flechette"
	damage = 24
	armour_penetration = 20
	wound_bonus = -10
	bare_wound_bonus = 5
	hitsound = 'hl13/sound/creatures/hunter/flechette_flesh_impact1.ogg'

/obj/projectile/bullet/pellet/shotgun_buckshot/pulse
	name = "pulseshot pellet"
	icon_state = "pulsepellet"
	damage = 20 //120 total damage
	armour_penetration = 25

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

/obj/projectile/bullet/immolator_plasma
	name = "plasma arc"
	icon_state = "xray"
	damage = 24
	armour_penetration = 25
	wound_bonus = -20
	damage_type = BURN
	armor_flag = LASER
	range = 5 //close range
	hitscan = TRUE
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray
