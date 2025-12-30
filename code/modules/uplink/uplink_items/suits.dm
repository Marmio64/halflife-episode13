// File ordered by progression

/datum/uplink_category/suits
	name = "Armor & Clothes"
	weight = 3

/datum/uplink_item/suits
	category = /datum/uplink_category/suits
	surplus = 40

/datum/uplink_item/suits/rebelsuit
	name = "Rebel Jumpsuit"
	desc = "A partially armored jumpsuit with no sensors built in."
	item = /obj/item/clothing/under/citizen/rebel
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/copsuit
	name = "Civil Protection Vest"
	desc = "An armored vest that civil protection like to use, and rebels like to steal."
	item = /obj/item/clothing/suit/armor/civilprotection
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/light_rebel_vest
	name = "Light Rebel Vest"
	desc = "A slightly modified civil protection vest which offers a tad bit more protection at no cost to speed."
	item = /obj/item/clothing/suit/armor/rebel/light
	cost = 4
	progression_minimum = 10 MINUTES

/datum/uplink_item/suits/heavy_rebel_vest
	name = "Heavy Rebel Vest"
	desc = "A stolen and modified Overwatch soldier vest. Slows you down a decent bit, but is relatively cheap and provides a high level of protection."
	item = /obj/item/clothing/suit/armor/rebel
	cost = 7
	progression_minimum = 10 MINUTES

/datum/uplink_item/suits/vet_suit
	name = "PLF Modified Bomb Suit"
	desc = "An old world EOD suit modified by the PLF. Incredibly heavy, but is the most protective suit of armor you can get your hands on."
	item = /obj/item/clothing/suit/armor/halflife/plf_veteran
	cost = 20
	progression_minimum = 20 MINUTES

/datum/uplink_item/suits/vet_helmet
	name = "PLF Modified Bomb Suit Helmet"
	desc = "An old world EOD suit helmet modified by the PLF. Hard to see out of, but great for keeping your brain intact."
	item = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	cost = 9
	progression_minimum = 20 MINUTES

/datum/uplink_item/suits/militaryhelmet
	name = "Military Helmet"
	desc = "A old world metal and kevlar helmet. Provides good protection for your head."
	item = /obj/item/clothing/head/helmet/halflife/military
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/hevsuit
	name = "HEV Suit"
	desc = "A heavily armored suit designed for hazardous environments. Offers very good protection against everything, and has a built in automatic medical system."
	item = /obj/item/clothing/suit/hooded/hev
	cost = 30
	progression_minimum = 20 MINUTES
