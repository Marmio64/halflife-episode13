//Hunting headcrabs might be profitable...
/datum/export/xenmeat
	cost = CARGO_CRATE_VALUE * 0.5
	unit_name = "xen flesh"
	export_types = list(/obj/item/food/meat/slab/xen)

/datum/export/watercanister
	cost = CARGO_CRATE_VALUE
	unit_name = "water canister"
	export_types = list(/obj/item/water_canister)

/datum/export/destabilizerantenna
	cost = CARGO_CRATE_VALUE*2
	unit_name = "destabilizer antenna"
	export_types = list(/obj/item/halflife/antenna)

//clearing out xen infestations might be profitable... or even farming them?
/datum/export/xenshrooms
	cost = CARGO_CRATE_VALUE * 0.2
	unit_name = "xenian mushrooms"
	export_types = list(/obj/item/food/grown/mushroom_stem)

/datum/export/xenparts
	cost = CARGO_CRATE_VALUE * 0.2
	unit_name = "xenian flora parts"
	export_types = list(/obj/item/food/xen)

//package and sell medkits for a profit
/datum/export/medkits
	cost = CARGO_CRATE_VALUE
	unit_name = "medkits"
	export_types = list(/obj/item/reagent_containers/pill/patch/medkit/manufactured)

//recycle delivered ration refill boxes for a small return of credits
/datum/export/ration_refill_box
	cost = CARGO_CRATE_VALUE * 0.25
	unit_name = "used ration refill boxes"
	export_types = list(/obj/item/ration_construction/used_container)

//Sell completed factory goods boxes
/datum/export/factory_box
	cost = CARGO_CRATE_VALUE * 0.75
	unit_name = "completed factory goods boxes"
	export_types = list(/obj/item/factory_construction/full_container)
