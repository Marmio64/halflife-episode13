/datum/supply_pack/materials
	group = "Canisters & Materials"

/datum/supply_pack/materials/fueltank
	name = "Fuel Tank Crate"
	desc = "Contains a welding fuel tank. Caution, highly flammable."
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	crate_name = "fuel tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/materials/hl13plastic
	name = "Plastic Crate"
	desc = "Contains a dozen pieces of plastic for making ration bags. Make sure to recycle bags to avoid having to buy more plastic."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/stack/sheet/halflife/plastic/twelve)
	crate_name = "plastic crate"
