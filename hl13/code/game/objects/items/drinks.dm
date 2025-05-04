
/obj/item/reagent_containers/cup/soda_cans/breenwater
	name = "water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory!"
	icon_state = "breenwater"
	list_reagents = list(/datum/reagent/water = 25)

/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow
	name = "yellow water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted yellow, and smells funny."
	icon_state = "breenwateryellow"
	list_reagents = list(/datum/reagent/water/unpurified = 20)
	custom_price = PAYCHECK_CREW * 0.65

/obj/item/reagent_containers/cup/soda_cans/breenwater/red
	name = "red water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted red, and seems more filled."
	icon_state = "breenwaterred"
	list_reagents = list(/datum/reagent/water = 35)
	custom_price = PAYCHECK_CREW * 1.3

/obj/item/reagent_containers/cup/soda_cans/breenwater/green
	name = "green water can"
	desc = "A special can of Breen's private reserve water, for the best of the best. Flavored, and topped off to full."
	icon_state = "breenwatergreen"
	list_reagents = list(/datum/reagent/water = 35, /datum/reagent/consumable/tonic = 5, /datum/reagent/consumable/sugar = 10)
	custom_price = PAYCHECK_CREW * 1.5

/obj/item/reagent_containers/cup/soda_cans/breenwater/purple
	name = "purple nutriment can"
	desc = "A special can of Breen's private reserve... Actually, this is a special oil-flavored 'nutriment fulfilling' can. It's not an offensive taste, but it isn't great and costs a lot for the calorie content..."
	icon_state = "breenwaterpurple"
	list_reagents = list(/datum/reagent/water = 7, /datum/reagent/consumable/nutriment/fat/oil = 15, /datum/reagent/consumable/nutriment = 3)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/soda_cans/breenwater/fuel
	name = "breen-fuel can"
	desc = "A special can of Breen's private reserve energy drinks. It has a strange after taste and makes you feel queezy, but you do at least feel more awake."
	icon_state = "fuelcan"
	list_reagents = list(/datum/reagent/consumable/breenfuel = 25)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/glass/mouthwash
	name = "Mouthwash Bottle"
	desc = "A bottle of old mouthwash. There's enough sugar in the thing you wonder how it would ever clean your mouth, let alone with how old it is."
	isGlass = FALSE
	icon_state = "mouthwash"
	list_reagents = list(/datum/reagent/consumable/sugar = 15, /datum/reagent/consumable/ethanol = 7, /datum/reagent/water = 28)

/obj/item/reagent_containers/cup/soda_cans/halflife/coffee
	name = "Combine Coffee"
	desc = "A dark beverage inside an equally dark metal can. It tastes like day-old burnt coffee."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 25)
	custom_price = PAYCHECK_CREW * 2
