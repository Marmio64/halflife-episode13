/datum/job/outlands/survivor
	title = JOB_OUTLANDS_SURVIVOR
	description = "Become one of a random few survivors of varying positions who are stranded within Forest District. Your role is randomized and can vary from citizens, to officers, or even liaisons. You are beholden to no one now after the fall of Forest District, and can ally with anyone, even as an officer."

	department_head = list(JOB_HEAD_OF_PERSONNEL)

	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 2

	exp_granted_type = EXP_TYPE_CREW
	config_tag = "OUTLANDS_SURVIVOR"

	outfit = /datum/outfit/job/outlands/survivor

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BOTANIST

	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_ASSIGN_QUIRKS|JOB_OUTLANDS_JOB|JOB_NEW_PLAYER_JOINABLE

/datum/outfit/job/outlands/survivor
	name = "Default Outlands Survivor"
	jobtype = /datum/job/outlands/survivor

/datum/outfit/job/outlands/survivor/pre_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	var/destination = null
	var/position = null

	//Citizen
	if(prob(50))

		id = /obj/item/card/id/advanced/halflife/grey
		id_trim = /datum/id_trim/job/outlands/survivor_citizen
		uniform = /obj/item/clothing/under/citizen
		destination = /area/halflife/indoors/old
		position = JOB_OUTLANDS_SURVIVOR_CITIZEN

	//Liaison
	else if(prob(25))
		id = /obj/item/card/id/advanced/halflife/combine/one

		id_trim = /datum/id_trim/job/lawyer
		uniform = /obj/item/clothing/under/halflife/brownsuit
		ears = /obj/item/radio/headset/heads/liaison
		shoes = /obj/item/clothing/shoes/laceup
		l_hand = /obj/item/storage/briefcase
		belt = /obj/item/melee/baton/telescopic
		destination = /area/halflife/indoors/townhall
		position = JOB_OUTLANDS_SURVIVOR_LIAISON

		H.change_stat(STATKEY_INT, 1)

	//Officer
	else if (prob(25))
		id = /obj/item/card/id/advanced/halflife/combine/one

		id_trim = /datum/id_trim/job/security_officer
		ears = /obj/item/radio/headset/civilprotection
		uniform = /obj/item/clothing/under/combine/civilprotection
		gloves = /obj/item/clothing/gloves/color/civilprotection
		suit = /obj/item/clothing/suit/armor/civilprotection
		shoes = /obj/item/clothing/shoes/jackboots/civilprotection
		glasses = /obj/item/clothing/glasses/hud/security

		mask = /obj/item/clothing/mask/gas/civilprotection
		belt = /obj/item/storage/belt/civilprotection/riotfullpistol

		implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)
		destination = /area/halflife/indoors/townhall/civilprotection
		position = JOB_OUTLANDS_SURVIVOR_OFFICER

	//Doctor
	else
		jobtype = /datum/job/doctor
		id = /obj/item/card/id/advanced/halflife/red

		id_trim = /datum/id_trim/job/medical_doctor
		uniform = /obj/item/clothing/under/citizen/full_sensors
		suit =  /obj/item/clothing/suit/whitejacket
		accessory = /obj/item/clothing/accessory/armband/medblue
		ears = /obj/item/radio/headset
		gloves = /obj/item/clothing/gloves/latex/nitrile
		skillchips = list(/obj/item/skillchip/entrails_reader)

		H.change_stat(STATKEY_INT, 3)

		destination = /area/halflife/indoors/hospital/virology
		position = JOB_OUTLANDS_SURVIVOR_DOCTOR

	if(visuals_only == TRUE)
		return

	addtimer(CALLBACK(src, PROC_REF(send_to_location), H, destination, position), 0.25 SECONDS)


/datum/outfit/job/outlands/survivor/proc/send_to_location(mob/living/carbon/human/H, destination, position)
	var/spawn_point = pick(LAZYACCESS(GLOB.outlands_survivor_spawns, position))

	if(destination || spawn_point)
		if(spawn_point)
			H.Move(get_turf(spawn_point))
		else
			var/list/possible_turfs = get_area_turfs(destination)
			while (length(possible_turfs))
				var/random_index = rand(1, length(possible_turfs))
				var/turf/target = possible_turfs[random_index]
				if (H.Move(target))
					break
				possible_turfs.Cut(random_index, random_index + 1)

/datum/outfit/job/outlands/survivor/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	if(id_trim != /datum/id_trim/job/security_officer)
		return

	user.faction += "combine"

	ADD_TRAIT(user, TRAIT_ABOVE_LABOR, JOB_TRAIT)

	user.change_stat(STATKEY_DEX, 2)
	user.change_stat(STATKEY_STR, 1)
	user.change_stat(STATKEY_END, 1)
	user.change_stat(STATKEY_PER, 1)

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
			user.change_stat(STATKEY_INT, 3) //Guarantee they can use an analyzer
			user.change_stat(STATKEY_STR, -1)
		if(department == SEC_DEPT_XRAY)
			name_source = list ("Xray")
			user.change_stat(STATKEY_INT, 3)
			user.change_stat(STATKEY_STR, -1)
		if(department == SEC_DEPT_DEFENDER)
			name_source = list ("Defender")
			user.change_stat(STATKEY_DEX, -1)
			user.change_stat(STATKEY_END, 1)
		if(department == SEC_DEPT_JURY)
			name_source = list ("Jury")
			user.change_stat(STATKEY_DEX, -1)
			user.change_stat(STATKEY_STR, 1)
		if(department == SEC_DEPT_RANGER)
			name_source = list ("Ranger")
			user.change_stat(STATKEY_STR, -1)
			user.change_stat(STATKEY_PER, 2)
		if(department == SEC_DEPT_QUICK)
			name_source = list ("Quick")
			user.change_stat(STATKEY_DEX, 1)
			user.change_stat(STATKEY_STR, -1)

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "CP:[currentrankpoints].[pick(name_source)]-[rand(111,999)]"
		ID.update_label()

		if(24 < currentrankpoints)
			ID.registered_account.requisition_points += 1

		if(49 < currentrankpoints)
			ID.registered_account.requisition_points += 1

		if(74 < currentrankpoints)
			ID.registered_account.requisition_points += 1

/datum/job/outlands/survivor/get_roundstart_spawn_point()
	return pick(LAZYACCESS(GLOB.outlands_survivor_spawns, JOB_OUTLANDS_SURVIVOR_CITIZEN))
