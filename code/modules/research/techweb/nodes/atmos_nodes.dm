/datum/techweb_node/atmos
	id = TECHWEB_NODE_ATMOS
	starting_node = TRUE
	display_name = "Atmospherics"
	description = "Maintaining district air and related life support systems. Usually unnessecary"
	design_ids = list(
		"atmos_control",
		"atmosalerts",
		"thermomachine",
		"space_heater",
		"scrubber",
		"generic_tank",
		"oxygen_tank",
		"plasma_tank",
		"plasmaman_tank_belt",
		"plasmarefiller",
		"extinguisher",
		"gas_filter",
		"plasmaman_gas_filter",
		"analyzer",
		"pipe_painter",
	)

/datum/techweb_node/gas_compression
	id = TECHWEB_NODE_GAS_COMPRESSION
	display_name = "Gas Compression"
	description = "Highly pressurized gases hold potential for unlocking immense energy capabilities."
	prereq_ids = list(TECHWEB_NODE_ATMOS)
	design_ids = list(
		"tank_compressor",
		"pump",
		"emergency_oxygen",
		"emergency_oxygen_engi",
		"power_turbine_console",
		"turbine_part_compressor",
		"turbine_part_rotor",
		"turbine_part_stator",
		"turbine_compressor",
		"turbine_rotor",
		"turbine_stator",
		"atmos_thermal",
		"pneumatic_seal",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_1_POINTS)
	experiments_to_unlock = list(
		/datum/experiment/ordnance/gaseous/plasma,
		/datum/experiment/ordnance/gaseous/nitrous_oxide,
		/datum/experiment/ordnance/gaseous/bz,
		/datum/experiment/ordnance/gaseous/noblium,
	)
	announce_channels = list(RADIO_CHANNEL_ENGINEERING)

/datum/techweb_node/plasma_control
	id = TECHWEB_NODE_PLASMA_CONTROL
	display_name = "Controlled Plasma"
	description = "Experiments with high-pressure gases and electricity resulting in crystallization and controlled plasma reactions."
	prereq_ids = list(TECHWEB_NODE_GAS_COMPRESSION, TECHWEB_NODE_ENERGY_MANIPULATION)
	design_ids = list(
		"plasmacutter",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS)
	discount_experiments = list(/datum/experiment/ordnance/gaseous/plasma = TECHWEB_TIER_2_POINTS)
	announce_channels = list(RADIO_CHANNEL_ENGINEERING)
