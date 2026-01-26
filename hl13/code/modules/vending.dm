/obj/machinery/vending/breenwater
	name = "\improper Breen's Private Reserve"
	desc = "The finest, most pure water around."
	icon = 'hl13/icons/obj/machines/vending_tall.dmi'
	icon_state = "breen_machine"
	panel_type = "panel2"
	product_ads = "Stay hydrated.;A thirsty citizen is a inefficient citizen.;Drink Breen's private reserve!;The purest water around."
	products = list(/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow = 8, /obj/item/reagent_containers/cup/soda_cans/breenwater = 8, /obj/item/reagent_containers/cup/soda_cans/breenwater/red = 4, /obj/item/reagent_containers/cup/soda_cans/breenwater/purple = 3, /obj/item/reagent_containers/cup/soda_cans/halflife/coffee = 3)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/breen
	default_price = 15
	extra_price = 1
	payment_department = NO_FREEBIES
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	all_products_free = FALSE

/obj/item/vending_refill/breen
	machine_name = "Breen's Private Reserve"
	icon_state = "refill_cola"

/obj/machinery/vending/gifts
	name = "\improper Shop Vendor"
	desc = "A vending machine for selling 'luxury' store goods."
	icon_state = "parts"
	icon_deny = "parts-deny"
	product_slogans = "Stimulate the economy!;Sedate resistive thoughts!;Purchase neat belongings!;Buy, Buy, Buy!"
	vend_reply = "Thank you for using Shop Vendor."
	products = list(/obj/item/clothing/under/citizen = 3,
					/obj/item/clothing/suit/bluejacket = 5,
					/obj/item/camera_film = 10,
					/obj/item/camera = 3,
					/obj/item/flashlight = 5,
					/obj/item/clothing/head/beanie/black = 3,
					/obj/item/clothing/head/flatcap = 3,
					/obj/item/lighter/greyscale = 6,
					/obj/item/storage/halflife/keyring = 4,
					/obj/item/storage/wallet = 10,
					/obj/item/radio/off/halflife = 5,
					/obj/item/radio/headset = 3,
					/obj/item/storage/halflife/hand_box/cookie = 5,
					/obj/item/reagent_containers/pill/patch/medkit/vial = 5,
					/obj/item/stack/sticky_tape = 4,
					/obj/item/tape = 5, //tape recorder stuff
					/obj/item/taperecorder = 3,
					/obj/item/storage/halflife/suitcase = 6,
					/obj/item/storage/fancy/cigarettes/halflife = 8,
					/obj/item/storage/halflife/pill_bottle/antifatigue = 6,
					/obj/item/reagent_containers/cup/glass/bottle/beer/light = 10,
					/obj/item/storage/belt/pouch = 6,
					/obj/item/storage/pill_bottle/mannitol/braintumor = 5,
					/obj/item/clothing/glasses/regular = 5,
					/obj/item/clothing/gloves/fingerless = 3)

	contraband = list(/obj/item/lockpick = 1,
	                  /obj/item/clothing/suit/armor/browncoat = 1)

	premium = list(/obj/item/storage/backpack/halflife/satchel = 3,
				   /obj/item/storage/backpack/halflife = 3,
				   /obj/item/storage/box/halflife/ration/ration = 5)

	light_mask = "gifts-light-mask"
	payment_department = NO_FREEBIES
	default_price = 6
	extra_price = 20

/obj/machinery/vending/miningvendor
	name = "\improper Union Vendor"
	desc = "Acquire useful mining tools and equipment here."
	icon_state = "mining"
	panel_type = "panel2"
	product_ads = "Acquire high grade equipment here.;Improve your work efficiency.;Better serve the combine!;Quit being useless."
	products = list(/obj/item/pickaxe/mini = 6,
					/obj/item/storage/halflife/hand_box/egg = 6,
					/obj/item/reagent_containers/pill/patch/medkit = 6)

	premium = list(/obj/item/storage/belt/pouch = 6,
				   /obj/item/storage/belt/utility = 5,
				   /obj/item/storage/box/halflife/ration/betterration = 6,
				   /obj/item/flashlight/seclite = 6)

	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/miner
	max_integrity = 500 //reinforced
	default_price = 20
	extra_price = 40
	payment_department = NO_FREEBIES

/obj/item/vending_refill/miner
	machine_name = "Miner Vendor"
	icon_state = "refill_cola"

