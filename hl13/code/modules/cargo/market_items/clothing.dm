/datum/market_item/halflife/clothing
	category = "Clothing"
	abstract_path = /datum/market_item/halflife/clothing

/datum/market_item/halflife/clothing/refugee
	name = "Refugee Clothes"
	desc = "Simple refugee clothes. For the defiant citizen."
	item = /obj/item/clothing/under/citizen/refugee

	price_min = CARGO_CRATE_VALUE/5
	price_max = CARGO_CRATE_VALUE/4
	stock_max = 4
	availability_prob = 100

/datum/market_item/halflife/clothing/rebel
	name = "Rebel Clothes"
	desc = "A lightly armored citizen outfit with the trackers removed."
	item = /obj/item/clothing/under/citizen/rebel

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	stock_max = 4
	availability_prob = 100

/datum/market_item/halflife/clothing/metrocop_vest
	name = "Civil Protection Vest"
	desc = "An armored vest stolen from the Combine, worn by Civil Protection."
	item = /obj/item/clothing/suit/armor/civilprotection

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	stock_max = 4
	availability_prob = 100

/datum/market_item/halflife/clothing/overwatch_vest
	name = "Overwatch Vest"
	desc = "A heavily armored and bulky Combine soldier vest. This stuff is hard to come by, and not cheap."
	item = /obj/item/clothing/suit/armor/overwatch

	price_min = CARGO_CRATE_VALUE * 1.25
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 2
	availability_prob = 60

/datum/market_item/halflife/clothing/mask
	name = "Gas Mask"
	desc = "A gas mask with a filter. Obviously useful against gas attacks, but also muffles your voice and hides your face, so you can conceal your identity."
	item = /obj/item/clothing/mask/gas/hl2/modern

	price_min = CARGO_CRATE_VALUE/4
	price_max = CARGO_CRATE_VALUE/3
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/clothing/beret
	name = "United Nations Beret"
	desc = "An old blue beret. It is made with kevlar, and thus provides a small amount of protection to the head."
	item = /obj/item/clothing/head/beret/durathread/unitednations

	price_min = CARGO_CRATE_VALUE/4
	price_max = CARGO_CRATE_VALUE/3
	stock_max = 3
	availability_prob = 80

