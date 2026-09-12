/// EVIL speedwagon with different behaviour
/obj/vehicle/sealed/car/truck
	name = "pre-war military truck"
	desc = "An old, pre-war military truck. Commonly used by the Polish Liberation Front and the Overwatch Conscripted Arm for logistical purposes or as an affordable troop transport. These things make for effective battering rams against most barricades, though thicker walls will stop them dead in their tracks and razor-wire should be able to rip up their tires."
	icon = 'hl13/icons/obj/port/van.dmi'
	icon_state = "van_base"
	max_integrity = 250
	layer = LYING_MOB_LAYER
	max_occupants = 8
	pixel_y = -32
	pixel_x = -32
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_range = 6
	light_power = 2
	light_on = FALSE
	enter_delay = 3 SECONDS
	vehicle_move_delay = 2 //slower version for less powerful bus
	explodes_on_death = FALSE //leaves wreckage instead
	waterproof = FALSE
	var/crashdamage = TRUE //take damage when hitting things that can do that
	var/leave_wreckage = TRUE //do we leave a wreck (override in case tdm version gets added)
	var/bus_kidnap = FALSE //dont enable unless its a kidnap car

/obj/vehicle/sealed/car/truck/Initialize(mapload)
	. = ..()
	add_overlay(image(icon, "wheels_0", ABOVE_MOB_LAYER))

/obj/vehicle/sealed/car/truck/generate_actions()
	. = ..()
	initialize_controller_action_type(/datum/action/vehicle/sealed/headlights, VEHICLE_CONTROL_DRIVE)

/obj/vehicle/sealed/car/truck/atom_destruction()
	if(leave_wreckage)
		var/obj/structure/halflife/cargotruck/formerly_drivable_wreckage/wreck = new(loc)
		wreck.setDir(dir)
	return ..()

/obj/vehicle/sealed/car/truck/Bump(atom/bumped)
	. = ..()
	if(iswallturf(bumped))
		if(src.crashdamage)
			src.take_damage(65, BRUTE) //you really shouldn't
			visible_message(span_danger("[src] crashes into [bumped] and comes to a grinding halt!"))
			stall(3)
		return
	if(!ismovable(bumped))
		return
	if(istraveltile(bumped))
		var/obj/structure/fluff/traveltile/drivethru = bumped
		drivethru.drive_through(src)
		return
	if(isvehicle(bumped))
		var/obj/vehicle/victim = bumped
		if(victim.canmove)
			victim.stall(1)
			victim.take_damage(75, BRUTE)
			if(crash_damage)
				visible_message(span_danger("[src] rams into [bumped] and both come to a screeching halt!"))
				src.stall(1)
				src.take_damage(25, BRUTE) //you can bumper cars with a truck but it probably isnt a good idea
				return
			else
				visible_message(span_danger("[src] rams into [bumped], which comes to a screeching halt!"))
				return
		else
			visible_message(span_danger("[src] rams into [bumped]!"))
			victim.take_damage(5, BRUTE) //go at them while they're still mobile or youre BOOORING
			if(crash_damage)
				src.stall(1)
				src.take_damage(10, BRUTE) //"more forgiving", i say, as the truck you just rammed comes back to life
			return
	if(israzorwire(bumped))
		visible_message(span_danger("[src] rolls over [bumped]!"))
		bumped.take_damage(35, BRUTE) //two rollthroughs to clear it...
		if(src.crashdamage)
			src.take_damage(10, BRUTE) //but it'll fuck your tires up
		return
	if(!bumped.density || occupant_amount() == 0)
		return
	if(iswindow(bumped))
		visible_message(span_danger("[src] slams through [bumped]!"))
		bumped.take_damage(950, BRUTE) //YOUR MORTAL WINDOWS CANNOT STOP ME.
		return
	if(iswoodrailing(bumped) || iswoodbarricade(bumped) || istree(bumped))
		playsound(src, 'hl13/sound/halflifeeffects/wood_door_break.ogg', 50, TRUE)
		visible_message(span_danger("[src] crashes through [bumped]!"))
		bumped.take_damage(950, BRUTE) //shitty flimsy wooden structures dont usually do well against high-velocity truck
		return
	if(israiling(bumped) || istable(bumped))
		visible_message(span_danger("[src] crashes into [bumped]!"))
		bumped.take_damage(85, BRUTE) //weaker cade
		playsound(src, 'sound/effects/bang.ogg', 50, TRUE)
		return
	if(isconcreteroadbarrier(bumped) || iscombineroadbarrier(bumped) || isbarricade(bumped))
		visible_message(span_danger("[src] crashes into [bumped]!"))
		bumped.take_damage(55, BRUTE) //slam into the barrier at the cost of slight self-damage
		playsound(src, 'sound/effects/bang.ogg', 50, TRUE)
		if(src.crashdamage)
			src.take_damage(2, BRUTE) //this will take about 20 damage to ram through one concrete cade
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
		if(bus_kidnap)
			rammed.visible_message(span_warning("[src] rams into [rammed] and sucks [rammed.p_them()] up!")) //i don't know why i'm adding this but i can
			mob_forced_enter(rammed)

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
	crashdamage = FALSE
	waterproof = TRUE

/obj/vehicle/sealed/car/truck/fast/admeme/kidnap
	car_traits = CAN_KIDNAP
	escape_time = 10 SECONDS //this is an adminspawn you're getting on the wild ride
	bus_kidnap = TRUE
	max_occupants = 999 //as above

/obj/vehicle/sealed/car/truck/fast/admeme/kidnap/generate_actions()
	. = ..()
	initialize_controller_action_type(/datum/action/vehicle/sealed/dump_kidnapped_mobs, VEHICLE_CONTROL_DRIVE)
