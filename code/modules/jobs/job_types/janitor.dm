/datum/job/janitor
	title = JOB_JANITOR
	description = "Obey the combine, clean up messes."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "JANITOR"
	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/janitor
	plasmaman_outfit = /datum/outfit/plasmaman/janitor

	paycheck = PAYCHECK_ZERO
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_JANITOR
	departments_list = list(
		/datum/job_department/service,
		)

	family_heirlooms = list(/obj/item/mop, /obj/item/clothing/suit/caution, /obj/item/reagent_containers/cup/bucket, /obj/item/paper/fluff/stations/soap)

	mail_goodies = list(
		/obj/item/grenade/chem_grenade/cleaner = 30,
		/obj/item/storage/box/lights/mixed = 20,
		/obj/item/lightreplacer = 10
	)
	rpg_title = "Groundskeeper"
	job_flags = STATION_JOB_FLAGS

	job_tone = "slip"

	gameplay_help = "Vortigaunts have particular mannerisms which must be followed, you're not just some random human. In addition, you are bound to never willingly betray or harm your kin."

	ration_bonus = -1

/datum/outfit/job/janitor
	name = "Vortigaunt Slave"
	jobtype = /datum/job/janitor
	id = /obj/item/card/id/advanced/halflife/vort

	id_trim = /datum/id_trim/job/janitor
	neck = /obj/item/clothing/neck/anti_magic_collar
	ears = /obj/item/radio/headset/earpiece //so they can hear orders given to them
	uniform = null
	shoes = null

/datum/outfit/job/janitor/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt)

/*
/datum/job/janitor/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.remove_all_quirks()
*/
