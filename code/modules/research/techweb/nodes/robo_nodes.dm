/datum/techweb_node/robotics
	id = TECHWEB_NODE_ROBOTICS
	starting_node = TRUE
	display_name = "Robotics"
	description = "Programmable machines that make our lives lazier."
	design_ids = list(
		"mechfab",
		"botnavbeacon",
		"paicard",
	)

// AI root node
/datum/techweb_node/ai
	id = TECHWEB_NODE_AI
	display_name = "Artificial Intelligence"
	description = "Exploration of AI systems, more intelligent than the entire crew put together."
	prereq_ids = list(TECHWEB_NODE_ROBOTICS)
	design_ids = list(
		"aiupload",
		"aifixer",
		"intellicard",
		"mecha_tracking_ai_control",
		"borg_ai_control",
		"aicore",
		"reset_module",
		"default_module",
		"freeform_module",
		"remove_module",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE)
