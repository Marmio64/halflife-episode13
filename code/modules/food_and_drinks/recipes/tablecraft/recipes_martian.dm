/datum/crafting_recipe/food/rice_dough
	name = "Rice dough"
	reqs = list(
		/datum/reagent/consumable/flour = 10,
		/datum/reagent/consumable/rice = 10,
		/datum/reagent/water = 10,
	)
	result = /obj/item/food/rice_dough
	category = CAT_BREAD

/datum/crafting_recipe/food/raw_ballpark_pretzel
	name = "Raw ballpark pretzel"
	reqs = list(
		/obj/item/food/doughslice = 1,
		/datum/reagent/consumable/salt = 2,
	)
	result = /obj/item/food/raw_ballpark_pretzel
	category = CAT_BREAD

/datum/crafting_recipe/food/raw_ballpark_tsukune
	name = "Raw ballpark tsukune"
	reqs = list(
		/obj/item/food/raw_meatball/chicken = 1,
		/datum/reagent/consumable/nutriment/soup/teriyaki = 2,
		/obj/item/stack/rods = 1,
	)
	result = /obj/item/food/kebab/raw_ballpark_tsukune
	category = CAT_MISCFOOD

// Soups

/datum/crafting_recipe/food/reaction/soup/boilednoodles
	reaction = /datum/chemical_reaction/food/soup/boilednoodles
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/dashi
	reaction = /datum/chemical_reaction/food/soup/dashi
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/teriyaki
	reaction = /datum/chemical_reaction/food/soup/teriyaki
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/curry_sauce
	reaction = /datum/chemical_reaction/food/soup/curry_sauce
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/shoyu_ramen
	reaction = /datum/chemical_reaction/food/soup/shoyu_ramen
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/gyuramen
	reaction = /datum/chemical_reaction/food/soup/gyuramen
	category = CAT_SOUP

/datum/crafting_recipe/food/reaction/soup/dragon_ramen
	reaction = /datum/chemical_reaction/food/soup/dragon_ramen
	category = CAT_SOUP
