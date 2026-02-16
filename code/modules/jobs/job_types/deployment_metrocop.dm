GLOBAL_VAR_INIT(deployment_combine_cash, 0)

/datum/job/deployment_metrocop
	title = JOB_DEPLOYMENT_METROCOP
	description = "You are part of the combine! You have better medium-high tier loadouts than rebels, but it takes your faction longer to unlock high tier loadouts compared to the rebels. Early to mid-game may have you struggling, but you are likely to win if you last till late game!"
	department_head = list("Nobody")
	total_positions = 65
	spawn_positions = 65
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/deployment_metrocop

	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = COMBINE_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'

/datum/job/deployment_metrocop/get_spawn_message_information()
	var/list/info = list()
	if(SSmapping.current_map.combat_deployment_gamemode == "towers")
		info += "You are playing for the Combine Side in the Communication Towers TDM game mode! Destroy the rebel's comms tower while protecting your own! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "koth")
		info += "You are playing for the Combine Side in the King of The Hill TDM game mode! Capture the central flag and keep it under your faction's control for a total of five minutes to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "payload")
		info += "You are playing for the Combine Side in the Payload gamemode! You may either have to defend the cart, or push it into the enemy's base to win!"
	if(SSmapping.current_map.combat_deployment_gamemode == "ctf")
		info += "You are playing for the Combine Side in the Capture the Flag gamemode! Capture the enemy's flag and bring it back to your own flag enough times to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "the_hidden")
		info += "You are part of a team hunting down an anomalous test subject known as The Hidden. Stick together with your squad, and try to put this invisible, merciless beast down. Alternatively, try to active all five combine distress terminals to win."

	return info

/datum/outfit/job/deployment_metrocop
	name = "Deployment metrocop"
	jobtype = /datum/job/deployment_metrocop

	ears = /obj/item/radio/headset/civilprotection/deployment
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	id = /obj/item/storage/wallet

	mask = /obj/item/clothing/mask/gas/civilprotection

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

/datum/outfit/job/deployment_metrocop/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 3) //Gives you a few seconds of invincibility to prevent spawn camping
	ADD_TRAIT(user, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(user, TRAIT_TDMPLAYER, JOB_TRAIT)
	user.faction += "combine"
	user.faction -= "neutral"

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
		if(DEPLOYMENT_TIER5_EXTRA_CHANCE_COMBINE <= GLOB.deployment_combine_cash)
			if(prob(DEPLOYMENT_TIER5_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/combine/tier5
		else
			if(prob(DEPLOYMENT_TIER5_EXTRA_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/combine/tier5

	if(SSmapping.current_map.combat_deployment_gamemode == "the_hidden")
		chosen = /obj/item/hl2/loadout_picker/hidden/combine

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

/datum/job/deployment_metrocop/get_roundstart_spawn_point()
	return pick(GLOB.deployments_metrocop)

/datum/job/deployment_metrocop/get_latejoin_spawn_point()
	return pick(GLOB.deployments_metrocop)
