/mob/living/basic/trader/halflife/refugee
	name = "Refugee Smuggler"
	desc = "A gruff looking man, with the wares you need, though perhaps not the ones you want. His coat conceals a revolver, and a hefty amount of body armor."

	maxHealth = 250
	health = 250
	blood_volume = BLOOD_VOLUME_NORMAL

	spawner_path = /obj/effect/mob_spawn/corpse/human/refugee_smuggler
	loot = list(/obj/effect/mob_spawn/corpse/human/refugee_smuggler)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/smuggler

	ai_controller = /datum/ai_controller/basic_controller/trader/halflife

	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE)

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
	mask = /obj/item/clothing/mask/gas/hl2/military

/// refugee guard
/mob/living/basic/trooper/rebel/mp7/refugee
	name = "Refugee Guard"
	desc = "An armed fellow, looking to protect his employer."
	maxHealth = 150
	health = 150
	loot = list(/obj/effect/mob_spawn/corpse/human/refugeeguard)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/refugeeguard
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/rebel/refugeeguard
	death_sound = 'hl13/sound/voice/human/scream/malescream_8.ogg'

	faction = list(FACTION_NEUTRAL, FACTION_REFUGEE)

/mob/living/basic/trooper/rebel/mp7/refugee/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
	if (ranged_cooldown <= 1 SECONDS)
		AddComponent(/datum/component/ranged_mob_full_auto)

	AddElement(/datum/element/ai_retaliate)

/obj/effect/mob_spawn/corpse/human/refugeeguard
	name = "Refugee Guard"
	hairstyle = "Business Hair 3"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/refugeeguard

/datum/outfit/refugeeguard
	name = "Refugee Guard Corpse"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless


