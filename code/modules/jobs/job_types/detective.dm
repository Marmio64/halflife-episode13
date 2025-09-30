/datum/job/detective
	title = JOB_DETECTIVE
	description = "Patrol the forests and condemned city with your squad and protect the town, while avoiding entering it. Avoid getting rebellious, unless you want an Overwatch strike on your base."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY)
	total_positions = 3
	spawn_positions = 3
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "DETECTIVE"

	outfit = /datum/outfit/job/conscript
	plasmaman_outfit = /datum/outfit/plasmaman/detective
	departments_list = list(
		/datum/job_department/security,
		)

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_DETECTIVE

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 25,
		/obj/item/ammo_box/c38 = 20,
		/obj/item/ammo_box/c38/dumdum = 5,
		/obj/item/ammo_box/c38/hotshot = 5,
		/obj/item/ammo_box/c38/iceblox = 5,
		/obj/item/ammo_box/c38/match = 5,
		/obj/item/ammo_box/c38/trac = 5,
		/obj/item/card/id/advanced/plainclothes = 5,
		/obj/item/storage/belt/holster/detective/full = 1,
	)

	ration_bonus = 1

	faction = FACTION_STATION
	job_flags = STATION_JOB_FLAGS

	family_heirlooms = list(/obj/item/reagent_containers/cup/glass/bottle/whiskey)

/datum/outfit/job/conscript
	name = "Conscript"

	id = /obj/item/card/id/advanced/halflife/combine/one
	id_trim = /datum/id_trim/job/detective
	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	head = /obj/item/clothing/head/helmet/halflife/military/weak

	mask = /obj/item/clothing/mask/gas/hl2/military/hardened

	back = /obj/item/storage/backpack/halflife/satchel/military

	belt = /obj/item/flashlight/seclite
	r_pocket = /obj/item/hl2key/conscript
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/conscript/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.faction += "combine"

	user.change_stat(STATKEY_DEX, 2)
























/datum/outfit/job/detective
	name = "Detective"
	jobtype = /datum/job/detective

	id = /obj/item/card/id/advanced/plainclothes

	id_trim = /datum/id_trim/job/detective
	uniform = /obj/item/clothing/under/rank/security/detective
	suit = /obj/item/clothing/suit/jacket/det_suit
	backpack_contents = list(
		/obj/item/detective_scanner = 1,
		/obj/item/melee/baton = 1,
		/obj/item/storage/box/evidence = 1,
		)
	belt = /obj/item/modular_computer/pda/detective
	ears = /obj/item/radio/headset/headset_sec/alt
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/fedora/det_hat
	mask = /obj/item/cigarette
	neck = /obj/item/clothing/neck/tie/detective
	shoes = /obj/item/clothing/shoes/sneakers/brown
	l_pocket = /obj/item/toy/crayon/white
	r_pocket = /obj/item/lighter

	chameleon_extras = list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/gun/ballistic/revolver/c38/detective,
		)
	implants = list(/obj/item/implant/mindshield)

	skillchips = list(/obj/item/skillchip/job/detectives_taste)

/datum/outfit/job/detective/pre_equip(mob/living/carbon/human/human, visuals_only = FALSE)
	. = ..()
	if (human.age < AGE_MINOR)
		mask = /obj/item/cigarette/candy
		head = /obj/item/clothing/head/fedora/det_hat/minor

/datum/outfit/job/detective/post_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	..()
	var/obj/item/cigarette/cig = H.wear_mask
	if(istype(cig)) //Some species specfic changes can mess this up (plasmamen)
		cig.light("")

	if(visuals_only)
		return
