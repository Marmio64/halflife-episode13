// File ordered by progression

/datum/uplink_category/suits
	name = "Suits"
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
	name = "Civil protection vest"
	desc = "An armored vest that civil protection like to use, and rebels like to steal."
	item = /obj/item/clothing/suit/armor/civilprotection
	cost = 3
	progression_minimum = 5 MINUTES

/datum/uplink_item/suits/copsuit
	name = "HEV Suit"
	desc = "A heavily armored suit designed for hazardous environments, with built in medical systems."
	item = /obj/item/clothing/suit/hooded/hev
	cost = 25
	progression_minimum = 15 MINUTES
