/datum/job/atmospheric_technician
	title = JOB_ATMOSPHERIC_TECHNICIAN
	description = "Remove any xenian infestations from hotspots in the city, and travel with conscripts and metropolice beyond the city for additional harvesting of xenian resources."
	department_head = list(JOB_QUARTERMASTER)
	total_positions = 0
	spawn_positions = 0
	supervisors = SUPERVISOR_CE
	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "ATMOSPHERIC_TECHNICIAN"

	outfit = /datum/outfit/job/atmos
	plasmaman_outfit = /datum/outfit/plasmaman/atmospherics

	paycheck = PAYCHECK_STANDARD
	paycheck_department = ACCOUNT_ENG

	liver_traits = list(TRAIT_ENGINEER_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN
	bounty_types = CIV_JOB_ATMOS
	departments_list = list(
		/datum/job_department/engineering,
		)

	family_heirlooms = list(/obj/item/lighter, /obj/item/lighter/greyscale, /obj/item/storage/box/matches)

	mail_goodies = list(
		/obj/item/rpd_upgrade/unwrench = 30,
		/obj/item/grenade/gas_crystal/crystal_foam = 10,
		/obj/item/grenade/gas_crystal/proto_nitrate_crystal = 10,
		/obj/item/grenade/gas_crystal/healium_crystal = 10,
		/obj/item/grenade/gas_crystal/nitrous_oxide_crystal = 5,
	)

	rpg_title = "Aeromancer"

	ration_bonus = 1

	cmode_music = 'hl13/sound/music/combat/crawlyard.ogg'

	//faction = FACTION_STATION
	//job_flags = STATION_JOB_FLAGS

/datum/outfit/job/atmos
	name = "Infestation Control"
	jobtype = /datum/job/atmospheric_technician
	id = /obj/item/card/id/advanced/halflife/green

	id_trim = /datum/id_trim/job/atmospheric_technician
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	r_pocket = /obj/item/hl2key/factory
	belt = /obj/item/storage/belt/pouch/large/cleanup

	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup
	suit = /obj/item/clothing/suit/utility/radiation/cleanup
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/utility/radiation

/datum/outfit/job/atmos/mod
	name = "Atmospheric Technician (MODsuit)"

	suit = null
	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/atmospheric
	mask = /obj/item/clothing/mask/gas/atmos
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/job/atmos/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.change_stat(STATKEY_STR, 1)
