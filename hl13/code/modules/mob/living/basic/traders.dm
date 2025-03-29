/mob/living/basic/trader/halflife/refugee
	name = "Refugee Smuggler"
	desc = "A gruff looking man, with the wares you need, though perhaps not the ones you want."

	spawner_path = /obj/effect/mob_spawn/corpse/human/refugee_smuggler
	loot = list(/obj/effect/mob_spawn/corpse/human/refugee_smuggler)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/smuggler

/obj/effect/mob_spawn/corpse/human/refugee_smuggler
	name = "Refugee Smuggler"
	hairstyle = "Short Hair"
	haircolor = COLOR_BLACK
	facial_hairstyle = "Shaved"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/refugee_smuggler

/datum/outfit/refugee_smuggler
	name = "Refugee Smuggler"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

/datum/trader_data/halflife/smuggler
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop

	initial_products = list(
		/obj/item/ammo_box/magazine/makeshift9mm = list(PAYCHECK_CREW * 2, 10),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 5, 10),
		/obj/item/gun/ballistic/rifle/rebarxbow = list(PAYCHECK_CREW * 8, 3),
		/obj/item/reagent_containers/pill/patch/medkit/vial = list(PAYCHECK_CREW * 2, 10),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 8, 3),
		/obj/item/clothing/head/helmet/halflife/military/weak/crafted = list(PAYCHECK_CREW * 4, 5),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW * 4, 5),
		/obj/item/stack/sticky_tape = list(PAYCHECK_CREW * 4, 5),
		/obj/item/weaponcrafting/receiver = list(PAYCHECK_CREW * 4, 5),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.5, 5),
		/obj/item/clothing/under/citizen/rebel = list(PAYCHECK_CREW * 5, 5),
	)

	initial_wanteds = list(
		/obj/item/factory_construction/full_container = list(PAYCHECK_CREW * 0.5, 15, ""),
		/obj/item/food/rationpack = list(PAYCHECK_CREW * 0.5, 15, ""),
		/obj/item/food/meat/steak/xen = list(PAYCHECK_CREW * 0.5, 15, ""),
		/obj/item/food/pierogi_ration = list(PAYCHECK_CREW * 2, 15, ""),
		/obj/item/ammo_box/magazine/makeshift9mm = list(PAYCHECK_CREW, 10, ""),
		/obj/item/stack/sheet/animalhide/goliath_hide = list(PAYCHECK_CREW * 0.5, 15, ""),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/clothing/under/citizen/refugee = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW, 5, ""),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Sorry pal, this ain't it. Show me somethin' else.",
			"Not what i'm lookin' for.",,
			"I'm sure someone would want that, just not me.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"What a shame, tell me if you changed your mind.",
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Heh, thanks, stranga'.",
			"Pleasure doin' buisness, stranga'.",
		),
		INTERESTED_PHRASE = list(
			"I like the look of that item. I'll give ya some creddies for it, deal?",
			"Looks like a fine piece, i'll buy it off ya.",
		),
		BUY_PHRASE = list(
			"Enjoy it, stranga'.",
			"Heh, hope you like it, stranga'.",
			"Knew you'd fine somethin' ya like.",
		),
		NO_CASH_PHRASE = list(
			"This ain't a charity, pal, come back with some cash.",
			"I need cold hard cash for this to work, pal.",
		),
		NO_STOCK_PHRASE = list(
			"Ain't got no more of that right now.",
			"Fresh outta that shit, pal.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Not interested in that right now, pal.",
			"Don't want that, pal.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This shit's worthless, I don't want it.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I've got enough of this, ain't buyin' it.",
		),
		TRADER_LORE_PHRASE = list(
			"Hey pal, I don't care who you are, but if you're willing to trade, I got you covered.",
			"My wares are open for all, civil protection, rebel, citizen, don't care.",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I'm out of creddies right now, cant buy anything.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Ran out of stock, see me another time.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"You think you can fuck with me!?",
			"Big fucking mistake.",
			"You just signed your fuckin' death warrant, pal!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Take that, you fuckin' punk!",
			"Just like the last one who started shit!",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Heh, open for business!",
			"I've got what you need, stranga'.",
		),
	)
