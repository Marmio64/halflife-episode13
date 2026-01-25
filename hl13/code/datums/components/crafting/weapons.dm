/datum/crafting_recipe/usp
	name = "USP Match"
	result = /obj/item/gun/ballistic/automatic/pistol/usp/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 3,
				/obj/item/weaponcrafting/frame/usp = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/mosin
	name = "Mosin-Nagant"
	result = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/mosin = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS


/datum/crafting_recipe/makeshiftpistol
	name = "Makeshift Pistol"
	result = /obj/item/gun/ballistic/automatic/pistol/makeshift/no_mag
	reqs = list(/obj/item/stack/sheet/scrap_metal = 7)
	time = 12 SECONDS
	category = CAT_WEAPON_RANGED
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH)

/datum/crafting_recipe/makeshiftpistolmag
	name = "9mm Makeshift Pistol Full Magazine"
	result = /obj/item/ammo_box/magazine/makeshift9mm
	reqs = list(/obj/item/stack/sheet/scrap_metal = 6,
				/obj/item/stack/cable_coil = 2,
				/datum/reagent/fuel = 10)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 6 SECONDS
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/pistolmag
	name = "9mm USP Match Full Magazine"
	result = /obj/item/ammo_box/magazine/usp9mm
	reqs = list(/obj/item/stack/bulletcasings = 3,
				/obj/item/stack/sheet/halflife/bullets = 3,
				/datum/reagent/fuel = 30)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 6 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/mosinclip
	name = "7.62mm full Mosin-Nagant clip"
	result = /obj/item/ammo_box/strilka310/a762
	reqs = list(/obj/item/stack/bulletcasings = 1,
				/obj/item/stack/sheet/halflife/bullets = 1,
				/datum/reagent/fuel = 30)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 8 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/// Far quicker to make than 3 magazines, and more space efficient.
/datum/crafting_recipe/pistolbox
	name = "9mm USP Match Full Ammo Box"
	result = /obj/item/ammo_box/halflife/c9mm
	reqs = list(/obj/item/stack/bulletcasings = 9,
				/obj/item/stack/sheet/halflife/bullets = 9,
				/datum/reagent/fuel = 90)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 5 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/revolver
	name = "Colt Python"
	result = /obj/item/gun/ballistic/revolver/coltpython
	reqs = list(/obj/item/stack/sheet/iron = 3,
				/obj/item/weaponcrafting/frame/coltpython = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/magnumloader
	name = "357 Magnum Speed Loader"
	result = /obj/item/ammo_box/colta357
	reqs = list(/obj/item/stack/bulletcasings = 2,
				/obj/item/stack/sheet/halflife/bullets = 1,
				/datum/reagent/fuel = 25)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 10 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/mp7
	name = "MP7"
	result = /obj/item/gun/ballistic/automatic/mp7/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 3,
				/obj/item/weaponcrafting/frame/mp7 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/mp7mag
	name = "4.6x30mm MP7 Full Magazine"
	result = /obj/item/ammo_box/magazine/mp7
	reqs = list(/obj/item/stack/bulletcasings = 9,
				/obj/item/stack/sheet/halflife/bullets = 9,
				/datum/reagent/fuel = 30)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 7 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/// Far quicker to make than 3 magazines, and more space efficient.
/datum/crafting_recipe/mp7box
	name = "4.6x30mm MP7 Full Ammo Box"
	result = /obj/item/ammo_box/halflife/c46x30mm
	reqs = list(/obj/item/stack/bulletcasings = 27,
				/obj/item/stack/sheet/halflife/bullets = 27,
				/datum/reagent/fuel = 90)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 6 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/m4a1
	name = "M4A1"
	result = /obj/item/gun/ballistic/automatic/m4a1/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/m4a1 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 2)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/service
	name = "Service Rifle"
	result = /obj/item/gun/ballistic/automatic/servicerifle/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/service = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 2)
	time = 7 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/service/wooden
	name = "Service Rifle (Wood-Furnished)"
	result = /obj/item/gun/ballistic/automatic/servicerifle/wood/no_mag
	reqs = list(/obj/item/stack/sheet/iron = 4,
				/obj/item/stack/sheet/mineral/wood = 2,
				/obj/item/weaponcrafting/frame/service = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 2)
	time = 7 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/m4a1mag
	name = "5.56 M4A1 Full Magazine"
	result = /obj/item/ammo_box/magazine/m4a1
	reqs = list(/obj/item/stack/bulletcasings = 6,
				/obj/item/stack/sheet/halflife/bullets = 6,
				/datum/reagent/fuel = 30)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 12 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/servicemag
	name = "5.56 Service Rifle Full Magazine"
	result = /obj/item/ammo_box/magazine/m4a1/service
	reqs = list(/obj/item/stack/bulletcasings = 4,
				/obj/item/stack/sheet/halflife/bullets = 4,
				/datum/reagent/fuel = 30)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 10 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/spas12
	name = "SPAS12"
	result = /obj/item/gun/ballistic/shotgun/spas12
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/weaponcrafting/frame/spas12 = 1,
				/obj/item/weaponcrafting/receiver = 1,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS

