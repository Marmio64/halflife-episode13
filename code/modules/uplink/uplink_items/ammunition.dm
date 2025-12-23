/datum/uplink_category/ammo
	name = "Ammunition"
	weight = 7

/datum/uplink_item/ammo
	category = /datum/uplink_category/ammo
	surplus = 40

/datum/uplink_item/ammo/pistol
	name = "9mm Handgun Magazine"
	desc = "An additional 18-round 9mm magazine, for the USP Match pistol."
	item = /obj/item/ammo_box/magazine/usp9mm
	cost = 3
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/ammo/smg
	name = "4.6x30mm SMG Magazine"
	desc = "An additional 45-round 4.6x30mm magazine, for the MP7 smg."
	item = /obj/item/ammo_box/magazine/mp7
	cost = 4
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	progression_minimum = 2 MINUTES

/datum/uplink_item/ammo/revolver
	name = "357 Speed Loader"
	desc = "A revolver speed loader with 357 magnum rounds."
	item = /obj/item/ammo_box/colta357
	cost = 4
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	progression_minimum = 2 MINUTES

/datum/uplink_item/ammo/mosin
	name = "7.62mm Clip"
	desc = "A 5-round clip for the Mosin-Nagant rifle."
	item = /obj/item/ammo_box/strilka310/a762
	cost = 2
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	progression_minimum = 3 MINUTES

/datum/uplink_item/ammo/ammo_crate
	name = "Ammo Crate"
	desc = "A crate that can dispense three magazines from a wide selection of ammunition."
	progression_minimum = 10 MINUTES
	item = /obj/machinery/ammo_crate/no_recharge
	cost = 10

/datum/uplink_item/ammo/heavy_ammo_crate
	name = "Heavy Ammo Crate"
	desc = "A crate that can dispense four unique, heavy ammunition types. Includes dark energy cells for the AR2, 20mm MP7 grenades, and RPG rockets."
	progression_minimum = 15 MINUTES
	item = /obj/machinery/ammo_crate/heavy
	cost = 20

