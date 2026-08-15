/datum/crafting_recipe/substance
	name = "Substance"
	result = /obj/item/reagent_containers/pill/patch/substance
	reqs = list(/obj/item/food/xen/xenspore = 1, /obj/item/cigarette/halflife = 2, /datum/reagent/fuel = 10)
	time = 5 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_CHEM

/datum/crafting_recipe/chope
	name = "Chope"
	result = /obj/item/reagent_containers/pill/patch/chope
	reqs = list(/obj/item/food/meat/slab/chumtoad = 1, /obj/item/food/meat/slab/xen/poison = 1, /obj/item/reagent_containers/pill/antitox = 1, /obj/item/match = 3, /datum/reagent/fuel = 10, /datum/reagent/consumable/ethanol = 30) //its kinda like chumtoad meth
	time = 5 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_CHEM
