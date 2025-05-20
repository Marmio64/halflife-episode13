/datum/round_event_control/fieldfailure
	name = "Force Field Failures"
	typepath = /datum/round_event/fieldfailure
	weight = 15
	max_occurrences = 4
	min_players = 10
	category = EVENT_CATEGORY_JANITORIAL
	description = "All forcefields experience a chance to malfunction."

/datum/round_event/fieldfailure
	/// A list of force fields that may fail
	var/list/forcefields = list()


/datum/round_event/fieldfailure/setup()
	for(var/obj/machinery/turnstile/brig/halflife/forcefield/temp_field as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/turnstile/brig/halflife/forcefield))
		var/turf/field_turf = get_turf(temp_field)
		if(!field_turf)
			continue
		if(!is_station_level(field_turf.z))
			continue
		forcefields += temp_field

	if(!forcefields.len)
		return kill()

/datum/round_event_control/fieldfailure/can_spawn_event(players_amt, allow_magic = FALSE)
	. = ..()
	if(!.)
		return
	for(var/obj/machinery/turnstile/brig/halflife/forcefield/temp_field as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/turnstile/brig/halflife/forcefield))
		var/turf/field_turf = get_turf(temp_field)
		if(!field_turf)
			continue
		if(!is_station_level(field_turf.z))
			continue
		return TRUE //there's at least one. we'll let the codergods handle the rest with prob() i guess.
	return FALSE


/datum/round_event/fieldfailure/start()
	for(var/obj/machinery/turnstile/brig/halflife/forcefield/field as anything in forcefields)
		if(!field.loc)
			CRASH("FORCE FIELD FAILURE: [field] has no loc somehow?")

		if(prob(10 + SSsociostability.getloss() / 50))
			field.malfunction()

		CHECK_TICK
