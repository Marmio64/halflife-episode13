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

	faction = list(FACTION_REFUGEE)

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

/// crabwalker /////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/basic/trader/halflife/crabwalker
	name = "Crabwalker Trader"
	desc = "A suspicious looking fellow that almost looks like a zombie at first glance, and definitely smells like one. Looks like he is selling and buying questionable things."

	maxHealth = 250
	health = 250
	blood_volume = BLOOD_VOLUME_NORMAL
	speed = 1

	spawner_path = /obj/effect/mob_spawn/corpse/human/crabwalker
	loot = list(/obj/effect/mob_spawn/corpse/human/crabwalker)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/crabwalker

	ai_controller = /datum/ai_controller/basic_controller/trader/halflife

	faction = list(FACTION_REFUGEE, FACTION_HEADCRAB)

/obj/effect/mob_spawn/corpse/human/crabwalker
	name = "Crabwalker"
	hairstyle = "Short Hair"
	haircolor = COLOR_BLACK
	facial_hairstyle = "Shaved"
	skin_tone = "albino"
	outfit = /datum/outfit/crabwalker

/datum/outfit/crabwalker
	name = "Crabwalker"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/platearmor
	head = /obj/item/clothing/head/helmet/halflife/headcrab
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/bandana/sinew

/datum/outfit/crabwalker/spear
	name = "Armed Crabwalker"

	r_hand = /obj/item/spear/halflife

/datum/outfit/crabwalker/heavy
	name = "Heavy Crabwalker"

	suit = /obj/item/clothing/suit/armor/platearmor/heavy
	head = /obj/item/clothing/head/helmet/halflife/headcrab/gonome

	r_hand = /obj/item/spear/halflife/deathmatch

/// refugee guard /////////////////////////////////////////////////////////////////////////////////////////////////////////////
/mob/living/basic/trooper/rebel/mp7/refugee
	name = "Refugee Guard"
	desc = "An armed fellow, looking to protect his employer."
	maxHealth = 150
	health = 150
	loot = list(/obj/effect/mob_spawn/corpse/human/refugeeguard)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/refugeeguard
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst/rebel/refugeeguard
	death_sound = 'hl13/sound/voice/human/scream/malescream_8.ogg'

	faction = list(FACTION_REFUGEE)

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

/// blackmarket dealer /////////////////////////////////////////////////////////////////////////////////////////////////////////////
/mob/living/basic/trader/halflife/blackmarket
	name = "Black Market Dealer"
	desc = "A gruff looking, armored fellow who is selling all sorts of illegal armaments and armor."

	maxHealth = 250
	health = 250
	blood_volume = BLOOD_VOLUME_NORMAL

	spawner_path = /obj/effect/mob_spawn/corpse/human/blackmarket
	loot = list(/obj/effect/mob_spawn/corpse/human/blackmarket)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/blackmarket

	ai_controller = /datum/ai_controller/basic_controller/trader/halflife

	faction = list(FACTION_REFUGEE)

/obj/effect/mob_spawn/corpse/human/blackmarket
	name = "Refugee Smuggler"
	hairstyle = "Short Hair"
	haircolor = COLOR_BLACK
	facial_hairstyle = "Shaved"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/blackmarket_npc

/datum/outfit/blackmarket_npc
	name = "Black Market Operator"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/hl2/military

/// blackmarket dealer /////////////////////////////////////////////////////////////////////////////////////////////////////////////
/mob/living/basic/trader/halflife/refugee_tradesmen
	name = "Refugee Tradesmen"
	desc = "An older looking gentlemen, who looks like they've been in the outlands for a long time. They seem to be selling useful supplies."

	maxHealth = 150
	health = 150
	blood_volume = BLOOD_VOLUME_NORMAL

	spawner_path = /obj/effect/mob_spawn/corpse/human/refugee_tradesmen
	loot = list(/obj/effect/mob_spawn/corpse/human/refugee_tradesmen)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/refugee_tradesmen

	ai_controller = /datum/ai_controller/basic_controller/trader/halflife

	faction = list(FACTION_REFUGEE)

/obj/effect/mob_spawn/corpse/human/refugee_tradesmen
	name = "Refugee Tradesmen"
	hairstyle = "Short Hair"
	haircolor = COLOR_BLACK
	facial_hairstyle = "Beard (Full)"
	skin_tone = "caucasian1"
	outfit = /datum/outfit/refugee_tradesmen

