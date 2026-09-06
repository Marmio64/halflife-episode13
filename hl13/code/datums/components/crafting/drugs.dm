/datum/crafting_recipe/substance
	name = "Substance"
	result = /obj/item/reagent_containers/pill/patch/sporetamine
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

/datum/crafting_recipe/antisicknesspills
	name = "Homebrewed Anti-Sickness Pills"
	result = /obj/item/reagent_containers/pill/antitox/makeshift
	reqs = list(/obj/item/food/xen/xenbranch = 1, /datum/reagent/consumable/ethanol = 10, /obj/item/food/xen/xenslime = 1, /obj/item/reagent_containers/pill/patch/grubnugget = 1, /datum/reagent/fuel = 10)
	time = 5 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_CHEM

/datum/crafting_recipe/painbreaker
	name = "Painbreaker tablets"
	result = /obj/item/reagent_containers/pill/painbreaker
	reqs = list(/datum/reagent/consumable/ethanol = 25, /obj/item/food/meat/slab/xen/poison = 1, /datum/reagent/fuel = 10)
	time = 5 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_CHEM
