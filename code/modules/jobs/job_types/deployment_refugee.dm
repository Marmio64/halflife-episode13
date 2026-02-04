GLOBAL_VAR_INIT(deployment_rebels_cash, 0)

/datum/job/deployment_refugee
	title = JOB_DEPLOYMENT_REFUGEE
	description = "You are part of the resistance! You are able to get access to higher loadout tiers earlier than the combine, but have slightly weaker tier 3 and 4 loadouts."
	department_head = list("Nobody")
	total_positions = 65
	spawn_positions = 65
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/refugee/deployment

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = REBEL_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg' //cause they're a cp violation

/datum/job/deployment_refugee/get_spawn_message_information()
	var/list/info = list()
	if(SSmapping.current_map.combat_deployment_gamemode == "towers")
		info += "You are playing for the Rebel Side in the Communication Towers TDM game mode! Destroy the combine's comms tower while protecting your own! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "koth")
		info += "You are playing for the Rebel Side in the King of The Hill TDM game mode! Capture the central flag and keep it under your faction's control for a total of five minutes to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "payload")
		info += "You are playing for the Rebel Side in the Payload gamemode! Move the cart to the combine base to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "ctf")
		info += "You are playing for the Rebel Side in the Capture the Flag gamemode! Capture the enemy's flag and bring it back to your own flag enough times to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "the_hidden")
		info += "You are part of a team hunting down an anomalous test subject known as The Hidden. Stick together with your squad, and try to put this invisible, merciless beast down. Alternatively, try to active all five combine distress terminals to win."
	if(SSmapping.current_map.combat_deployment_gamemode == "xen_defense")
		info += "You are playing for the Rebel Side in the Xen Defense gamemode! Protect your comms tower, gather cash, and keep incoming zombies and antlions at bay long enough for reinforcements to arrive."

	return info

/datum/outfit/job/refugee/deployment/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_TDMPLAYER, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ALWAYS_ID_NAME, JOB_TRAIT)
	H.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 3) //Gives you a few seconds of invincibility to prevent spawn camping

	var/chosen = null

	if(DEPLOYMENT_TIER4_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier4
	else if(DEPLOYMENT_TIER3_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier3
	else if(DEPLOYMENT_TIER2_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier2
	else if(DEPLOYMENT_TIER1_REBELS <= GLOB.deployment_rebels_cash)
		chosen = /obj/item/hl2/loadout_picker/rebel/tier1

	if(DEPLOYMENT_TIER5_REBELS <= GLOB.deployment_rebels_cash)
		if(DEPLOYMENT_TIER5_EXTRA_CHANCE_REBELS <= GLOB.deployment_rebels_cash)
			if(prob(DEPLOYMENT_TIER5_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/rebel/tier5
		else
			if(prob(DEPLOYMENT_TIER5_EXTRA_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/rebel/tier5

	if(SSmapping.current_map.combat_deployment_gamemode == "the_hidden")
		chosen = /obj/item/hl2/loadout_picker/hidden/rebel

	if(chosen)
		var/turf/T = get_turf(H)
		var/obj/item/I = new chosen(T)
		H.put_in_hands(I)

/datum/job/deployment_refugee/get_roundstart_spawn_point()
	return pick(GLOB.deployments_refugee)

/datum/job/deployment_refugee/get_latejoin_spawn_point()
	return pick(GLOB.deployments_refugee)