/datum/outfit/refugee_tradesmen
	name = "Refugee Tradesmen"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/cigarette/halflife

/// plf recruiter /////////////////////////////////////////////////////////////////////////////////////////////////////////////
/mob/living/basic/trader/halflife/plf_recruiter
	name = "Polish Liberation Front Recruiter"
	desc = "A represenative of the local PLF cell. They are looking to recruit local prisoners and escaped vortigaunts who wish to fight back against the combine."

	maxHealth = 200
	health = 200
	blood_volume = BLOOD_VOLUME_NORMAL

	spawner_path = /obj/effect/mob_spawn/corpse/human/plf_recruiter
	loot = list(/obj/effect/mob_spawn/corpse/human/plf_recruiter)

	ranged_attack_casing = /obj/item/ammo_casing/a357
	ranged_attack_sound = 'hl13/sound/weapons/revolverfire.ogg'
	held_weapon_visual = /obj/item/gun/ballistic/revolver/coltpython

	trader_data_path = /datum/trader_data/halflife/plf_recruiter

	ai_controller = /datum/ai_controller/basic_controller/trader/halflife

	faction = list(FACTION_REFUGEE)

/obj/effect/mob_spawn/corpse/human/plf_recruiter
	name = "Polish Liberation Front Recruiter"
	hairstyle = "Short Hair 2"
	haircolor = COLOR_BLACK
	facial_hairstyle = "Beard (Full)"
	skin_tone = "caucasian2"
	outfit = /datum/outfit/plf_recruiter

/datum/outfit/plf_recruiter
	name = "Polish Liberation Front Recruiter"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/halflife/reinforced_brown_jacket
	head = /obj/item/clothing/head/beret/sec/poland
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/cigarette/halflife

///////////////// AI STUFF & TRADER DATA ////////////////////////////////////

/datum/trader_data/halflife/smuggler
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -1

	initial_products = list(
		/obj/item/ammo_box/magazine/makeshift9mm = list(PAYCHECK_CREW * 2, 3),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 4.5, 3),
		/obj/item/weaponcrafting/frame/usp = list(PAYCHECK_CREW * 5.5, 1),
		/obj/item/reagent_containers/pill/patch/medkit/vial = list(PAYCHECK_CREW * 1.5, 3),
		/obj/item/reagent_containers/hypospray/medipen/healthpen = list(PAYCHECK_CREW * 1.5, 3),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 5, 3),
		/obj/item/clothing/head/helmet/halflife/military/weak/crafted = list(PAYCHECK_CREW * 2.5, 3),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW * 2.5, 3),
		/obj/item/reagent_containers/cup/glass/bottle/vodka = list(PAYCHECK_CREW * 2, 3),
		/obj/item/stack/sticky_tape = list(PAYCHECK_CREW * 4, 2),
		/obj/item/weaponcrafting/receiver = list(PAYCHECK_CREW * 3, 3),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.5, 5),
		/obj/item/clothing/under/citizen/rebel = list(PAYCHECK_CREW * 4.5, 2),
		/obj/item/storage/backpack/halflife/satchel = list(PAYCHECK_CREW * 4, 3),
		/obj/item/switchblade = list(PAYCHECK_CREW * 5, 2),
		/obj/item/toy/crayon/spraycan = list(PAYCHECK_CREW, 2),
		/obj/item/cigarette/halflife = list(PAYCHECK_CREW * 0.75, 10),
		/obj/item/clothing/mask/gas/hl2/military = list(PAYCHECK_CREW * 3, 2),
		/obj/item/reagent_containers/cup/soup_pot = list(PAYCHECK_CREW, 2),
		/obj/item/lighter = list(PAYCHECK_CREW * 0.75, 3),
		/obj/item/food/canned/halflife/beans = list(PAYCHECK_CREW * 2, 3),
		/obj/item/reagent_containers/pill/antitox = list(PAYCHECK_CREW * 1.25, 3),
		/obj/item/machinepiece/multifunctiontool = list(PAYCHECK_CREW * 6, 3),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 6, 3),
		/obj/item/stack/kevlar = list(PAYCHECK_CREW, 5, 1),
		/obj/item/crowbar/large = list(PAYCHECK_CREW * 5, 1),
		/obj/item/weldingtool/halflife = list(PAYCHECK_CREW * 1.5, 2),
		/obj/item/wrench/halflife = list(PAYCHECK_CREW * 1.5, 2),
		/obj/item/screwdriver/halflife = list(PAYCHECK_CREW * 1.5, 2),
	)

	initial_wanteds = list(
		/obj/item/factory_construction/full_container/standard = list(PAYCHECK_CREW * 0.75, 5, ""),
		/obj/item/factory_construction/full_container/advanced = list(PAYCHECK_CREW * 1.5, 5, ""),
		/obj/item/halflife/nutrient_bar_wrapping/water = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/food/meat/steak/xen = list(PAYCHECK_CREW * 0.75, 10, ""),
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
		/obj/item/reagent_containers/pill/patch/medkit = list(PAYCHECK_CREW, 15, ""),
		/obj/item/circuitmaterial = list(PAYCHECK_CREW * 0.25, 10, ""),
		/obj/item/water_canister = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 3, 5, ""),
		/obj/item/ration_voucher = list(PAYCHECK_CREW * 2, 10, ""),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 2, 3, ""),
		/obj/item/reagent_containers/pill/lsd = list(PAYCHECK_CREW * 0.5, 5, ""),
		/obj/item/food/xen/xenbranch = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/clothing/suit/armor/browncoat = list(PAYCHECK_CREW, 3, ""),
		/obj/item/weaponcrafting/frame = list(PAYCHECK_CREW * 2.5, 3, ""),
		/obj/item/stack/telecrystal = list(PAYCHECK_CREW, 10, ""),
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
			"Wondering how I got down here? Try the sludge tunnels, assuming you've got something to protect you.",
			"Always good to see a customer. There's fewer and fewer every day.",
			"We've all gotta make a living somehow, heheh...",
			"Don't ask where I get this stuff from.",
			"Looking for a way out of here? Can't help you with that myself, pal, you're on your own.",
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
		/datum/ai_planning_subtree/target_retaliate/check_faction,
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
		"Hurry up, then.",
		"I'll see her again one day...",
	)

