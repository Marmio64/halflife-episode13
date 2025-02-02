/datum/market_item/halflife/consumable
	category = "Consumables"
	abstract_path = /datum/market_item/halflife/consumable

/datum/market_item/halflife/consumable/nutrientbar
	name = "Nutrient Bar"
	desc = "A stolen nutrient bar. Food has been hard to come by, and we have to charge a premium. Try to procure some on-site instead."
	item = /obj/item/food/rationpack

	price_min = CARGO_CRATE_VALUE/3
	price_max = CARGO_CRATE_VALUE/2
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/consumable/happinesspills
	name = "Happiness Pills"
	desc = "A bottle of so called Happiness Pills. Taken from old world pharmacies, this shit is old but still works as its name sake would make you think."
	item = /obj/item/storage/pill_bottle/happinesspsych

	price_min = CARGO_CRATE_VALUE/3
	price_max = CARGO_CRATE_VALUE
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/consumable/cigs
	name = "Cigarette Carton"
	desc = "A full carton of ciggies. Smokers will do anything to get their fill."
	item = /obj/item/storage/fancy/cigarettes/halflife

	price_min = CARGO_CRATE_VALUE/5
	price_max = CARGO_CRATE_VALUE/3
	stock_max = 3
	availability_prob = 90
