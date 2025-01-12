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

/datum/market_item/halflife/misc/medvial
	name = "Medvial"
	desc = "Essentially a smaller and downgraded version of biogel medkits. However, it is easier to carry, and quicker to apply."
	item = /obj/item/reagent_containers/pill/patch/medkit/vial
	stock = 6

	price_min = CARGO_CRATE_VALUE/6
	price_max = CARGO_CRATE_VALUE/5
	availability_prob = 100

/datum/market_item/halflife/misc/gauze
	name = "Gauze"
	desc = "A roll of good gauze. Useful for stemming blood flow from wounds."
	item = /obj/item/stack/medical/gauze
	stock = 3

	price_min = CARGO_CRATE_VALUE/5
	price_max = CARGO_CRATE_VALUE/4
	availability_prob = 100
