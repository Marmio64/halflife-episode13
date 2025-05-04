/obj/item/food/canned/halflife
	icon = 'hl13/icons/obj/food.dmi'

/obj/item/food/canned/halflife/beans
	name = "tin of pork beans"
	desc = "Old world beans with bits of pork floating inside. Better than rations at least."
	icon_state = "porknbean"
	trash_type = /obj/item/trash/can/food/halflife/beans
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/ketchup = 4,
	)
	tastes = list("beans" = 2, "pork" = 1)
	foodtypes = VEGETABLES | MEAT

/obj/item/food/canned/halflife/seafood
	name = "tin of fish"
	desc = "Some sort of chopped up fish crammed into a tin. It smells terrible, and looks just as bad, but hopefully is edible."
	icon_state = "seafood"
	trash_type = /obj/item/trash/can/food/halflife/seafood
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("fish" = 1)
	foodtypes = MEAT

/obj/item/food/canned/halflife/seafood/expired
	name = "tin of fish"
	desc = "Some sort of chopped up fish crammed into a tin. It smells terrible, and looks just as bad, but hopefully is edible."
	icon_state = "seafoodexpired"
	trash_type = /obj/item/trash/can/food/halflife/seafood
	food_reagents = list(
		/datum/reagent/consumable/nutriment/raw = 8,
		/datum/reagent/toxin/bad_food = 3,
	)
	tastes = list("expired fish" = 1)
	foodtypes = MEAT | TOXIC


/obj/item/food/canned/halflife/seafood/expired/open_can(mob/user)
	. = ..()
	desc = "The contents of this tin look extremely off, it might not be wise to eat out of it, not to mention the absolutely disgusting stench emanating from it."

/obj/item/food/canned/halflife/crisps
	name = "tin of crisps"
	desc = "A tin tube filled with crisps. They're stale, but the salt is good as ever at least."
	icon_state = "crisps"
	trash_type = /obj/item/trash/can/food/halflife/crisps
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/salt = 2,
	)
	tastes = list("stale chips" = 1)
	foodtypes = JUNKFOOD | FRIED

/obj/item/trash/can/food/halflife
	icon = 'hl13/icons/obj/food.dmi'

/obj/item/trash/can/food/halflife/beans
	name = "tin of pork beans"
	icon_state = "porknbean_empty"

/obj/item/trash/can/food/halflife/crisps
	name = "tin of crisps"
	icon_state = "crisps_empty"

/obj/item/trash/can/food/halflife/seafood
	name = "tin of fish"
	icon_state = "seafood_empty"
