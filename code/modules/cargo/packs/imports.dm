/**
 * Imports category.
 * This is for crates not intended for goodies, but also not intended for departmental orders.
 * This allows us to have a few crates meant for deliberate purchase through cargo, and for cargo to have a few items
 * they explicitly control. It also holds all of the black market material and contraband material, including items
 * meant for purchase only through emagging the console.
 */

/datum/supply_pack/imports
	group = "Imports"
	crate_name = "emergency crate"

/datum/supply_pack/imports/materials_market
	name = "Materials Market Crate"
	desc = "A circuit board to build your own materials market for use by certified market traders. Warning: Losses are not covered by insurance."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(
		/obj/item/circuitboard/machine/materials_market = 1,
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/cable_coil/five = 2,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stock_parts/card_reader = 1
	)
	crate_name = "materials market crate"
