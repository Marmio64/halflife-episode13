GLOBAL_VAR_INIT(deployment_combine_cash, 0)

/datum/job/deployment_metrocop
	title = JOB_DEPLOYMENT_METROCOP
	description = "You are part of the combine! You have better medium-high tier loadouts than rebels, but it takes your faction longer to unlock high tier loadouts compared to the rebels. Early to mid-game may have you struggling, but you are likely to win if you last till late game!"
	department_head = list("Nobody")
	total_positions = 99
	spawn_positions = 99
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/deployment_metrocop

	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = COMBINE_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

	gameplay_help = "You need to destroy the rebel's communication tower in their base to win, while making sure they don't destroy your communication tower! You can sell corpses of the enemy and cash to the cash deposit in your base to upgrade your starting loadouts!"

/datum/outfit/job/deployment_metrocop
	name = "Deployment metrocop"
	jobtype = /datum/job/deployment_metrocop
	id = /obj/item/card/id/advanced/halflife/combine/one

	id_trim = /datum/id_trim/job/security_officer
	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

/datum/outfit/job/deployment_metrocop/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 5) //Gives you a few seconds of invincibility to prevent spawn camping
	user.faction += "combine"

	var/name_source = list("Line", "Patrol", "Roller", "Victor", "Jury", "Quick", "Defender")

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "CP:0.[pick(name_source)]-[rand(111,999)]"
		ID.update_label()

	var/chosen = null

	if(DEPLOYMENT_TIER4_COMBINE <= GLOB.deployment_combine_cash)
		chosen = /obj/item/hl2/loadout_picker/combine/tier4
	else if(DEPLOYMENT_TIER3_COMBINE <= GLOB.deployment_combine_cash)
		chosen = /obj/item/hl2/loadout_picker/combine/tier3
	else if(DEPLOYMENT_TIER2_COMBINE <= GLOB.deployment_combine_cash)
		chosen = /obj/item/hl2/loadout_picker/combine/tier2
	else if(DEPLOYMENT_TIER1_COMBINE <= GLOB.deployment_combine_cash)
		chosen = /obj/item/hl2/loadout_picker/combine/tier1

	if(DEPLOYMENT_TIER5_COMBINE <= GLOB.deployment_combine_cash)
		if(prob(DEPLOYMENT_TIER5_CHANCE))
			chosen = /obj/item/hl2/loadout_picker/combine/tier5

	if(chosen)
		var/turf/T = get_turf(user)
		var/obj/item/I = new chosen(T)
		user.put_in_hands(I)

/datum/job/deployment_metrocop/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/job/deployment_metrocop/after_roundstart_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
