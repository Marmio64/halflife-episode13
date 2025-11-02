/obj/machinery/deployable_turret/combine
	name = "combine emplacement gun"
	desc = "A gun similar to an AR2 is mounted here, and can be used to fire."
	icon_state = "combine_emplacement"
	icon = 'hl13/icons/obj/barriers.dmi'
	max_integrity = 550
	projectile_type = /obj/projectile/bullet/pulse/ar2/emplacement
	anchored = TRUE
	number_of_shots = 8
	cooldown_duration = 2.25 SECONDS
	rate_of_fire = 2
	firesound = 'hl13/sound/weapons/ar2fire.ogg'
	overheatsound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'
	always_anchored = TRUE
	view_range = 0
	var/projectile_passchance = 25

	armor_type = /datum/armor/combine_emplacement_turret

/datum/armor/combine_emplacement_turret
	bomb = -50

/obj/machinery/deployable_turret/combine/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(istype(mover, /obj/projectile))
		if(!projectile_passchance)
			return
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob((projectile_passchance)))
			return TRUE
		return FALSE
