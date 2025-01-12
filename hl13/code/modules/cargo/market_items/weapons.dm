/datum/market_item/halflife/weapon
	category = "Weapons"
	abstract_path = /datum/market_item/halflife/weapon

/datum/market_item/halflife/weapon/uspmatch
	name = "USP Match"
	desc = "A metropolice standard issue pistol."
	item = /obj/item/gun/ballistic/automatic/pistol/usp

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 60

/datum/market_item/halflife/weapon/mp7
	name = "MP7"
	desc = "A metropolice standard issue SMG for suppression and high firepower."
	item = /obj/item/gun/ballistic/automatic/mp7

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 60

/datum/market_item/halflife/weapon/spas12
	name = "SPAS-12"
	desc = "High power pump action shotgun for quick and dirty room clearing."
	item = /obj/item/gun/ballistic/shotgun/spas12

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 60
