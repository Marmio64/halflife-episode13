/datum/supply_pack/security
	group = "Security"
	access = ACCESS_SECURITY
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/security/armor
	name = "Armor Crate"
	desc = "Three additional metropolice standard issue protective vests."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/suit/armor/civilprotection,
					/obj/item/clothing/suit/armor/civilprotection,
					/obj/item/clothing/suit/armor/civilprotection)
	crate_name = "armor crate"

/datum/supply_pack/security/riotarmor
	name = "Riot Armor Crate"
	desc = "Two sets of riot control armor that excels at stopping blunt force trauma, cuts, and lacerations from close range. Does little against firearms, however."
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/head/helmet/toggleable/riot,
					/obj/item/clothing/head/helmet/toggleable/riot)
	crate_name = "riot armor crate"

/datum/supply_pack/security/baton
	name = "Stun Baton Crate"
	desc = "Three unloaded stun batons that require power cells."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/melee/baton,
					/obj/item/melee/baton,
					/obj/item/melee/baton)
	crate_name = "baton crate"

/datum/supply_pack/security/riotshield
	name = "Riot Shield Crate"
	desc = "Three riot shields designed for blocking melee attacks."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/shield/riot,
					/obj/item/shield/riot,
					/obj/item/shield/riot)
	crate_name = "riot shield crate"

/datum/supply_pack/security/stingpack
	name = "Stingbang Grenade Pack"
	desc = "Contains five \"stingbang\" grenades, perfect for stopping \
		riots and playing morally unthinkable pranks."
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "stingbang grenade pack crate"

/// Armory packs

/datum/supply_pack/security/armory
	group = "Armory"
	access = ACCESS_ARMORY
	access_view = ACCESS_ARMORY
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/security/armory/ar2
	name = "OSIPR Crate"
	desc = "Contains two Overwatch Standard Issue Pulse Rifles. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 25
	contains = list(/obj/item/gun/ballistic/automatic/ar2,
					/obj/item/gun/ballistic/automatic/ar2)
	crate_name = "osipr gun crate"

/datum/supply_pack/security/armory/ar2ammo
	name = "OSIPR Ammo Crate"
	desc = "Contains four OSIPR magazines. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/ammo_box/magazine/ar2,
					/obj/item/ammo_box/magazine/ar2,
					/obj/item/ammo_box/magazine/ar2,
					/obj/item/ammo_box/magazine/ar2)
	crate_name = "osipr ammo crate"

/datum/supply_pack/security/armory/mp7
	name = "MP7 Frame Crate"
	desc = "Contains two MP7 submachine gun frames that must be assembled. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/weaponcrafting/frame/mp7,
					/obj/item/weaponcrafting/frame/mp7)
	crate_name = "mp7 gun crate"

/datum/supply_pack/security/armory/mp7ammo
	name = "MP7 Ammo Crate"
	desc = "Contains four MP7 magazines. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/ammo_box/magazine/mp7,
					/obj/item/ammo_box/magazine/mp7,
					/obj/item/ammo_box/magazine/mp7,
					/obj/item/ammo_box/magazine/mp7)
	crate_name = "mp7 ammo crate"

/datum/supply_pack/security/armory/spas12
	name = "SPAS-12 Frame Crate"
	desc = "Contains two SPAS-12 shotgun frames that must be assembled. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/weaponcrafting/frame/spas12,
					/obj/item/weaponcrafting/frame/spas12)
	crate_name = "spas-12 gun crate"

/datum/supply_pack/security/armory/shotgunammo
	name = "Shotgun Buckshot Ammo Crate"
	desc = "Contains four boxes of buckshot. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot,
					/obj/item/storage/box/lethalshot)
	crate_name = "buckshot crate"

/datum/supply_pack/security/armory/coltpython
	name = "Colt Python Frame Crate"
	desc = "Contains two Colt Python revolver frames that must be assembled. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 11
	contains = list(/obj/item/weaponcrafting/frame/coltpython,
					/obj/item/weaponcrafting/frame/coltpython)
	crate_name = "colt python gun crate"

/datum/supply_pack/security/armory/revolverammo
	name = "Colt Python Ammo Crate"
	desc = "Contains four Colt Python speed loaders. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/ammo_box/a357,
					/obj/item/ammo_box/a357,
					/obj/item/ammo_box/a357,
					/obj/item/ammo_box/a357)
	crate_name = "colt python ammo crate"

/datum/supply_pack/security/armory/usp
	name = "USP Match Crate"
	desc = "Contains two USP Match pistol frames that must be assembled. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/weaponcrafting/frame/usp,
					/obj/item/weaponcrafting/frame/usp)
	crate_name = "usp match gun crate"

/datum/supply_pack/security/armory/uspammo
	name = "USP Match Ammo Crate"
	desc = "Contains four USP Match magazines. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/ammo_box/magazine/usp9mm,
					/obj/item/ammo_box/magazine/usp9mm,
					/obj/item/ammo_box/magazine/usp9mm,
					/obj/item/ammo_box/magazine/usp9mm)
	crate_name = "usp match ammo crate"

/datum/supply_pack/security/armory/manhacks
	name = "Viscerator Crate"
	desc = "Contains three activatable viscerators. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/grenade/spawnergrenade/manhacks,
					/obj/item/grenade/spawnergrenade/manhacks,
					/obj/item/grenade/spawnergrenade/manhacks)
	crate_name = "viscerator crate"

/datum/supply_pack/security/armory/receivers
	name = "Modular Receiver Crate"
	desc = "Contains three modular firearm receivers, necessary for putting firearms together. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/weaponcrafting/receiver,
					/obj/item/weaponcrafting/receiver,
					/obj/item/weaponcrafting/receiver)
	crate_name = "modular receiver crate"

/datum/supply_pack/security/armory/heavybaton
	name = "Heavy Stun Baton Crate"
	desc = "Two unloaded heavy stun batons that require power cells. These heavy versions are more bulky and hard to carry, but carry a lot more force, and slightly more stunning power."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/melee/baton/security/heavy,
					/obj/item/melee/baton/security/heavy)
	crate_name = "heavy baton crate"
