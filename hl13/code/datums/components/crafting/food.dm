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
	crafting_flags = CRAFT_CHECK_DENSITY // doesn't clear or transfer reagents

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
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_TRANSFERS_REAGENTS //doesn't clear reagents, this needs to make a more nutritious end product

/datum/crafting_recipe/food/xenstew
	name = "Xen Stew"
	reqs = list(
		/obj/item/food/rationpack = 1,
		/datum/reagent/water = 15,
		/obj/item/food/meat/cutlet/xen = 2,
	)
	result = /obj/item/food/xenstew
	category = CAT_RATION
