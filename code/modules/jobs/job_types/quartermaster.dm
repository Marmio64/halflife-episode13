/datum/job/quartermaster
	title = JOB_QUARTERMASTER
	description = "Carry out the orders of the labor lead, keep the factory and mines running, request funding and workers."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SUPPLY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	supervisors = SUPERVISOR_CAPTAIN
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "QUARTERMASTER"

	outfit = /datum/outfit/job/quartermaster
	plasmaman_outfit = /datum/outfit/plasmaman/cargo

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CAR

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM) // finally upgraded

	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/cargo,
		/datum/job_department/command,
		)
	family_heirlooms = list(/obj/item/stamp, /obj/item/stamp/denied)
	mail_goodies = list(
		/obj/item/circuitboard/machine/emitter = 3
	)
	rpg_title = "Steward"
	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS
	voice_of_god_power = 1.4 //Command staff has authority
	human_authority = JOB_AUTHORITY_NON_HUMANS_ALLOWED

	ration_bonus = 1

/datum/outfit/job/quartermaster
	name = "Foreman"
	jobtype = /datum/job/quartermaster

	id_trim = /datum/id_trim/job/quartermaster
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	head = /obj/item/clothing/head/halflife/blue_hardhat
	r_pocket = /obj/item/hl2key/factory
