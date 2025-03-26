/datum/crafting_recipe/food/devilledflavorbar
	name = "Devilled Flavor Bar"
	reqs = list(
		/obj/item/food/flavorbar = 1,
		/datum/reagent/consumable/mayonnaise = 10,
		/datum/reagent/water = 5,
	)
	result = /obj/item/food/devilled_flavorbar
	category = CAT_RATION

/datum/crafting_recipe/food/mayobox
	name = "Nutriment Mayo Box"
	reqs = list(
		/obj/item/food/rationpack/box = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 15
	)
	result = /obj/item/reagent_containers/cup/glass/nutrimentmayobox
	category = CAT_RATION

/datum/crafting_recipe/food/nutripaste
	name = "Handmade Nutripaste"
	reqs = list(
		/obj/item/food/rationpack = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 15,
		/datum/reagent/water = 7,
		/datum/reagent/consumable/nutriment = 3,
	)
	result = /obj/item/food/nutripaste/handmade
	category = CAT_RATION
