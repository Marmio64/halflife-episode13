/datum/round_event_control/sentient_zombie
	name = "Spawn Sentient Zombie"
	typepath = /datum/round_event/ghost_role/sentient_zombie
	max_occurrences = 0 //only occurs at night curfew time
	min_players = 0
	weight = 0
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a Sentient Zombie."
	min_wizard_trigger_potency = 6
	max_wizard_trigger_potency = 7

/datum/round_event/ghost_role/sentient_zombie
	minimum_required = 1
	role_name = "sentient zombie"
	fakeable = FALSE

/datum/round_event/ghost_role/sentient_zombie/spawn_role()
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(role_name_text = role_name, amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/datum/mind/player_mind = new /datum/mind(chosen_one.key)
	player_mind.active = TRUE

	var/list/spawn_locs = list()
	for(var/X in GLOB.blobstart)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR
	if(prob(60))
		var/mob/living/basic/halflife/zombie/S = new ((pick(spawn_locs)))
		S.key = chosen_one.key
		message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Zombie by an event.")
		S.log_message("was spawned as a Zombie by an event.", LOG_GAME)
		spawned_mobs += S
	else if(prob(50))
		var/mob/living/basic/halflife/zombie/poison/S = new ((pick(spawn_locs)))
		S.key = chosen_one.key
		message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Zombie by an event.")
		S.log_message("was spawned as a Zombie by an event.", LOG_GAME)
		spawned_mobs += S
	else
		var/mob/living/basic/halflife/zombie/fast/S = new ((pick(spawn_locs)))
		S.key = chosen_one.key
		message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Zombie by an event.")
		S.log_message("was spawned as a Zombie by an event.", LOG_GAME)
		spawned_mobs += S
	return SUCCESSFUL_SPAWN
