//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Conspicuous Weapons"
	weight = 9

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous


/datum/uplink_item/dangerous/pistol
	name = "Stechkin Pistol"
	desc = "A small, easily concealable handgun that uses 9mm auto rounds in 18-round magazines and is compatible \
			with suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol/usp
	progression_minimum = 10 MINUTES
	cost = 8
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/revolver
	name = "Colt Python Revolver"
	desc = "A deadly revolver that fires .357 Magnum rounds and has 7 chambers."
	item = /obj/item/gun/ballistic/revolver/coltpython
	cost = 13
	progression_minimum = 30 MINUTES
	surplus = 50

/datum/uplink_item/dangerous/mp7
	name = "MP7 SMG"
	desc = "A full auto SMG with a 45 round magazine."
	item = /obj/item/gun/ballistic/automatic/mp7
	cost = 13
	progression_minimum = 30 MINUTES
	surplus = 50

/datum/uplink_item/dangerous/knife
	name = "Combat Knife"
	desc = "A deadly knife that can be easily concealed and drawn for melee combat."
	item = /obj/item/knife/combat
	cost = 5

