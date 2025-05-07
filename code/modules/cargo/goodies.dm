
/datum/supply_pack/goody
	access = NONE
	group = "Goodies"
	goody = TRUE
	discountable = SUPPLY_PACK_STD_DISCOUNTABLE

/datum/supply_pack/goody/fishing_toolbox
	name = "Fishing Toolbox"
	desc = "Complete toolbox set for your fishing adventure. Contains a valuable tip. Advanced hooks and lines sold separetely."
	cost = PAYCHECK_CREW * 2
	contains = list(/obj/item/storage/toolbox/fishing)

/datum/supply_pack/goody/fishing_hook_set
	name = "Fishing Hooks Set"
	desc = "Set of various fishing hooks."
	cost = PAYCHECK_CREW
	contains = list(/obj/item/storage/box/fishing_hooks)

/datum/supply_pack/goody/fishing_line_set
	name = "Fishing Lines Set"
	desc = "Set of various fishing lines."
	cost = PAYCHECK_CREW
	contains = list(/obj/item/storage/box/fishing_lines)

/datum/supply_pack/goody/fishing_lure_set
	name = "Fishing Lures Set"
	desc = "A set of bite-resistant fishing lures to fish all (most) sort of fish. Beat randomness to a curb today!"
	cost = PAYCHECK_CREW * 8
	contains = list(/obj/item/storage/box/fishing_lures)

/datum/supply_pack/goody/fishing_hook_rescue
	name = "Rescue Fishing Hook Single-Pack"
	desc = "For when your fellow miner has inevitably fallen into a chasm, and it's up to you to save them."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/fishing_hook/rescue)

/datum/supply_pack/goody/premium_bait
	name = "Deluxe Fishing Bait Single-Pack"
	desc = "When the standard variety is not good enough for you."
	cost = PAYCHECK_CREW
	contains = list(/obj/item/bait_can/worm/premium)

/datum/supply_pack/goody/naturalbait
	name = "Freshness Jars full of Natural Bait Single-Pack"
	desc = "Homemade in the Spinward Sector."
	cost = PAYCHECK_CREW * 4 //rock on
	contains = list(/obj/item/storage/pill_bottle/naturalbait)

/datum/supply_pack/goody/telescopic_fishing_rod
	name = "Telescopic Fishing Rod Single-Pack"
	desc = "A collapsible fishing rod that can fit within a backpack."
	cost = PAYCHECK_CREW * 8
	contains = list(/obj/item/fishing_rod/telescopic)

/datum/supply_pack/goody/fish_analyzer
	name = "Fish Analyzer Single-Pack"
	desc = "A single analyzer to monitor fish's status and traits with, in case you don't have the technology to print one."
	cost = PAYCHECK_CREW * 2.5
	contains = list(/obj/item/fish_analyzer)

/datum/supply_pack/goody/fish_catalog
	name = "Fishing Catalog Single-Pack"
	desc = "A catalog containing all the fishy info you'll ever need."
	cost = PAYCHECK_LOWER
	contains = list(/obj/item/book/manual/fish_catalog)

/datum/supply_pack/goody/coffee_mug
	name = "Coffee Mug Single-Pack"
	desc = "A bog standard coffee mug, for drinking coffee."
	cost = PAYCHECK_LOWER
	contains = list(/obj/item/reagent_containers/cup/glass/mug)

/datum/supply_pack/goody/coffee_cartridge_fancy
	name = "Fancy Coffee Cartridge Single-Pack"
	desc = "A fancy cartridge for a coffeemaker. Makes 4 pots."
	cost = PAYCHECK_CREW
	contains = list(/obj/item/coffee_cartridge/fancy)

/datum/supply_pack/goody/coffeepot
	name = "Coffeepot Single-Pack"
	desc = "A standard-sized coffeepot, for use with a coffeemaker."
	cost = PAYCHECK_CREW
	contains = list(/obj/item/reagent_containers/cup/coffeepot)

/datum/supply_pack/goody/experimental_medication
	name = "Experimental Medication Single-Pack"
	desc = "A single bottle of Interdyne brand experimental medication, used for treating people suffering from hereditary manifold disease."
	cost = PAYCHECK_CREW * 6.5
	contains = list(/obj/item/storage/pill_bottle/sansufentanyl)
