
/datum/job/deployment_metrocop_captain
	title = JOB_DEPLOYMENT_METROCOP_CAPTAIN
	description = "You are the leader of the combine deployment in this sector. Coordinate your troops to victory, and don't get yourself killed. Use your supply radio to call in unique stratagems."
	department_head = list("Nobody")
	total_positions = 1
	spawn_positions = 1
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/deployment_metrocop_captain

	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	department_for_prefs = /datum/job_department/assistant

	job_flags = JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS
	faction = FACTION_STATION

	combat_deployment_job = TRUE
	combat_deployment_faction = COMBINE_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/confrontation.ogg'

/datum/job/deployment_metrocop_captain/get_spawn_message_information()
	var/list/info = list()
	if(SSmapping.current_map.combat_deployment_gamemode == "towers")
		info += "You are playing for the Combine Side in the Communication Towers TDM game mode! Destroy the rebel's comms tower while protecting your own! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "koth")
		info += "You are playing for the Combine Side in the King of The Hill TDM game mode! Capture the central flag and keep it under your faction's control for a total of five minutes to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."
	if(SSmapping.current_map.combat_deployment_gamemode == "payload")
		info += "You are playing for the Combine Side in the Payload gamemode! Defend the cart for 7 minutes to win! You can loot buildings for money, and sell enemy player corpses to your base's cash deposit in order to upgrade your team's starting loadouts."

	return info

/datum/outfit/job/deployment_metrocop_captain
	name = "Deployment metrocop captain"
	jobtype = /datum/job/deployment_metrocop_captain

	ears = /obj/item/radio/headset/civilprotection/deployment
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	belt = /obj/item/melee/baton/security/loaded
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security
	neck = /obj/item/clothing/neck/sectorial_cloak
	head = /obj/item/clothing/head/hats/halflife/sectorial
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection
	id = /obj/item/card/id/advanced/halflife/combine/four/sectoral
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/hl2/supply_radio/combine = 1,
	)

	mask = /obj/item/clothing/mask/gas/civilprotection/divisional

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

	var/list/nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_MASK)

/datum/outfit/job/deployment_metrocop_captain/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.reagents.add_reagent(/datum/reagent/medicine/adminordrazine, 5) //Gives you a few seconds of invincibility to prevent spawn camping
	ADD_TRAIT(user, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(user, TRAIT_TDMCAPTAIN, JOB_TRAIT)
	user.faction += "combine"
	user.faction -= "neutral"

	user.change_stat(STATKEY_DEX, 4)
	user.change_stat(STATKEY_STR, 4)

	var/obj/item/card/id/outfit_id = user.wear_id
	if(outfit_id)
		outfit_id.registered_name = "Sectoral Commander"

	var/list/spells_to_add = list(/datum/action/cooldown/spell/aoe/rally/combine)

	for(var/datum/action/act as anything in spells_to_add)
		var/datum/action/new_ability = new act(user)
		if(istype(new_ability, /datum/action/cooldown/spell))
			var/datum/action/cooldown/spell/new_spell = new_ability
			new_spell.spell_requirements = NONE
		new_ability.Grant(user)

	var/list/no_drops = list()

	// Make clothing in the specified slots NODROP
	for(var/slot in nodrop_slots)
		no_drops += user.get_item_by_slot(slot)
	list_clear_nulls(no_drops) // For any slots we didn't have filled
	// Apply TRAIT_NODROP to everything
	for(var/obj/item/item_to_nodrop as anything in no_drops)
		ADD_TRAIT(item_to_nodrop, TRAIT_NODROP, CAPTURE_THE_FLAG_TRAIT)


/datum/job/deployment_metrocop_captain/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/job/deployment_metrocop_captain/after_roundstart_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.deployments_metrocop)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))
