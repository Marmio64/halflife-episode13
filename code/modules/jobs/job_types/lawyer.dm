/datum/job/lawyer
	title = JOB_LAWYER
	description = "Act as a foreign district represenative of your choice, such as Eastwatch or Raven district. Act in their best interests by messing with this one legally, such as by reporting union law infractions or lack of sociostability."
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = "your home district"
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "LAWYER"

	exp_requirements = 160
	exp_required_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/lawyer
	plasmaman_outfit = /datum/outfit/plasmaman/bar

	paycheck = PAYCHECK_HIGH
	paycheck_department = ACCOUNT_SRV

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_LAWYER
	departments_list = list(
		/datum/job_department/service,
		)
	rpg_title = "Magistrate"
	family_heirlooms = list(/obj/item/gavelhammer)


	//job_flags = STATION_JOB_FLAGS

	ration_bonus = 2

/datum/outfit/job/lawyer/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	user.change_stat(STATKEY_INT, 1)
	user.change_stat(STATKEY_STR, -1)

/datum/outfit/job/lawyer
	name = "District Liaison"
	jobtype = /datum/job/lawyer
	id = /obj/item/card/id/advanced/halflife/combine/one

	id_trim = /datum/id_trim/job/lawyer
	uniform = /obj/item/clothing/under/halflife/brownsuit
	ears = /obj/item/radio/headset/heads/liaison
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/briefcase
	belt = /obj/item/melee/baton/telescopic
