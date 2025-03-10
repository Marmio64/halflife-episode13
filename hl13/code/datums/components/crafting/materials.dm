/datum/crafting_recipe/scrap_metal
	name = "Recombine Scrap Metal"
	result = /obj/item/stack/sheet/iron
	reqs = list(/obj/item/stack/sheet/scrap_metal = 2)
	time = 1 SECONDS
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_MISC

/datum/crafting_recipe/scrap_wood
	name = "Recombine Scrap Wood"
	result = /obj/item/stack/sheet/mineral/wood
	reqs = list(/obj/item/stack/sheet/mineral/scrap_wood = 2)
	time = 2 SECONDS
	category = CAT_MISC

/datum/crafting_recipe/recycle_casings
	name = "Recycle Spent Casings"
	result = /obj/item/stack/bulletcasings
	reqs = list(/obj/item/ammo_casing = 5)
	time = 3 SECONDS
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/make_casings
	name = "Create Casings"
	result = /obj/item/stack/bulletcasings
	reqs = list(/obj/item/stack/sheet/iron = 5)
	time = 3 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_GENERAL
