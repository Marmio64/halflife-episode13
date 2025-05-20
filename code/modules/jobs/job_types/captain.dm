/datum/job/captain
	title = JOB_CAPTAIN
	description = "Be responsible for the city, manage your underlings, \
		keep the city functioning, be prepared to do anything and everything or die \
		horribly trying."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("CentCom")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "Overwatch"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 240
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CAPTAIN"

	outfit = /datum/outfit/job/captain
	plasmaman_outfit = /datum/outfit/plasmaman/captain

	paycheck = PAYCHECK_GREAT
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CAPTAIN
	department_for_prefs = /datum/job_department/captain
	departments_list = list(
		/datum/job_department/command,
	)

	family_heirlooms = list(/obj/item/reagent_containers/cup/glass/flask/gold, /obj/item/toy/captainsaid/collector)

	mail_goodies = list(
		/obj/item/cigarette/cigar/havana = 20,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 15,
		/obj/item/reagent_containers/cup/glass/bottle/champagne = 5,
		/obj/item/reagent_containers/cup/glass/bottle/champagne/cursed = 5,
		/obj/item/toy/captainsaid/collector = 20,
		/obj/item/skillchip/sabrage = 5,
	)

	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS
	rpg_title = "Star Duke"

	human_authority = JOB_AUTHORITY_HUMANS_ONLY

	voice_of_god_power = 1.4 //Command staff has authority

	ration_bonus = 3
	union_law_notify = TRUE

	gameplay_help = "As the District Administrator, you are the highest ranking citizen in the district and are bound by fear and/or loyalty to the combine, and cannot disobey Overwatch without a very good reason."

	cmode_music = 'hl13/sound/music/combat/branescan.ogg'

/datum/job/captain/get_captaincy_announcement(mob/living/captain)
	return "District Administrator [captain.real_name] will be managing this district."

/datum/job/captain/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	ADD_TRAIT(H, TRAIT_BAD_AIM, JOB_TRAIT)

/datum/job/captain/get_radio_information()
	. = ..()
	. += "\nYou have access to all radio channels, but they are not automatically tuned. Check your radio for more information."

/datum/outfit/job/captain
	name = "District Administrator"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/advanced/halflife/combine/four
	id_trim = /datum/id_trim/job/captain
	ears = /obj/item/radio/headset/heads/captain/alt
	uniform =  /obj/item/clothing/under/administrator
	shoes = /obj/item/clothing/shoes/laceup
	r_pocket = /obj/item/hl2key/master

	belt = /obj/item/melee/baton/telescopic

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/administrator)
	skillchips = list(/obj/item/skillchip/disk_verifier)

	var/special_charter

/datum/outfit/job/captain/mod
	name = "Captain (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/magnate
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/atmos/captain
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/job/captain/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	user.change_stat(STATKEY_INT, 2)
	user.change_stat(STATKEY_STR, -1)
