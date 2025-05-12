/datum/job/doctor
	title = JOB_MEDICAL_DOCTOR
	description = "Operate the public hospital, negotiate funding with the labor lead, ask the labor lead to get you nurses and assistants."
	department_head = list(JOB_CHIEF_MEDICAL_OFFICER)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	supervisors = SUPERVISOR_CMO
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MEDICAL_DOCTOR"

	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/doctor
	plasmaman_outfit = /datum/outfit/plasmaman/medical

	paycheck = PAYCHECK_STANDARD
	paycheck_department = ACCOUNT_MED

	liver_traits = list(TRAIT_MEDICAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_MEDICAL_DOCTOR
	bounty_types = CIV_JOB_MED
	departments_list = list(
		/datum/job_department/medical,
		)

	family_heirlooms = list(/obj/item/storage/medkit/ancient/heirloom, /obj/item/scalpel, /obj/item/hemostat, /obj/item/circular_saw, /obj/item/retractor, /obj/item/cautery, /obj/item/statuebust/hippocratic)

	mail_goodies = list(
		/obj/item/healthanalyzer/advanced = 15,
		/obj/item/scalpel/advanced = 6,
		/obj/item/retractor/advanced = 6,
		/obj/item/cautery/advanced = 6,
		/obj/item/reagent_containers/cup/bottle/formaldehyde = 6,
		/obj/effect/spawner/random/medical/organs = 5,
		/obj/effect/spawner/random/medical/memeorgans = 1
	)
	rpg_title = "Cleric"
	job_flags = STATION_JOB_FLAGS

	ration_bonus = 1

/datum/outfit/job/doctor
	name = "Union Doctor"
	jobtype = /datum/job/doctor

	id_trim = /datum/id_trim/job/medical_doctor
	uniform = /obj/item/clothing/under/citizen
	suit =  /obj/item/clothing/suit/whitejacket
	accessory = /obj/item/clothing/accessory/armband/medblue
	ears = /obj/item/radio/headset
	gloves = /obj/item/clothing/gloves/latex/nitrile
	skillchips = list(/obj/item/skillchip/entrails_reader)

/datum/outfit/job/doctor/mod
	name = "Medical Doctor (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/medical
	suit = null
	head = null
	uniform = /obj/item/clothing/under/rank/medical/doctor
	mask = /obj/item/clothing/mask/breath/medical
	r_pocket = /obj/item/flashlight/pen
	internals_slot = ITEM_SLOT_SUITSTORE
