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

/datum/uplink_item/dangerous/pistol
	name = "USP Match Pistol"
	desc = "A small, easily concealable handgun that uses 9mm auto rounds in 15-round magazines and is compatible \
			with suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol/usp
	progression_minimum = 5 MINUTES
	cost = 7

/datum/uplink_item/dangerous/mp7
	name = "MP7"
	desc = "A compact submachine gun which can shred lightly armored targets in close to medium range."
	item = /obj/item/gun/ballistic/automatic/mp7
	progression_minimum = 15 MINUTES
	cost = 10

/datum/uplink_item/dangerous/spas12
	name = "SPAS-12"
	desc = "A high power pump action shotgun which ensures anyone who steps into close range with you does not get to leave it alive."
	item = /obj/item/gun/ballistic/shotgun/spas12
	progression_minimum = 15 MINUTES
	cost = 11

/datum/uplink_item/dangerous/colt
	name = "Colt Python Revolver"
	desc = "A timeless revolver which is good at any range, but is most notable as a handheld sniping implement for accurate, high power shots."
	item = /obj/item/gun/ballistic/revolver/coltpython
	progression_minimum = 15 MINUTES
	cost = 11

/datum/uplink_item/dangerous/m4a1
	name = "M4A1"
	desc = "High power in a beautiful design that has withstood the passing of time well. This firearm from the far west of America combines precision and stopping power."
	item = /obj/item/gun/ballistic/automatic/m4a1
	progression_minimum = 20 MINUTES
	cost = 15

/datum/uplink_item/dangerous/ar2
	name = "AR2"
	desc = "One of the combine's rifles, issued only to high ranking soldiers in the Overwatch arm. We've acquired and modified one at great cost to us in order to make it usable by anyone."
	item = /obj/item/gun/ballistic/automatic/ar2/standardpin
	progression_minimum = 25 MINUTES
	cost = 20

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

/datum/uplink_item/dangerous/mosin_nagant
	name = "Surplus Rifle"
	desc = "An outdated, old bolt-action rifle from long before the war. By some miracle, these things are still prevalent in military surplus stockpiles. Cannot be concealed, but you can fit a bayonet."
	progression_minimum = 10 MINUTES //if you buy a roundstart mosin to go sport hunting for cops i do quite like you but thats not the best idea
	item = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	cost = 8

/datum/uplink_item/dangerous/rebel_turret
	name = "Hacked Combine Turret"
	desc = "A hacked combine turret which shoots at biosignal authorised combine individuals, which includes civil protection and the Warden."
	progression_minimum = 10 MINUTES
	item = /obj/machinery/porta_turret/combine/rebel
	cost = 9
