// From Mojave Sun

/obj/structure/halflife/street_sign
	name = "\improper street sign"
	desc = "sign street is the other way."
	icon = 'hl13/icons/obj/street_signs.dmi'
	anchored = TRUE
	density = FALSE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500
	projectile_passchance = 95

/obj/structure/halflife/street_sign/stop
	desc = "You would stop at this sign if there were any vehicles left on the roads for you to drive."
	icon_state = "stop"

/obj/structure/halflife/street_sign/turning
	desc = "No turning around now. A good lesson for life."
	icon_state = "noturn"

/obj/structure/halflife/street_sign/parking
	desc = "No pee allowed here?"
	icon_state = "noparking"

/obj/structure/halflife/street_sign/street
	desc = "A street sign. Interesting."
	icon_state = "street"

/obj/structure/halflife/street_sign/one_way
	desc = "It seems the road ahead is one way."
	icon_state = "direction"

/obj/structure/halflife/street_sign/bus
	desc = "You'll be waiting here a very long time if you want a bus."
	icon_state = "busstop"

/obj/structure/halflife/street_sign/railroad
	desc = "I suppose the combine still run trains around."
	icon_state = "railcrossing"

/obj/structure/halflife/street_sign/only_direction
	desc = "It's telling you to only go this way."
	icon_state = "onlydir"

/obj/structure/halflife/street_sign/speed
	desc = "The combine usually ignore these signs, anyways. You recognise it is showing speed in kilometers per hour."
	icon_state = "speed"

/obj/structure/halflife/street_sign/warnings
	desc = "Looks like there are traffic lights nearby, presumably."
	icon_state = "warnings"

/obj/structure/halflife/street_sign/turn
	desc = "It's pointing a direction with arrows on it. Cool."
	icon_state = "turn"

/obj/machinery/power/halflife/streetlamp
	name = "\improper street lamp"
	desc = "An old street lamp, with an eerie semi-blue glow."
	icon = 'hl13/icons/obj/streetpoles.dmi'
	icon_state = "streetlight"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	light_range = 3
	light_power = 1.25
	light_color = "#658cac"
	max_integrity = 2000
	pixel_x = -32
	pixel_y = 8
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/power/halflife/streetlamp/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/halflife/streetlamp) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(75)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/halflife/streetlamp/corner
	name = "\improper street lamp"
	icon_state = "streetlightcorner"

/obj/machinery/power/halflife/streetlamp/double
	name = "\improper street lamp"
	icon_state = "streetlightduo"

/obj/machinery/power/halflife/trafficlight
	name = "\improper traffic light"
	desc = "The combine tend to ignore these anyways."
	icon = 'hl13/icons/obj/streetpoles.dmi'
	anchored = TRUE
	max_integrity = 2000
	pixel_x = -32
	icon_state = "trafficlightright"
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/power/halflife/trafficlight/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/halflife/trafficlight) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(75)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/halflife/trafficlight/alt
	icon_state = "trafficlightleft"


/obj/machinery/power/halflife/streetlamphalt
	name = "\improper street lamp"
	desc = "An old street lamp in surpisingly good condition. Through its cob webbed lamp post and swarming moths, a warm yellow light is emanated to brighten the street."
	icon = 'hl13/icons/obj/streetlamps.dmi'
	icon_state = "streetlamp"
	anchored = TRUE
	density = FALSE
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	light_range = 3.25
	light_power = 1
	light_color = "#ddcc9b"
	max_integrity = 2000
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/power/halflife/streetlamphalt/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/machinery/power/halflife/streetlamphalt) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(75)) // These things are pretty thin
			return TRUE
		return FALSE

/obj/machinery/power/halflife/streetlamphalt/Initialize(mapload)
	. = ..()
	if(dir == NORTH)
		pixel_y = 14

	if(dir == EAST)
		pixel_y = 12
		pixel_x = 8

	if(dir == SOUTH)
		pixel_y = 2

	if(dir == WEST)
		pixel_y = 12
		pixel_x = -8

//Ladders

/obj/structure/ladder/halflife
	name = "ladder"
	desc = "A questionable metal ladder. There's got to be stairs around, right?"
	icon = 'hl13/icons/obj/ladders.dmi'
	icon_state = "ladder01"
	resistance_flags = INDESTRUCTIBLE
	travel_time = 2 SECONDS

