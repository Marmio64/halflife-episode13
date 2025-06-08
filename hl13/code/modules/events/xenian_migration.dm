/datum/round_event_control/xen_migration
	name = "Xen Migration"
	typepath = /datum/round_event/xen_migration
	weight = 15
	min_players = 12
	earliest_start = 20 MINUTES
	max_occurrences = 0
	category = EVENT_CATEGORY_ENTITIES
	description = "Summons a roving gang of zombies (by default)."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 3
	admin_setup = list(/datum/event_admin_setup/xen_migration)

/datum/round_event/xen_migration
	announce_when = 3
	start_when = 50
	/// Set to true when we announce something to ghosts, to prevent duplicate announcements
	var/hasAnnounced = FALSE
	/// Most common mob type to spawn, must be a child of /mob/living/basic/carp
	var/carp_type = /mob/living/basic/halflife/zombie
	/// Rarer mob type to spawn, must also be a child of /mob/living/basic/carp. If one of these is created, it will take priority to show ghosts.
	var/boss_type = /mob/living/basic/halflife/zombie/poison
	/// Just a boss type variation
	var/boss_type_2 = /mob/living/basic/halflife/zombie/zombine
	/// What to describe detecting near the station
	var/fluff_signal = "Unknown biological entities"
	/// Associated lists of z level to a list of points to travel to, so that grouped fish move to the same places
	var/list/z_migration_paths = list()

/datum/round_event/xen_migration/setup()
	start_when = rand(30, 50)

/datum/round_event/xen_migration/announce(fake)
	priority_announce("Attention, [fluff_signal] have been detected near your district. All citizens are instructed to vacate district perimeters, and remain within interior locations.", "Lifesign Alert")

/datum/round_event/xen_migration/start()
	// Stores the most recent fish we spawn
	var/mob/living/simple_animal/hostile/zombie/fish

	for(var/obj/effect/landmark/carpspawn/spawn_point in GLOB.landmarks_list)
		if(prob(95 - SSsociostability.getloss() / 20)) //HL13: Less sociostability means more dangerous zombies.
			fish = new carp_type(spawn_point.loc)
		else
			if(prob(50))
				fish = new boss_type(spawn_point.loc)
				fishannounce(fish) //Prefer to announce the megacarps over the regular fishies
			else
				fish = new boss_type_2(spawn_point.loc)
				fishannounce(fish) //Prefer to announce the megacarps over the regular fishies

	fishannounce(fish)

/// Generate two locations for carp to travel to, one in the station and one off in space
/datum/round_event/xen_migration/proc/pick_xen_migration_points(z_level_key)
	var/list/valid_areas = list()
	var/list/station_areas = GLOB.the_station_areas
	for (var/area/potential_area as anything in SSmapping.areas_in_z[z_level_key])
		if (!is_type_in_list(potential_area, station_areas))
			continue
		valid_areas += potential_area

	var/turf/station_turf = get_safe_random_station_turf(valid_areas)
	if (!station_turf)
		return list()
	var/turf/exit_turf = get_edge_target_turf(station_turf, pick(GLOB.alldirs))
	return list(WEAKREF(station_turf), WEAKREF(exit_turf))

/datum/round_event/xen_migration/proc/fishannounce(atom/fish)
	if (!hasAnnounced)
		announce_to_ghosts(fish) //Only anounce the first fish
		hasAnnounced = TRUE

/datum/event_admin_setup/xen_migration
	/// Admin set list of turfs for carp to travel to for each z level
	var/list/targets_per_z = list()

/datum/event_admin_setup/xen_migration/prompt_admins()
	targets_per_z = list()
	if (tgui_alert(usr, "Direct xenians to your current location? Only applies to your current Z level.", "Xen Direction", list("Yes", "No")) != "Yes")
		return
	record_admin_location()
	while (tgui_alert(usr, "Add additional locations? Only applies to your current Z level.", "More Carp Direction", list("Yes", "No")) == "Yes")
		record_admin_location()

/// Stores the admin's current location corresponding to the z level of that location
/datum/event_admin_setup/xen_migration/proc/record_admin_location()
	var/turf/aimed_turf = get_turf(usr)
	var/z_level_key = "[aimed_turf.z]"
	if (!targets_per_z[z_level_key])
		targets_per_z[z_level_key] = list()
	targets_per_z[z_level_key] += WEAKREF(aimed_turf)

/datum/event_admin_setup/xen_migration/apply_to_event(datum/round_event/xen_migration/event)
	event.z_migration_paths = targets_per_z

/datum/round_event_control/xen_migration/zombies
	name = "Zombie Migration"
	typepath = /datum/round_event/xen_migration/zombies
	weight = 10
	min_players = 12
	max_occurrences = 2
	description = "Summons a roving gang of zombies."
	admin_setup = list(/datum/event_admin_setup/xen_migration)

/datum/round_event/xen_migration/zombies
	carp_type = /mob/living/basic/halflife/zombie
	boss_type = /mob/living/basic/halflife/zombie/poison
	boss_type_2 = /mob/living/basic/halflife/zombie/zombine
	fluff_signal = "Necrotic Biosignals"

/datum/round_event_control/xen_migration/antlions
	name = "Antlion Migration"
	typepath = /datum/round_event/xen_migration/antlions
	weight = 5
	min_players = 12
	max_occurrences = 1
	description = "Summons a infestation of antlions."
	admin_setup = list(/datum/event_admin_setup/xen_migration)

/datum/round_event/xen_migration/antlions
	carp_type = /mob/living/simple_animal/hostile/halflife/antlion
	boss_type = /mob/living/basic/halflife/antlion_worker
	boss_type_2 = /mob/living/basic/halflife/antlion_worker
	fluff_signal = "Exogen Biosignals"
