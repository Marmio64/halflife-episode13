/datum/techweb_node/augmentation
	id = TECHWEB_NODE_AUGMENTATION
	starting_node = TRUE
	display_name = "Augmentation"
	description = "For those who prefer shiny metal over squishy flesh."
	prereq_ids = list(TECHWEB_NODE_ROBOTICS)
	design_ids = list(
		//"borg_chest",
		//"borg_head",
		"borg_l_arm",
		"borg_l_leg",
		"borg_r_arm",
		"borg_r_leg",
		"borg_suit",
		"cybernetic_eyes",
		"cybernetic_eyes_moth",
		"cybernetic_ears",
		"cybernetic_lungs",
		"cybernetic_stomach",
		"cybernetic_liver",
		"cybernetic_heart",
	)
	experiments_to_unlock = list(
		/datum/experiment/scanning/people/android,
	)

/datum/techweb_node/cybernetics
	id = TECHWEB_NODE_CYBERNETICS
	display_name = "Cybernetics"
	description = "Sapient robots with preloaded tool modules and programmable laws."
	prereq_ids = list(TECHWEB_NODE_AUGMENTATION)
	design_ids = list(
		"robocontrol",
		"borgupload",
		"cyborgrecharger",
		"mmi_posi",
		"mmi",
		"mmi_m",
		"advanced_l_arm",
		"advanced_r_arm",
		"advanced_l_leg",
		"advanced_r_leg",
		"borg_upgrade_rename",
		"borg_upgrade_restart",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE)

// Implants root node
/datum/techweb_node/passive_implants
	id = TECHWEB_NODE_PASSIVE_IMPLANTS
	display_name = "Passive Implants"
	description = "Implants designed to operate seamlessly without active user input, enhancing various physiological functions or providing continuous benefits."
	prereq_ids = list(TECHWEB_NODE_AUGMENTATION)
	design_ids = list(
		"skill_station",
		"implant_trombone",
		"implant_chem",
		"implant_tracking",
		"implant_exile",
		"implant_beacon",
		"implant_bluespace",
		"implantcase",
		"implanter",
		"locator",
		"c38_trac",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	announce_channels = list(RADIO_CHANNEL_SECURITY, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/cyber_implants
	id = TECHWEB_NODE_CYBER_IMPLANTS
	display_name = "Cybernetic Implants"
	description = "Advanced technological enhancements integrated into the body, offering improved physical capabilities."
	prereq_ids = list(TECHWEB_NODE_PASSIVE_IMPLANTS, TECHWEB_NODE_CYBERNETICS)
	design_ids = list(
		"ci-breather",
		"ci-nutriment",
		"ci-thrusters",
		"ci-herculean",
		"ci-connector",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs[TECHWEB_POINT_TYPE_GENERIC] /= 2

/datum/techweb_node/cyber/combat_implants
	id = TECHWEB_NODE_COMBAT_IMPLANTS
	display_name = "Combat Implants"
	description = "To make sure that you can wake the f*** up, samurai."
	prereq_ids = list(TECHWEB_NODE_CYBER_IMPLANTS)
	design_ids = list(
		"ci-reviver",
		"ci-antidrop",
		"ci-antistun",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/integrated_toolsets
	id = TECHWEB_NODE_INTERGRATED_TOOLSETS
	display_name = "Integrated Toolsets"
	description = "Decades of contraband smuggling by citizens have led to the development of a full toolbox that fits seamlessly into your arm."
	prereq_ids = list(TECHWEB_NODE_COMBAT_IMPLANTS)
	design_ids = list(
		"ci-nutrimentplus",
		"ci-toolset",
		"ci-surgery",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/cyber_organs
	id = TECHWEB_NODE_CYBER_ORGANS
	display_name = "Cybernetic Organs"
	description = "We have the technology to rebuild him."
	prereq_ids = list(TECHWEB_NODE_CYBERNETICS)
	design_ids = list(
		"cybernetic_eyes_improved",
		"cybernetic_eyes_improved_moth",
		"cybernetic_ears_u",
		"cybernetic_lungs_tier2",
		"cybernetic_stomach_tier2",
		"cybernetic_liver_tier2",
		"cybernetic_heart_tier2",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/cyber_organs_upgraded
	id = TECHWEB_NODE_CYBER_ORGANS_UPGRADED
	display_name = "Upgraded Cybernetic Organs"
	description = "We have the technology to upgrade him."
	prereq_ids = list(TECHWEB_NODE_CYBER_ORGANS)
	design_ids = list(
		"ci-gloweyes",
		"ci-welding",
		"cybernetic_ears_whisper",
		"cybernetic_lungs_tier3",
		"cybernetic_stomach_tier3",
		"cybernetic_liver_tier3",
		"cybernetic_heart_tier3",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	required_experiments = list(/datum/experiment/scanning/people/augmented_organs)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)

/datum/techweb_node/cyber/cyber_organs_adv
	id = TECHWEB_NODE_CYBER_ORGANS_ADV
	display_name = "Advanced Cybernetic Organs"
	description = "Cutting-edge cybernetic organs offering enhanced sensory capabilities, making it easier than ever to detect external rebel plans."
	prereq_ids = list(TECHWEB_NODE_CYBER_ORGANS_UPGRADED, TECHWEB_NODE_NIGHT_VISION)
	design_ids = list(
		"cybernetic_ears_xray",
		"ci-thermals",
		"ci-xray",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	discount_experiments = list(/datum/experiment/scanning/people/android = TECHWEB_TIER_5_POINTS)
	announce_channels = list(RADIO_CHANNEL_SCIENCE, RADIO_CHANNEL_MEDICAL)