/obj/machinery/vending/combine_wallmed
	name = "\improper Combine Automated Med Shop"
	desc = "The CAMS is a wall mounted vendor which sells basic medical supplies for high prices."
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/reagent_containers/syringe = 3,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 6,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 6,
		/obj/item/storage/halflife/pill_bottle/antitox = 3,
		/obj/item/reagent_containers/pill/potassiodide = 3,
		/obj/item/reagent_containers/pill/iron = 4,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/reagent_containers/hypospray/medipen = 3,
		/obj/item/storage/halflife/pill_bottle/paracetamol = 3,
		/obj/item/reagent_containers/hypospray/medipen/blood = 3,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 3,
		/obj/item/stack/medical/splint = 4,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 2,
		/obj/item/reagent_containers/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
	)
	refill_canister = /obj/item/vending_refill/combine_wallmed
	default_price = PAYCHECK_CREW * 1.25
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_MED
	tiltable = FALSE
	light_mask = "wallmed-light-mask"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/combine_wallmed, 32)

/obj/item/vending_refill/combine_wallmed
	machine_name = "Combine Automated Med Shop"
	icon_state = "refill_medical"

/obj/machinery/vending/civpro
	name = "\improper Metropolice Supply Vendor"
	desc = "An equipment vendor for civil protection to spend requisition points on supplies."
	product_ads = "Improve your ability to patrol.;Purchase additional supplies.;Help insure your family cohesion"
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	displayed_currency_name = " requisition points"
	tiltable = FALSE
	products = list(
		/obj/item/restraints/handcuffs = 12,
		/obj/item/lockpick/combine = 12,
		/obj/item/gps = 12,
		/obj/item/flashlight/flare = 12,
		/obj/item/ammo_box/magazine/usp9mm/rubber = 12,
		/obj/item/ammo_box/colta357 = 2,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 12,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 12,
		/obj/item/reagent_containers/spray/pepper = 12,
		/obj/item/radio/civpro = 12,
		/obj/item/halflife/combine_battery = 12,
		/obj/item/storage/halflife/pill_bottle/antifatigue = 12,
		/obj/item/food/nutripaste/small = 12,
		/obj/item/grenade/stingbang/halflife = 12,
		/obj/item/stack/kevlar = 12,
	)
	contraband = list(
		/obj/item/clothing/glasses/sunglasses = 2,
	)
	premium = list(
		/obj/item/storage/backpack/halflife/satchel/civilprotection = 12,
		/obj/item/gun/ballistic/automatic/pistol/usp/riot/civ_pro_vendor = 12,
		/obj/item/melee/baton/security/heavy/loaded = 12,
	)
	refill_canister = /obj/item/vending_refill/civpro
	default_price = 1
	extra_price = 3
	payment_department = NO_FREEBIES

/obj/machinery/vending/civpro/proceed_payment(obj/item/card/id/paying_id_card, mob/living/mob_paying, datum/data/vending_product/product_to_vend, price_to_use)
	if(coin_records.Find(product_to_vend) || hidden_records.Find(product_to_vend))
		price_to_use = product_to_vend.custom_premium_price ? product_to_vend.custom_premium_price : extra_price
	if(LAZYLEN(product_to_vend.returned_products))
		price_to_use = 0 //returned items are free
	if(price_to_use && !(paying_id_card.registered_account.requisition_points >= price_to_use)) //not enough points
		speak("You do not possess enough requisition points to purchase [product_to_vend.name].")
		flick(icon_deny, src)
		vend_ready = TRUE
		return FALSE

	paying_id_card.registered_account.requisition_points -= price_to_use
	return TRUE

/obj/machinery/vending/civpro/fetch_balance_to_use(obj/item/card/id/passed_id)
	return passed_id.registered_account.requisition_points

/obj/item/vending_refill/civpro
	machine_name = "Metropolice Supply Vendor"
	icon_state = "refill_sec"

/obj/machinery/vending/armory
	name = "\improper Armory Vendor"
	desc = "A machine which holds some lethal and less-lethal equipment in an easy to sort manner. Requisitioning from here is a poor mark on the sociostability of your district, and will actively lower it."
	product_ads = "Acquire emergency supplies.;Restock and resupply.;Help insure your family cohesion."
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	products = list(
		/obj/item/gun/ballistic/automatic/mp7/rubber = 1,
		/obj/item/ammo_box/magazine/mp7/rubber = 2,
		/obj/item/gun/ballistic/shotgun/spas12/beanbag = 1,
		/obj/item/storage/box/lethalshot/halflife/beanbag = 2,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/gun/ballistic/automatic/pistol/usp/riot = 1,
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/ammo_box/c38 = 1,
	)
	refill_canister = /obj/item/vending_refill/civpro
	default_price = PAYCHECK_ZERO
	extra_price = PAYCHECK_ZERO
	all_products_free = TRUE
	scan_id = FALSE

/obj/item/vending_refill/armory
	machine_name = "Armory Vendor"
	icon_state = "refill_sec"

/obj/machinery/vending/armory/on_dispense(obj/item/vended_item)
	SSsociostability.modifystability(-20) //All the equipment in this vendor is lethal. Not having to resort to lethals is a mark of good sociostability. In total if you empty the machine, you lose 200 sociostability aka 18%