/datum/ai_controller/basic_controller/trooper/ranged/burst/rebel/refugeeguard
	idle_behavior = null

	planning_subtrees = list(
		/datum/ai_planning_subtree/target_retaliate/check_faction,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper_burst,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/random_speech/refugeeguard,
	)

/datum/trader_data/halflife/crabwalker
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -1

	initial_products = list(
		/obj/item/clothing/head/helmet/halflife/headcrab = list(PAYCHECK_CREW * 2.5, 5),
		/obj/item/clothing/suit/armor/platearmor = list(PAYCHECK_CREW * 3.5, 5),
		/obj/item/clothing/head/helmet/halflife/headcrab/gonome = list(PAYCHECK_CREW * 4.5, 1),
		/obj/item/clothing/suit/armor/platearmor/heavy = list(PAYCHECK_CREW * 7.5, 1),
		/obj/item/clothing/mask/bandana/sinew = list(PAYCHECK_CREW * 0.5, 2),
		/obj/item/food/meat/steak/xen = list(PAYCHECK_CREW * 1.25, 1),
		/obj/item/knife/combat = list(PAYCHECK_CREW * 6, 3),
		/obj/item/spear/halflife/deathmatch = list(PAYCHECK_CREW * 6, 3),
		/obj/item/stack/medical/bandage = list(PAYCHECK_CREW * 0.75, 5),
		/obj/item/stack/sheet/leather = list(PAYCHECK_CREW * 1.25, 5),
	)

	initial_wanteds = list(
		/obj/item/food/meat/steak/xen = list(PAYCHECK_CREW, 10, ""),
		/obj/item/food/meat/slab/halflife/zombie = list(PAYCHECK_CREW * 0.25, 10, ""),
		/obj/item/stack/sheet/animalhide/goliath_hide = list(PAYCHECK_CREW, 10, ""),
		/obj/item/food/meat/steak/plain/human = list(PAYCHECK_CREW * 2, 15, ""),
		/obj/item/food/meat/slab/human = list(PAYCHECK_CREW * 2, 15, ""),
		/obj/item/organ/heart = list(PAYCHECK_CREW * 2, 5, ""),
		/obj/item/reagent_containers/pill/patch/grubnugget = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/food/xen/xenbranch = list(PAYCHECK_CREW * 0.5, 5, ""),
		/obj/item/stack/sheet/animalhide/human = list(PAYCHECK_CREW * 0.5, 10, ""),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"D-Don't fuckin' need this shit r-right now.",
			"I don't want that shit.",
			"Don't f-fuckin' want it.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"T-Then fuck off.",
			"F-Fuck off then."
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"F-Fuckin' finally.",
			"G-Give it already.",
		),
		INTERESTED_PHRASE = list(
			"I'll buy it. Now.",
			"I'll fuckin' b-buy it, just give it already.",
		),
		BUY_PHRASE = list(
			"H-Hahaha, come b-back for more.",
			"All naturally s-sourced...",
		),
		NO_CASH_PHRASE = list(
			"N-Need fuckin' cash.",
			"N-Not fucking giving it to you f-for free.",
		),
		NO_STOCK_PHRASE = list(
			"I'm out of that.",
			"F-Fuck off, i'm out of that.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Don't f-fucking want that.",
			"I D-DON'T FUCKING WANT THAT!!!",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"F-Fucking worthless.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"G-Got way t-too much of that shit.",
		),
		TRADER_LORE_PHRASE = list(
			"N-Not here to talk. Buy s-something, or g-give me something, or fuck off.",
			"F-Fresh meat...",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I'm done buying...",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"I'm done selling...",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"YOU'RE NEXT ON THE MEATSPIKE!!!",
			"DINNER TIME!!!",
			"I'LL TEAR YOUR THROAT OUT!!!",
			"ANOTHER TROPHY!!!",
			"I'LL PAINT MYSELF IN YOUR BLOOD!!!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Ahhh... A-Ahhhh, b-bloooood... haha...",
			"The smell of blood is divine...",
			"Flesh. Blood. Bones.",
			"You'll look pretty on the spikes.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Y-You... flesh t-trading here...",
			"Need to eat?",
			"I w-won't bite... yet.",
		),
	)

