/datum/job/deployment_refugee_captain
	title = JOB_DEPLOYMENT_REFUGEE_CAPTAIN
	description = "You are the leader of this resistance cell. Lead your men to victory, and tear down the combine's regime! Use your supply radio to call in unique stratagems."
	department_head = list("Nobody")
	total_positions = 1
	spawn_positions = 1
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/deployment_refugee_captain

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = REBEL_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/darkstalker.ogg'

/datum/outfit/job/deployment_refugee_captain
	name = "Deployment Refugee Captain"
	jobtype = /datum/job/deployment_refugee_captain

	suit = /obj/item/clothing/suit/armor/halflife/reinforced_brown_jacket
	mask = /obj/item/cigarette/halflife
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	belt = /obj/item/melee/baton
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/beret/sec/poland
	uniform = /obj/item/clothing/under/citizen/rebel
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/eyepatch
	id = null

	back = /obj/item/storage/backpack/halflife/satchel/radio

	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/hl2/supply_radio/rebel = 1,
		/obj/item/storage/fancy/cigarettes/halflife = 1,
		/obj/item/lighter = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment/loud

	var/list/nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES)

/datum/job/deployment_refugee_captain/get_spawn_message_information()
	var/list/info = list()
	if(SSmapping.current_map.combat_deployment_gamemode == "towers")
		info += "You are playing for the Rebel Side in the Communication Towers TDM game mode! Destroy the combine's comms tower while protecting your own! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "koth")
		info += "You are playing for the Rebel Side in the King of The Hill TDM game mode! Capture the central flag and keep it under your faction's control for a total of five minutes to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "payload")
		info += "You are playing for the Rebel Side in the Payload gamemode! Move the cart to the combine base to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "the_hidden")
		info += "You are part of a team hunting down an anomalous test subject known as The Hidden. Stick together with your squad, and try to put this invisible, merciless beast down. Alternatively, try to active all five combine distress terminals to win."

	return info

/datum/outfit/job/deployment_refugee_captain/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_TDMCAPTAIN, JOB_TRAIT)

	H.change_stat(STATKEY_DEX, 4)
	H.change_stat(STATKEY_STR, 4)

	H.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 5) //Gives you a few seconds of invincibility to prevent spawn camping

	H.fully_replace_character_name(H.real_name,"Cell Leader [H.real_name]")


	var/list/spells_to_add = list(/datum/action/cooldown/spell/aoe/rally/rebel)

	for(var/datum/action/act as anything in spells_to_add)
		var/datum/action/new_ability = new act(H)
		if(istype(new_ability, /datum/action/cooldown/spell))
			var/datum/action/cooldown/spell/new_spell = new_ability
			new_spell.spell_requirements = NONE
		new_ability.Grant(H)

	var/list/no_drops = list()

	// Make clothing in the specified slots NODROP
	for(var/slot in nodrop_slots)
		no_drops += H.get_item_by_slot(slot)
	list_clear_nulls(no_drops) // For any slots we didn't have filled
	// Apply TRAIT_NODROP to everything
	for(var/obj/item/item_to_nodrop as anything in no_drops)
		ADD_TRAIT(item_to_nodrop, TRAIT_NODROP, CAPTURE_THE_FLAG_TRAIT)


/datum/job/deployment_refugee_captain/get_roundstart_spawn_point()
	return pick(GLOB.deployments_refugee)

/datum/job/deployment_refugee_captain/get_latejoin_spawn_point()
	return pick(GLOB.deployments_refugee)
