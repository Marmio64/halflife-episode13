/datum/crafting_recipe/food/herby_cheese
	name = "Herby cheese"
	reqs = list(
		/obj/item/food/cheese/curd_cheese = 1,
		/obj/item/food/grown/herbs = 4,
		/obj/item/reagent_containers/cup/bowl = 1,
	)
	result = /obj/item/food/herby_cheese
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/ratatouille
	reqs = list(
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/onion/red = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/roasted_bell_pepper = 1
	)
	result = /obj/item/food/raw_ratatouille
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/mozzarella_sticks
	name = "Mozzarella sticks"
	reqs = list(
		/obj/item/food/cheese/mozzarella = 1,
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/tomato_sauce = 1
	)
	result = /obj/item/food/mozzarella_sticks
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/caprese_salad
	name = "Caprese salad"
	reqs = list(
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/cheese/mozzarella = 1,
		/obj/item/food/grown/herbs = 1,
		/datum/reagent/consumable/nutriment/fat/oil/olive = 2,
		/datum/reagent/consumable/vinegar = 2
	)
	result = /obj/item/food/caprese_salad
	category = CAT_SALAD
