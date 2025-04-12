/datum/supply_pack/materials
	group = "Canisters & Materials"

/datum/supply_pack/materials/cardboard50
	name = "50 Cardboard Sheets"
	desc = "Create a bunch of boxes."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/item/stack/sheet/cardboard/fifty)
	crate_name = "cardboard sheets crate"

/datum/supply_pack/materials/wood50
	name = "50 Wood Planks"
	desc = "Contains a bunch of wood for doing... wood stuff?"
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "wood planks crate"

/datum/supply_pack/materials/fueltank
	name = "Fuel Tank Crate"
	desc = "Contains a welding fuel tank. Caution, highly flammable."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	crate_name = "fuel tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/materials/watertank
	name = "Water Tank Crate"
	desc = "Contains a tank of dihydrogen monoxide... sounds dangerous."
	cost = CARGO_CRATE_VALUE * 1.2
	contains = list(/obj/structure/reagent_dispensers/watertank)
	crate_name = "water tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/materials/hl13plastic
	name = "Plastic Crate"
	desc = "Contains a bunch of plastic for use in ration casing construction"
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/stack/sheet/halflife/plastic/twenty)
	crate_name = "plastic crate"
