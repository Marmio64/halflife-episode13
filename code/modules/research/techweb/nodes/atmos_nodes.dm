/datum/techweb_node/plasma_control
	id = TECHWEB_NODE_PLASMA_CONTROL
	display_name = "Controlled Plasma"
	description = "Experiments with high-pressure gases and electricity resulting in crystallization and controlled plasma reactions."
	prereq_ids = list(TECHWEB_NODE_ENERGY_MANIPULATION)
	design_ids = list(
		"plasmacutter",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	discount_experiments = list(/datum/experiment/ordnance/gaseous/plasma = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_ENGINEERING)
