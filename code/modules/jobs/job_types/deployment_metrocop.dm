/datum/job/deployment_metrocop
	title = JOB_DEPLOYMENT_METROCOP
	description = "You are part of the combine! You have better starting gear than the resistance and can get very powerful overwatch grade gear later on using resin, but may struggle in the midgame once rebels get powerful!"
	department_head = list("Nobody")
	total_positions = 99
	spawn_positions = 99
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/security

	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = COMBINE_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

	gameplay_help = "You need to destroy the rebel's communication tower in their base to win, while making sure they don't destroy your communication tower!"

/datum/job/deployment_metrocop/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/job/deployment_metrocop/after_roundstart_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
