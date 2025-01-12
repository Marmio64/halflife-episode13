/datum/outfit/blackmarket
	name = "Blackmarket dealer"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/halflife/satchel

	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/market_uplink/halflife/blackmarket

	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/chameleon/blackmarket

	// 125 credits to get you started, incase you want to give some deals, get some stock right away, give change, or just buy stuff for self defense.
	backpack_contents = list(
		/obj/item/stack/spacecash/c50 = 1,
		/obj/item/stack/spacecash/c20 = 2,
		/obj/item/stack/spacecash/c10 = 2,
		/obj/item/stack/spacecash/c1 = 15,
		/obj/item/clothing/mask/gas/hl2/military, //For covertness, if you wish.
	)

/datum/outfit/blackmarket/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'
