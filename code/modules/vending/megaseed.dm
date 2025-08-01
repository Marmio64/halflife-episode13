/obj/machinery/vending/hydroseeds
	name = "\improper Seed Dispenser" //hl13 edit
	desc = "When you need seeds fast!"
	product_slogans = "Acquire agricultural seed products.;Nutritious plant-inspired specimens."
	product_ads = "Create semi-organic crops.;Remain efficient."
	icon_state = "seeds"
	panel_type = "panel2"
	light_mask = "seeds-light-mask"

	products = list(
		/obj/item/seeds/hl2/blueshroom = 5,
		/obj/item/seeds/hl2/redshroom = 5,
		/obj/item/seeds/hl2/yellowshroom = 5,
		/obj/item/seeds/wheat = 3,
		/obj/item/seeds/wheat/oat = 3,
		/obj/item/seeds/wheat/rice = 3,
		/obj/item/seeds/coffee = 3,
		/obj/item/seeds/cotton = 3,
		/obj/item/seeds/onion = 3,
		/obj/item/seeds/potato = 3,
		/obj/item/seeds/cabbage = 3,
		/obj/item/seeds/garlic = 3,
		/obj/item/seeds/tomato = 3,
	)

	refill_canister = /obj/item/vending_refill/hydroseeds
	default_price = PAYCHECK_ZERO
	extra_price = PAYCHECK_ZERO
	all_products_free = TRUE
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/hydroseeds
	machine_name = "Seed Dispenser"
	icon_state = "refill_plant"
