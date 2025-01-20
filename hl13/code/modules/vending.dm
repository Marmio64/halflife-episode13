/obj/machinery/vending/breenwater
	name = "\improper Breen's Private Reserve"
	desc = "The finest, most pure water around."
	icon = 'hl13/icons/obj/vending.dmi'
	icon_state = "breen_machine"
	panel_type = "panel2"
	product_ads = "Stay hydrated.;A thirsty citizen is a inefficient citizen.;Drink Breen's private reserve!;The purest water around."
	products = list(/obj/item/reagent_containers/cup/soda_cans/breenwater = 20)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/breen
	default_price = 20
	extra_price = 1
	payment_department = NO_FREEBIES

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
					/obj/item/camera_film = 10,
					/obj/item/camera = 3,
					/obj/item/hourglass = 2,
					/obj/item/instrument/harmonica = 1,
					/obj/item/instrument/piano_synth = 1,
					/obj/item/taperecorder = 3,
					/obj/item/flashlight = 3,
					/obj/item/clothing/head/beanie/black = 3,
					/obj/item/clothing/head/flatcap = 3,
					/obj/item/lighter/greyscale = 3,
					/obj/item/customlock = 8,
					/obj/item/customblank = 12,
					/obj/item/storage/wallet = 10,
					/obj/item/radio/off/halflife = 3,
					/obj/item/reagent_containers/cup/bottle/welding_fuel = 3,
					/obj/item/food/rationpack/box = 5,
					/obj/item/reagent_containers/pill/patch/medkit/vial = 3,
					/obj/item/stack/sticky_tape = 2,
					/obj/item/storage/toolbox/fishing = 2,
					/obj/item/storage/box/fishing_hooks = 2,
					/obj/item/storage/box/fishing_lines = 2,
					/obj/item/storage/box/fishing_lures = 2,
					/obj/item/storage/fancy/cigarettes/halflife = 5,
					/obj/item/clothing/gloves/fingerless = 3)

	contraband = list(/obj/item/lockpick = 1,
	                  /obj/item/clothing/suit/armor/browncoat = 1)

	premium = list(/obj/item/storage/backpack = 3,
				   /obj/item/binoculars = 3,
				   /obj/item/storage/box/halflife/ration = 3)

	light_mask = "gifts-light-mask"
	default_price = 20
	extra_price = 35

/obj/machinery/vending/miningvendor
	name = "\improper Miner Vendor"
	desc = "Acquire useful mining tools and equipment here."
	icon_state = "mining"
	panel_type = "panel2"
	product_ads = "Acquire high grade equipment here.;Improve your work efficiency.;Better serve the combine!;Quit being useless."
	products = list(/obj/item/pickaxe/mini = 5,
					/obj/item/food/rationpack/box = 5,
					/obj/item/reagent_containers/pill/patch/medkit = 5)

	premium = list(/obj/item/storage/belt/pouch = 5,
				   /obj/item/storage/box/halflife/betterration = 5,
				   /obj/item/flashlight/seclite = 5)

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
	icon = 'hl13/icons/obj/vending.dmi'
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	products = list(
		/obj/item/reagent_containers/syringe = 3,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 5,
		/obj/item/reagent_containers/pill/multiver = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/simple = 2,
		/obj/item/stack/medical/bone_gel = 2,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 2,
		/obj/item/reagent_containers/pill/morphine = 2,
		/obj/item/storage/box/gum/happiness = 1,
	)
	refill_canister = /obj/item/vending_refill/combine_wallmed
	default_price = PAYCHECK_COMMAND //Double the medical price due to being meant for public consumption, not player specfic
	extra_price = PAYCHECK_COMMAND * 1.5
	payment_department = ACCOUNT_MED
	tiltable = FALSE
	light_mask = "wallmed-light-mask"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/combine_wallmed, 32)

/obj/item/vending_refill/combine_wallmed
	machine_name = "Combine Automated Med Shop"
	icon_state = "refill_medical"
