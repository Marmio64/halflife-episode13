/datum/techweb_node/material_processing
	id = TECHWEB_NODE_MATERIAL_PROC
	starting_node = TRUE
	display_name = "Material Processing"
	description = "Refinement and processing of alloys and ores to enhance their utility and value."
	design_ids = list(
		"pickaxe",
		"shovel",
		"conveyor_switch",
		"conveyor_belt",
		"mass_driver",
		"recycler",
		"stack_machine",
		"stack_console",
		"autolathe",
		"rglass",
		"plasmaglass",
		"plasmareinforcedglass",
		"plasteel",
		"titaniumglass",
		"plastitanium",
		"plastitaniumglass",
	)

/datum/techweb_node/mining
	id = TECHWEB_NODE_MINING
	display_name = "Mining Technology"
	description = "Development of tools meant to optimize mining operations and resource extraction."
	prereq_ids = list(TECHWEB_NODE_MATERIAL_PROC)
	design_ids = list(
		"cargoexpress",
		"brm",
		"b_smelter",
		"b_refinery",
		"ore_redemption",
		"mining_equipment_vendor",
		"mining_scanner",
		"mech_mscanner",
		"superresonator",
		"mech_drill",
		"mod_drill",
		"drill",
		"mod_orebag",
		"beacon",
		"telesci_gps",
		"mod_gps",
		"mod_visor_meson",
		"mesons",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SUPPLY)

