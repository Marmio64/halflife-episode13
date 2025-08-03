/datum/job/head_of_security
	title = JOB_HEAD_OF_SECURITY
	description = "Command the civil protection team, and act as Overwatch's ground agent in the city. Should a conflict of interest occur, you have to side with Overwatch."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CAPTAIN
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 240
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "HEAD_OF_SECURITY"

	outfit = /datum/outfit/job/hos
	plasmaman_outfit = /datum/outfit/plasmaman/head_of_security
	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/command,
		)

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_GREAT
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_HEAD_OF_SECURITY
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	rpg_title = "Guard Leader"
	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS

	human_authority = JOB_AUTHORITY_HUMANS_ONLY

	voice_of_god_power = 1.4 //Command staff has authority

	ration_bonus = 3
	union_law_notify = TRUE

	requisition_points = 6

	gameplay_help = "As the divisional lead, you are partially augmented and have had a full memory wipe. You cannot go rogue and HAVE to follow orders from Overwatch (and thus, often Dispatch). Your CP officers and the District Administrator are not absolutely loyal however, so you'll have to instill loyalty in them to Overwatch."

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

/datum/job/head_of_security/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting District Administrator [captain.real_name] assuming command."


/datum/outfit/job/hos
	name = "Divisional Lead"
	jobtype = /datum/job/head_of_security
	id = /obj/item/card/id/advanced/halflife/combine/three

	id_trim = /datum/id_trim/job/head_of_security
	ears = /obj/item/radio/headset/civilprotection/divisional
	uniform = /obj/item/clothing/under/combine/civilprotection/divisionallead
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/divisional
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/divisional
	belt = /obj/item/storage/belt/civilprotection/divisionleadfull

	r_pocket = /obj/item/hl2key/townhall

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

/datum/outfit/job/hos/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	var/currentrankpoints = 0

	var/client/user_client = GLOB.directory[ckey(user.mind?.key)]

	var/department = null

	if(user_client)
		currentrankpoints = user_client.prefs.read_preference(/datum/preference/numeric/rankpoints)
		department = user_client.prefs.read_preference(/datum/preference/choiced/security_department)

	var/name_source = list("Line", "Patrol", "Roller", "Victor")

	if(department)
		if(department == SEC_DEPT_HELIX)
			name_source = list ("Helix")
			user.change_stat(STATKEY_INT, 3) //Guarantee they can use an analyzer, at the cost of strength
			user.change_stat(STATKEY_STR, -2)
		if(department == SEC_DEPT_XRAY)
			name_source = list ("Xray")
			user.change_stat(STATKEY_INT, 3)
			user.change_stat(STATKEY_STR, -2)
		if(department == SEC_DEPT_DEFENDER)
			name_source = list ("Defender")
			user.change_stat(STATKEY_DEX, -1)
			user.change_stat(STATKEY_STR, 1)
		if(department == SEC_DEPT_JURY)
			name_source = list ("Jury")
			user.change_stat(STATKEY_DEX, -1)
			user.change_stat(STATKEY_STR, 1)
		if(department == SEC_DEPT_RANGER)
			name_source = list ("Ranger")
			user.change_stat(STATKEY_DEX, 1)
			user.change_stat(STATKEY_STR, -1)
		if(department == SEC_DEPT_QUICK)
			name_source = list ("Quick")
			user.change_stat(STATKEY_DEX, 1)
			user.change_stat(STATKEY_STR, -1)

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "DV:[currentrankpoints].[pick(name_source)]-[rand(10,99)]"
		ID.update_label()

		if(24 < currentrankpoints)
			ID.registered_account.requisition_points += 1

		if(49 < currentrankpoints)
			ID.registered_account.requisition_points += 1

		if(74 < currentrankpoints)
			ID.registered_account.requisition_points += 1

	user.change_stat(STATKEY_DEX, 2)
	user.change_stat(STATKEY_STR, 3)

/datum/outfit/job/hos/mod
	name = "Head of Security (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/safeguard
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/sechailer
	internals_slot = ITEM_SLOT_SUITSTORE
