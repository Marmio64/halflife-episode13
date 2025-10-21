/datum/lazy_template/deathmatch
	map_dir = "_maps/deathmatch"
	place_on_top = TRUE
	turf_reservation_type = /datum/turf_reservation/turf_not_baseturf
	/// Map UI Name
	var/name
	/// Map Description
	var/desc = ""
	/// Minimum players for this map
	var/min_players = 2
	/// Maximum players for this map
	var/max_players = 2 // TODO: make this automatic.
	/// The map will end in this time
	var/automatic_gameend_time = 8 MINUTES
	/// List of allowed loadouts for this map, otherwise defaults to all loadouts
	var/list/allowed_loadouts = list()
	/// whether we are currently being loaded by a lobby
	var/template_in_use = FALSE

/datum/turf_reservation/indestructible_plating
	turf_type = /turf/open/indestructible/plating //a little hacky but i guess it has to be done
