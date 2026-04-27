/datum/job/outlands/grunt
	title = JOB_OUTLANDS_GRUNT
	description = "Follow the orders of your Ordinal and neutralize any hostile forces you see."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 4

	exp_requirements = 120
	exp_required_type = EXP_TYPE_CREW
	supervisors = SUPERVISOR_ORDINAL
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "GRUNT"

	outfit = /datum/outfit/job/outlands/grunt

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/security,
		)

	cmode_music = 'hl13/sound/music/combat/lgorbifold.ogg'

	gameplay_help = "You are a lower-grade transhuman that has already went through mind alteration procedures. While you retain some form of human emotion, you have been made completely loyal to the combine, and you cannot betray them."

	requisition_points = 4

/datum/outfit/job/outlands/grunt
	name = "Grunt"
	jobtype = /datum/job/outlands/grunt
	id = /obj/item/card/id/advanced/halflife/combine/one

	id_trim = /datum/id_trim/job/outlands/grunt
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch
	glasses = /obj/item/clothing/glasses/hud/security

	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7_no_grenade
	suit = /obj/item/clothing/suit/halflife/invis_grunt_harness
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/ota)

/datum/outfit/job/outlands/grunt/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()

	user.faction += "combine"

	user.skin_tone = "#e9dfd7"
	user.set_facial_hairstyle("Shaved", update = FALSE)
	user.set_hairstyle("Bald") //this will call update_body_parts()
	user.eye_color_left = "#b9b9b9"
	user.eye_color_right = "#b9b9b9"
	user.update_body()

	user.mob_mood?.mood_modifier -= 0.2

	user.change_stat(STATKEY_END, 2)
	user.change_stat(STATKEY_DEX, 1)
	user.change_stat(STATKEY_STR, 2)
	user.change_stat(STATKEY_PER, 2)

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "OTA:Echo-[rand(111,999)]"
		ID.update_label()
