/datum/supply_pack/organic
	group = "Food & Hydroponics"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/organic/hydroponics
	access_view = ACCESS_HYDROPONICS

/datum/supply_pack/organic/rationsupplies
	name = "Ration Supplies Crate"
	desc = "A crate of various ration supplies and containers. The rations must be assembled by hand, and can then be put inside a vending unit to refill it. Contains enough to fill a dispenser by about 12 rations."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/packs,
					/obj/item/ration_construction/packs,
					/obj/item/ration_construction/boxes,
					/obj/item/ration_construction/boxes,
					/obj/item/ration_construction/bars,
					/obj/item/ration_construction/bars,
					/obj/item/ration_construction/bags,
					/obj/item/ration_construction/bags,
					/obj/item/ration_construction/blue_cans,
					/obj/item/ration_construction/blue_cans,
					/obj/item/ration_construction/yellow_cans,
					/obj/item/ration_construction/yellow_cans,
					/obj/item/ration_construction/red_cans,
					/obj/item/ration_construction/red_cans,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container)
	crate_name = "ration supplies crate"

/datum/supply_pack/organic/food
	name = "Food Crate"
	desc = "Allow the citizens a treat with this crate filled with specially preserved old world foods."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/reagent_containers/condiment/flour,
					/obj/item/reagent_containers/condiment/rice,
					/obj/item/reagent_containers/condiment/milk,
					/obj/item/reagent_containers/condiment/soymilk,
					/obj/item/reagent_containers/condiment/saltshaker,
					/obj/item/reagent_containers/condiment/peppermill,
					/obj/item/storage/fancy/egg_box,
					/obj/item/reagent_containers/condiment/enzyme,
					/obj/item/reagent_containers/condiment/sugar,
					/obj/item/food/meat/slab/chicken,
					/obj/item/food/meat/slab/chicken,
					/obj/item/food/meat/slab/monkey)
	crate_name = "food crate"

/datum/supply_pack/organic/rations
	name = "Ration Crate"
	desc = "A crate of five ration packs, made for easy distribution."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/box/halflife/ration,
					/obj/item/storage/box/halflife/ration,
					/obj/item/storage/box/halflife/ration,
					/obj/item/storage/box/halflife/ration,
					/obj/item/storage/box/halflife/ration)
	crate_name = "ration crate"


/datum/supply_pack/organic/loyaltyrations
	name = "Loyalty-grade Ration Crate"
	desc = "A crate of five loyalty-grade ration packs, made for easy distribution."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/storage/box/halflife/loyaltyration,
					/obj/item/storage/box/halflife/loyaltyration,
					/obj/item/storage/box/halflife/loyaltyration,
					/obj/item/storage/box/halflife/loyaltyration,
					/obj/item/storage/box/halflife/loyaltyration)
	crate_name = "loyalty-grade ration crate"

/datum/supply_pack/organic/badrations
	name = "Low-grade Ration Crate"
	desc = "A crate of five low-grade ration packs, made for easy distribution."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/item/storage/box/halflife/badration,
					/obj/item/storage/box/halflife/badration,
					/obj/item/storage/box/halflife/badration,
					/obj/item/storage/box/halflife/badration,
					/obj/item/storage/box/halflife/badration)
	crate_name = "low-grade ration crate"

/datum/supply_pack/organic/alcohol
	name = "Approved Ethanol Crate"
	desc = "A crate of five Combine Approved Ethanol Beverages, rated for citizen use."
	cost = CARGO_CRATE_VALUE * 1.75
	contains = list(/obj/item/reagent_containers/cup/glass/bottle/beer/light,
					/obj/item/reagent_containers/cup/glass/bottle/beer/light,
					/obj/item/reagent_containers/cup/glass/bottle/beer/light,
					/obj/item/reagent_containers/cup/glass/bottle/beer/light,
					/obj/item/reagent_containers/cup/glass/bottle/beer/light)
	crate_name = "approved ethanol crate"

/datum/supply_pack/organic/fancyalcohol
	name = "Exotic Alcohol Crate"
	desc = "A crate of five exotic old world alcoholic beverages. Probably too good for the common citizen to have."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/reagent_containers/cup/glass/bottle/beer,
				/obj/item/reagent_containers/cup/glass/bottle/grappa,
				/obj/item/reagent_containers/cup/glass/bottle/gin,
				/obj/item/reagent_containers/cup/glass/bottle/hooch,
				/obj/item/reagent_containers/cup/glass/bottle/vodka)
	crate_name = "exotic alcohol crate"
