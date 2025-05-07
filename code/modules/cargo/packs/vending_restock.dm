/datum/supply_pack/vending
	group = "Vending Restocks"

/datum/supply_pack/vending/bartending
	name = "Drink Dispensery Refill"
	desc = "A refill for the bartender's drink dispenser."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/boozeomat)
	crate_name = "bartending refill crate"

/datum/supply_pack/vending/food_dispensery
	name = "Food Dispensery Refill"
	desc = "One refill container for the kitchen's food dispensery."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/food_dispensery)
	crate_name = "food dispensery refill crate"

/datum/supply_pack/vending/medical
	name = "Combine WallMed Refill"
	desc = "One refill container for a Combine WallMed dispenser."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/combine_wallmed)
	crate_name = "wallmed refill crate"
