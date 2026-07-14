/**
 * Imports category.
 * This is for crates not intended for goodies, but also not intended for departmental orders.
 * This allows us to have a few crates meant for deliberate purchase through cargo, and for cargo to have a few items
 * they explicitly control. It also holds all of the black market material and contraband material, including items
 * meant for purchase only through emagging the console.
 * HL13: Primarily contaband buys, lower sociostability when purchased.
 */

/datum/supply_pack/imports
	group = "Imports"
	crate_name = "smuggled crate"

/datum/supply_pack/imports/pierogi
	name = "Pierogi Delivery"
	desc = "Baked with love by the Polish Liberation Front, unlike those expensive and tasteless Pierogi Rations. Contains x3 Meat Pierogi, x3 Cheese Pierogi."
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 6
	contains = list(
		/obj/item/food/cheese_pierogi = 3,
		/obj/item/food/meat_pierogi = 3,
	)
	socio_cost = -10

/datum/supply_pack/imports/rebelarmor
	name = "Light Resistance Armor"
	desc = "Armor defiantly stolen from the many Civil Protection units and factories both Lambda and the Polish Liberation Front has raided, modified to protect and provide more value then standard CPO vests. Consider this an alternative option should you not be able to source armor on-site, agent. Contains x3 Rebel Light Armor, and as a regional bonus x3 Polish Armbands."
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/obj/item/clothing/accessory/armband/plf = 3,
		/obj/item/clothing/suit/armor/rebel/light = 3,
	)
	socio_cost = -15

/datum/supply_pack/imports/uprising
	name = "Bulk Civil Uprising Starter Kit"
	desc = "Start your own revolution today for cheap! No need to buy guns and armor, simply hand these out! *Not responsible for loss of life- promise of free state not guranteed. Contains x4 Molotov, x2 Lighter, x9 Bricks, x3 Gas Masks, x6 Refugee Suits, x2 Kevlar Vests, x2 Brown Overcoats, x6 Broken Bottles, x4 Healthpens, x2 Makeshift Pistol, x2 Makeshift Pistol Magazine, x1 Polish Liberation Front Beret, x1 Megaphone."
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/obj/item/grenade/halflife/molotov = 4,
		/obj/item/lighter = 2,
		/obj/item/stack/sheet/halflife/brick = 9,
		/obj/item/clothing/mask/gas/hl2/military = 3,
		/obj/item/clothing/under/citizen/refugee = 6,
		/obj/item/clothing/suit/armor/halflife/kevlar = 2,
		/obj/item/clothing/suit/armor/browncoat = 2,
		/obj/item/broken_bottle = 6,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 4,
		/obj/item/gun/ballistic/automatic/pistol/makeshift = 2,
		/obj/item/ammo_box/magazine/makeshift9mm = 2,
		/obj/item/clothing/head/beret/sec/poland = 1,
		/obj/item/megaphone = 1,
	)
	socio_cost = -20