/datum/trader_data/halflife/smuggler
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -1

	initial_products = list(
		/obj/item/ammo_box/magazine/makeshift9mm = list(PAYCHECK_CREW * 2, 5),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 5, 5),
		/obj/item/gun/ballistic/rifle/rebarxbow = list(PAYCHECK_CREW * 8, 3),
		/obj/item/reagent_containers/pill/patch/medkit/vial = list(PAYCHECK_CREW * 2, 5),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 8, 3),
		/obj/item/clothing/head/helmet/halflife/military/weak/crafted = list(PAYCHECK_CREW * 4, 5),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW * 4, 5),
		/obj/item/reagent_containers/cup/glass/bottle/vodka = list(PAYCHECK_CREW * 3, 5),
		/obj/item/stack/sticky_tape = list(PAYCHECK_CREW * 4, 5),
		/obj/item/weaponcrafting/receiver = list(PAYCHECK_CREW * 3.5, 5),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.5, 5),
		/obj/item/clothing/under/citizen/rebel = list(PAYCHECK_CREW * 5, 5),
		/obj/item/storage/backpack/halflife/satchel = list(PAYCHECK_CREW * 8, 3),
		/obj/item/clothing/suit/armor/rebel = list(PAYCHECK_CREW * 16, 1),
		/obj/item/switchblade = list(PAYCHECK_CREW * 6, 2),
		/obj/item/toy/crayon/spraycan = list(PAYCHECK_CREW, 2),
		/obj/item/cigarette/halflife = list(PAYCHECK_CREW * 0.75, 10),
		/obj/item/clothing/mask/gas/hl2/military = list(PAYCHECK_CREW * 3, 3),
		/obj/item/reagent_containers/cup/soup_pot = list(PAYCHECK_CREW, 3),
		/obj/item/lighter = list(PAYCHECK_CREW, 3),
		/obj/item/food/canned/halflife/beans = list(PAYCHECK_CREW * 2, 3),
		/obj/item/reagent_containers/syringe/syriniver = list(PAYCHECK_CREW * 2, 3),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 8, 1),
		/obj/item/crowbar/large = list(PAYCHECK_CREW * 4, 1),
	)

	initial_wanteds = list(
		/obj/item/factory_construction/full_container = list(PAYCHECK_CREW * 0.5, 10, ""),
		/obj/item/food/rationpack = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/food/meat/steak = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/food/pierogi_ration = list(PAYCHECK_CREW * 2.5, 10, ""),
		/obj/item/stack/sheet/animalhide/goliath_hide = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/clothing/under/citizen/refugee = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW, 5, ""),
		/obj/item/clothing/under/combine/civilprotection = list(PAYCHECK_CREW * 2.5, 5, ""),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 2.5, 5, ""),
		/obj/item/crowbar/large = list(PAYCHECK_CREW * 0.75, 3, ""),
		/obj/item/food/grown/onion = list(PAYCHECK_CREW * 0.5, 3, ""),
		/obj/item/food/grown/potato = list(PAYCHECK_CREW * 0.5, 3, ""),
		/obj/item/cigarette/halflife = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/reagent_containers/pill/patch/grubnugget = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/circuitmaterial = list(PAYCHECK_CREW * 0.25, 10, ""),
		/obj/item/water_canister = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 3, 5, ""),
		/obj/item/ration_voucher = list(PAYCHECK_CREW * 2, 10, ""),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 2, 3, ""),
		/obj/item/reagent_containers/pill/lsd = list(PAYCHECK_CREW * 0.5, 5, ""),
		/obj/item/food/xen/xenbranch = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/clothing/suit/armor/browncoat = list(PAYCHECK_CREW, 3, ""),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Sorry pal, this ain't it. Show me somethin' else.",
			"Not what i'm lookin' for.",
			"I'm sure someone would want that, just not me.",
			"I don't think I could flip that right now, lemme see a different item.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"What a shame, tell me if you changed your mind.",
			"No? Eh, see me if you change your mind."
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Heh, thanks, stranga'.",
			"Pleasure doin' buisness, stranga'.",
		),
		INTERESTED_PHRASE = list(
			"I like the look of that item. I'll give ya some creddies for it, deal?",
			"Looks like a fine piece, i'll buy it off ya.",
			"Looks fine enough, i'll buy it.",
		),
		BUY_PHRASE = list(
			"Enjoy it, stranga'.",
			"Heh, hope you like it, stranga'.",
			"Knew you'd find somethin' ya like.",
			"They always leave a happy customer, heheh.",
		),
		NO_CASH_PHRASE = list(
			"This ain't a charity, pal, come back with some cash.",
			"I need cold hard cash for this to work, pal.",
			"No creds, no meds. Or whatever the fuck you want.",
			"I ain't a bleeding heart rebel gift giver, you've gotta pay for this shit.",
			"Sorry, I don't give credit.",
			"I'll need to see the cash in your hand.",
		),
		NO_STOCK_PHRASE = list(
			"Ain't got no more of that right now.",
			"Fresh outta that shit, pal.",
			"Wait till I restock, alright pal?",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Not interested in that right now, pal.",
			"Don't want that, pal.",
			"No thanks, don't want it.",
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
			"I've got contacts in every district, even Southwatch.",
			"I've got more than just this you know, but I ain't carryin' a truckload of shit everywhere I go.",
			"Always good to see a customer. There's fewer and fewer every day.",
			"We've all gotta make a living somehow, heheh...",
			"Don't bother trying to make it through the tunnel I came from, only I know the safe routes.",
			"Don't ask where I get this stuff from.",
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
			"Another idiot looking to die.",
			"Get ready to fuckin' taste lead.",
			"Go fuck yourself!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Take that, you fuckin' punk!",
			"Just like the last one who started shit!",
			"Back to where you crawled from.",
			"Rot in hell, bastard.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Heh, open for business!",
			"I've got what you need, stranga'.",
			"Come over here, pal, i've got the goods.",
		),
	)

/datum/ai_controller/basic_controller/trader/halflife
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_REINFORCEMENTS_EMOTE = "shouts for help!",
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk/not_while_on_target/trader
	planning_subtrees = list(
		/datum/ai_planning_subtree/call_reinforcements,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trader,
		/datum/ai_planning_subtree/prepare_travel_to_destination/trader,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target,
		/datum/ai_planning_subtree/setup_shop,
	)

/datum/ai_planning_subtree/random_speech/refugeeguard
	speech_chance = 2
	emote_see = list("takes a drag from a cigarette.", "yawns.", "scratches their back.", "looks around.")
	speak = list(
		"Kolejny dzień, kolejny dolar...",
		"One day, it'll all be over.",
		"Just don't try anything.",
		"I'll see her again one day...",
	)

/datum/ai_controller/basic_controller/trooper/ranged/burst/rebel/refugeeguard
	idle_behavior = null

	planning_subtrees = list(
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/refugeeguard,
	)
