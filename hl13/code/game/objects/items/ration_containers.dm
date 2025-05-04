//New food and ration sprites are from Half Life City 13 Rebuilt, AGPL 3.0 licensed.

/obj/item/storage/box/halflife/ration
	icon = 'hl13/icons/obj/storage/rationbags.dmi'

/obj/item/storage/box/halflife/ration/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2

/obj/item/storage/box/halflife/ration/ration
	name = "ration pack"
	desc = "A pack with ration items inside."
	foldable_result = null
	icon_state = "ration"

/obj/item/storage/box/halflife/ration/ration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/halflife/nutrient_bar_wrapping/water(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater(src)
	new /obj/item/stack/spacecash/c1(src, 5)

/obj/item/storage/box/halflife/ration/betterration
	name = "production-grade ration pack"
	desc = "A slightly enhanced ration pack for productive citizens."
	foldable_result = null
	icon_state = "ration-bettergrade"

/obj/item/storage/box/halflife/ration/betterration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/storage/halflife/hand_box/egg(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/stack/spacecash/c10(src)

/obj/item/storage/box/halflife/ration/loyaltyration
	name = "loyalty-grade ration pack"
	desc = "An improved ration pack, intended for loyalists and civil protection. The food inside is slightly more filling and flavorful."
	foldable_result = null
	icon_state = "ration-highgrade"

/obj/item/storage/box/halflife/ration/loyaltyration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/halflife/nutrient_bar_wrapping/pork(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/food/halflife/cookie(src)
	new /obj/item/stack/credit_voucher(src, 3)

/obj/item/storage/box/halflife/ration/bestration
	name = "priority-grade ration pack"
	desc = "An extra high grade ration pack. It's pretty good in comparison, though still not incredible."
	foldable_result = null
	icon_state = "ration-bestgrade"

/obj/item/storage/box/halflife/ration/bestration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/halflife/nutrient_bar_wrapping/beef(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/green(src)
	new /obj/item/food/halflife/cookie(src)
	new /obj/item/reagent_containers/cup/soda_cans/halflife/coffee(src)
	new /obj/item/stack/credit_voucher(src, 4)

/obj/item/storage/box/halflife/ration/badration
	name = "low-grade ration pack"
	desc = "A downgraded ration pack usually given to misbehaving citizens or your average biotic. This is utter garbage."
	foldable_result = null
	icon_state = "ration-lowgrade"
	custom_price = 25

/obj/item/storage/box/halflife/ration/badration/PopulateContents()
	new /obj/item/reagent_containers/cup/halflife/sustenance_dust(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow(src)

/obj/item/storage/box/halflife/ration/worstration
	name = "bottom-grade ration pack"
	desc = "A downgraded ration pack, usually dumped out onto the floor for despicable citizens and exceptionally bad biotics. You're not sure if you can call the stuff inside edible, even compared to normal rations. This is absolutely terrible garbage."
	foldable_result = null
	icon_state = "ration-worstgrade"
	custom_price = 25

/obj/item/storage/box/halflife/ration/worstration/PopulateContents()
	new /obj/item/food/nutripaste/small(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow(src)
