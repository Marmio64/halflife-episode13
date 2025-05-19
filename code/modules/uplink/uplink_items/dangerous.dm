//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Conspicuous Weapons"
	weight = 9

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous


/datum/uplink_item/dangerous/makeshiftpistol
	name = "Makeshift Pistol"
	desc = "Most comparable to a shitty version of the USP Match, this makeshift pistol fires slower, uses lower velocity rounds, is harder to aim, and holds much less ammo."
	item = /obj/item/gun/ballistic/automatic/pistol/makeshift
	cost = 3
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/pistol
	name = "USP Match Pistol"
	desc = "A small, easily concealable handgun that uses 9mm auto rounds in 15-round magazines and is compatible \
			with suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol/usp
	progression_minimum = 5 MINUTES
	cost = 7
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/knife
	name = "Combat Knife"
	desc = "A deadly knife that can be easily concealed and drawn for melee combat."
	item = /obj/item/knife/combat
	cost = 5

/datum/uplink_item/dangerous/tireiron
	name = "Tire Iron"
	desc = "A deadly... mechanical tool. Regardless of its banality, it is still a dangerous weapon that isn't too suspcious to have in your hands."
	item = /obj/item/melee/tireiron
	cost = 3
