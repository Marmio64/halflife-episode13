// Circuit boards, spare parts, etc.

/datum/export/solar/assembly
	cost = CARGO_CRATE_VALUE * 0.25
	unit_name = "solar panel assembly"
	export_types = list(/obj/item/solar_assembly)

/datum/export/solar/tracker_board
	cost = CARGO_CRATE_VALUE * 0.5
	unit_name = "solar tracker board"
	export_types = list(/obj/item/electronics/tracker)

/datum/export/solar/control_board
	cost = CARGO_CRATE_VALUE * 0.75
	unit_name = "solar panel control board"
	export_types = list(/obj/item/circuitboard/computer/solar_control)

//Data Disks
/datum/export/modular_part/portabledrive/advanced
	cost = CARGO_CRATE_VALUE * 0.4
	unit_name = "advanced data disk"
	export_types = list(/obj/item/computer_disk/advanced)
	include_subtypes = FALSE

/datum/export/modular_part/portabledrive/super
	cost = CARGO_CRATE_VALUE * 0.6
	unit_name = "super data disk"
	export_types = list(/obj/item/computer_disk/super)
	include_subtypes = FALSE

/datum/export/modular_part/portabledrive/standard
	cost = CARGO_CRATE_VALUE * 0.2
	unit_name = "data disk"
	export_types = list(/obj/item/computer_disk)
	include_subtypes = TRUE

/datum/export/refill_canister
	cost = CARGO_CRATE_VALUE * 0.5 //If someone want to make this worth more as it empties, go ahead
	unit_name = "vending refill canister"
	message = "Thank you for restocking the station!"
	export_types = list(/obj/item/vending_refill)

//Hunting headcrabs might be profitable...
/datum/export/xenmeat
	cost = CARGO_CRATE_VALUE * 0.5
	unit_name = "xen flesh"
	export_types = list(/obj/item/food/meat/slab/xen)

/datum/export/watercanister
	cost = CARGO_CRATE_VALUE
	unit_name = "water canister"
	export_types = list(/obj/item/water_canister)

//clearing out xen infestations might be profitable... or even farming them?
/datum/export/xenshrooms
	cost = CARGO_CRATE_VALUE * 0.25
	unit_name = "xenian mushrooms"
	export_types = list(/obj/item/food/grown/mushroom_stem)

//package and sell medkits for a profit
/datum/export/medkits
	cost = CARGO_CRATE_VALUE
	unit_name = "medkits"
	export_types = list(/obj/item/reagent_containers/pill/patch/medkit/manufactured)

//sell manufactured rations for money
/datum/export/rations
	cost = CARGO_CRATE_VALUE * 0.5
	unit_name = "rations"
	export_types = list(/obj/item/food/rationpack/manufactured)

//recycle delivered ration refill boxes for a small return of credits
/datum/export/ration_refill_box
	cost = CARGO_CRATE_VALUE * 0.15
	unit_name = "used ration refill boxes"
	export_types = list(/obj/item/ration_construction/used_container)

//Sell completed factory goods boxes
/datum/export/factory_box
	cost = CARGO_CRATE_VALUE * 0.75
	unit_name = "completed factory goods boxes"
	export_types = list(/obj/item/factory_construction/full_container)
