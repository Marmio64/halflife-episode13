/datum/techweb_node/fundamental_sci
	id = TECHWEB_NODE_FUNDIMENTAL_SCI
	starting_node = TRUE
	display_name = "Fundamental Science"
	description = "Establishing the bedrock of scientific understanding, paving the way for deeper exploration and theoretical inquiry."
	design_ids = list(
		"rdserver",
		"rdservercontrol",
		"rdconsole",
		"tech_disk",
		"doppler_array",
		"experimentor",
		"destructive_analyzer",
		"destructive_scanner",
		"experi_scanner",
		"laptop",
		"portadrive_basic",
		"portadrive_advanced",
		"portadrive_super",
		"ore_silo",
	)

/*
/datum/techweb_node/anomaly_research
	id = TECHWEB_NODE_ANOMALY_RESEARCH
	display_name = "Anomaly Research"
	description = "Delving into the study of mysterious anomalies to investigate methods to refine and harness their unpredictable energies."
	prereq_ids = list(TECHWEB_NODE_FUNDIMENTAL_SCI)
	design_ids = list(
		"anomaly_refinery",
		"anomaly_neutralizer",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE)

/datum/techweb_node/anomaly_shells
	id = TECHWEB_NODE_ANOMALY_SHELLS
	display_name = "Advanced Anomaly Shells"
	description = "New shells designed to utilize anomaly cores, maximizing their potential in innovative ways."
	prereq_ids = list(TECHWEB_NODE_ANOMALY_RESEARCH)
	design_ids = list(
		"gravitygun",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	discount_experiments = list(/datum/experiment/scanning/points/anomalies = TECHWEB_TIER_5_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE)
*/
