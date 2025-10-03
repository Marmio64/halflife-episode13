/datum/job/head_of_security
	title = JOB_HEAD_OF_SECURITY
	description = "Guard the District Administrator at all costs, except whereby doing so it would conflict with the orders of Overwatch. Command over local Metropolice and Conscript forces when necessary."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_CAPTAIN
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 600 //10 hours of gameplay, about 5 rounds. Ensures they're pretty good.
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "HEAD_OF_SECURITY"

	outfit = /datum/outfit/job/overwatch
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

	gameplay_help = "As the Overwatch Soldier, you are the very best combatant stationed in the area by combine forces, and you have been given the task of protecting the District Administrator and advising them on security details. Note, while your AR2 is very powerful, there is no way to get extra ammunition for it, use it sparingly!"

	cmode_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/job/overwatch
	name = "Overwatch Soldier"

	id = /obj/item/card/id/advanced/halflife/combine/three
	id_trim = /datum/id_trim/job/head_of_security
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	skillchips = list(/obj/item/skillchip/overwatch) //Skilled soldiers
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/ota)

	suit_store = /obj/item/gun/ballistic/automatic/ar2
	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2

	back = null

	var/role = "OTA.C13-"
	var/name_source = list("Blade", "Dagger", "Hammer", "Hunter", "Razor", "Spear", "Striker", "Tracker", "Echo")

/datum/outfit/job/overwatch/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.skin_tone = "#e9dfd7"
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_hairstyle("Bald") //this will call update_body_parts()
	H.eye_color_left = "#b9b9b9"
	H.eye_color_right = "#b9b9b9"
	H.update_body()
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT) //OTA dont need to eat or drink
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT) //OTA dont need to sleep

	H.change_stat(STATKEY_DEX, 2)
	H.change_stat(STATKEY_STR, 5)

/datum/outfit/job/overwatch/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"[role][pick(name_source)] [rand(111,999)]")

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

/datum/outfit/job/hos/mod
	name = "Head of Security (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/safeguard
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/sechailer
	internals_slot = ITEM_SLOT_SUITSTORE
