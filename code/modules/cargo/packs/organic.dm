/datum/supply_pack/organic
	group = "Food & Hydroponics"

/datum/supply_pack/organic/hydroponics
	access_view = ACCESS_HYDROPONICS

/datum/supply_pack/organic/rationflavourings
	name = "Ration Flavourings Crate"
	desc = "A crate of various ration flavors for use in the assembly factory."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/flavoring/sweet,
					/obj/item/ration_construction/flavoring/sweet,
					/obj/item/ration_construction/flavoring/sweet,
					/obj/item/ration_construction/flavoring/sweet,
					/obj/item/ration_construction/flavoring/bitter,
					/obj/item/ration_construction/flavoring/bitter,
					/obj/item/ration_construction/flavoring/bitter,
					/obj/item/ration_construction/flavoring/bitter,
					/obj/item/ration_construction/flavoring/sour,
					/obj/item/ration_construction/flavoring/sour,
					/obj/item/ration_construction/flavoring/sour,
					/obj/item/ration_construction/flavoring/sour)
	crate_name = "ration flavor crate"

/datum/supply_pack/organic/rationcontainers
	name = "Ration Containers Crate"
	desc = "A crate of ration containers for use at the assembly factory."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container)
	crate_name = "ration container crate"

/datum/supply_pack/organic/rationbase
	name = "Ration Base Crate"
	desc = "A crate of various blocks of flavorless base for use in the assembly factory."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/base/protein,
					/obj/item/ration_construction/base/protein,
					/obj/item/ration_construction/base/protein,
					/obj/item/ration_construction/base/protein,
					/obj/item/ration_construction/base/fat,
					/obj/item/ration_construction/base/fat,
					/obj/item/ration_construction/base/fat,
					/obj/item/ration_construction/base/fat,
					/obj/item/ration_construction/base/fiber,
					/obj/item/ration_construction/base/fiber,
					/obj/item/ration_construction/base/fiber,
					/obj/item/ration_construction/base/fiber)
	crate_name = "ration base crate"

/datum/supply_pack/organic/waterjug
	name = "Unfiltered Water Crate"
	desc = "A crate of several jugs of unfiltered water, for use in the factory."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/ration_construction/waterbase,
					/obj/item/ration_construction/waterbase,
					/obj/item/ration_construction/waterbase,
					/obj/item/ration_construction/waterbase)

	crate_name = "ration water crate"

/datum/supply_pack/organic/wateradds
	name = "Water Additives Crate"
	desc = "A crate of water additive tablets, for use in water mixing at the factory."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/watermix/blueadditive,
					/obj/item/ration_construction/watermix/blueadditive,
					/obj/item/ration_construction/watermix/blueadditive,
					/obj/item/ration_construction/watermix/blueadditive,
					/obj/item/ration_construction/watermix/yellowadditive,
					/obj/item/ration_construction/watermix/yellowadditive,
					/obj/item/ration_construction/watermix/yellowadditive,
					/obj/item/ration_construction/watermix/yellowadditive,
					/obj/item/ration_construction/watermix/redadditive,
					/obj/item/ration_construction/watermix/redadditive,
					/obj/item/ration_construction/watermix/redadditive,
					/obj/item/ration_construction/watermix/redadditive,
					/obj/item/ration_construction/watermix/purpleadditive,
					/obj/item/ration_construction/watermix/purpleadditive,
					/obj/item/ration_construction/watermix/purpleadditive,
					/obj/item/ration_construction/watermix/purpleadditive)
	crate_name = "water additives crate"

/datum/supply_pack/organic/complete_rationsupplies
	name = "Complete Ration Packing Supplies Crate"
	desc = "A complete crate of ration supplies which has one of everything, and a couple containers. You get less of a bulk discount, but its very convenient."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/ration_construction/watermix/blueadditive,
					/obj/item/ration_construction/watermix/yellowadditive,
					/obj/item/ration_construction/watermix/redadditive,
					/obj/item/ration_construction/watermix/purpleadditive,
					/obj/item/ration_construction/flavoring/sweet,
					/obj/item/ration_construction/flavoring/bitter,
					/obj/item/ration_construction/flavoring/sour,
					/obj/item/ration_construction/container,
					/obj/item/ration_construction/container,
					/obj/item/stack/sheet/halflife/plastic,
					/obj/item/stack/sheet/halflife/plastic,
					/obj/item/ration_construction/waterbase,
					/obj/item/ration_construction/base/protein,
					/obj/item/ration_construction/base/fat,
					/obj/item/ration_construction/base/fiber)
	crate_name = "complete ration supplies crate"

