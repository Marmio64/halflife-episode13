/datum/round_event_control/crabwalker
	name = "Spawn Crabwalker Cultist"
	typepath = /datum/round_event/ghost_role/crabwalker
	max_occurrences = 1
	min_players = 10
	weight = 1
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a playable Crabwalker Cultist."

	map_flags = EVENT_PRISON_RP_BANNED | EVENT_CITY_RP_BANNED

/datum/round_event/ghost_role/crabwalker
	minimum_required = 1
	role_name = "crabwalker cultist"
	fakeable = FALSE

/datum/round_event/ghost_role/crabwalker/spawn_role()
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_CULTIST, role_name_text = role_name, amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/datum/mind/player_mind = new /datum/mind(chosen_one.key)
	player_mind.active = TRUE

	var/list/spawn_locs = list()
	for(var/X in GLOB.xeno_spawn)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/mob/living/carbon/human/S = new ((pick(spawn_locs)))
	player_mind.transfer_to(S)
	player_mind.set_assigned_role(SSjob.get_job_type(/datum/job/crabwalker_cultist))
	player_mind.special_role = "Crabwalker Cultist"
	S.equipOutfit(/datum/outfit/crabwalker/spear)
	player_mind.add_antag_datum(/datum/antagonist/crab_cultist)
	message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Crabwalker Cultist by an event.")
	S.log_message("was spawned as a Crabwalker Cultist by an event.", LOG_GAME)
	spawned_mobs += S
	return SUCCESSFUL_SPAWN

/datum/job/crabwalker_cultist
	title = "Crabwalker Cultist"
