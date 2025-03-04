// Xen soup
/datum/reagent/consumable/nutriment/soup/xensoup
	name = "Xen Soup"
	description = "A thick stew made of whatever alien and strange foodstuffs on hand."
	data = list("meat" = 1, "fungus" = 1)
	color = "#375f3f"

/datum/glass_style/has_foodtype/soup/xensoup
	required_drink_type = /datum/reagent/consumable/nutriment/soup/xensoup
	drink_type = VEGETABLES | MEAT

/datum/chemical_reaction/food/soup/xensoup
	required_reagents = list(/datum/reagent/water = 50)
	required_ingredients = list(
		/obj/item/food/meat/cutlet/xen = 2,
		/obj/item/food/deadmouse = 1,
		/obj/item/food/grown/ash_flora/mushroom_stem = 1,
	)
	results = list(
		/datum/reagent/consumable/nutriment/soup/xensoup = 30,
	)
