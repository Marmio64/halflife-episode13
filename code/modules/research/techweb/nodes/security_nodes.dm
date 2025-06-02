/datum/techweb_node/basic_arms
	id = TECHWEB_NODE_BASIC_ARMS
	starting_node = TRUE
	display_name = "Basic Arms"
	description = "Ballistics can be unpredictable here."
	design_ids = list(
		"foam_dart",
		"sec_beanbag_slug",
		"sec_dart",
		"sec_Islug",
		"sec_rshot",
	)

/datum/techweb_node/sec_equip
	id = TECHWEB_NODE_SEC_EQUIP
	display_name = "Security Equipment"
	description = "All the essentials to subdue a citizen."
	prereq_ids = list(TECHWEB_NODE_BASIC_ARMS)
	design_ids = list(
		"secdata",
		"mining",
		"prisonmanage",
		"rdcamera",
		"seccamera",
		"security_photobooth",
		"photobooth",
		"scanner_gate",
		"pepperspray",
		"dragnet_beacon",
		"inspector",
		"evidencebag",
		"zipties",
		"seclite",
		"electropack",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SECURITY)


/datum/techweb_node/riot_supression
	id = TECHWEB_NODE_RIOT_SUPRESSION
	display_name = "Riot Supression"
	description = "When you are on the opposing side of a revolutionary movement."
	prereq_ids = list(TECHWEB_NODE_SEC_EQUIP)
	design_ids = list(
		"pin_testing",
		"tele_shield",
		"ballistic_shield",
		"handcuffs_s",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SECURITY)

/datum/techweb_node/explosives
	id = TECHWEB_NODE_EXPLOSIVES
	display_name = "Explosives"
	description = "For once, intentional explosions."
	prereq_ids = list(TECHWEB_NODE_RIOT_SUPRESSION)
	design_ids = list(
		"large_grenade",
		"adv_grenade",
		"pyro_grenade",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	required_experiments = list(/datum/experiment/ordnance/explosive/lowyieldbomb)
	announce_channels = list(RADIO_CHANNEL_SECURITY, RADIO_CHANNEL_MEDICAL)
