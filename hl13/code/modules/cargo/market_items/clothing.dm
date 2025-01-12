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
	availability_prob = 80

/datum/market_item/halflife/clothing/metrocop_vest
	name = "Civil Protection Vest"
	desc = "An armored vest stolen from the Combine, worn by Civil Protection."
	item = /obj/item/clothing/suit/armor/civilprotection

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	stock_max = 4
	availability_prob = 70
