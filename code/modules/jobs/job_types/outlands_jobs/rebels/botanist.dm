/datum/job/outlands/botanist
	title = JOB_OUTLANDS_BOTANIST
	description = "Grow food for the bunker to help stave off starvation."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	supervisors = SUPERVISOR_REB_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BOTANIST"

	outfit = /datum/outfit/job/outlands/botanist

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BOTANIST

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

/datum/outfit/job/outlands/botanist
	name = "Bunker Botanist"
	jobtype = /datum/job/outlands/botanist
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/botanist

	uniform = /obj/item/clothing/under/citizen
	gloves  = /obj/item/clothing/gloves/botanic_leather
	suit = /obj/item/clothing/suit/apron/overalls

	ears = /obj/item/radio/headset/rebel_deployment

/datum/job/outlands/botanist/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/outfit/job/outlands/botanist/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
