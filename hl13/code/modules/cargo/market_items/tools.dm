/datum/market_item/halflife/tool
	category = "Tools"
	abstract_path = /datum/market_item/halflife/tool

/datum/market_item/halflife/tool/electricaltool
	name = "Multifunction Electrical Tool"
	desc = "A useful little tool for zapping forcefields open."
	item = /obj/item/card/emag/halflife
	stock = 1

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2
	availability_prob = 50

/datum/market_item/halflife/tool/crowbar
	name = "Crowbar"
	desc = "A large crowbar. Useful as a tool for machining, prying open manhole covers, or just plain beating skulls in."
	item = /obj/item/crowbar/large
	stock = 3

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	availability_prob = 90
