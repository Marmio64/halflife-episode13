/datum/crafting_recipe/stunprod
	name = "Stunprod"
	result = /obj/item/melee/baton/security/cattleprod
	reqs = list(
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/stack/rods = 1,
		/obj/item/assembly/igniter = 1,
	)
	time = 4 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/chainsaw
	name = "Chainsaw"
	result = /obj/item/chainsaw
	reqs = list(
		/obj/item/circular_saw = 1,
		/obj/item/stack/cable_coil = 3,
		/obj/item/stack/sheet/plasteel = 5,
	)
	tool_behaviors = list(TOOL_WELDER)
	time = 5 SECONDS
	category = CAT_WEAPON_MELEE
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/spear
	name = "Spear"
	result = /obj/item/spear
	reqs = list(
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/shard = 1,
		/obj/item/stack/rods = 1,
	)
	parts = list(/obj/item/shard = 1)
	time = 4 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/bonedagger
	name = "Bone Dagger"
	result = /obj/item/knife/combat/bone
	time = 2 SECONDS
	reqs = list(/obj/item/stack/sheet/bone = 2)
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/bonespear
	name = "Bone Spear"
	result = /obj/item/spear/bonespear
	time = 3 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 5,
		/obj/item/stack/sheet/sinew = 2,
	)
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/house_edge
	name = "House Edge"
	result = /obj/item/house_edge
	tool_behaviors = list(TOOL_WRENCH, TOOL_SCREWDRIVER, TOOL_WELDER)
	reqs = list(
		/obj/item/v8_engine = 1,
		/obj/item/weaponcrafting/receiver = 1,
		/obj/item/assembly/igniter = 1,
		/obj/item/stack/sheet/iron = 2,
		/obj/item/knife = 1,
		/obj/item/weldingtool = 1,
		/obj/item/roulette_wheel_beacon = 1,
	)
	time = 10 SECONDS
	category = CAT_WEAPON_MELEE
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