/datum/trader_data/halflife/blackmarket
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -2

	initial_products = list(
		/obj/item/ammo_box/magazine/makeshift9mm = list(PAYCHECK_CREW, 5),
		/obj/item/ammo_box/magazine/usp9mm = list(PAYCHECK_CREW * 2, 5),
		/obj/item/ammo_box/magazine/mp7 = list(PAYCHECK_CREW * 3, 5),
		/obj/item/ammo_box/colta357 = list(PAYCHECK_CREW * 3, 5),
		/obj/item/ammo_box/strilka310/a762 = list(PAYCHECK_CREW * 2, 5),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 4.5, 5),
		/obj/item/gun/ballistic/automatic/pistol/usp = list(PAYCHECK_CREW * 8, 2),
		/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant = list(PAYCHECK_CREW * 10, 1),
		/obj/item/gun/ballistic/automatic/mp7 = list(PAYCHECK_CREW * 12, 1),
		/obj/item/gun/ballistic/revolver/coltpython = list(PAYCHECK_CREW * 13, 1),
		/obj/item/gun/ballistic/rifle/rebarxbow = list(PAYCHECK_CREW * 7.5, 3),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 4, 3),
		/obj/item/clothing/head/helmet/halflife/military/weak/crafted = list(PAYCHECK_CREW * 2.5, 5),
		/obj/item/clothing/head/helmet/halflife/military = list(PAYCHECK_CREW * 4, 5),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW * 2, 5),
		/obj/item/weaponcrafting/receiver = list(PAYCHECK_CREW * 2, 5),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.5, 5),
		/obj/item/clothing/under/citizen/rebel = list(PAYCHECK_CREW * 4, 5),
		/obj/item/clothing/suit/armor/rebel = list(PAYCHECK_CREW * 9, 1),
		/obj/item/switchblade = list(PAYCHECK_CREW * 3, 2),
		/obj/item/clothing/mask/gas/hl2/military = list(PAYCHECK_CREW * 2, 3),
		/obj/item/stack/kevlar = list(PAYCHECK_CREW, 5),
	)

	initial_wanteds = list(
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/factory_construction/full_container/advanced/military = list(PAYCHECK_CREW * 3, 15, ""),
		/obj/item/grenade/halflife/molotov = list(PAYCHECK_CREW, 5, ""),
		/obj/item/clothing/under/combine/civilprotection = list(PAYCHECK_CREW * 2.5, 5, ""),
		/obj/item/clothing/suit/armor/civilprotection = list(PAYCHECK_CREW * 2.5, 5, ""),
		/obj/item/gun/ballistic/automatic/pistol/makeshift = list(PAYCHECK_CREW * 2, 3, ""),
		/obj/item/clothing/suit/armor/browncoat = list(PAYCHECK_CREW, 3, ""),
		/obj/item/weaponcrafting/frame = list(PAYCHECK_CREW * 4, 3, ""),
		/obj/item/gun/ballistic/automatic/ar2 = list(PAYCHECK_CREW * 12, 3, ""),
		/obj/item/gun/ballistic/automatic/pulsesmg = list(PAYCHECK_CREW * 10, 3, ""),
		/obj/item/gun/ballistic/combine_sniper = list(PAYCHECK_CREW * 14, 3, ""),
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
			"Looking for a way out of here? Hahaha! Sorry, but my contact isn't currently looking for more clients, you'll have to wait. Besides, it's not so bad here, bahaha!",
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

/datum/trader_data/halflife/refugee_tradesmen
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -1

	initial_products = list(
		/obj/item/reagent_containers/pill/patch/medkit/vial = list(PAYCHECK_CREW * 1.25, 5),
		/obj/item/reagent_containers/hypospray/medipen/healthpen = list(PAYCHECK_CREW * 1.25, 5),
		/obj/item/reagent_containers/cup/glass/bottle/vodka = list(PAYCHECK_CREW * 1.5, 5),
		/obj/item/stack/sticky_tape = list(PAYCHECK_CREW * 3, 5),
		/obj/item/clothing/under/citizen/refugee = list(PAYCHECK_CREW * 0.5, 5),
		/obj/item/storage/backpack/halflife/satchel = list(PAYCHECK_CREW * 3, 3),
		/obj/item/toy/crayon/spraycan = list(PAYCHECK_CREW * 0.5, 2),
		/obj/item/cigarette/halflife = list(PAYCHECK_CREW * 0.5, 10),
		/obj/item/reagent_containers/cup/soup_pot = list(PAYCHECK_CREW, 3),
		/obj/item/lighter = list(PAYCHECK_CREW * 0.5, 3),
		/obj/item/food/canned/halflife/beans = list(PAYCHECK_CREW * 2, 3),
		/obj/item/halflife/nutrient_bar_wrapping/water = list(PAYCHECK_CREW * 1, 3),
		/obj/item/reagent_containers/pill/antitox = list(PAYCHECK_CREW, 3),
		/obj/item/card/emag/halflife = list(PAYCHECK_CREW * 10, 3),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 4, 3),
		/obj/item/crowbar/large = list(PAYCHECK_CREW * 3, 1),
		/obj/item/weldingtool/halflife = list(PAYCHECK_CREW * 1.25, 2),
		/obj/item/wrench/halflife = list(PAYCHECK_CREW * 1.25, 2),
		/obj/item/screwdriver/halflife = list(PAYCHECK_CREW * 1.25, 2),
		//obj/item/fuel_cell/full = list(PAYCHECK_CREW * 4, 2),
	)

	initial_wanteds = list(
		/obj/item/factory_construction/full_container/standard = list(PAYCHECK_CREW * 1.5, 15, ""),
		/obj/item/factory_construction/full_container/advanced = list(PAYCHECK_CREW * 2.5, 15, ""),
		/obj/item/halflife/nutrient_bar_wrapping/water = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/food/meat/steak/xen = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/food/pierogi_ration = list(PAYCHECK_CREW * 2.5, 10, ""),
		/obj/item/stack/sheet/animalhide/goliath_hide = list(PAYCHECK_CREW * 0.75, 10, ""),
		/obj/item/stack/bulletcasings = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/clothing/under/citizen/refugee = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/crowbar/large = list(PAYCHECK_CREW * 0.75, 3, ""),
		/obj/item/food/grown/onion = list(PAYCHECK_CREW * 0.5, 3, ""),
		/obj/item/food/grown/potato = list(PAYCHECK_CREW * 0.5, 3, ""),
		/obj/item/cigarette/halflife = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/reagent_containers/pill/patch/grubnugget = list(PAYCHECK_CREW * 0.25, 15, ""),
		/obj/item/reagent_containers/pill/patch/medkit = list(PAYCHECK_CREW, 15, ""),
		/obj/item/circuitmaterial = list(PAYCHECK_CREW * 0.25, 10, ""),
		/obj/item/water_canister = list(PAYCHECK_CREW * 0.5, 5, ""),
		/obj/item/halflife/antenna = list(PAYCHECK_CREW * 3, 5, ""),
		/obj/item/ration_voucher = list(PAYCHECK_CREW * 2, 10, ""),
		/obj/item/reagent_containers/pill/lsd = list(PAYCHECK_CREW * 0.5, 5, ""),
		/obj/item/food/xen/xenbranch = list(PAYCHECK_CREW * 0.25, 5, ""),
		/obj/item/stack/telecrystal = list(PAYCHECK_CREW, 10, ""),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Sorry, friend, but I don't need this.",
			"Sorry, don't really need that right now.",
			"Ehhh, no thanks.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"What a shame.",
			"Hm, that's a no then, huh?"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Thanks, friend.",
			"My pleasure.",
		),
		INTERESTED_PHRASE = list(
			"Hm, I'd buy it.",
			"Sure, why not.",
		),
		BUY_PHRASE = list(
			"Enjoy.",
			"Leave a good review, heheh...",
			"Need anything else?",
			"Take care now.",
		),
		NO_CASH_PHRASE = list(
			"Sorry, friend, but you do need to pay for that.",
			"I don't see any money in your hands. Can't really trade if that's so.",
			"No bartering, friend, cash only.",
			"Sorry... Can't afford to give things out for free, you'll have to pay for that.",
		),
		NO_STOCK_PHRASE = list(
			"Ran out of that recently... Sorry, friend.",
			"Just sold out of that, unfortunately.",
			"I'm out of stock of that for now, friend.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Hm, no thanks.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"Sorry, but, this item looks pretty worthless to me.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I've already got too much of that unfortunately.",
		),
		TRADER_LORE_PHRASE = list(
			"Hey friend. How has the outlands been treating you?",
			"Hungry? I've got food for any budget.",
			"Don't be a stranger, have a seat.",
			"Do you remember the better days? I do. All the time...",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I'm all out of cash, can't buy anything more.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Ran out of stock, see me another time.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"Another dog to put down...",
			"Why can't we all just get along?",
			"World's gone to shit.",
			"Bullets are expensive, and you're making me do this...",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Finally, it's over.",
			"Just business, I suppose.",
			"Don't let the door hit you on the way out.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Hey friend, need something?",
			"Food, meds, clothes, and more.",
		),
	)

