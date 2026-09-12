/// EVIL speedwagon with different behaviour
/obj/vehicle/sealed/car/truck
	name = "pre-war military truck"
	desc = "An old, pre-war military truck. Commonly used by the Polish Liberation Front and the Overwatch Conscripted Arm for logistical purposes or as an affordable troop transport. This one still seems functional, too!"
	icon = 'hl13/icons/obj/port/van.dmi'
	icon_state = "van_base"
	max_integrity = 250
	layer = LYING_MOB_LAYER
	max_occupants = 8
	pixel_y = -32
	pixel_x = -32
	enter_delay = 3 SECONDS
	escape_time = 3 SECONDS
	vehicle_move_delay = 2 //slower version for less powerful bus
	var/crashdamage = TRUE

/obj/vehicle/sealed/car/truck/Initialize(mapload)
	. = ..()
	add_overlay(image(icon, "wheels_0", ABOVE_MOB_LAYER))

/obj/vehicle/sealed/car/truck/Bump(atom/bumped)
	. = ..()
	if(istraveltile(bumped))
		var/obj/structure/fluff/traveltile/drivethru = bumped
		drivethru.drive_through(src)
		return
	if(!bumped.density || occupant_amount() == 0)
		return
	if(iswoodrailing(bumped) || iswoodbarricade(bumped) || istree(bumped))
		playsound(src, 'hl13/sound/halflifeeffects/wood_door_break.ogg', 50, TRUE)
		visible_message(span_danger("[src] crashes through [bumped]!"))
		bumped.take_damage(950, BRUTE) //shitty flimsy wooden structures dont usually do well against
	if(isfixedroadbarrier(bumped) || isbarricade(bumped))
		visible_message(span_danger("[src] crashes into [bumped]!"))
		bumped.take_damage(55, BRUTE) //slam into the barrier at the cost of slight self-damage
		playsound(src, 'sound/effects/bang.ogg', 50, TRUE)
		if(src.crashdamage)
			src.take_damage(5, BRUTE)
	if(!ismovable(bumped))
		return
	var/atom/movable/flying_debris = bumped
	if(!flying_debris.anchored)
		flying_debris.throw_at(get_edge_target_turf(bumped, dir), 2, 3)
		if(!isliving(bumped))
			flying_debris.take_damage(85, BRUTE)
		visible_message(span_danger("[src] crashes into [bumped]!"))
		playsound(src, 'sound/effects/bang.ogg', 50, TRUE)
	if(!isliving(bumped))
		return
	var/mob/living/rammed = bumped
	rammed.apply_damage(rand(20,35), BRUTE)
	if(ishuman(rammed))
		rammed.Paralyze(50)
		rammed.adjustStaminaLoss(80)

/obj/vehicle/sealed/car/truck/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	if(occupant_amount() == 0)
		return
	for(var/atom/future_statistic in range(0, src))
		if(future_statistic == src)
			continue
		if(!LAZYACCESS(occupants, future_statistic))
			Bump(future_statistic)

/obj/vehicle/sealed/car/truck/fast
	name = "pristine pre-war military truck"
	desc = "An old, pre-war military truck. Commonly used by the Polish Liberation Front and the Overwatch Conscripted Arm for logistical purposes or as an affordable troop transport. This one happens to be in pristine condition!"
	max_integrity = 400
	vehicle_move_delay = 1

/obj/vehicle/sealed/car/truck/fast/admeme
	name = "heavily-modified pre-war military truck"
	desc = "An old, pre-war military truck. Commonly used by the Polish Liberation Front and the Overwatch Conscripted Arm for logistical purposes or as an affordable troop transport. This one happens to have been upgraded with seized Combine technology; fear, the chariot of war!"
	max_integrity = 900
	vehicle_move_delay = 0
	enter_delay = 0 SECONDS
	escape_time = 0 SECONDS
	crashdamage = FALSE
