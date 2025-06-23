/datum/fish_source/sewer
	catalog_description = "Sewers"
	radial_state = "toilet"
	duds = list("ewww... nothing", "it was nothing", "it was toilet paper", "it sunk into the slewage", "the hook is empty", "where's the damn money?!")
	overlay_state = "portal_river" // placeholder
	fish_table = list(
		FISHING_DUD = 32,
		/obj/item/trash/halflife/nutrient_bar_waste/water = 4,
		/obj/item/reagent_containers/cup/soda_cans/breenwater/empty = 4,
		/obj/item/fish/needlefish = 4,
		/obj/item/fish/ratfish = 2,
		/obj/item/storage/wallet/money = 2,
	)
	fish_counts = list(
		/obj/item/storage/wallet/money = 1,
	)
	fishing_difficulty = FISHING_DEFAULT_DIFFICULTY + 10
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS

/datum/fish_source/halfliferiver
	catalog_description = "River water"
	radial_state = "river"
	overlay_state = "portal_river"
	fish_table = list(
		FISHING_DUD = 9,
		/obj/item/fish/goldfish = 6,
		/obj/item/fish/catfish = 4,
		/obj/item/fish/perch = 4,
		/obj/item/fish/pike = 1,
	)
	fish_counts = list(
		/obj/item/fish/pike = 1,
	)
	fish_count_regen = list(
		/obj/item/fish/pike = 4 MINUTES,
	)
	fishing_difficulty = FISHING_DEFAULT_DIFFICULTY + 15
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS

/datum/fish_source/halflifepond
	catalog_description = "Pond water"
	radial_state = "river"
	overlay_state = "portal_river"
	fish_table = list(
		FISHING_DUD = 12,
		/obj/item/reagent_containers/cup/soda_cans/breenwater/empty = 4,
		/obj/item/fish/goldfish = 8,
		/obj/item/fish/catfish = 1,
	)
	fish_counts = list(
		/obj/item/fish/catfish = 1,
	)
	fish_count_regen = list(
		/obj/item/fish/catfish = 4 MINUTES,
	)
	fishing_difficulty = FISHING_DEFAULT_DIFFICULTY + 15
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS

/datum/fish_source/halflifesalt
	catalog_description = "Salt water"
	radial_state = "seaboat"
	overlay_state = "portal_ocean"
	fish_table = list(
		FISHING_DUD = 10,
		/obj/item/fish/catfish = 4,
		/obj/item/fish/perch = 5,
	)
	fishing_difficulty = FISHING_DEFAULT_DIFFICULTY + 20
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS
