/datum/job/outlands/police
	title = JOB_OUTLANDS_POLICE
	description = "You are an officer of the Polish Free State's civil police force, assigned to keep order and uphold Polish law inside the bunker and any surface territories it may take control of. As a civilian law enforcement officer, you answer ONLY to the Quartermaster, or the Lieutenant if they are absent. You are the bunker's last line of defence in an emergency, but this does not mean you are a soldier; your duty is to stand guard at home."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	supervisors = SUPERVISOR_REB_QM
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "POLICE"

	outfit = /datum/outfit/job/outlands/police

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_COOK

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/service,
		)

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

/datum/outfit/job/outlands/police
	name = "Bunker Civil Police"
	jobtype = /datum/job/outlands/police
	id = /obj/item/card/id/advanced/halflife/grey
	id_trim = /datum/id_trim/job/outlands/police

	uniform = /obj/item/clothing/under/halflife/police
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	belt = /obj/item/melee/baton
	suit_store = /obj/item/gun/ballistic/revolver/snubnose/police
	head = /obj/item/clothing/head/costume/polishpolice
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel/military

	l_pocket = /obj/item/hl2key/rebel_bunker/police
	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/ammo_box/c38 = 2,
		/obj/item/knife/combat/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/job/outlands/police/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += FACTION_REFUGEE
	user.change_stat(STATKEY_END, 2)
	user.change_stat(STATKEY_DEX, 1)
	user.change_stat(STATKEY_STR, 2)
	user.change_stat(STATKEY_PER, 1)

/datum/job/outlands/police/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_refugee)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
