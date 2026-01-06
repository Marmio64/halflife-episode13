/datum/crafting_recipe/handradio
	name = "Handheld Radio"
	result = /obj/item/radio/off/halflife
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial = 1,
				/obj/item/stack/cable_coil = 3)
	time = 4 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

//Awful, but its quite cheap, and doesn't even need an electrical bench.
/datum/crafting_recipe/flashlight_makeshift
	name = "Makeshift Flashlight"
	result = /obj/item/flashlight/makeshift
	reqs = list(/obj/item/stack/sheet/scrap_metal = 2,
				/obj/item/stack/sheet/scrap_copper = 1,
				/obj/item/light/bulb = 1)
	time = 4 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/flashlight
	name = "Flashlight"
	result = /obj/item/flashlight
	reqs = list(/obj/item/stack/sheet/iron = 1,
				/obj/item/circuitmaterial = 1,
				/obj/item/light/bulb = 1,
				/obj/item/stack/cable_coil = 2)
	time = 4 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/maglite
	name = "Maglite"
	result = /obj/item/flashlight/seclite
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/light/bulb = 1,
				/obj/item/stack/cable_coil = 2)
	time = 4 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/combine_battery
	name = "Charged Combine Battery"
	result = /obj/item/halflife/combine_battery
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial = 1,
				/obj/item/stack/sheet/scrap_copper = 1)
	time = 4 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/circuitchips
	name = "Circuit Chips"
	result = /obj/item/circuitmaterial
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/stack/sheet/glass = 1,
				/obj/item/stack/sheet/scrap_copper = 1,
				/obj/item/stack/cable_coil = 2)
	time = 4 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/advancedcircuitchips
	name = "Advanced Circuit Chips"
	result = /obj/item/circuitmaterial/advanced
	reqs = list(/obj/item/stack/sheet/mineral/diamond = 2,
				/obj/item/stack/sheet/scrap_copper = 1,
				/obj/item/stack/sheet/mineral/gold = 1,
				/obj/item/circuitmaterial = 2)
	time = 6 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/scrap_advcircuitchips
	name = "Scrap Advanced Circuit Chips"
	result = /obj/item/circuitmaterial
	reqs = list(/obj/item/circuitmaterial/advanced = 1)
	time = 4 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/combineturret
	name = "Combine AR2 Turret"
	result = /obj/machinery/porta_turret/combine/off
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/gun/ballistic/automatic/ar2 = 1)
	time = 6 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/combineturretmp7
	name = "Combine MP7 Turret"
	result = /obj/machinery/porta_turret/combine/mp7/off
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/gun/ballistic/automatic/mp7 = 1)
	time = 6 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/viscerator
	name = "Viscerator"
	result = /obj/item/grenade/spawnergrenade/manhacks
	time = 5 SECONDS
	reqs = list(
		/obj/item/machinepiece/viscerator = 1,
		/obj/item/circuitmaterial = 1,
		/obj/item/stack/cable_coil = 5
	)
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/cityscanner
	name = "City Scanner"
	result = /obj/effect/mob_spawn/ghost_role/cityscanner
	time = 5 SECONDS
	reqs = list(
		/obj/item/machinepiece/scanner = 1,
		/obj/item/circuitmaterial = 1,
		/obj/item/halflife/combine_battery = 1,
		/obj/item/stack/cable_coil = 5
	)
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/destabilizer
	name = "Destabilizer"
	result = /obj/machinery/destabilizer/makeshift
	reqs = list(/obj/item/halflife/antenna = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/circuitmaterial = 1)
	time = 6 SECONDS
	category = CAT_ROBOT

/datum/crafting_recipe/destabilizer_antenna
	name = "Destabilizer Antenna"
	result = /obj/item/halflife/antenna
	reqs = list(/obj/item/factory_construction/full_container/advanced/electronics = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/iron = 1,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/circuitmaterial = 1)
	time = 12 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/alyxtool
	name = "Hacking Multitool"
	result = /obj/item/card/emag/halflife
	reqs = list(/obj/item/stack/sheet/iron = 1,
				/obj/item/machinepiece/multifunctiontool = 1,
				/obj/item/circuitmaterial = 2)
	time = 10 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/alyxtool_frame
	name = "Broken Hacking Multitool Frame"
	result = /obj/item/machinepiece/multifunctiontool
	reqs = list(/obj/item/stack/sheet/iron = 3,
				/obj/item/circuitmaterial/advanced = 2,
				/obj/item/stack/cable_coil = 10)
	time = 10 SECONDS
	category = CAT_EQUIPMENT
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/musicradio
	name = "Music Radio"
	result = /obj/machinery/jukebox/radio
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/circuitmaterial = 2)
	time = 10 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/cablecoil
	name = "Cable Coil (30x)"
	result = /obj/item/stack/cable_coil
	reqs = list(/obj/item/stack/sheet/scrap_copper = 3, /obj/item/stack/sheet/halflife/plastic = 5)
	time = 8 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_ELECTRIC

/datum/crafting_recipe/strip_cablecoil
	name = "Strip Copper From Cables"
	result = /obj/item/stack/sheet/scrap_copper/three
	reqs = list(/obj/item/stack/cable_coil = 30)
	time = 5 SECONDS
	category = CAT_ROBOT
	tool_behaviors = list(TOOL_KNIFE)

/datum/crafting_recipe/super_destabilizer
	name = "Super Destabilizer Beacon"
	result = /obj/item/super_destabilizer_beacon
	reqs = list(/obj/item/halflife/antenna = 1,
				/obj/item/stack/sheet/iron = 5,
				/obj/item/circuitmaterial/advanced = 1,
				/obj/item/circuitmaterial = 3)
	time = 10 SECONDS
	category = CAT_ROBOT
	crafting_interface = CRAFTING_BENCH_ELECTRIC
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED
