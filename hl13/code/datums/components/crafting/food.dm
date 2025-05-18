

/datum/crafting_recipe/food/nutripaste
	name = "Handmade Nutripaste"
	reqs = list(
		/obj/item/food/halflife/nutrient_bar/water = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 15,
		/datum/reagent/water = 7,
		/datum/reagent/consumable/nutriment = 3,
	)
	result = /obj/item/food/nutripaste/handmade
	category = CAT_RATION
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_TRANSFERS_REAGENTS //doesn't clear reagents, this needs to make a more nutritious end product

/datum/crafting_recipe/food/xenstew
	name = "Xen Stew"
	reqs = list(
		/obj/item/food/halflife/nutrient_bar = 1,
		/datum/reagent/water = 15,
		/obj/item/food/meat/cutlet/xen = 2,
	)
	result = /obj/item/food/xenstew
	category = CAT_RATION
