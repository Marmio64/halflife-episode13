/datum/crafting_recipe/usp
	name = "USP Match"
	result = /obj/item/gun/ballistic/automatic/pistol/usp/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/usp = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/makeshiftpistol
	name = "Makeshift Pistol"
	result = /obj/item/gun/ballistic/automatic/pistol/makeshift/no_mag
	reqs = list(/obj/item/stack/sheet/scrap_metal = 6)
	time = 12 SECONDS
	category = CAT_WEAPON_RANGED
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)

/datum/crafting_recipe/makeshiftpistolmag
	name = "9mm Makeshift Pistol Full Magazine"
	result = /obj/item/ammo_box/magazine/makeshift9mm
	reqs = list(/obj/item/stack/sheet/scrap_metal = 5,
				/obj/item/stack/cable_coil = 2,
				/datum/reagent/fuel = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 6 SECONDS
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/pistolbullet
	name = "9mm Bullet"
	result = /obj/item/ammo_casing/c9mm
	reqs = list(/obj/item/stack/sheet/iron = 1,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 2)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 0.5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/pistolmag
	name = "9mm USP Match Full Magazine"
	result = /obj/item/ammo_box/magazine/usp9mm
	reqs = list(/obj/item/stack/sheet/iron = 18,
				/obj/item/stack/cable_coil = 18,
				/datum/reagent/fuel = 36)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 9 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/revolver
	name = "Colt Python"
	result = /obj/item/gun/ballistic/revolver/coltpython
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/coltpython = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/magnumbullet
	name = "357 Magnum Bullet"
	result = /obj/item/ammo_casing/a357
	reqs = list(/obj/item/stack/sheet/iron = 1,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 5)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 0.5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/mp7
	name = "MP7"
	result = /obj/item/gun/ballistic/automatic/mp7/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/mp7 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/mp7bullet
	name = "4.6x30mm Bullet"
	result = /obj/item/ammo_casing/c46x30mm
	reqs = list(/obj/item/stack/sheet/iron = 1,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 1)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 0.3 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/mp7mag
	name = "4.6x30mm MP7 Full Magazine"
	result = /obj/item/ammo_box/magazine/mp7
	reqs = list(/obj/item/stack/sheet/iron = 40,
				/obj/item/stack/cable_coil = 40,
				/datum/reagent/fuel = 40)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 9 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/m4a1
	name = "M4A1"
	result = /obj/item/gun/ballistic/automatic/m4a1/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 7,
				/obj/item/weaponcrafting/frame/m4a1 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 2)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m4a1bullet
	name = "5.56 Bullet"
	result = /obj/item/ammo_casing/a556
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 5)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 0.5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/m4a1mag
	name = "5.56 M4A1 Full Magazine"
	result = /obj/item/ammo_box/magazine/m4a1
	reqs = list(/obj/item/stack/sheet/iron = 40,
				/obj/item/stack/cable_coil = 30,
				/datum/reagent/fuel = 60)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 20 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/spas12
	name = "SPAS12"
	result = /obj/item/gun/ballistic/shotgun/spas12
	reqs = list(/obj/item/stack/sheet/iron = 7,
				/obj/item/weaponcrafting/frame/spas12 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/buckshotshell
	name = "Buckshot Shell"
	result = /obj/item/ammo_casing/shotgun/buckshot
	reqs = list(/obj/item/stack/sheet/iron = 3,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 5)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/rubbershotshell
	name = "Rubbershot Shell"
	result = /obj/item/ammo_casing/shotgun/rubbershot
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 4)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING
