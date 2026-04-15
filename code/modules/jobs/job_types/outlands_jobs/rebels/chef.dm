/datum/job/outlands/chef
	title = JOB_OUTLANDS_CHEF
	description = "Put together recipes with ingredients at hand, produce from the botanist, and whatever else you can scavenge up."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	supervisors = SUPERVISOR_REB_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "COOK"

	outfit = /datum/outfit/job/outlands/chef

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_COOK

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

/datum/outfit/job/outlands/chef
	name = "Bunker Chef"
	jobtype = /datum/job/outlands/chef
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/chef

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/utility/chefhat

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/chef/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	ADD_TRAIT(user, TRAIT_EXPERIENCED_CHEF, JOB_TRAIT)

	user.mind?.teach_crafting_recipe(/datum/crafting_recipe/food/nutrimentpierogi_pork)
	user.mind?.teach_crafting_recipe(/datum/crafting_recipe/food/nutrimentpierogi_beef)
	user.change_stat(STATKEY_STR, 1) //strong from butchering
	user.change_stat(STATKEY_DEX, 1) //fine knife control
	user.change_stat(STATKEY_INT, -1) //kind of a loaf

/datum/job/outlands/chef/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
