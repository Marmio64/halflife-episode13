/datum/techweb_node/robotics
	id = TECHWEB_NODE_ROBOTICS
	starting_node = TRUE
	display_name = "Robotics"
	description = "Programmable machines that make our lives lazier."
	design_ids = list(
		"mechfab",
		"botnavbeacon",
	)

// AI root node
/datum/techweb_node/ai
	id = TECHWEB_NODE_AI
	display_name = "Artificial Intelligence"
	description = "Explore AI systems used by Dispatch and mechanical drones such as City Scanners and Viscerators."
	prereq_ids = list(TECHWEB_NODE_ROBOTICS)
	design_ids = list(
		"aiupload",
		"aifixer",
		"intellicard",
		"borg_ai_control",
		"aicore",
		"reset_module",
		"default_module",
		"freeform_module",
		"remove_module",
		"scannerframe",
		"visceratorframe",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE)
