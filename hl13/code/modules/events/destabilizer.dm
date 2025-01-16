
/datum/round_event_control/destabilizer
	name = "Destabilizer"
	typepath = /datum/round_event/destabilizer
	weight = 8
	min_players = 8
	earliest_start = 15 MINUTES
	max_occurrences = 2

/datum/round_event/destabilizer/start()
	var/list/possible_spawns = list()
	for(var/obj/effect/landmark/destabilizer/D in GLOB.landmarks_list)
		possible_spawns += D
	if(!possible_spawns.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR
	var/turf/landing_turf = pick(possible_spawns)
	new /obj/machinery/destabilizer(landing_turf.loc)

/datum/round_event/destabilizer
	announce_when	= 10

/datum/round_event/destabilizer/setup()
	announce_when = rand(10, 20)

/datum/round_event/destabilizer/announce(fake)
	priority_announce("Warning. Disruptive sociostability threat detected in your district. Local protection team units, contain immediately. A GPS signal has been assigned to the threat.", "Overwatch Alert")
