/datum/job/outlands/doctor
	title = JOB_OUTLANDS_DOCTOR
	description = "Treat injured and sick bunker personnel with medicine and surgery."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2

	supervisors = SUPERVISOR_REB_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MEDICAL_DOCTOR"

	outfit = /datum/outfit/job/outlands/doctor

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_COOK

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

/datum/outfit/job/outlands/doctor
	name = "Bunker Doctor"
	jobtype = /datum/job/outlands/doctor
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/doctor

	uniform = /obj/item/clothing/under/citizen
	suit =  /obj/item/clothing/suit/whitejacket
	accessory = /obj/item/clothing/accessory/armband/medblue
	gloves = /obj/item/clothing/gloves/latex/nitrile

	l_pocket = /obj/item/hl2key/rebel_bunker/infirmary

	ears = /obj/item/radio/headset/rebel_deployment

/datum/job/outlands/doctor/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/outfit/job/outlands/doctor/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_INT, 3)
	user.change_stat(STATKEY_STR, -1)
