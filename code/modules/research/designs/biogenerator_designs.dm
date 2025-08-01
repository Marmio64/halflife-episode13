///////////////////////////////////
///////Biogenerator Designs ///////
///////////////////////////////////

/datum/design/milk
	name = "Synthetic Milk"
	id = "milk"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.8)
	make_reagent = /datum/reagent/consumable/milk
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/soymilk
	name = "Synthetic Soy Milk"
	id = "soymilk"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.8)
	make_reagent = /datum/reagent/consumable/soymilk
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/ethanol
	name = "Synthetic Ethanol"
	id = "ethanol"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.8)
	make_reagent = /datum/reagent/consumable/ethanol
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/cream
	name = "Synthetic Cream"
	id = "cream"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.8)
	make_reagent = /datum/reagent/consumable/cream
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/black_pepper
	name = "Synthetic Black Pepper"
	id = "black_pepper"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.6)
	make_reagent = /datum/reagent/consumable/blackpepper
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/enzyme
	name = "Synthetic Enzyme"
	id = "enzyme"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.6)
	make_reagent = /datum/reagent/consumable/enzyme
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/sugar
	name = "Synthetic Sugar"
	id = "sugar"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.9)
	make_reagent = /datum/reagent/consumable/sugar
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/waterbar
	name = "Water Flavored Nutrient Bar"
	id = "waterbar"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 5)
	build_path = /obj/item/food/halflife/nutrient_bar/water
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/flourpaste
	name = "Flour Paste Cube"
	id = "flourpaste"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 5)
	build_path = /obj/item/food/halflife/flour_paste
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/synthmeat
	name = "Synthetic Meat"
	id = "synthmeat"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 10)
	build_path = /obj/item/food/meat/slab/synthmeat
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_FOOD)

/datum/design/ez_nut   //easy nut :)
	name = "E-Z Nutrient"
	id = "ez_nut"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.3)
	make_reagent = /datum/reagent/plantnutriment/eznutriment
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/rh_nut
	name = "Robust Harvest"
	id = "rh_nut"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.5)
	make_reagent = /datum/reagent/plantnutriment/robustharvestnutriment
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/end_gro
	name = "Enduro Grow"
	id = "end_gro"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.6)
	make_reagent = /datum/reagent/plantnutriment/endurogrow
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/liq_earth
	name = "Liquid Earthquake"
	id = "liq_earth"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.6)
	make_reagent = /datum/reagent/plantnutriment/liquidearthquake
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/weed_killer
	name = "Weed Killer"
	id = "weed_killer"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.3)
	make_reagent = /datum/reagent/toxin/plantbgone/weedkiller
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/pest_spray
	name = "Pest Killer"
	id = "pest_spray"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 0.5)
	make_reagent = /datum/reagent/toxin/pestkiller
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_CHEMICALS)

/datum/design/cloth
	name = "Sheet of Cloth"
	id = "cloth"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 12)
	build_path = /obj/item/stack/sheet/cloth
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/cardboard
	name = "Sheet of Cardboard"
	id = "cardboard"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 6)
	build_path = /obj/item/stack/sheet/cardboard
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/paper
	name = "Sheet of Paper"
	id = "paper"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 3)
	build_path = /obj/item/paper
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/rolling_paper
	name = "Sheet of Rolling Paper"
	id = "rollingpaper"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 2)
	build_path = /obj/item/rollingpaper
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/candle
	name = "Candle"
	id = "candle"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 4)
	build_path = /obj/item/flashlight/flare/candle
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

//hl13 edit start

/datum/design/base_protein
	name = "Protein Base"
	id = "base_protein"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 5)
	build_path = /obj/item/ration_construction/base/protein
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/base_fat
	name = "Fat Base"
	id = "base_fat"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 5)
	build_path = /obj/item/ration_construction/base/fat
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/base_fiber
	name = "Fiber Base"
	id = "base_fiber"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 5)
	build_path = /obj/item/ration_construction/base/fiber
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/flavor_sweet
	name = "Sweet Flavoring Jug"
	id = "flavor_sweet"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 3)
	build_path = /obj/item/ration_construction/flavoring/sweet
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/flavor_bitter
	name = "Bitter Flavoring Jug"
	id = "flavor_bitter"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 3)
	build_path = /obj/item/ration_construction/flavoring/bitter
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

/datum/design/flavor_sour
	name = "Sour Flavoring Jug"
	id = "flavor_sour"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 3)
	build_path = /obj/item/ration_construction/flavoring/sour
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_BIO_MATERIALS)

//hl13 edit end
