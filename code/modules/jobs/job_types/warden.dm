/datum/job/warden
	title = JOB_WARDEN
	description = "You are an officer tasked with monitoring prisoners and the armory first and foremost. Elsewise, you are the Divisonal Lead's second in command."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "WARDEN"

	outfit = /datum/outfit/job/warden
	plasmaman_outfit = /datum/outfit/plasmaman/warden

	paycheck = PAYCHECK_STANDARD
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_WARDEN
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		)

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 15,
		/obj/item/storage/box/handcuffs = 10,
		/obj/item/storage/box/teargas = 10,
		/obj/item/storage/box/flashbangs = 10,
		/obj/item/storage/box/rubbershot = 10,
		/obj/item/storage/box/lethalshot = 5
	)
	rpg_title = "Jailor"
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT

	ration_bonus = 2
	union_law_notify = TRUE

	requisition_points = 8

	gameplay_help = "As a civil protection officer, you are bound by fear and/or loyalty to the combine. You cannot directly rebel or go rogue without a very good reason. Also, make sure to visit a Metropolice Supply Vendor in the trainstation or nexus to gear up at."

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

/datum/outfit/job/warden/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	user.change_stat(STATKEY_DEX, 1)

	var/currentrankpoints = 0

	var/client/user_client = GLOB.directory[ckey(user.mind?.key)]

	if(user_client)
		currentrankpoints = user_client.prefs.read_preference(/datum/preference/numeric/rankpoints)

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "OV:13.[currentrankpoints]-[rand(10,90)]"
		ID.update_label()

		if(49 < currentrankpoints)
			ID.registered_account.requisition_points += 1

		if(94 < currentrankpoints)
			ID.registered_account.requisition_points += 1

/datum/outfit/job/warden
	name = "Overseer"
	jobtype = /datum/job/warden
	id = /obj/item/card/id/advanced/halflife/combine/one

	id_trim = /datum/id_trim/job/warden
	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/overseer
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/overseer
	belt = /obj/item/storage/belt/civilprotection/full

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)
