/obj/structure/halflife/toilet
	name = "toilet"
	desc = "An old toilet. It's obviously seen better years, alas you think you can still see some water in it. Care for a drink?"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE

/obj/structure/sink/halflife
	name = "sink"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	has_water_reclaimer = TRUE
	reclaim_rate = 0.1
	pixel_shift = 0

/obj/structure/sink/halflife/dirty
	name = "filthy sink"
	desc = "There isn't a clean sink left in the world most likely, but this one is espescially filthy. The rusty and mold filled faucet leads you to think twice about drinking from it."
	dispensedreagent = /datum/reagent/water/dirty

/obj/machinery/shower/halflife
	name = "shower"
	desc = "An old shower, there must still be some water in the tank since it works, but you probably shouldn't leave your mouth open whilst using it."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "shower"
	pixel_shift = 0
	reagent_id = /datum/reagent/water