/obj/item/storage/box/syndicate/plf_recruiter
	name = "PLF Recruit Package"
	icon_state = "syndiebox"
	illustration = "writing_syndie"

/obj/item/storage/box/syndicate/plf_recruiter/PopulateContents()
	new /obj/item/clothing/head/helmet/halflife/military/weak/poland(src)
	new /obj/item/clothing/suit/armor/civilprotection(src)
	new /obj/item/clothing/under/citizen/refugee(src)
	new /obj/item/gun/ballistic/automatic/pistol/makeshift(src)
	new /obj/item/ammo_box/magazine/makeshift9mm(src)
	new /obj/item/reagent_containers/pill/patch/medkit/vial(src)
	new /obj/item/food/canned/halflife/beans(src)
	new /obj/item/reagent_containers/cup/glass/waterbottle(src)

/datum/trader_data/halflife/plf_recruiter
	shop_spot_type = /obj/structure/chair/halflife/overlaypickup/plastic
	sign_type = /obj/structure/halflife/sign/shop
	sociostability_loss = -10
	required_trait = TRAIT_PRISONER
	delete_trait_on_buy = TRUE

	initial_products = list(
		/obj/item/storage/box/syndicate/plf_recruiter = list(PAYCHECK_CREW, 5),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Sorry, friend, but I don't need this.",
			"Sorry, don't really need that right now.",
			"Ehhh, no thanks.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"What a shame.",
			"Hm, that's a no then, huh?"
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Thanks, friend.",
			"My pleasure.",
		),
		INTERESTED_PHRASE = list(
			"Hm, I'd buy it.",
			"Sure, why not.",
		),
		BUY_PHRASE = list(
			"Welcome to the Polish Liberation Front, friend.",
		),
		NO_CASH_PHRASE = list(
			"I do need a small donation in exchange for providing you equipment.",
		),
		NO_STOCK_PHRASE = list(
			"Sorry, I don't have any more equipment for new recruits.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Hm, no thanks.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"Sorry, but, this item looks pretty worthless to me.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I've already got too much of that unfortunately.",
		),
		TRADER_LORE_PHRASE = list(
			"One day, Poland will be free again.",
			"The combine will fall one day. One day...",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I'm all out of cash, can't buy anything more.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Ran out of stock, see me another time.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"For the Liberation Front!",
			"Some people just are too stupid to understand things around here!",
			"Fuck you!",
			"I've killed plenty of traitors like you before.",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Good riddance.",
			"Another traitor gone.",
			"Don't let the door hit you on the way out.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"The PLF stands strong.",
		),
	)
