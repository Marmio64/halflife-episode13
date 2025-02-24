/datum/crafting_recipe/combineturret
	name = "Combine Turret"
	result = /obj/machinery/porta_turret/combine/off
	time = 15 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
		        /obj/item/stock_parts/scanning_module = 2,
				/obj/item/gun/ballistic/automatic/ar2,
				/obj/item/circuitmaterial = 2,
		        /obj/item/stack/cable_coil = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE

/datum/crafting_recipe/forcefield
	name = "Basic Forcefield"
	result = /obj/machinery/turnstile/brig/halflife/forcefield/nodirectional
	time = 15 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
		        /obj/item/stock_parts/micro_laser = 3,
				/obj/item/circuitmaterial = 2,
		        /obj/item/stack/cable_coil = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE

/datum/crafting_recipe/cpforcefield
	name = "Civil Protection Forcefield"
	result = /obj/machinery/turnstile/brig/halflife/forcefield/civilprotection/nodirectional
	time = 15 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
		        /obj/item/stock_parts/micro_laser = 3,
				/obj/item/circuitmaterial = 2,
		        /obj/item/stack/cable_coil = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE

/datum/crafting_recipe/maintforcefield
	name = "Engineering/Infestation Control Forcefield"
	result = /obj/machinery/turnstile/brig/halflife/forcefield/maint/nodirectional
	time = 15 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 10,
		        /obj/item/stock_parts/micro_laser = 3,
				/obj/item/circuitmaterial = 2,
		        /obj/item/stack/cable_coil = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE

/datum/crafting_recipe/heavycombinedoor
	name = "Heavy Combine Door Assembly"
	result = /obj/structure/door_assembly/door_assembly_highsecurity/combine
	time = 15 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 15,
				/obj/item/circuitmaterial = 2,
		        /obj/item/stack/cable_coil = 5)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE

/datum/crafting_recipe/heavycombinedoor
	name = "Metal Door"
	result = /obj/machinery/door/unpowered/halflife/metal
	time = 12 SECONDS
	reqs = list(/obj/item/stack/sheet/iron = 15)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_STRUCTURE