/obj/structure/ladder/halflife/upwards
	icon_state = "ladder10"

/obj/structure/ladder/halflife/travel(going_up, mob/user, is_ghost, obj/structure/ladder/ladder)
	if(!is_ghost)
		ladder.add_fingerprint(user)
		if(!do_after(user, travel_time, target = src))
			return
		playsound(user, pick('hl13/sound/halflifeeffects/ladder1.ogg',
							'hl13/sound/halflifeeffects/ladder2.ogg',
							'hl13/sound/halflifeeffects/ladder3.ogg',
							'hl13/sound/halflifeeffects/ladder4.ogg'), 60)

	var/turf/target = get_turf(ladder)
	user.zMove(target = target, z_move_flags = ZMOVE_CHECK_PULLEDBY|ZMOVE_ALLOW_BUCKLED|ZMOVE_INCLUDE_PULLED)
	//ladder.use(user) //reopening ladder radial menu ahead

// TG code edit to add a check for blocked ladders //

/obj/structure/ladder/halflife/use(mob/user, is_ghost=FALSE, going_up = TRUE)
	if (!is_ghost && !in_range(src, user))
		return

	if(obstructed)
		to_chat(user, span_warning("It's blocked, you'll have to find a way to change that."))
		return

	var/list/tool_list = list()
	if (up)
		tool_list["Up"] = image(icon = 'icons/testing/turf_analysis.dmi', icon_state = "red_arrow", dir = NORTH)
	if (down)
		tool_list["Down"] = image(icon = 'icons/testing/turf_analysis.dmi', icon_state = "red_arrow", dir = SOUTH)
	if (!length(tool_list))
		to_chat(user, span_warning("[src] doesn't seem to lead anywhere!"))
		return

	var/result = show_radial_menu(user, src, tool_list, custom_check = CALLBACK(src, PROC_REF(check_menu), user, is_ghost), require_near = !is_ghost, tooltips = TRUE)
	if (!is_ghost && !in_range(src, user))
		return  // nice try
	if(isliving(user))
		var/mob/living/living_mob = user
		if(living_mob.mob_size > MOB_SIZE_HUMAN)
			to_chat(user, span_notice("You're too large to climb this."))
			return
	switch(result)
		if("Up")
			if(up.obstructed)
				to_chat(user, span_warning("[src] is obstructed!"))
				return
			else
				if(!user.can_perform_action(src, NEED_DEXTERITY))
					to_chat(user, span_notice("You don't have the ability to climb this."))
					return
				travel(TRUE, user, is_ghost, up)
		if("Down")
			if(!user.can_perform_action(src, NEED_DEXTERITY))
				to_chat(user, span_notice("You don't have the ability to climb this."))
				return
			travel(FALSE, user, is_ghost, down)
		if("Cancel")
			return

	if(!is_ghost)
		add_fingerprint(user)

///////////////////// MANHOLE COVER /////////////////////////

/obj/structure/ladder/halflife/manhole
	name = "manhole"
	desc = "A manhole ladder, you could probably push the cover off from here, or try dragging it back on."
	travel_time = 2 SECONDS
	pixel_y = 7
	icon_state = "manhole_closed"

/obj/structure/ladder/halflife/manhole/upwards
	icon_state = "ladder10"

/obj/structure/ladder/halflife/manhole/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use <b>RIGHT-CLICK</b> on [src] to open or close it.</span>"
	. += "<span class='notice'>Careful, if you're not <b>STRONG</b> enough, you might hurt yourself if you need to lift the cover without a crowbar.</span>"

