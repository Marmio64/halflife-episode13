/datum/job/outlands/sergeant
	title = JOB_OUTLANDS_SERGEANT
	description = "You are a well trained sergeant in the PLF, chosen by the bunker's lieutenant as a field squad leader."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW
	supervisors = SUPERVISOR_REB_LT
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SERGEANT"

	outfit = /datum/outfit/job/outlands/sergeant

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_COOK

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

/datum/outfit/job/outlands/sergeant
	name = "Bunker Sergeant"
	jobtype = /datum/job/outlands/sergeant
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/sergeant

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	head = /obj/item/clothing/head/helmet/halflife/military/poland
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel

	r_pocket = /obj/item/flashlight

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1/service = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/sergeant/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_END, 1)
	user.change_stat(STATKEY_DEX, 3)
	user.change_stat(STATKEY_STR, 1)
	user.change_stat(STATKEY_PER, 2)

/datum/job/outlands/sergeant/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
