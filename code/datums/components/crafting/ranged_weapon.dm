/datum/crafting_recipe/receiver
	name = "Modular Firearm Receiver"
	tool_behaviors = list(TOOL_WRENCH, TOOL_WELDER)
	result = /obj/item/weaponcrafting/receiver
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/sticky_tape = 1,
		/obj/item/screwdriver = 1,
	)
	time = 12 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/riflestock
	name = "Wooden Rifle Stock"
	tool_paths = list(/obj/item/hatchet)
	result = /obj/item/weaponcrafting/stock
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 8,
		/obj/item/stack/sticky_tape = 1,
	)
	time = 5 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/pipegun_prime
	name = "Regal Pipegun"
	result = /obj/item/gun/ballistic/rifle/boltaction/pipegun/prime
	reqs = list(
		/obj/item/gun/ballistic/rifle/boltaction/pipegun = 1,
		/obj/item/food/deadmouse = 1,
		/datum/reagent/consumable/grey_bull = 20,
		/obj/item/spear = 1,
		/obj/item/storage/toolbox = 1,
		/obj/item/clothing/head/costume/crown = 1, // Any ol' crown will do
	)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/clothing/gloves/color/yellow, /obj/item/clothing/mask/gas, /obj/item/melee/baton/security/cattleprod)
	time = 15 SECONDS //contemplate for a bit
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/deagle_prime //When you factor in the makarov (7 tc), the toolbox (1 tc), and the emag (3 tc), this comes to a total of 18 TC or thereabouts. Igorning the 20k pricetag, obviously.
	name = "Regal Condor"
	result = /obj/item/gun/ballistic/automatic/pistol/deagle/regal
	reqs = list(
		/obj/item/gun/ballistic/automatic/pistol = 1,
		/obj/item/stack/sheet/mineral/gold = 25,
		/obj/item/stack/sheet/mineral/silver = 25,
		/obj/item/food/donkpocket = 1,
		/obj/item/stack/telecrystal = 4,
		/obj/item/clothing/head/costume/crown/fancy = 1, //the captain's crown
		/obj/item/storage/toolbox/syndicate = 1,
		/obj/item/stack/sheet/iron = 10,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(
		/obj/item/clothing/under/syndicate,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/card/emag
	)
	time = 30 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/deagle_prime/New()
	..()
	blacklist += subtypesof(/obj/item/gun/ballistic/automatic/pistol)

/datum/crafting_recipe/deagle_prime_mag
	name = "Regal Condor Magazine (10mm Reaper)"
	result = /obj/item/ammo_box/magazine/r10mm
	reqs = list(
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/sheet/mineral/gold = 10,
		/obj/item/stack/sheet/mineral/silver = 10,
		/obj/item/stack/sheet/mineral/plasma = 10,
		/obj/item/food/donkpocket = 1, //Station mass murder, as sponsored by Donk Co.
	)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER)
	tool_paths = list(
		/obj/item/clothing/under/syndicate,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/card/emag,
		/obj/item/gun/ballistic/automatic/pistol/deagle/regal
	)
	time = 5 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/trash_cannon
	name = "Trash Cannon"
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	result = /obj/structure/cannon/trash
	reqs = list(
		/obj/item/melee/skateboard/improvised = 1,
		/obj/item/tank/internals/oxygen = 1,
		/datum/reagent/drug/maint/tar = 15,
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/storage/toolbox = 1,
	)
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/laser_musket_prime
	name = "Heroic Laser Musket"
	result = /obj/item/gun/energy/laser/musket/prime
	reqs = list(
		/obj/item/gun/energy/laser/musket = 1,
		/obj/item/stack/cable_coil = 15,
		/obj/item/stack/sheet/mineral/silver = 5,
		/obj/item/stock_parts/water_recycler = 1,
		/datum/reagent/consumable/nuka_cola = 15,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	tool_paths = list(/obj/item/clothing/head/cowboy, /obj/item/clothing/shoes/cowboy)
	time = 30 SECONDS //contemplate for a bit
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/smoothbore_disabler_prime
	name = "Elite Smoothbore Disabler"
	result = /obj/item/gun/energy/disabler/smoothbore/prime
	reqs = list(
		/obj/item/gun/energy/disabler/smoothbore = 1,
		/obj/item/stack/sheet/mineral/gold = 5,
		/obj/item/stock_parts/power_store/cell/hyper = 1,
		/datum/reagent/reaction_agent/speed_agent = 10,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER)
	time = 20 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/shortbow
	name = "Shortbow"
	result = /obj/item/gun/ballistic/bow/shortbow
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 4,
		/obj/item/stack/sheet/cloth = 2,
		/obj/item/stack/sheet/iron = 1,
	)
	tool_paths = list(
		/obj/item/hatchet,
	)
	time = 30 SECONDS
	category = CAT_WEAPON_RANGED
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

