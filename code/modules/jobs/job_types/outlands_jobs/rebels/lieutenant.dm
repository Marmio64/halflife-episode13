/datum/job/outlands/lieutenant
	title = JOB_OUTLANDS_LIEUTENANT
	description = "Take control of military aspects of the bunker, leading expeditions and mounting a defense when necessary. Defer civillian needs to the Quartermaster whenever possible."

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	exp_requirements = 240
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "LIEUTENANT"

	outfit = /datum/outfit/job/outlands/lieutenant

	paycheck = PAYCHECK_HIGH
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_CAPTAIN

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

	gameplay_help = "The bunker is running low on supplies. Coordinate with the Quartermaster and lead expeditions to gather needed supplies from outside the bunker."

/datum/outfit/job/outlands/lieutenant
	name = "Bunker Lieutenant"
	jobtype = /datum/job/outlands/lieutenant
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/lieutenant

	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	head = /obj/item/clothing/head/beret/sec/poland
	gloves = /obj/item/clothing/gloves/fingerless
	back = /obj/item/storage/backpack/halflife/satchel

	belt = /obj/item/melee/baton

	l_pocket = /obj/item/hl2key/rebel_bunker/command_offices
	r_pocket = /obj/item/flashlight

	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/binoculars = 1,
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/storage/fancy/cigarettes/halflife = 1,
		/obj/item/lighter = 1,
		/obj/item/hl2key/rebel_bunker/armory = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/lieutenant/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_END, 1)
	user.change_stat(STATKEY_DEX, 3)
	user.change_stat(STATKEY_STR, 1)
	user.change_stat(STATKEY_INT, 1)
	user.change_stat(STATKEY_PER, 2)

/datum/job/outlands/lieutenant/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
