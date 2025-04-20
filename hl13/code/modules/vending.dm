/obj/machinery/vending/breenwater
	name = "\improper Breen's Private Reserve"
	desc = "The finest, most pure water around."
	icon = 'hl13/icons/obj/machines/vending_tall.dmi'
	icon_state = "breen_machine"
	panel_type = "panel2"
	product_ads = "Stay hydrated.;A thirsty citizen is a inefficient citizen.;Drink Breen's private reserve!;The purest water around."
	products = list(/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow = 8, /obj/item/reagent_containers/cup/soda_cans/breenwater = 8, /obj/item/reagent_containers/cup/soda_cans/breenwater/red = 4, /obj/item/reagent_containers/cup/soda_cans/breenwater/purple = 3, /obj/item/reagent_containers/cup/soda_cans/breenwater/fuel = 3)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/breen
	default_price = 15
	extra_price = 1
	payment_department = NO_FREEBIES
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/item/vending_refill/breen
	machine_name = "Breen's Private Reserve"
	icon_state = "refill_cola"

/obj/machinery/vending/gifts
	name = "\improper Shop Vendor"
	desc = "A vending machine for selling general store goods."
	icon_state = "parts"
	icon_deny = "parts-deny"
	product_slogans = "Stimulate the economy!;Sedate resistive thoughts!;Purchase neat belongings!;Buy, Buy, Buy!"
	vend_reply = "Thank you for using Gift Vendor!"
	products = list(/obj/item/clothing/under/citizen = 3,
					/obj/item/clothing/suit/bluejacket = 5,
					/obj/item/camera_film = 10,
					/obj/item/camera = 3,
					/obj/item/hourglass = 2,
					/obj/item/instrument/harmonica = 1,
					/obj/item/instrument/piano_synth = 1,
					/obj/item/taperecorder = 3,
					/obj/item/flashlight = 5,
					/obj/item/clothing/head/beanie/black = 3,
					/obj/item/clothing/head/flatcap = 3,
					/obj/item/lighter/greyscale = 6,
					/obj/item/customlock = 8,
					/obj/item/customblank = 12,
					/obj/item/screwdriver/halflife = 6,
					/obj/item/storage/halflife/keyring = 4,
					/obj/item/storage/wallet = 10,
					/obj/item/radio/off/halflife = 3,
					/obj/item/reagent_containers/cup/bottle/welding_fuel = 3,
					/obj/item/food/rationpack/box = 5,
					/obj/item/food/flavorbar = 5,
					/obj/item/reagent_containers/pill/patch/medkit/vial = 3,
					/obj/item/stack/sticky_tape = 4,
					/obj/item/storage/toolbox/fishing = 2,
					/obj/item/storage/box/fishing_hooks = 2,
					/obj/item/storage/box/fishing_lines = 2,
					/obj/item/storage/box/fishing_lures = 2,
					/obj/item/stack/sheet/cloth = 5,
					/obj/item/tape = 5, //tape recorder stuff
					/obj/item/taperecorder = 2,
					/obj/item/storage/fancy/cigarettes/halflife = 8,
					/obj/item/storage/box/coffeepack = 3, //for coffee makers
					/obj/item/clothing/gloves/fingerless = 3)

	contraband = list(/obj/item/lockpick = 1,
	                  /obj/item/clothing/suit/armor/browncoat = 1)

	premium = list(/obj/item/storage/backpack/halflife/satchel = 3,
				   /obj/item/storage/backpack/halflife = 3,
				   /obj/item/binoculars = 3,
				   /obj/item/storage/box/halflife/ration = 5)

	light_mask = "gifts-light-mask"
	default_price = 20
	extra_price = 35

/obj/machinery/vending/miningvendor
	name = "\improper Union Vendor"
	desc = "Acquire useful mining tools and equipment here."
	icon_state = "mining"
	panel_type = "panel2"
	product_ads = "Acquire high grade equipment here.;Improve your work efficiency.;Better serve the combine!;Quit being useless."
	products = list(/obj/item/pickaxe/mini = 6,
					/obj/item/food/rationpack/box = 6,
					/obj/item/reagent_containers/pill/patch/medkit = 6)

	premium = list(/obj/item/storage/belt/pouch = 6,
				   /obj/item/storage/belt/utility = 5,
				   /obj/item/storage/box/halflife/betterration = 6,
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
		/obj/item/reagent_containers/pill/multiver = 3,
		/obj/item/reagent_containers/pill/potassiodide = 3,
		/obj/item/reagent_containers/pill/iron = 4,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
		/obj/item/reagent_containers/hypospray/medipen = 3,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 2,
		/obj/item/reagent_containers/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
	)
	refill_canister = /obj/item/vending_refill/combine_wallmed
	default_price = PAYCHECK_CREW * 1.5
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
	desc = "An equipment vendor for civil protection to spend their hard earned credits on overpriced items."
	product_ads = "Improve your ability to patrol.;Purchase additional supplies.;Help insure your family cohesion"
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/lockpick/combine = 3,
		/obj/item/gps = 4,
		/obj/item/flashlight/flare = 6,
		/obj/item/restraints/handcuffs/cable/zipties = 8,
		/obj/item/ammo_box/magazine/usp9mm/rubber = 8,
		/obj/item/ammo_box/magazine/usp9mm = 4,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 4,
		/obj/item/reagent_containers/spray/pepper = 6,
		/obj/item/radio/civpro = 8,
		/obj/item/stack/credit_voucher = 10,
	)
	contraband = list(
		/obj/item/clothing/glasses/sunglasses = 2,
	)
	premium = list(
		/obj/item/storage/backpack/halflife/satchel = 3,
		/obj/item/storage/backpack/halflife/satchel/military = 3,
	)
	refill_canister = /obj/item/vending_refill/civpro
	default_price = PAYCHECK_CREW
	extra_price = PAYCHECK_COMMAND * 3
	payment_department = NO_FREEBIES

/obj/item/vending_refill/civpro
	machine_name = "Metropolice Supply Vendor"
	icon_state = "refill_sec"

/obj/machinery/vending/armory
	name = "\improper Armory Vendor"
	desc = "A machine which holds lethal equipment in an easy to sort manner. Requisitioning from here is a poor mark on the sociostability of your district, and will actively lower it."
	product_ads = "Acquire emergency supplies.;Restock and resupply.;Help insure your family cohesion."
	icon = 'hl13/icons/obj/machines/vending.dmi'
	icon_state = "sec"
	icon_deny = "sec-deny"
	panel_type = "panel6"
	light_mask = "sec-light-mask"
	products = list(
		/obj/item/gun/ballistic/automatic/mp7 = 1,
		/obj/item/ammo_box/magazine/mp7 = 2,
		/obj/item/gun/ballistic/shotgun/spas12 = 1,
		/obj/item/storage/box/lethalshot/halflife = 2,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/grenade/spawnergrenade/manhacks = 2,
		/obj/item/gun/ballistic/automatic/pistol/usp = 1,
		/obj/item/ammo_box/magazine/usp9mm = 3,
		/obj/item/ammo_box/colta357 = 1,
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
	SSsociostability.modifystability(-20) //All the equipment in this vendor is lethal. Not having to resort to lethals is a mark of good sociostability. In total if you empty the machine, you lose 300 sociostability aka 30%

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
		/obj/item/storage/halflife/keyring = 6,
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
