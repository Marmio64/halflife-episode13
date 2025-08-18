GLOBAL_VAR_INIT(deployment_rebels_cash, 0)

/datum/job/deployment_refugee
	title = JOB_DEPLOYMENT_REFUGEE
	description = "You are part of the resistance! You have less starting gear than the combine and have a less powerful endgame, but gear can be bought cheaply from your base with cash you can find while scavenging!"
	department_head = list("Nobody")
	total_positions = 99
	spawn_positions = 99
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/refugee/deployment

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = REBEL_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg' //cause they're a cp violation

	gameplay_help = "You need to destroy the combine's communication tower in their base to win, while making sure they don't destroy your communication tower!"

/datum/outfit/job/refugee/deployment/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	var/chosen = null

	if(DEPLOYMENT_TIER4_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier4
	else if(DEPLOYMENT_TIER3_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier3
	else if(DEPLOYMENT_TIER2_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier2
	else if(DEPLOYMENT_TIER1_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier1
	if(chosen)
		var/turf/T = get_turf(H)
		var/obj/item/I = new chosen(T)
		H.put_in_hands(I)

/datum/job/deployment_refugee/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/job/deployment_refugee/after_roundstart_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
