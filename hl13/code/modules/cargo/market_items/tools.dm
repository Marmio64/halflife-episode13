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
