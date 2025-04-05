/datum/job/cargo_technician
	title = JOB_CARGO_TECHNICIAN
	description = "Preform work in the factory, and carry out any tasks that the foreman needs you to do."
	department_head = list(JOB_QUARTERMASTER)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	supervisors = SUPERVISOR_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CARGO_TECHNICIAN"

	outfit = /datum/outfit/job/cargo_tech
	plasmaman_outfit = /datum/outfit/plasmaman/cargo

	paycheck = PAYCHECK_LOWER
	paycheck_department = ACCOUNT_CAR
	display_order = JOB_DISPLAY_ORDER_CARGO_TECHNICIAN
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/cargo,
		)

	family_heirlooms = list(/obj/item/clipboard)

	rpg_title = "Merchantman"
	job_flags = STATION_JOB_FLAGS

	ration_bonus = 1

/datum/outfit/job/cargo_tech
	name = "Union Worker"
	jobtype = /datum/job/cargo_technician

	id_trim = /datum/id_trim/job/cargo_technician
	uniform = /obj/item/clothing/under/citizen
	r_pocket = /obj/item/hl2key/factory

	suit = /obj/item/clothing/suit/greenjacket

/datum/outfit/job/cargo_tech/mod
	name = "Cargo Technician (MODsuit)"

	back = /obj/item/mod/control/pre_equipped/loader
	suit = null
