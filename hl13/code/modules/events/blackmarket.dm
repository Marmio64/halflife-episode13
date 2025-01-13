/datum/round_event_control/blackmarket
	name = "Spawn Blackmarket Dealer"
	typepath = /datum/round_event/ghost_role/blackmarket
	max_occurrences = 1
	min_players = 20
	weight = 8
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a black market dealer."
	min_wizard_trigger_potency = 6
	max_wizard_trigger_potency = 7

/datum/round_event/ghost_role/blackmarket
	minimum_required = 1
	role_name = "black market dealer"
	fakeable = FALSE

/datum/round_event/ghost_role/blackmarket/spawn_role()
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_TRAITOR, role_name_text = role_name, amount_to_pick = 1)
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
	player_mind.set_assigned_role(SSjob.get_job_type(/datum/job/blackmarket))
	player_mind.special_role = "Black Market Dealer"
	S.equipOutfit(/datum/outfit/blackmarket)
	player_mind.add_antag_datum(/datum/antagonist/blackmarket)
	message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Black Market Dealer by an event.")
	S.log_message("was spawned as a Black Market Dealer by an event.", LOG_GAME)
	spawned_mobs += S
	return SUCCESSFUL_SPAWN

/datum/job/blackmarket
	title = "Black Market Dealer"