/obj/structure/ladder/halflife/manhole/attack_hand_secondary(mob/living/user, list/modifiers)
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)

	if(!down && up.obstructed)
		if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			up.icon_state = "manhole_open"
			up.desc = "An open manhole, it still stinks even after all these years. You could use a crowbar or your hands to slide the cover back on."
			up.density = FALSE
			up.obstructed = FALSE
			density = FALSE
			to_chat(user, span_notice("You push up on the cover from below, and slide it off."))
			playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	if(!down && !up.obstructed)
		if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			up.icon_state = "manhole_closed"
			up.desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
			up.obstructed = TRUE
			obstructed = TRUE
			to_chat(user, span_notice("You carefully drag and slide the cover back on from below."))
			playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	else
		if(obstructed)
			to_chat(user, span_warning("It's so heavy! Surely there's a better way of doing this."))
			if(user.get_stat_level(STATKEY_STR) < 13)
				to_chat(user, span_warning("You aren't strong enough to comfortably lift this without a tool, you might get injured..."))
			if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
				obstructed = FALSE
				down.obstructed = FALSE
				icon_state = "manhole_open"
				desc = "An open manhole, it still stinks even after all these years. You could use a crowbar or your hands to slide the cover back on."
				playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
				if(12 < user.get_stat_level(STATKEY_STR))
					to_chat(user, span_notice("That was heavy, but you're strong, no way you're going to get hurt just from that."))
				else
					to_chat(user, span_notice("With a lot of effort, you manage to finally get the cover off."))
					if(prob(30))
						to_chat(user, span_userdanger("MY ARM! THE PAIN!"))
						arm.force_wound_upwards(/datum/wound/blunt/bone/moderate)
						arm.receive_damage(10)
		else
			if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
				obstructed = TRUE
				down.obstructed = TRUE
				icon_state = "manhole_closed"
				desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
				to_chat(user, span_notice("You carefully slide the cover back on the manhole."))
				playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN


