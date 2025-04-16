/datum/job/curator
	title = JOB_CURATOR
	description = "Operate your store, and try not to get shutdown."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOP
	config_tag = "CURATOR"
	exp_granted_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/curator
	plasmaman_outfit = /datum/outfit/plasmaman/curator

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_CURATOR
	departments_list = list(
		/datum/job_department/service,
		)

	mail_goodies = list(
		/obj/item/book/random = 44,
		/obj/item/book/manual/random = 5,
		/obj/item/book/granter/action/spell/blind/wgw = 1,
	)

	family_heirlooms = list(/obj/item/pen/fountain, /obj/item/storage/dice)


	voice_of_god_silence_power = 3
	rpg_title = "Veteran Adventurer"

	faction = FACTION_STATION
	job_flags = STATION_JOB_FLAGS

/datum/outfit/job/curator
	name = "Clerk"
	jobtype = /datum/job/curator

	id_trim = /datum/id_trim/job/curator
	uniform = /obj/item/clothing/under/citizen

	r_pocket = /obj/item/hl2key/clerk

	back = /obj/item/storage/backpack/halflife/satchel //so it cant get stolen if they latejoin to their store

	backpack_contents = list(
		/obj/item/stack/spacecash/c10 = 7,
		/obj/item/stack/spacecash/c1 = 15,
	)
