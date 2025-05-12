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

	skills = list(/datum/skill/firearms = SKILL_EXP_APPRENTICE, /datum/skill/athletics = SKILL_EXP_JOURNEYMAN)

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

	requisition_points = 8

	gameplay_help = "As the divisional lead, you are partially augmented and have had a full memory wipe. You cannot go rogue and HAVE to follow orders from Overwatch (and thus, often Dispatch). Your CP officers and the District Administrator are not absolutely loyal however, so you'll have to instill loyalty in them to Overwatch."

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

/datum/job/head_of_security/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting District Administrator [captain.real_name] assuming command."


/datum/outfit/job/hos
	name = "Divisional Lead"
	jobtype = /datum/job/head_of_security

	id = /obj/item/card/id/advanced/silver
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

	skillchips = list(/obj/item/skillchip/aiming, /obj/item/skillchip/fitness) //The DvL comes pre-augmented
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

/datum/outfit/job/hos/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	var/exp_rank = "0"

	if(user?.client?.prefs)
		switch(user.client.prefs.exp[JOB_HEAD_OF_SECURITY])
			if(750 to INFINITY)
				exp_rank = "100"
			if(500 to 750)
				exp_rank = "75"
			if(300 to 500)
				exp_rank = "50"
			if(50 to 300)
				exp_rank = "25"

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "DV:13.[exp_rank]-[rand(10,90)]"
		ID.update_label()

/datum/outfit/job/hos/mod
	name = "Head of Security (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/safeguard
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/sechailer
	internals_slot = ITEM_SLOT_SUITSTORE
