/datum/crafting_recipe/paperball
	name = "Paper Ball"
	result = /obj/item/ammo_casing/rebar/paperball
	reqs = list(
		/obj/item/paper = 1,
	)
	time = 0.1 SECONDS
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/rebarsyndie
	name = "jagged iron rod"
	result = /obj/item/ammo_casing/rebar/syndie
	reqs = list(
		/obj/item/stack/rods = 1,
	)
	tool_behaviors = list(TOOL_WIRECUTTER)
	time = 0.1 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/improvisedslug
	name = "Junk Shell"
	result = /obj/effect/spawner/random/junk_shell
	reqs = list(
		/obj/item/stack/sheet/iron = 2,
		/obj/item/stack/cable_coil = 1,
		/obj/item/shard = 1,
		/datum/reagent/fuel = 10,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 1.2 SECONDS
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/trashball
	name = "Trashball"
	result = /obj/item/stack/cannonball/trashball
	reqs = list(
		/obj/item/stack/sheet = 5,
		/datum/reagent/consumable/space_cola = 10,
	)
	category = CAT_WEAPON_AMMO
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/arrow
	name = "Arrow"
	result = /obj/item/ammo_casing/arrow
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 1,
		/obj/item/stack/sheet/cloth = 1,
		/obj/item/stack/sheet/iron = 1,
	)
	tool_paths = list(
		/obj/item/hatchet,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/plastic_arrow
	name = "Plastic Arrow"
	result = /obj/item/ammo_casing/arrow/plastic
	reqs = list(
		/obj/item/stack/sheet/plastic = 1,
	)
	tool_paths = list(
		/obj/item/hatchet,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED


/datum/crafting_recipe/holy_arrow
	name = "Holy Arrow"
	result = /obj/item/ammo_casing/arrow/holy
	reqs = list(
		/obj/item/ammo_casing/arrow = 1,
		/datum/reagent/water/holywater = 10,
	)
	tool_paths = list(
		/obj/item/gun/ballistic/bow/divine,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED
