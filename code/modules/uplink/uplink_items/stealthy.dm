/datum/uplink_category/stealthy
	name = "Stealthy Weapons"
	weight = 8

/datum/uplink_item/stealthy_weapons
	category = /datum/uplink_category/stealthy
	uplink_item_flags = SYNDIE_ILLEGAL_TECH

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle
	name = "Poison Kit"
	desc = "An assortment of deadly chemicals packed into a compact box. Comes with a syringe for more precise application."
	item = /obj/item/storage/box/syndie_kit/chemical
	cost = 8
	surplus = 50
	progression_minimum = 2 MINUTES

/datum/uplink_item/stealthy_weapons/suppressor
	name = "Suppressor"
	desc = "This suppressor will silence the shots of the weapon it is attached to for increased stealth and superior ambushing capability. It is compatible with many small ballistic guns including the Makarov, Stechkin APS and C-20r, but not revolvers or energy guns."
	item = /obj/item/suppressor
	cost = 3
	surplus = 10
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/stealthy_weapons/holster
	name = "Rebel Holster"
	desc = "A useful little device that allows for inconspicuous carrying of guns using chameleon technology. It also allows for badass gun-spinning."
	item = /obj/item/storage/belt/holster/chameleon
	cost = 1