/*
/datum/supply_pack/organic/exoticrationsupplies
	name = "Exotic Ration Supplies Crate"
	desc = "A crate of various exotic ration supplies and containers. The rations must be assembled by hand, and can then be put inside a vending unit to refill it. Some ingredients for the rations will need to be sourced locally, but exotic rations fill up the vendors better and generate more revenue."
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/item/ration_construction/purple_cans,
					/obj/item/ration_construction/purple_cans,
					/obj/item/ration_construction/bags,
					/obj/item/ration_construction/bags,
					/obj/item/ration_construction/nutripastes,
					/obj/item/ration_construction/nutripastes,
					/obj/item/ration_construction/container/exotic,
					/obj/item/ration_construction/container/exotic,
					/obj/item/ration_construction/container/exotic,
					/obj/item/ration_construction/container/exotic)
	crate_name = "exotic ration supplies crate"
*/

/datum/supply_pack/organic/food
	name = "Food Crate"
	desc = "Allow the citizens a treat with this crate filled with specially preserved old world foods."
	cost = CARGO_CRATE_VALUE * 6.5
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
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/storage/box/halflife/ration/ration,
					/obj/item/storage/box/halflife/ration/ration,
					/obj/item/storage/box/halflife/ration/ration,
					/obj/item/storage/box/halflife/ration/ration,
					/obj/item/storage/box/halflife/ration/ration)
	crate_name = "ration crate"

/datum/supply_pack/organic/loyaltyrations
	name = "Loyalty-grade Ration Crate"
	desc = "A crate of five loyalty-grade ration packs, made for easy distribution."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/storage/box/halflife/ration/loyaltyration,
					/obj/item/storage/box/halflife/ration/loyaltyration,
					/obj/item/storage/box/halflife/ration/loyaltyration,
					/obj/item/storage/box/halflife/ration/loyaltyration,
					/obj/item/storage/box/halflife/ration/loyaltyration)
	crate_name = "loyalty-grade ration crate"

/datum/supply_pack/organic/badrations
	name = "Low-grade Ration Crate"
	desc = "A crate of five low-grade ration packs, made for easy distribution."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/storage/box/halflife/ration/badration,
					/obj/item/storage/box/halflife/ration/badration,
					/obj/item/storage/box/halflife/ration/badration,
					/obj/item/storage/box/halflife/ration/badration,
					/obj/item/storage/box/halflife/ration/badration)
	crate_name = "low-grade ration crate"

/datum/supply_pack/organic/nutrimentpierogis
	name = "Nutriment Pierogis Crate"
	desc = "A crate of five nutriment pierogis. These are handcrafted (by anticitizen forced labor) meals guaranteed to satiate and provoke sensations of taste, and a citizen will kill to get their hands on these."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/food/pierogi_ration,
					/obj/item/food/pierogi_ration,
					/obj/item/food/pierogi_ration,
					/obj/item/food/pierogi_ration,
					/obj/item/food/pierogi_ration)
	crate_name = "nutriment pierogis crate"

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
	cost = CARGO_CRATE_VALUE * 5.5
	contains = list(/obj/item/reagent_containers/cup/glass/bottle/beer,
				/obj/item/reagent_containers/cup/glass/bottle/grappa,
				/obj/item/reagent_containers/cup/glass/bottle/gin,
				/obj/item/reagent_containers/cup/glass/bottle/hooch,
				/obj/item/reagent_containers/cup/glass/bottle/vodka)
	crate_name = "exotic alcohol crate"

/datum/supply_pack/organic/cigs
	name = "Cigarette Packs Crate"
	desc = "A crate of four packs of old world cigarettes. A precious commodity nowadays, good for taking advantage of citizens."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/fancy/cigarettes/halflife,
					/obj/item/storage/fancy/cigarettes/halflife,
					/obj/item/storage/fancy/cigarettes/halflife,
					/obj/item/storage/fancy/cigarettes/halflife)
	crate_name = "cigarette packs crate"

/datum/supply_pack/organic/stalker
	name = "Stalker Crate"
	desc = "A crate with one, empty minded stalker along with an earpiece, food, and water for it. Good for giving Dispatch extra hands to work with."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/mob/living/carbon/human/species/stalker,
				/obj/item/radio/headset/earpiece,
				/obj/item/reagent_containers/cup/soda_cans/breenwater,
				/obj/item/reagent_containers/cup/soda_cans/breenwater,
				/obj/item/food/nutripaste,
				/obj/item/food/nutripaste)
	crate_name = "stalker crate"
