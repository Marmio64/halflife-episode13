/datum/job/station_engineer
	title = JOB_STATION_ENGINEER
	description = "Maintain and construct new structures, electronics, and machines."
	department_head = list(JOB_QUARTERMASTER)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	supervisors = SUPERVISOR_CE
	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "STATION_ENGINEER"

	outfit = /datum/outfit/job/engineer
	plasmaman_outfit = /datum/outfit/plasmaman/engineering

	paycheck = PAYCHECK_STANDARD
	paycheck_department = ACCOUNT_ENG

	liver_traits = list(TRAIT_ENGINEER_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER
	bounty_types = CIV_JOB_ENG
	departments_list = list(
		/datum/job_department/engineering,
		)

	family_heirlooms = list(/obj/item/clothing/head/utility/hardhat, /obj/item/screwdriver, /obj/item/wrench, /obj/item/weldingtool, /obj/item/crowbar, /obj/item/wirecutters)

	mail_goodies = list(
		/obj/item/storage/box/lights/mixed = 20,
		/obj/item/lightreplacer = 10,
		/obj/item/spess_knife = 10,
		/obj/item/holosign_creator/engineering = 8,
		/obj/item/wrench/bolter = 8,
		/obj/item/clothing/head/utility/hardhat/red/upgraded = 1
	)
	rpg_title = "Crystallomancer"
	job_flags = STATION_JOB_FLAGS

	ration_bonus = 1

/datum/outfit/job/engineer
	name = "Union Engineer"
	jobtype = /datum/job/station_engineer
	id = /obj/item/card/id/advanced/halflife/green

	id_trim = /datum/id_trim/job/station_engineer
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer
	r_pocket = /obj/item/hl2key/factory
	l_pocket = /obj/item/flashlight
	skillchips = list(/obj/item/skillchip/engineer)

/datum/outfit/job/engineer/gloved
	name = "Station Engineer (Gloves)"

	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/job/engineer/mod
	name = "Station Engineer (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/engineering
	head = null
	mask = /obj/item/clothing/mask/breath
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/job/engineer/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.change_stat(STATKEY_INT, 1)
