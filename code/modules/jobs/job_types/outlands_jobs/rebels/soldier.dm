/datum/job/outlands/soldier
	title = JOB_OUTLANDS_SOLDIER
	description = "You are a relatively fresh soldier under the command of the bunker's lieutenant. You have a moderate amount of combat training, but will a lot of times also be expected to preform grunt work as needed."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 6
	spawn_positions = 4

	supervisors = SUPERVISOR_REB_LT
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SOLDIER"

	outfit = /datum/outfit/job/outlands/soldier

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_COOK

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

/datum/outfit/job/outlands/soldier
	name = "Bunker Soldier"
	jobtype = /datum/job/outlands/soldier
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/soldier

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel

	r_pocket = /obj/item/flashlight

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/soldier/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_END, 1)
	user.change_stat(STATKEY_DEX, 3)
	user.change_stat(STATKEY_STR, 1)
	user.change_stat(STATKEY_PER, 2)

/datum/job/outlands/soldier/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
