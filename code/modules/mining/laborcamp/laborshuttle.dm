/obj/machinery/computer/shuttle/labor
	name = "labor helicopter flight controls"
	desc = "Used to fly, remotely or otherwise, the labour helicopter."
	circuit = /obj/item/circuitboard/computer/labor_shuttle
	shuttleId = "laborcamp"
	possible_destinations = "laborcamp_home;laborcamp_away"
	req_access = list(ACCESS_BRIG)
	icon_state = "sr_console"
	icon_screen = null
	icon_keyboard = null
	light_color = LIGHT_COLOR_CYAN

/obj/machinery/computer/shuttle/labor/one_way
	name = "labor helicopter recall console"
	desc = "A one-way autopilot computer, used to recall the labour helicopter."
	possible_destinations = "laborcamp_away"
	circuit = /obj/item/circuitboard/computer/labor_shuttle/one_way
	req_access = list( )

/obj/machinery/computer/shuttle/labor/one_way/launch_check(mob/user)
	. = ..()
	if(!.)
		return FALSE
	var/obj/docking_port/mobile/M = SSshuttle.getShuttle("laborcamp")
	if(!M)
		to_chat(user, span_warning("Cannot locate shuttle!"))
		return FALSE
	var/obj/docking_port/stationary/S = M.get_docked()
	if(S?.name == "laborcamp_away")
		to_chat(user, span_warning("Shuttle is already at the outpost!"))
		return FALSE
	return TRUE

/obj/docking_port/stationary/laborcamp_home
	name = "City 13: Town Hall Helipad"
	shuttle_id = "laborcamp_home"
	roundstart_template = /datum/map_template/shuttle/labour/box //fuck you, we boxstation in this bitch
	width = 13
	height = 13

/obj/docking_port/stationary/laborcamp_home/kilo
	roundstart_template = /datum/map_template/shuttle/labour/kilo

/obj/docking_port/stationary/laborcamp_home/nebula
	roundstart_template = /datum/map_template/shuttle/labour/nebula
