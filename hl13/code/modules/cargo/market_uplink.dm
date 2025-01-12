/obj/item/market_uplink/halflife/blackmarket
	name = "\improper Black Market Uplink"
	desc = "An illegal piece of tech: a simple phone for calling in supply drops in exchange for credits."
	icon = 'hl13/icons/obj/machines.dmi'
	icon_state = "uplink"
	//The original black market uplink
	accessible_markets = list(/datum/market/halflife/blackmarket)
	custom_premium_price = PAYCHECK_CREW * 2.5

	w_class = WEIGHT_CLASS_SMALL

/obj/item/market_uplink/halflife/blackmarket/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CONTRABAND, INNATE_TRAIT)
