
/obj/item/reagent_containers/cup/soda_cans/breenwater
	name = "water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory!"
	icon_state = "breen_can"
	icon = 'hl13/icons/obj/drinks.dmi'
	list_reagents = list(/datum/reagent/water = 25)

/obj/item/reagent_containers/cup/soda_cans/breenwater/open_soda(mob/user)
	. = ..()
	icon_state = "[icon_state]_open"

/obj/item/reagent_containers/cup/soda_cans/breenwater/empty
	name = "water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory!"
	icon_state = "breen_can_open"
	list_reagents = null
	reagent_flags = OPENCONTAINER
	spillable = TRUE
	throwforce = 0

/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow
	name = "yellow water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted yellow, and smells funny."
	icon_state = "breen_can_yellow"
	list_reagents = list(/datum/reagent/water/unpurified = 20)
	custom_price = PAYCHECK_CREW * 0.5 //4 credits

/obj/item/reagent_containers/cup/soda_cans/breenwater/red
	name = "red water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted red, and seems more filled."
	icon_state = "breen_can_red"
	list_reagents = list(/datum/reagent/water = 35)
	volume = 35
	custom_price = PAYCHECK_CREW * 1.15 //9 credits

/obj/item/reagent_containers/cup/soda_cans/breenwater/green
	name = "green water can"
	desc = "A special can of Breen's private reserve water, for the best of the best. Flavored, and topped off to full."
	icon_state = "breen_can_green"
	list_reagents = list(/datum/reagent/water = 35, /datum/reagent/consumable/greenflavor = 15)
	volume = 50
	custom_price = PAYCHECK_CREW * 1.5 //12 credits

/obj/item/reagent_containers/cup/soda_cans/breenwater/purple
	name = "purple nutriment can"
	desc = "A special can of Breen's private reserve... Actually, this is a special oil-flavored 'nutriment fulfilling' can. It's not an offensive taste, but it isn't great and costs a lot for the calorie content..."
	icon_state = "breen_can_purple"
	list_reagents = list(/datum/reagent/water = 7, /datum/reagent/consumable/nutriment/fat/oil = 15, /datum/reagent/consumable/nutriment = 3)
	custom_price = PAYCHECK_CREW * 1.75

/obj/item/reagent_containers/cup/soda_cans/breenwater/purple/protein
	name = "purple protein can"
	desc = "A special can of Breen's private reserve... Actually, this is a special protein filled can. It's an expensive drink meant for the hard working, filled with protein and combine approved steroids for muscle growth."
	icon_state = "breen_can_purple"
	list_reagents = list(/datum/reagent/water = 7, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/inverse/oxandrolone = 12)
	custom_price = PAYCHECK_CREW * 2.25

/obj/item/reagent_containers/cup/soda_cans/breenwater/fuel
	name = "breen-fuel can"
	desc = "A discontinued can of Breen-Fuel. It was designed as a cheap energy drink which gave citizens extra energy to complete work for their benefactors, but production stopped after studies showed it had adverse health effects and the short term gains were not worth the longterm costs of lost labor."
	icon_state = "breen_can_red"
	list_reagents = list(/datum/reagent/consumable/breenfuel = 30)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/glass/mouthwash
	name = "Mouthwash Bottle"
	desc = "A bottle of old mouthwash. There's enough sugar in the thing you wonder how it would ever clean your mouth, let alone with how old it is."
	isGlass = FALSE
	icon_state = "mouthwash"
	icon = 'hl13/icons/obj/drinks.dmi'
	list_reagents = list(/datum/reagent/consumable/sugar = 15, /datum/reagent/consumable/ethanol = 7, /datum/reagent/water = 28)

/obj/item/reagent_containers/cup/soda_cans/halflife/coffee
	name = "Combine Coffee"
	desc = "A dark beverage inside an equally dark metal can. It tastes like day-old burnt coffee. It's good at delaying the onset of tiredness, but is often not enough if you're already exhausted."
	icon = 'hl13/icons/obj/drinks.dmi'
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 30)
	custom_price = PAYCHECK_CREW * 1.5

/obj/item/reagent_containers/cup/headcrab_musk
	name = "headcrab musk bottle"
	desc = "An earthenware container which is meant to hold the foul pheromones of headcrabs. Drinking some may let you disguise as the beasts for a while, but the terrible taste may lead you to quickly vomit."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "musk"
	inhand_icon_state = null
	list_reagents = list(/datum/reagent/headcrab_musk = 15)

/obj/item/reagent_containers/cup/glass/canteen
	name = "canteen"
	desc = "A metal flask that is excellent for efficiently storing water."
	icon = 'hl13/icons/obj/drinks.dmi'
	icon_state = "canteen"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*2.5)
	volume = 150
	list_reagents = list(/datum/reagent/water = 150)
	w_class = WEIGHT_CLASS_SMALL
	isGlass = FALSE
