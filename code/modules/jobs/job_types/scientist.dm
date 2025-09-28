/datum/job/scientist
	title = JOB_SCIENTIST
	description = "Operate your miniature science station under the supervision of the labor lead, requesting assistants if necessary."
	department_head = list(JOB_RESEARCH_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = SUPERVISOR_RD
	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SCIENTIST"

	outfit = /datum/outfit/job/scientist
	plasmaman_outfit = /datum/outfit/plasmaman/science

	paycheck = PAYCHECK_STANDARD
	paycheck_department = ACCOUNT_SCI

	liver_traits = list(TRAIT_BALLMER_SCIENTIST)

	display_order = JOB_DISPLAY_ORDER_SCIENTIST
	bounty_types = CIV_JOB_SCI
	departments_list = list(
		/datum/job_department/science,
		)

	family_heirlooms = list(/obj/item/toy/plush/slimeplushie)

	mail_goodies = list(
		/obj/item/raw_anomaly_core/random = 10,
		/obj/item/disk/design_disk/bepis = 2,
	)
	rpg_title = "Thaumaturgist"
	//job_flags = STATION_JOB_FLAGS

	job_tone = "boom"

	ration_bonus = 1

/datum/outfit/job/scientist
	name = "Union Scientist"
	jobtype = /datum/job/scientist
	id = /obj/item/card/id/advanced/halflife/purple

	id_trim = /datum/id_trim/job/scientist
	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/toggle/labcoat/halflife
	accessory = /obj/item/clothing/accessory/armband/science
	ears = /obj/item/radio/headset
	gloves = /obj/item/clothing/gloves/latex

	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup
	suit = /obj/item/clothing/suit/utility/radiation/cleanup/scientist
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/utility/radiation/scientist

/datum/outfit/job/scientist/pre_equip(mob/living/carbon/human/H)
	..()
	try_giving_horrible_tie()

/datum/outfit/job/scientist/proc/try_giving_horrible_tie()
	if (prob(0.4))
		neck = /obj/item/clothing/neck/tie/horrible

/datum/outfit/job/scientist/get_types_to_preload()
	. = ..()
	. += /obj/item/clothing/neck/tie/horrible

/// A version of the scientist outfit that is guaranteed to be the same every time
/datum/outfit/job/scientist/consistent
	name = "Scientist - Consistent"

/datum/outfit/job/scientist/consistent/try_giving_horrible_tie()
	return

/datum/outfit/job/scientist/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.change_stat(STATKEY_INT, 4)
	user.change_stat(STATKEY_STR, -2)
	user.change_stat(STATKEY_DEX, -1)
