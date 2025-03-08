/datum/supply_pack/service
	group = "Service"

/datum/supply_pack/service/cargo_supples
	name = "Cargo Supplies Crate"
	desc = "Sold everything that wasn't bolted down? You can get right \
		back to work with this crate containing stamps, an export scanner, \
		destination tagger, hand labeler and some package wrapping."
	cost = CARGO_CRATE_VALUE * 1.75
	contains = list(/obj/item/stamp,
					/obj/item/stamp/denied,
					/obj/item/universal_scanner,
					/obj/item/dest_tagger,
					/obj/item/hand_labeler,
					/obj/item/stack/package_wrap,
				)
	crate_name = "cargo supplies crate"

/datum/supply_pack/service/janitor
	name = "Janitorial Supplies Crate"
	desc = "Fight back against dirt and grime with Combine Janitorial Essentials™! \
		Contains three buckets and caution signs. Also has a single mop, \
		broom, spray cleaner, rag, and trash bag."
	cost = CARGO_CRATE_VALUE * 1.8
	access_view = ACCESS_JANITOR
	contains = list(/obj/item/reagent_containers/cup/bucket = 3,
					/obj/item/mop,
					/obj/item/pushbroom,
					/obj/item/clothing/suit/caution = 3,
					/obj/item/storage/bag/trash,
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/reagent_containers/cup/rag,
				)
	crate_name = "janitorial supplies crate"

/datum/supply_pack/service/lightbulbs
	name = "Replacement Lights"
	desc = "Mass manufactured light bulbs and tubes for replacing the cheap ones installed in the city."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/lights/mixed = 3)
	crate_name = "replacement lights"

/datum/supply_pack/service/survivalknives
	name = "Survival Knives Crate"
	desc = "Contains three sharpened survival knives. Each knife guaranteed to fit snugly \
		inside most boots as well."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/knife/combat/survival = 3)
	crate_name = "survival knife crate"
	crate_type = /obj/structure/closet/crate/cargo/mining

/// Box of 7 grey IDs.
/datum/supply_pack/service/greyidbox
	name = "Grey ID Card Multipack Crate"
	desc = "A convenient crate containing a box of seven cheap ID cards in a handy wallet-sized form factor. \
		Cards come in every colour you can imagine, as long as it's grey."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/box/ids)
	crate_name = "basic id card crate"

/datum/supply_pack/service/emptycrate
	name = "Empty Crate"
	desc = "It's an empty crate, for all your storage needs."
	cost = CARGO_CRATE_VALUE * 1.4 //Net Zero Profit.
	contains = list()
	crate_name = "crate"

/datum/supply_pack/service/coffeekit
	name = "Coffee Equipment Crate"
	desc = "A complete kit to setup your own cozy coffee shop, the coffeemaker is for some reason not included."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/obj/item/storage/box/coffeepack/robusta,
		/obj/item/storage/box/coffeepack,
		/obj/item/reagent_containers/cup/coffeepot,
		/obj/item/storage/fancy/coffee_condi_display,
		/obj/item/reagent_containers/cup/glass/bottle/juice/cream,
		/obj/item/reagent_containers/condiment/milk,
		/obj/item/reagent_containers/condiment/soymilk,
		/obj/item/reagent_containers/condiment/sugar,
		/obj/item/reagent_containers/cup/bottle/syrup_bottle/caramel, //one extra syrup as a treat
	)
	crate_name = "coffee equipment crate"
	crate_type = /obj/structure/closet/crate/robust
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/coffeemaker
	name = "Impressa Coffeemaker Crate"
	desc = "An assembled Impressa model coffeemaker."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/machinery/coffeemaker/impressa)
	crate_name = "coffeemaker crate"
	crate_type = /obj/structure/closet/crate/large
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/// Spare bar sign wallmount
/datum/supply_pack/service/bar_sign
	name = "Bar Sign Replacement Kit"
	desc = "A replacement bar sign, perfect for drawing in customers to your bar, tavern, inn, nightclub, or even coffeehouse!"
	cost = CARGO_CRATE_VALUE * 14
	contains = list(/obj/item/wallframe/barsign/all_access)
	crate_name = "bar sign crate"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/organic/vouchers
	name = "Reward Voucher Crate"
	desc = "A large crate with 50 reward vouchers, totalling to 250 credits. A useful way for giving out rewards to citizens with less risk of Civil Protection embezzlement."
	cost = CARGO_CRATE_VALUE * 6.5 //a bit over the return from recycling the crate, stamping the manifest, and giving out the vouchers.
	contains = list(/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10)
	crate_name = "voucher crate"
