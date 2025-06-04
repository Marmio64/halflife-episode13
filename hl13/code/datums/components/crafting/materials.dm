/datum/crafting_recipe/scrap_metal
	name = "Recombine Scrap Metal"
	result = /obj/item/stack/sheet/iron
	reqs = list(/obj/item/stack/sheet/scrap_metal = 3)
	time = 1 SECONDS
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_MISC

	mass_craftable = TRUE

/datum/crafting_recipe/scrap_metal_workbench
	name = "Recombine Scrap Metal (Workbench)"
	result = /obj/item/stack/sheet/iron
	reqs = list(/obj/item/stack/sheet/scrap_metal = 4)
	time = 1 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL

	mass_craftable = TRUE

/datum/crafting_recipe/scrounge_parts
	name = "Scrounge Apart Scrap Parts"
	result = /obj/item/stack/sheet/scrap_metal/three
	reqs = list(/obj/item/stack/sheet/scrap_parts = 1)
	time = 3 SECONDS
	category = CAT_MISC

/datum/crafting_recipe/breakdown_iron
	name = "Breakdown Iron"
	result = /obj/item/stack/sheet/scrap_metal/two
	reqs = list(/obj/item/stack/sheet/iron = 1)
	time = 2 SECONDS
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_MISC
	mass_craftable = TRUE

/datum/crafting_recipe/scrap_wood
	name = "Recombine Scrap Wood"
	result = /obj/item/stack/sheet/mineral/wood
	reqs = list(/obj/item/stack/sheet/mineral/scrap_wood = 2)
	time = 2 SECONDS
	category = CAT_MISC
	mass_craftable = TRUE

/datum/crafting_recipe/recycle_casings
	name = "Recycle Spent Casings"
	result = /obj/item/stack/bulletcasings
	reqs = list(/obj/item/ammo_casing = 5)
	time = 2 SECONDS
	category = CAT_WEAPON_AMMO
	mass_craftable = TRUE

/datum/crafting_recipe/make_casings
	name = "Create Casings"
	result = /obj/item/stack/bulletcasings
	reqs = list(/obj/item/stack/sheet/iron = 4)
	time = 2 SECONDS
	category = CAT_WEAPON_AMMO
	mass_craftable = TRUE
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/create_bullets
	name = "Create Uncased Bullets"
	result = /obj/item/stack/sheet/halflife/bullets
	reqs = list(/obj/item/stack/sheet/iron = 2)
	time = 2 SECONDS
	category = CAT_WEAPON_AMMO
	mass_craftable = TRUE
	crafting_interface = CRAFTING_BENCH_GENERAL | CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/scrap_can
	name = "Scrap Liquid Can"
	result = /obj/item/stack/sheet/scrap_metal
	reqs = list(/obj/item/trash/can = 1)
	time = 2 SECONDS
	category = CAT_MISC
