GLOBAL_VAR_INIT(deployment_xen_cash, 0)
GLOBAL_VAR_INIT(xen_boss_spawned, FALSE)

/datum/job/deployment_xen
	title = JOB_DEPLOYMENT_XEN
	description = "You are a Xenian creature. Whether antlion or zombie, you have put aside your differences to ravage the earth. While you are individually weaker than the combine or rebels, you can respawn quickly and use larger numbers to overwhelm them."
	department_head = list("Nobody")
	total_positions = 0
	spawn_positions = 0
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/xen_tdm

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = XEN_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg' //cause they're a cp violation

/datum/outfit/job/xen_tdm
	name = "Xen TDM"
	jobtype = /datum/job/deployment_xen

	uniform = /obj/item/clothing/under/citizen/refugee/green/slowing
	head = /obj/item/clothing/head/halflife/cosmetic_headcrab
	implants = list(/obj/item/implant/mindshield) //snowflake and bad but... this makes rebel turrets shoot crabwalkers
	var/list/nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES)

/datum/job/deployment_xen/get_spawn_message_information()
	var/list/info = list()
	if(SSmapping.current_map.combat_deployment_gamemode == "xen_defense")
		info += "You are playing for the Xenian side! Destroy the enemy's comms tower before the time limit is up to win!"
	return info

/datum/outfit/job/xen_tdm/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_TDMPLAYER, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ALWAYS_ID_NAME, JOB_TRAIT)
	H.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 3) //Gives you a few seconds of invincibility to prevent spawn camping

	H.faction = list(FACTION_HEADCRAB)

	var/chosen = null

	if(DEPLOYMENT_TIER3_XEN <= GLOB.deployment_xen_cash)
		chosen = /obj/item/hl2/loadout_picker/xen/tier3
	else if(DEPLOYMENT_TIER2_XEN <= GLOB.deployment_xen_cash)
		chosen = /obj/item/hl2/loadout_picker/xen/tier2
		if(prob(15)) //15% chance to get the next tier instead, for increased variety
			chosen = /obj/item/hl2/loadout_picker/xen/tier3
	else if(DEPLOYMENT_TIER1_XEN <= GLOB.deployment_xen_cash)
		chosen = /obj/item/hl2/loadout_picker/xen/tier1
		if(prob(15))
			chosen = /obj/item/hl2/loadout_picker/xen/tier2

	if(DEPLOYMENT_TIER4_XEN <= GLOB.deployment_xen_cash)
		if(DEPLOYMENT_TIER4_EXTRA_CHANCE_XEN <= GLOB.deployment_xen_cash)
			if(prob(DEPLOYMENT_TIER4_XEN_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/xen/tier4
		else
			if(prob(DEPLOYMENT_TIER4_HIGH_XEN_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/xen/tier4

	if(DEPLOYMENT_TIER5_XEN <= GLOB.deployment_xen_cash)
		if(DEPLOYMENT_TIER5_EXTRA_CHANCE_XEN <= GLOB.deployment_xen_cash)
			if(prob(DEPLOYMENT_TIER5_XEN_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/xen/tier5
		else
			if(prob(DEPLOYMENT_TIER5_HIGH_XEN_CHANCE))
				chosen = /obj/item/hl2/loadout_picker/xen/tier5

	if(DEPLOYMENT_TIER6_XEN <= GLOB.deployment_xen_cash && GLOB.xen_boss_spawned == FALSE)
		if(prob(50)) //not an guarantee, even if its available
			chosen = /obj/item/hl2/loadout_picker/xen/tier6
			GLOB.xen_boss_spawned = TRUE

	if(chosen)
		var/turf/T = get_turf(H)
		var/obj/item/I = new chosen(T)
		H.put_in_hands(I)

	var/list/no_drops = list()

	// Make clothing in the specified slots NODROP
	for(var/slot in nodrop_slots)
		no_drops += H.get_item_by_slot(slot)
	list_clear_nulls(no_drops) // For any slots we didn't have filled
	// Apply TRAIT_NODROP to everything
	for(var/obj/item/item_to_nodrop as anything in no_drops)
		ADD_TRAIT(item_to_nodrop, TRAIT_NODROP, CAPTURE_THE_FLAG_TRAIT)

/datum/job/deployment_xen/get_roundstart_spawn_point()
	return pick(GLOB.deployments_xen)

/datum/job/deployment_xen/get_latejoin_spawn_point()
	return pick(GLOB.deployments_xen)
