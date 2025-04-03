/datum/round_event_control/nightmare
	name = "Spawn Vortigaunt"
	typepath = /datum/round_event/ghost_role/nightmare
	max_occurrences = 1
	min_players = 20
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a free vortigaunt."
	min_wizard_trigger_potency = 6
	max_wizard_trigger_potency = 7

/datum/round_event/ghost_role/nightmare
	minimum_required = 1
	role_name = "vortigaunt"
	fakeable = FALSE

/datum/round_event/ghost_role/nightmare/spawn_role()
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_ALIEN, role_name_text = role_name, amount_to_pick = 1)
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
	player_mind.set_assigned_role(SSjob.get_job_type(/datum/job/nightmare))
	player_mind.special_role = "Vortigaunt"
	if(prob(25))
		S.set_species(/datum/species/vortigaunt/elder)
	else
		S.set_species(/datum/species/vortigaunt)
	playsound(S, 'sound/effects/magic/ethereal_exit.ogg', 50, TRUE, -1)
	message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Vortigaunt by an event.")
	S.log_message("was spawned as a Vortigaunt by an event.", LOG_GAME)
	spawned_mobs += S
	return SUCCESSFUL_SPAWN
