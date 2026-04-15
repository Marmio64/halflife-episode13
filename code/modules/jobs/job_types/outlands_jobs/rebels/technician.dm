/datum/job/outlands/technician
	title = JOB_OUTLANDS_TECHNICIAN
	description = "Put together recipes with ingredients at hand, produce from the botanist, and whatever else you can scavenge up."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2

	supervisors = SUPERVISOR_REB_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "STATION_ENGINEER"

	outfit = /datum/outfit/job/outlands/technician

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

/datum/outfit/job/outlands/technician
	name = "Bunker Technician"
	jobtype = /datum/job/outlands/technician
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/technician

	uniform = /obj/item/clothing/under/citizen/refugee/green
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining
	belt = /obj/item/storage/belt/utility/full

	r_pocket = /obj/item/flashlight
	skillchips = list(/obj/item/skillchip/engineer)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/technician/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_INT, 1)
	user.change_stat(STATKEY_STR, 1)

/datum/job/outlands/technician/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