/obj/machinery/vending/keyvendor
	name = "\improper Key Vendor"
	desc = "A wall mounted vendor which dispenses blank keys, locks, and screwdrivers, for taking ownership of any unowned apartments. More convenient, but more expensive compared to getting these items from the clerk or factory."
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "key"
	icon_deny = "key-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/customlock = 12,
		/obj/item/customblank = 14,
		/obj/item/storage/halflife/keyring = 12,
	)
	refill_canister = /obj/item/vending_refill/keyvendor
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_CREW * 1.5
	tiltable = FALSE
	light_mask = "wallmed-light-mask"
	payment_department = NO_FREEBIES

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/keyvendor, 32)

/obj/item/vending_refill/keyvendor
	machine_name = "Key Vendor"
	icon_state = "refill_snack"

/obj/machinery/vending/food_dispensery
	name = "\improper Food Ingredient Dispensery"
	desc = "The FID is a wall mounted vendor which sells approved food items."
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "fooddispenser"
	icon_deny = "fooddispenser-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/food/meat/slab/synthmeat = 3,
		/obj/item/food/meat/slab/meatproduct = 3,
		/obj/item/reagent_containers/condiment/flour = 3,
		/obj/item/reagent_containers/condiment/sugar = 1,
		/obj/item/reagent_containers/condiment/rice = 2,
		/obj/item/reagent_containers/condiment/soymilk = 2,
		/obj/item/reagent_containers/condiment/milk = 1,
		/obj/item/reagent_containers/cup/glass/bottle/juice/cream = 1,
		/obj/item/food/butter = 2,
		/obj/item/food/grown/onion = 3,
		/obj/item/food/grown/potato = 4,
		/obj/item/food/grown/tomato = 3,
		/obj/item/food/grown/corn = 3,
		/obj/item/food/grown/garlic = 3,
		/obj/item/food/grown/cabbage = 3,
		/obj/item/halflife/nutrient_bar_wrapping/water = 4,
		/obj/item/halflife/nutrient_bar_wrapping/pork = 2,
		/obj/item/halflife/nutrient_bar_wrapping/beef = 1,
		/obj/item/storage/halflife/hand_box/flour = 4,
		/obj/item/storage/halflife/hand_box/egg = 3,
		/obj/item/storage/halflife/hand_box/chicken = 2,
		/obj/item/storage/halflife/hand_box/cookie = 3,
		/obj/item/reagent_containers/cup/soda_cans/halflife/coffee = 6,
		/obj/item/reagent_containers/cup/soda_cans/breenwater/green = 6,
		/obj/item/reagent_containers/cup/soda_cans/breenwater/purple = 2,
		/obj/item/reagent_containers/cup/glass/bottle/beer/light = 10,
	)
	refill_canister = /obj/item/vending_refill/food_dispensery
	default_price = PAYCHECK_CREW/2
	extra_price = PAYCHECK_COMMAND/2
	payment_department = NO_FREEBIES
	tiltable = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/food_dispensery, 32)

/obj/item/vending_refill/food_dispensery
	machine_name = "Food Ingredient Dispensery"

/obj/machinery/vending/goods_dispensery
	name = "\improper Goods Dispensary"
	desc = "A wall mounted dispensary that sells general goods at high prices. The commissary clerk tends to have access to cheaper goods, but if there is no clerk, buying from here is an option."
	icon_state = "fooddispenser"
	icon_deny = "fooddispenser-deny"
	panel_type = "wallmed-panel"
	icon = 'hl13/icons/obj/machines/vending.dmi'
	density = FALSE
	tiltable = FALSE
	product_slogans = "Stimulate the economy!;Sedate resistive thoughts!;Purchase neat belongings!;Buy, Buy, Buy!"
	vend_reply = "Thank the combine for the ability to enjoy this."
	products = list(/obj/item/clothing/under/citizen = 3,
					/obj/item/clothing/suit/bluejacket = 5,
					/obj/item/camera_film = 3,
					/obj/item/camera = 3,
					/obj/item/flashlight = 5,
					/obj/item/clothing/head/beanie/black = 3,
					/obj/item/clothing/head/flatcap = 2,
					/obj/item/lighter/greyscale = 4,
					/obj/item/storage/halflife/keyring = 4,
					/obj/item/storage/wallet = 6,
					/obj/item/radio/off/halflife = 2,
					/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
					/obj/item/stack/sticky_tape = 1,
					/obj/item/stack/sheet/cloth = 8,
					/obj/item/storage/halflife/suitcase = 6,
					/obj/item/storage/fancy/cigarettes/halflife = 8,
					/obj/item/storage/halflife/pill_bottle/antifatigue = 4,
					/obj/item/clothing/gloves/fingerless = 3)

	premium = list(/obj/item/storage/backpack/halflife/satchel = 3,
				   /obj/item/storage/backpack/halflife = 3)

	default_price = 14
	extra_price = 35
