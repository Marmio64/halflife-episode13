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

/datum/market_item/halflife/misc/fuel
	name = "Bottle of Welding Fuel"
	desc = "A bottle of flammable fuel. Used for making home made bullets, or if you just want to set someone on fire."
	item = /obj/item/reagent_containers/cup/bottle/welding_fuel
	stock = 3

	price_min = CARGO_CRATE_VALUE/8
	price_max = CARGO_CRATE_VALUE/7
	availability_prob = 80

/datum/market_item/halflife/misc/receiver
	name = "Firearm Receiver"
	desc = "A modular receiver for the making of firearms. If you found a frame, why not be economical?"
	item = /obj/item/weaponcrafting/receiver
	stock = 3

	price_min = CARGO_CRATE_VALUE/4
	price_max = CARGO_CRATE_VALUE/3
	availability_prob = 80

/datum/market_item/halflife/misc/tape
	name = "Tape"
	desc = "A roll of sticky tape. Best known for it's use in crafting firearms."
	item = /obj/item/stack/sticky_tape
	stock = 3

	price_min = CARGO_CRATE_VALUE/3
	price_max = CARGO_CRATE_VALUE/2
	availability_prob = 80

/datum/market_item/halflife/misc/satchel
	name = "Satchel"
	desc = "Storage is always useful for for just about anybody, so this fine leather satchel is sure to sell like hot cakes."
	item = /obj/item/storage/backpack/halflife/satchel
	stock = 3

	price_min = CARGO_CRATE_VALUE/3
	price_max = CARGO_CRATE_VALUE/2
	availability_prob = 100

/datum/market_item/halflife/misc/pouch
	name = "Pouch"
	desc = "Everybody loves being able to carry more stuff. A pouch will do them nicely."
	item = /obj/item/storage/belt/pouch
	stock = 4

	price_min = CARGO_CRATE_VALUE/4
	price_max = CARGO_CRATE_VALUE/3
	availability_prob = 80

/datum/market_item/halflife/misc/box
	name = "Mystery Box"
	desc = "A mystery box of three random goods. You won't know what you might get. Could be worth far more than what you buy it for, or may be worth less."
	item = /obj/item/storage/box/syndicate/care_package
	stock = 1

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	availability_prob = 80
