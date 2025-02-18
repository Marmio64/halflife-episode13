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

/datum/supply_pack/security/militarygear
	name = "Old Military Gear Crate"
	desc = "Two sets of kevlar, helmets, camo fatigues, fingerless gloves, ruck sacks, gas masks, and one beret. Most of this gear is no longer in circulation, and now runs a premium."
	cost = CARGO_CRATE_VALUE * 12
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/suit/armor/kevlar,
					/obj/item/clothing/suit/armor/kevlar,
					/obj/item/clothing/under/syndicate/camo,
					/obj/item/clothing/under/syndicate/camo,
					/obj/item/clothing/mask/gas/hl2/military/hardened,
					/obj/item/clothing/mask/gas/hl2/military/hardened,
					/obj/item/storage/backpack/halflife/satchel/military,
					/obj/item/storage/backpack/halflife/satchel/military,
					/obj/item/clothing/gloves/fingerless,
					/obj/item/clothing/gloves/fingerless,
					/datum/market_item/halflife/clothing/beret,
					/obj/item/clothing/head/helmet/halflife/military/weak,
					/obj/item/clothing/head/helmet/halflife/military/weak)
	crate_name = "military gear crate"

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
	name = "Stinger Grenade Pack"
	desc = "Contains five \"stinger\" grenades which fire out rubber pellets, perfect for stopping \
		riots and playing morally unthinkable pranks."
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "Stinger grenade pack crate"

/datum/supply_pack/security/cs_gas
	name = "CS Gas Grenade Pack"
	desc = "Contains three CS Gas grenades, for dispersing crowds with no real physical harm."
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/grenade/halflife/cs_gas,
					/obj/item/grenade/halflife/cs_gas,
					/obj/item/grenade/halflife/cs_gas)
	crate_name = "cs gas grenade pack crate"

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

/datum/supply_pack/security/armory/servicerifle
	name = "Service Rifle Crate"
	desc = "Contains two service rifle gun frames that must be assembled. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 17
	contains = list(/obj/item/weaponcrafting/frame/service,
					/obj/item/weaponcrafting/frame/service)
	crate_name = "service rifle crate"

/datum/supply_pack/security/armory/servicerifleammo
	name = "Service Rifle Ammo Crate"
	desc = "Contains four service rifle magazines. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 11
	contains = list(/obj/item/ammo_box/magazine/service,
					/obj/item/ammo_box/magazine/service,
					/obj/item/ammo_box/magazine/service,
					/obj/item/ammo_box/magazine/service)
	crate_name = "service rifle ammo crate"

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
	cost = CARGO_CRATE_VALUE * 10
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
	cost = CARGO_CRATE_VALUE * 10
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
	cost = CARGO_CRATE_VALUE * 11
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

/datum/supply_pack/security/armory/uspammorubber
	name = "USP Match Rubber Ammo Crate"
	desc = "Contains four USP Match rubber bullet magazines. These are less-lethal alternatives to standard rounds. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/ammo_box/magazine/usp9mm/rubber,
					/obj/item/ammo_box/magazine/usp9mm/rubber,
					/obj/item/ammo_box/magazine/usp9mm/rubber,
					/obj/item/ammo_box/magazine/usp9mm/rubber)
	crate_name = "usp match rubber ammo crate"

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

/datum/supply_pack/security/armory/brainwash
	name = "Brainwashing Disk Crate"
	desc = "A disk with loaded instruction and technologies to allow you to permanently coerce citizens into better serving the combine. Simply load into a surgical console to be able to start the surgery."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/disk/surgery/brainwashing)
	crate_name = "brainwashing disk crate"

/datum/supply_pack/security/armory/mk3a2
	name = "MK3A2 Grenade Crate"
	desc = "Contains three standard combine extractor grenades. Requires Armory access to open."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/grenade/syndieminibomb/bouncer,
					/obj/item/grenade/syndieminibomb/bouncer,
					/obj/item/grenade/syndieminibomb/bouncer)
	crate_name = "MK3A2 grenade crate"
