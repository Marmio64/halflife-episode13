/datum/job/outlands/engineer
	title = JOB_OUTLANDS_ENGINEER
	description = "Assist the combine investigative fireteam you have been sent with by helping them set up a forward operating base."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2

	supervisors = SUPERVISOR_ORDINAL
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "STATION_ENGINEER"

	outfit = /datum/outfit/job/outlands/engineer

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/security,
		)

	cmode_music = 'hl13/sound/music/combat/branescan.ogg'

	gameplay_help = "As a engineer as part of a special operations fireteam, you are trusted by and loyal to the combine. You cannot rebel without a very good reason."

/datum/outfit/job/outlands/engineer
	name = "Union Engineer"
	jobtype = /datum/job/station_engineer
	id = /obj/item/card/id/advanced/halflife/green

	id_trim = /datum/id_trim/job/station_engineer
	ears = /obj/item/radio/headset/civilprotection/deployment
	uniform = /obj/item/clothing/under/citizen/full_sensors
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer
	l_pocket = /obj/item/flashlight
	belt = /obj/item/storage/belt/utility/full
	skillchips = list(/obj/item/skillchip/engineer)

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/engineer)

/datum/outfit/job/outlands/engineer/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()

	user.faction += "combine"

	user.change_stat(STATKEY_INT, 2)
	user.change_stat(STATKEY_STR, 1)
