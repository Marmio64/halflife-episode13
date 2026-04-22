/datum/job/outlands/quartermaster
	title = JOB_OUTLANDS_QUARTERMASTER
	description = "Take control of civillian aspects of the bunker, managing supplies, resources, and personnel. Defer military needs to the Lieutenant whenever possible."

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "QUARTERMASTER"

	outfit = /datum/outfit/job/outlands/quartermaster

	paycheck = PAYCHECK_HIGH
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

	gameplay_help = "Bunker supplies are getting low. Ensure supplies do not run out and coordinate with the Lieutenant to achieve this goal and keep everyone alive and well."

/datum/outfit/job/outlands/quartermaster
	name = "Bunker Quartermaster"
	jobtype = /datum/job/outlands/quartermaster
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/quartermaster

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/greenjacket
	head = /obj/item/clothing/head/halflife/blue_hardhat
	back = /obj/item/storage/backpack/halflife/satchel

	belt = /obj/item/melee/baton

	l_pocket = /obj/item/hl2key/rebel_bunker/command_offices

	backpack_contents = list(
		/obj/item/megaphone = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/quartermaster/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_INT, 2)
	user.change_stat(STATKEY_STR, 1)

/datum/job/outlands/quartermaster/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