/datum/crafting_recipe/buckshotshell
	name = "Buckshot Shell"
	result = /obj/item/ammo_casing/shotgun/buckshot/halflife
	reqs = list(/obj/item/stack/sheet/halflife/bullets = 1,
				/datum/reagent/fuel = 5)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/rubbershotshell
	name = "Rubbershot Shell"
	result = /obj/item/ammo_casing/shotgun/rubbershot
	reqs = list(/obj/item/stack/sheet/halflife/plastic = 1,
				/datum/reagent/fuel = 4)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO
	crafting_interface = CRAFTING_BENCH_RELOADING

/datum/crafting_recipe/rebarxbow
	name = "Heated Rebar Crossbow"
	result = /obj/item/gun/ballistic/rifle/rebarxbow
	reqs = list(
		/obj/item/stack/rods = 6,
		/obj/item/stack/cable_coil = 12,
		/obj/item/lighter =  1,
	)
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/rebarxbowforced
	name = "Forced Rebar Crossbow"
	desc = "A much quicker reload... for a chance of shooting yourself when you fire it."
	result = /obj/item/gun/ballistic/rifle/rebarxbow/forced
	reqs = list(
		/obj/item/gun/ballistic/rifle/rebarxbow = 1,
	)
	blacklist = list(
	/obj/item/gun/ballistic/rifle/rebarxbow/forced,
	/obj/item/gun/ballistic/rifle/rebarxbow/syndie,
	)
	tool_behaviors = list(TOOL_CROWBAR)
	time = 1 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/halflife_molotov
	name = "Molotov"
	result = /obj/item/grenade/halflife/molotov
	reqs = list(
		/obj/item/stack/sheet/cloth = 1,
		/obj/item/reagent_containers/cup/glass/bottle = 1,
		/datum/reagent/consumable/ethanol = 30,
	)
	blacklist = list(
	/datum/reagent/consumable/ethanol/fake,
	)
	time = 3 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/halflife_tinbomb
	name = "Tinbomb"
	result = /obj/item/grenade/halflife/tinbomb
	reqs = list(
		/obj/item/stack/sheet/scrap_metal = 8,
		/datum/reagent/fuel = 30,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/halflife_spear_taped
	name = "Spear (Taped)"
	result = /obj/item/spear/halflife
	reqs = list(
		/obj/item/woodshaft = 1,
		/obj/item/stack/sticky_tape = 1,
		/obj/item/stack/sheet/scrap_metal = 5,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/halflife_spear_sinew
	name = "Spear (Sinew-Held)"
	result = /obj/item/spear/halflife
	reqs = list(
		/obj/item/woodshaft = 1,
		/obj/item/stack/sheet/sinew = 2,
		/obj/item/stack/sheet/scrap_metal = 5,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/halflife_woodshaft
	name = "Wooden Shaft"
	result = /obj/item/woodshaft
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 4)
	tool_behaviors = list(TOOL_KNIFE)
	time = 5 SECONDS
	category = CAT_WEAPON_MELEE

//Cheap basic weapon, though needs a crafting bench
/datum/crafting_recipe/tireiron
	name = "Tire Iron"
	result = /obj/item/melee/tireiron
	reqs = list(
		/obj/item/stack/sheet/scrap_metal = 8,
	)
	time = 8 SECONDS
	category = CAT_WEAPON_MELEE
	crafting_interface = CRAFTING_BENCH_WEAPONS | CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/stunbaton
	name = "Stun Baton"
	result = /obj/item/melee/baton/security/loaded
	reqs = list(
		/obj/item/stack/sheet/iron = 6,
		/obj/item/halflife/combine_battery = 1,
		/obj/item/circuitmaterial/advanced = 1,
	)
	time = 8 SECONDS
	category = CAT_WEAPON_MELEE
	crafting_interface = CRAFTING_BENCH_WEAPONS

///////////// must be learned stuff ////////////////////

/datum/crafting_recipe/usp_frame
	name = "USP Match Frame"
	result = /obj/item/weaponcrafting/frame/usp
	reqs = list(/obj/item/stack/sheet/iron = 5,
				/obj/item/stack/sheet/scrap_parts = 2,
				/obj/item/stack/sticky_tape = 1)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_interface = CRAFTING_BENCH_WEAPONS
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/halflife_spear_fine
	name = "Spear (Finely Made)"
	result = /obj/item/spear/halflife/deathmatch
	reqs = list(
		/obj/item/woodshaft = 1,
		/obj/item/stack/sticky_tape = 1,
		/obj/item/stack/sheet/iron = 3,
	)
	time = 12 SECONDS
	category = CAT_WEAPON_MELEE
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/bonedagger_fine
	name = "Bone Dagger (Finely Made)"
	result = /obj/item/knife/combat/bone/fine
	time = 5 SECONDS
	reqs = list(/obj/item/stack/sheet/bone = 3, /obj/item/stack/sheet/sinew = 1)
	category = CAT_WEAPON_MELEE
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED
