/datum/market_item/halflife/misc
	category = "Miscellaneous"
	abstract_path = /datum/market_item/halflife/misc

/datum/market_item/halflife/misc/medkit
	name = "Medkit"
	desc = "A handheld biogel injector medkit, for healing injuries."
	item = /obj/item/reagent_containers/pill/patch/medkit
	stock = 6

	price_min = CARGO_CRATE_VALUE/5
	price_max = CARGO_CRATE_VALUE/4
	availability_prob = 100
