/datum/crafting_recipe/strobeshield
	name = "Strobe Shield"
	result = /obj/item/shield/riot/flash
	reqs = list(
		/obj/item/wallframe/flasher = 1,
		/obj/item/assembly/flash/handheld = 1,
		/obj/item/shield/riot = 1,
	)
	time = 4 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/strobeshield/New()
	..()
	blacklist |= subtypesof(/obj/item/shield/riot)

/datum/crafting_recipe/improvisedshield
	name = "Improvised Shield"
	result = /obj/item/shield/improvised
	reqs = list(
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/sticky_tape = 2,
	)
	time = 4 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/radiogloves
	name = "Radio Gloves"
	result = /obj/item/clothing/gloves/radio
	time = 1.5 SECONDS
	reqs = list(
		/obj/item/clothing/gloves/color/black = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/radio = 1,
	)
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/radiogloves/New()
	..()
	blacklist |= typesof(/obj/item/radio/headset)
	blacklist |= typesof(/obj/item/radio/intercom)

/datum/crafting_recipe/wheelchair
	name = "Wheelchair"
	result = /obj/vehicle/ridden/wheelchair
	reqs = list(
		/obj/item/stack/sheet/iron = 4,
		/obj/item/stack/rods = 6,
	)
	time = 10 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/secured_freezer_cabinet
	name = "Secure Freezer Cabinet"
	result = /obj/structure/closet/secure_closet/freezer/empty
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/assembly/igniter/condenser = 1,
		/obj/item/electronics/airlock = 1,
	)
	parts = list(
		/obj/item/electronics/airlock = 1,
	)
	time = 5 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/secure_closet
	name = "Secure Closet"
	result = /obj/structure/closet/secure_closet
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/electronics/airlock = 1,
	)
	parts = list(
		/obj/item/electronics/airlock = 1,
	)
	time = 5 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/trapdoor_kit
	name = "Trapdoor Construction Kit"
	result = /obj/item/trapdoor_kit
	reqs = list(
		/obj/item/stack/sheet/iron = 4,
		/obj/item/stack/rods = 4,
		/obj/item/stack/cable_coil = 10,
		/obj/item/stock_parts/servo = 2,
		/obj/item/assembly/signaler = 1,
	)
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	time = 10 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/trapdoor_remote
	name = "Trapdoor Remote"
	result = /obj/item/trapdoor_remote/preloaded // since its useless without its assembly just require an assembly to craft it
	reqs = list(
		/obj/item/compact_remote = 1,
		/obj/item/stack/cable_coil = 5,
		/obj/item/assembly/trapdoor = 1,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 5 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/mousetrap
	name = "Mouse Trap"
	result = /obj/item/assembly/mousetrap
	time = 1 SECONDS
	reqs = list(
		/obj/item/stack/sheet/cardboard = 1,
		/obj/item/stack/rods = 1,
	)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/material_sniffer
	name = "Material Sniffer"
	time = 3 SECONDS
	reqs = list(
		/obj/item/analyzer = 1,
		/obj/item/stack/cable_coil = 5,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/pinpointer/material_sniffer
	category = CAT_EQUIPMENT

/datum/crafting_recipe/pressureplate
	name = "Pressure Plate"
	result = /obj/item/pressure_plate
	time = 0.5 SECONDS
	reqs = list(
		/obj/item/stack/sheet/iron = 1,
		/obj/item/stack/tile/iron = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/assembly/igniter = 1,
	)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/gripperoffbrand
	name = "Improvised Gripper Gloves"
	reqs = list(
		/obj/item/clothing/gloves/fingerless = 1,
		/obj/item/stack/sticky_tape = 1,
	)
	result = /obj/item/clothing/gloves/tackler/offbrand
	category = CAT_EQUIPMENT

/datum/crafting_recipe/rebar_quiver
	name = "Rebar Storage Quiver"
	result = /obj/item/storage/bag/rebar_quiver
	time = 10
	reqs = list(
		/obj/item/tank/internals/oxygen = 1,
		/obj/item/stack/cable_coil = 15,
	)
	category = CAT_EQUIPMENT
	tool_behaviors = list(TOOL_WELDER, TOOL_WIRECUTTER)