/obj/structure/ladder/halflife/manhole/crowbar_act(mob/living/user, obj/item/tool)
	if(down && obstructed)
		if(do_after(user, 4 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			obstructed = FALSE
			down.obstructed = FALSE
			icon_state = "manhole_open"
			desc = "An open manhole. You could use a crowbar or your hands to slide the cover back on."
			to_chat(user, span_notice("You wedge the crowbar in and pull the cover off the manhole."))
			playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	if(down && !obstructed)
		if(do_after(user, 4 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LADDERBLOCKERS))
			obstructed = TRUE
			down.obstructed = TRUE
			icon_state = "manhole_closed"
			desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems. Or, try using your hands..."
			to_chat(user, span_notice("You hook the edge of the manhole cover with your crowbar and slide it back on."))
			playsound(src.loc, 'hl13/sound/effects/manhole.ogg', 50, TRUE)
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/ladder/halflife/manhole/update_icon_state()
	. = ..()
	if(down)
		name = "manhole entry"
		desc = "A heavy stamped manhole. You could probably pry it up with a crowbar to access the lower town systems."
		icon_state = "manhole_closed"
		pixel_y = 7
		obstructed = TRUE
	else
		icon_state = "ladder10"

/obj/structure/bed/halflife
	name = "base class hl13 bed"
	desc = "Scream at the coders if you see this."
	icon = 'hl13/icons/obj/beds.dmi'
	can_deconstruct = FALSE

/obj/structure/bed/halflife/wrench_act(mob/living/user, obj/item/weapon)
	return

//bed//

/obj/structure/bed/halflife/bedframe
	name = "base class bedframe"
	desc = "Scream at the coders if you see this."
	build_stack_type = /obj/item/stack/sheet/scrap_metal
	build_stack_amount = 1

/obj/structure/bed/halflife/bedframe/wire
	name = "wireframe bed"
	desc = "A bed with a wire backing."
	icon_state = "wire_bed"

/obj/structure/bed/halflife/bedframe/metal
	name = "metal bed"
	desc = "A slatted metal bed."
	icon_state = "metal_bed"

/obj/structure/bed/halflife/bedframe/cot
	name = "cot"
	desc = "A cot. Still usable without a mattress."
	icon_state = "cot"

/obj/structure/bed/halflife/bedframe/wood
	name = "wood bed"
	desc = "A panel bed made from wood."
	icon_state = "wood_bed"
	build_stack_type = /obj/item/stack/sheet/mineral/scrap_wood
	build_stack_amount = 1

//mattress//

/obj/structure/bed/halflife/mattress
	name = "base class mattress"
	desc = "Scream at the coders if you see this."
	build_stack_type = /obj/item/stack/sheet/cloth
	build_stack_amount = 2
	hl13hit_sounds = SFX_CARDBOARDIMPACT

/obj/structure/bed/halflife/mattress/dirty
	name = "mattress"
	desc = "Less of a mattress and more of a lump."
	icon_state = "dirty_mattress"

/obj/structure/bed/halflife/mattress/old
	name = "mattress"
	desc = "Mildly stained and better than most."
	icon_state = "old_mattress"

/obj/structure/bed/halflife/mattress/stained
	name = "mattress"
	desc = "No idea what these stains are."
	icon_state = "stained_mattress"

/obj/structure/bed/halflife/mattress/yellowed
	name = "mattress"
	desc = "This was white when someone bought it."
	icon_state = "yellowed_mattress"

/obj/structure/bed/halflife/mattress/filthy
	name = "mattress"
	desc = "Is that mold?"
	icon_state = "filthy_mattress"

/obj/structure/bed/halflife/mattress/stale
	name = "mattress"
	desc = "Relatively clean."
	icon_state = "stale_mattress"


// BASE FENCES! //

//Base Fence - For obj interaction

/obj/structure/halflife/fence
	name = "base fence"
	desc = "Get this shit off the map mappa!"
	icon = 'hl13/icons/obj/fences.dmi'
	icon_state = "wirefence"
	density = TRUE
	anchored = TRUE
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_OBJ_LAYER
	max_integrity = 400
	damage_deflection = 15
	can_atmos_pass = ATMOS_PASS_YES
	flags_1 = ON_BORDER_1
	hitted_sound = 'hl13/sound/halflifeeffects/impact/chain fence/chainfence.ogg'
	var/fencepasschance = 90
	var/basetype = /obj/structure/halflife/fence //used for corner debugging
	var/canpass = FALSE // if projectiles can go through
	var/cansqueeze = FALSE //turn off for vertical states - for people / doesnt work right now
	var/breakmats = /obj/item/stack/sheet/scrap_metal //not sure this isnt a thing on everything

/obj/structure/halflife/fence/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		playsound(src, 'hl13/sound//halflifeeffects/impact/chain fence/chainfence.ogg', 100, TRUE)
		new breakmats(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/structure/halflife/fence/vertical
	icon_state = null
	flags_1 = NONE
	cansqueeze = FALSE

/obj/structure/halflife/fence/corner
	icon_state = null
	var/obj/cornersetter

/obj/structure/halflife/fence/junction
	icon_state = null
	flags_1 = NONE
	cansqueeze = FALSE

/obj/structure/halflife/fence/junction/Initialize()
	if(dir == NORTH)
		cansqueeze = TRUE
	. = ..()

/obj/structure/halflife/fence/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_exit),
	)

	if (flags_1 & ON_BORDER_1)
		AddElement(/datum/element/connect_loc, loc_connections)
	switch(dir)
		if(SOUTH)
			layer = ABOVE_ALL_MOB_LAYER + 0.1
		if(NORTH)
			layer = OBJ_LAYER

/obj/structure/halflife/fence/corner/Initialize()
	. = ..()
	ghostfence(FALSE)

/obj/structure/halflife/fence/corner/proc/ghostfence(destroyed)
	cornersetter = new basetype(loc)
	switch(dir)
		if(NORTH)
			cornersetter.dir = SOUTH
		if(SOUTH)
			cornersetter.dir = SOUTH
		if(EAST)
			cansqueeze = FALSE
		if(WEST)
			cansqueeze = FALSE

	cornersetter.invisibility = INVISIBILITY_ABSTRACT
	if(destroyed)
		qdel(cornersetter)

/obj/structure/halflife/fence/corner/Destroy()
	. = ..()
	ghostfence(TRUE)

/proc/valid_fence_location(turf/dest_turf, test_dir)
	if(!dest_turf)
		return FALSE
	for(var/obj/turf_content in dest_turf)
		if(istype(turf_content, /obj/structure/halflife/fence))
			if((turf_content.dir == test_dir))
				return FALSE
	return TRUE

/obj/structure/halflife/fence/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	if(istype(mover, /obj/projectile))
		return TRUE

	if(istype(mover, /obj/projectile/bullet))
		return TRUE

	if(istype(mover, /obj/item))
		var/obj/item/I = mover
		if(I.w_class == WEIGHT_CLASS_TINY)
			return TRUE

	if(.)
		return

	if(cansqueeze)
		if(ismob(mover))
			if(get_dir(loc, src) == dir)
				return

		if(border_dir == dir)
			return FALSE

		if(istype(mover, /obj/structure/halflife/fence))
			var/obj/structure/halflife/fence/moved_fence = mover
			return valid_fence_location(loc, moved_fence.dir)

	if(!cansqueeze)
		return FALSE

	return TRUE

/obj/structure/halflife/fence/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	if(canpass)
		if(istype(leaving, /obj/projectile) && prob(fencepasschance))
			return

		if(istype(leaving, /obj/projectile/bullet) && prob(fencepasschance))
			return

		if(istype(leaving, /obj/item))
			var/obj/item/I = leaving
			if(I.w_class == WEIGHT_CLASS_TINY && prob(fencepasschance))
				return
			else
				return COMPONENT_ATOM_BLOCK_EXIT

	if(cansqueeze)
		if(istype(leaving, /obj/projectile) && prob(fencepasschance))
			return

		if(istype(leaving, /obj/projectile/bullet) && prob(fencepasschance))
			return

		if(istype(leaving, /obj/item))
			var/obj/item/I = leaving
			if(I.w_class == WEIGHT_CLASS_TINY && prob(fencepasschance))
				return

		if(leaving == src)
			return // Let's not block ourselves.

		if (leaving.pass_flags & pass_flags_self)
			return

		if(direction == dir && density)
			leaving.Bump(src)
			return COMPONENT_ATOM_BLOCK_EXIT

// WIRE FENCES! //

//Plain Wire Fence

/obj/structure/halflife/fence/wire
	name = "wire fence"
	desc = "A basic wire fence, rusted and still standing."
	icon_state = "wirefence"
	max_integrity = 400
	damage_deflection = 15
	fencepasschance = 80
	basetype = /obj/structure/halflife/fence/wire

/obj/structure/halflife/fence/wire/end/east
	icon_state = "wirefence_end_east"

/obj/structure/halflife/fence/wire/end/west
	icon_state = "wirefence_end_west"

/obj/structure/halflife/fence/vertical/wire
	name = "wire fence"
	desc = "A basic wire fence, rusted and still standing."
	icon_state = null //purely for mapping sanity
	max_integrity = 400
	damage_deflection = 15
	fencepasschance = 80
	basetype = /obj/structure/halflife/fence/wire
	cansqueeze = FALSE

/obj/structure/halflife/fence/vertical/wire/east
	icon_state = "wirefence_east"

/obj/structure/halflife/fence/vertical/wire/west
	icon_state = "wirefence_west"

/obj/structure/halflife/fence/junction/wire
	name = "wire fence"
	desc = "A basic wire fence, rusted and still standing."
	icon_state = null //purely for mapping sanity
	max_integrity = 400
	damage_deflection = 15
	fencepasschance = 80
	basetype = /obj/structure/halflife/fence/wire
	cansqueeze = FALSE

/obj/structure/halflife/fence/junction/wire/east
	icon_state = "wirefence_east_T"

/obj/structure/halflife/fence/junction/wire/west
	icon_state = "wirefence_west_T"

/obj/structure/halflife/fence/corner/wire
	name = "wire fence"
	desc = "A basic wire fence, rusted and still standing."
	icon_state = "wirefence_corner"
	max_integrity = 400
	damage_deflection = 15
	fencepasschance = 80
	basetype = /obj/structure/halflife/fence/wire

//Wire fence door, seperated unfortunately

/obj/machinery/door/unpowered/halflife/seethrough/fence/wire
	name = "wire fence door"
	desc = "A wire fence door, the clattered gateway to freedom perhaps."
	icon_state = "wirefence_closed"
	door_type = "wirefence"
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_MOB_LAYER
	damage_deflection = 15
	max_integrity = 700
	opensound = 'hl13/sound/machines/chainlink_door.ogg'
	closesound = 'hl13/sound/machines/chainlink_door.ogg'

/obj/machinery/door/unpowered/halflife/seethrough/fence/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		playsound(src, 'hl13/sound//halflifeeffects/metal_door_break.ogg', 100, TRUE)
		new /obj/item/stack/sheet/scrap_metal(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/machinery/door/unpowered/halflife/seethrough/fence/Initialize()
	. = ..()
	if(dir == NORTH)
		pixel_y = -8

	if(dir == SOUTH)
		pixel_y = -8

	if(dir == EAST)
		pixel_x = -16
		pixel_y = 0

	if(dir == WEST)
		pixel_x = -16
		pixel_y = 0
/*
/obj/machinery/door/unpowered/halflife/seethrough/fence/open()
	. = ..()
	plane = GAME_PLANE
*/

/obj/machinery/door/unpowered/halflife/seethrough/fence/close()
	. = ..()
	if(safe)
		for(var/atom/movable/M in get_turf(src))
			if(M.density && M != src) //something is blocking the door
				return
	//plane = initial(plane)

//Barbed Wire Fence

/obj/structure/halflife/fence/wire/barb
	name = "barbed wire fence"
	desc = "A menacing wire fence, topped with rusted and deadly barbed wire. It looks very well reinforced, you'll have a lot of trouble breaking it."
	icon_state = "barbfence"
	max_integrity = 800 //no difference yet except its stronger
	damage_deflection = 21
	fencepasschance = 70
	basetype = /obj/structure/halflife/fence/wire/barb

/obj/structure/halflife/fence/wire/end/east/barb
	icon_state = "barbfence_end_east"

/obj/structure/halflife/fence/wire/end/west/barb
	icon_state = "barbfence_end_west"

/obj/structure/halflife/fence/vertical/wire/barb
	name = "barbed wire fence"
	desc = "A menacing wire fence, topped with rusted and deadly barbed wire."
	icon_state = null //purely for mapping sanity
	max_integrity = 900
	damage_deflection = 20
	fencepasschance = 70
	basetype = /obj/structure/halflife/fence/wire/barb
	cansqueeze = FALSE

/obj/structure/halflife/fence/vertical/wire/east/barb
	icon_state = "barbfence_east"

/obj/structure/halflife/fence/vertical/wire/west/barb
	icon_state = "barbfence_west"

/obj/structure/halflife/fence/junction/wire/barb
	name = "barbed wire fence"
	desc = "A menacing wire fence, topped with rusted and deadly barbed wire."
	icon_state = null
	max_integrity = 900
	damage_deflection = 20
	fencepasschance = 70
	basetype = /obj/structure/halflife/fence/wire/barb
	cansqueeze = FALSE

/obj/structure/halflife/fence/junction/wire/east/barb
	icon_state = "barbfence_east_T"

/obj/structure/halflife/fence/junction/wire/west/barb
	icon_state = "barbfence_west_T"

/obj/structure/halflife/fence/corner/wire/barb
	name = "barbed wire fence"
	desc = "A menacing wire fence, topped with rusted and deadly barbed wire."
	icon_state = "barbfence_corner"
	max_integrity = 900
	damage_deflection = 20
	fencepasschance = 70
	basetype = /obj/structure/halflife/fence/wire/barb

//Barbed Wire fence door

/obj/machinery/door/unpowered/halflife/seethrough/fence/wire/barb
	name = "barbed wire fence door"
	desc = "A menacing wire fence door, no jumping this one, keep out!"
	icon_state = "barbfence_closed"
	door_type = "barbfence"
	max_integrity = 1000
	damage_deflection = 20

/obj/structure/halflife/breencast
	name = "breencast"
	desc = "He'll blather stuff at you no matter what city you are in."
	icon = 'hl13/icons/obj/breencast.dmi'
	icon_state = "breencast"
	anchored = TRUE
	density = FALSE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500
	projectile_passchance = 30
	light_range = 5
	light_power = 1
	light_color = "#658cac"

/obj/structure/halflife/breencast/Destroy()
	. = ..()
	SSsociostability.modifystability(-50) //Destroying the central breencast is rather bad for stability

//Appliances//

//TVs//

/obj/structure/halflife/tv
	name = "base class halflife television"
	desc = "A message asking the audience to please not use this asset appears on screen."
	icon = 'hl13/icons/obj/television.dmi'
	icon_state = "radking_tv"
	max_integrity = 225
	density = TRUE
	anchored = TRUE

/obj/structure/halflife/tv/Initialize()
	. = ..()
	register_context()

/obj/structure/halflife/tv/screwdriver_act_secondary(mob/living/user, obj/item/weapon)
	if(flags_1&NO_DEBRIS_AFTER_DECONSTRUCTION)
		return TRUE
	..()
	weapon.play_tool_sound(src)
	if(do_after(user, 15 SECONDS, target = src))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/halflife/tv/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NO_DEBRIS_AFTER_DECONSTRUCTION))
		if(disassembled)
			new /obj/item/stack/sheet/mineral/scrap_wood(loc)
			new /obj/item/stack/sheet/scrap_parts(loc)
			new /obj/item/stack/sheet/glass(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/stack/sheet/scrap_copper(loc)
		else
			new /obj/item/stack/sheet/mineral/scrap_wood(loc)
			new /obj/item/stack/sheet/glass(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/stack/sheet/scrap_copper(loc)
	qdel(src)

/obj/structure/halflife/tv/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/halflife/tv/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> to take apart [src] for parts.")

/obj/structure/halflife/tv/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_RMB] = "Disassemble"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/halflife/tv/rad_king
	name = "\improper Advanced television"
	desc = "A futuristic looking set from before the war. Now just collecting dust."
	icon_state = "radking_tv"

/obj/structure/halflife/tv/rad_king/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NO_DEBRIS_AFTER_DECONSTRUCTION))
		if(disassembled)
			new /obj/item/stack/sheet/scrap_metal(loc, 3)
			new /obj/item/stack/sheet/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/glass(loc, 3)
			new /obj/item/circuitmaterial(loc, 3)
			new /obj/item/stack/sheet/scrap_copper(loc)
		else
			new /obj/item/stack/sheet/scrap_parts(loc)
			new /obj/item/stack/sheet/glass(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/stack/sheet/scrap_copper(loc)
	qdel(src)

/obj/structure/halflife/tv/wooden
	name = "wood television console"
	desc = "A television console made of wood. This was probably an antique long before the bombs dropped."
	icon_state = "wood_tv"

/obj/structure/halflife/tv/wooden/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NO_DEBRIS_AFTER_DECONSTRUCTION))
		if(disassembled)
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 3)
			new /obj/item/stack/sheet/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/glass(loc, 3)
			new /obj/item/circuitmaterial(loc, 3)
			new /obj/item/stack/sheet/scrap_copper(loc)
		else
			new /obj/item/stack/sheet/scrap_parts(loc)
			new /obj/item/stack/sheet/glass(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/stack/sheet/scrap_copper(loc)
	qdel(src)

/obj/structure/halflife/tv/wooden/red
	icon_state = "redwood_tv"

/obj/structure/halflife/tv/wooden/cabinet
	name = "television cabinet"
	desc = "A wood cabinet containing a television inside."
	icon_state = "cabinet_tv"

/obj/structure/halflife/tv/tube
	name = "tube television"
	desc = "A classic tube television. You're not exactly sure why it's called a tube television."
	icon_state = "tube_tv"

/obj/structure/halflife/tv/tube/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NO_DEBRIS_AFTER_DECONSTRUCTION))
		if(disassembled)
			new /obj/item/stack/sheet/halflife/plastic(loc, 3)
			new /obj/item/stack/sheet/scrap_parts(loc, 2)
			new /obj/item/stack/sheet/glass(loc, 3)
			new /obj/item/circuitmaterial(loc, 3)
			new /obj/item/stack/sheet/scrap_copper(loc)
		else
			new /obj/item/stack/sheet/scrap_parts(loc)
			new /obj/item/stack/sheet/glass(loc)
			new /obj/item/circuitmaterial(loc)
			new /obj/item/stack/sheet/scrap_copper(loc)
	qdel(src)

/obj/structure/halflife/tv/tube/small
	name = "small tube television"
	desc = "A small tube television. You're not exactly sure why it's called a tube television."
	icon_state = "small_tv"

/obj/structure/halflife/tv/tube/tiny
	name = "tiny television"
	desc = "A very small TV. Perhaps made for a very small person."
	icon_state = "tiny_tv"
