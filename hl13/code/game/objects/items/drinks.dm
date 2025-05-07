
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
	custom_price = PAYCHECK_CREW * 0.65

/obj/item/reagent_containers/cup/soda_cans/breenwater/red
	name = "red water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted red, and seems more filled."
	icon_state = "breen_can_red"
	list_reagents = list(/datum/reagent/water = 35)
	custom_price = PAYCHECK_CREW * 1.3

/obj/item/reagent_containers/cup/soda_cans/breenwater/green
	name = "green water can"
	desc = "A special can of Breen's private reserve water, for the best of the best. Flavored, and topped off to full."
	icon_state = "breen_can_green"
	list_reagents = list(/datum/reagent/water = 35, /datum/reagent/consumable/tonic = 5, /datum/reagent/consumable/sugar = 10)
	custom_price = PAYCHECK_CREW * 1.5

/obj/item/reagent_containers/cup/soda_cans/breenwater/purple
	name = "purple nutriment can"
	desc = "A special can of Breen's private reserve... Actually, this is a special oil-flavored 'nutriment fulfilling' can. It's not an offensive taste, but it isn't great and costs a lot for the calorie content..."
	icon_state = "breen_can_purple"
	list_reagents = list(/datum/reagent/water = 7, /datum/reagent/consumable/nutriment/fat/oil = 15, /datum/reagent/consumable/nutriment = 3)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/soda_cans/breenwater/fuel
	name = "breen-fuel can"
	desc = "A special can of Breen's private reserve energy drinks. It has a strange after taste and makes you feel queezy, but you do at least feel more awake."
	icon_state = "breen_can_red"
	list_reagents = list(/datum/reagent/consumable/breenfuel = 25)
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
	desc = "A dark beverage inside an equally dark metal can. It tastes like day-old burnt coffee. It's good at delaying the onset of tiredness, but isn't very useful if you're already very tired."
	icon = 'hl13/icons/obj/drinks.dmi'
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 30)
	custom_price = PAYCHECK_CREW * 1.5
