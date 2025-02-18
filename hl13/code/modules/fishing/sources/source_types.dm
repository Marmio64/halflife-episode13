/datum/fish_source/sewer
	catalog_description = "Sewers"
	radial_state = "toilet"
	duds = list("ewww... nothing", "it was nothing", "it was toilet paper", "it was flushed away", "the hook is empty", "where's the damn money?!")
	overlay_state = "portal_river" // placeholder
	fish_table = list(
		FISHING_DUD = 18,
		/obj/item/fish/sludgefish = 20,
		/obj/item/fish/needlefish = 4,
		/obj/item/fish/ratfish = 2,
		/obj/item/storage/wallet/money = 2,
		/obj/item/fish/goldfish/three_eyes = 1,
	)
	fish_counts = list(
		/obj/item/storage/wallet/money = 1,
	)
	fishing_difficulty = FISHING_EASY_DIFFICULTY + 10
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS

/datum/fish_source/halfliferiver
	catalog_description = "River water"
	radial_state = "river"
	overlay_state = "portal_river"
	fish_table = list(
		FISHING_DUD = 8,
		/obj/item/fish/goldfish = 6,
		/obj/item/fish/guppy = 6,
		/obj/item/fish/perch = 4,
		/obj/item/fish/angelfish = 4,
		/obj/item/fish/catfish = 4,
		/obj/item/fish/perch = 5,
		/obj/item/fish/arctic_char = 1,
		/obj/item/fish/pike = 1,
		/obj/item/fish/goldfish/three_eyes = 1,
	)
	fish_counts = list(
		/obj/item/fish/pike = 3,
	)
	fish_count_regen = list(
		/obj/item/fish/pike = 4 MINUTES,
	)
	fishing_difficulty = FISHING_DEFAULT_DIFFICULTY + 15
	fish_source_flags = FISH_SOURCE_FLAG_EXPLOSIVE_MALUS
