/datum/uplink_category/explosives
	name = "Explosives"
	weight = 6

/datum/uplink_item/explosives
	category = /datum/uplink_category/explosives

/datum/uplink_item/explosives/c4
	name = "Composition C-4"
	desc = "C-4 is plastic explosive of the common variety Composition C. You can use it to breach walls, sabotage equipment, or connect \
			an assembly to it in order to alter the way it detonates. It can be attached to almost all objects and has a modifiable timer with a \
			minimum setting of 10 seconds."
	item = /obj/item/grenade/c4
	cost = 3

/datum/uplink_item/explosives/smoke
	name = "Smoke Grenades"
	desc = "A box that contains five smoke grenades. Useful for vanishing and ninja fans with katana."
	item = /obj/item/storage/box/syndie_kit/smoke
	cost = 2

/datum/uplink_item/explosives/syndicate_minibomb
	name = "MK3A2 Grenade"
	desc = "A handheld grenade with a decent blast radius and some shrapnel."
	progression_minimum = 15 MINUTES
	item = /obj/item/grenade/syndieminibomb/bouncer
	cost = 5
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/explosives/rocket_launcher
	name = "Rocket Launcher"
	desc = "Devestating power does not come cheap, nor is it carried easily."
	item = /obj/item/gun/ballistic/rocketlauncher/halflife
	progression_minimum = 30 MINUTES
	cost = 20
