/datum/job/outlands/ordinal
	title = JOB_OUTLANDS_ORDINAL
	description = "Lead your investigative fireteam you have been assigned to in order to see what remains of Forest District, while setting up a Forward Operating Base."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	exp_requirements = 240
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "ORDINAL"

	outfit = /datum/outfit/job/outlands/ordinal

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB

	departments_list = list(
		/datum/job_department/security,
		)

	cmode_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/job/outlands/ordinal
	name = "Ordinal"
	jobtype = /datum/job/outlands/ordinal
	id = /obj/item/card/id/advanced/halflife/combine/one

	id_trim = /datum/id_trim/job/outlands/ordinal
	ears = /obj/item/radio/headset/civilprotection/deployment

	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2

	suit_store = /obj/item/gun/ballistic/automatic/ar2

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	l_pocket = /obj/item/grenade/spawnergrenade/manhacks
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/ota)
	skillchips = list(/obj/item/skillchip/overwatch)

/datum/outfit/job/outlands/ordinal/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()

	user.faction += "combine"

	user.skin_tone = "#e9dfd7"
	user.set_facial_hairstyle("Shaved", update = FALSE)
	user.set_hairstyle("Bald") //this will call update_body_parts()
	user.eye_color_left = "#b9b9b9"
	user.eye_color_right = "#b9b9b9"
	user.update_body()

	ADD_TRAIT(user, TRAIT_NOHUNGER, JOB_TRAIT)
	user.mob_mood?.mood_modifier -= 0.2

	user.change_stat(STATKEY_END, 5)
	user.change_stat(STATKEY_DEX, 4)
	user.change_stat(STATKEY_STR, 5)
	user.change_stat(STATKEY_PER, 4)

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "OTA:Ordinal-[rand(111,999)]"
		ID.update_label()
