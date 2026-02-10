/datum/round_event_control/factoryfailure
	name = "Factory Machine Failures"
	typepath = /datum/round_event/factoryfailure
	weight = 5
	max_occurrences = 2
	min_players = 10
	category = EVENT_CATEGORY_JANITORIAL
	description = "All factory sealers experience a chance to malfunction."

/datum/round_event/factoryfailure
	/// A list of sealers that may fail
	var/list/sealers = list()


/datum/round_event/factoryfailure/setup()
	for(var/obj/machinery/sealer/temp_sealer as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/sealer))
		var/turf/sealer_turf = get_turf(temp_sealer)
		if(!sealer_turf)
			continue
		if(!is_station_level(sealer_turf.z))
			continue
		sealers += temp_sealer

	if(!sealers.len)
		return kill()

/datum/round_event_control/factoryfailure/can_spawn_event(players_amt, allow_magic = FALSE)
	. = ..()
	if(!.)
		return
	for(var/obj/machinery/sealer/temp_sealer as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/sealer))
		var/turf/sealer_turf = get_turf(temp_sealer)
		if(!sealer_turf)
			continue
		if(!is_station_level(sealer_turf.z))
			continue
		return TRUE //there's at least one. we'll let the codergods handle the rest with prob() i guess.
	return FALSE


/datum/round_event/factoryfailure/start()
	for(var/obj/machinery/sealer/sealer_thing as anything in sealers)
		if(!sealer_thing.loc)
			CRASH("FACTORY FAILURE: [sealer_thing] has no loc somehow?")

		if(prob(40 + SSsociostability.getloss() / 25)) // up to a 80% chance at 0 sociostability
			sealer_thing.breakdown()

		CHECK_TICK
