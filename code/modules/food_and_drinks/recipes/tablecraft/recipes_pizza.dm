
// see code/module/crafting/table.dm

////////////////////////////////////////////////PIZZA!!!////////////////////////////////////////////////

/datum/crafting_recipe/food/margheritapizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/cheese/wedge = 4,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/margherita/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/meatpizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/meat/rawcutlet = 4,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/meat/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/mushroompizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/mushroom = 5
	)
	result = /obj/item/food/pizza/mushroom/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/vegetablepizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/vegetable/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/sassysagepizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/raw_meatball = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/sassysage/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/pineapplepizza
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/meat/rawcutlet = 2,
		/obj/item/food/pineappleslice = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/pineapple/raw
	category = CAT_PIZZA

/datum/crafting_recipe/food/raw_meat_calzone
	name = "Meat calzone"
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/cheese/wedge = 2,
		/obj/item/food/meat/rawcutlet = 3,
		/obj/item/food/grown/tomato = 1,
	)
	result = /obj/item/food/raw_meat_calzone
	category = CAT_PIZZA

/datum/crafting_recipe/food/raw_vegetarian_calzone
	name = "Vegetarian calzone"
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/raw_vegetarian_calzone
	category = CAT_PIZZA
