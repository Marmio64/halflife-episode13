/obj/structure/flora/tree/halflife/plain
	desc = "A tall, plain tree with wiltering, orange leaves.."
	icon = 'hl13/icons/obj/flora96x96.dmi'
	icon_state = "tree"
	pixel_x = -33

/obj/structure/flora/tree/halflife/plain/get_seethrough_map()
	return SEE_THROUGH_MAP_THREE_X_THREE

/obj/structure/flora/tree/halflife/plain/thin
	icon_state = "tree2"

/obj/structure/flora/tree/halflife/plain/concrete_large
	icon_state = "tree_concrete"

/obj/structure/flora/tree/halflife/plain/concrete_thin
	icon_state = "tree_concrete_2"

/obj/structure/flora/tree/halflife/pine
	desc = "A large, verdant green tree, seemingly unbothered by the destruction the combine have wrought upon the environment."
	icon = 'hl13/icons/obj/trees.dmi'
	icon_state = "pine_1"
	pixel_x = -16
	pixel_y = 6

/obj/structure/flora/tree/halflife/pine/get_seethrough_map()
	return SEE_THROUGH_MAP_THREE_X_THREE

/obj/structure/flora/tree/halflife/pine/style_random/Initialize(mapload)
	. = ..()
	icon_state = "pine_[rand(1, 4)]"
	update_appearance()

	if(!length(GLOB.holidays))
		return

	var/holiday_name = length(GLOB.holidays) && pick(GLOB.holidays)
	if(holiday_name)
		var/datum/holiday/holiday = GLOB.holidays[holiday_name]
		if(istype(holiday, /datum/holiday/xmas))
			icon_state = "pine_[rand(1, 2)]_snow"

		update_appearance()

/obj/structure/flora/tree/halflife/pine/dead
	desc = "Another casualty in the combine's war on Earth."
	icon_state = "pine_5"

//stalker13 wild roots
/obj/structure/flora/root
	name = "wild weeds"
	desc = "A useless weed which serves no purpose but to steal from other plants."
	harvested_desc = "Harvested, with only the residue of roots left."
	icon = 'hl13/icons/obj/flora.dmi'
	icon_state = "wild_root1"
	anchored = TRUE
	density = FALSE
	regrowth_time_low = 30 MINUTES
	regrowth_time_high = 50 MINUTES
	harvest_time = 8 SECONDS
	harvest_amount_low = 0
	harvest_amount_high = 2
	harvest_with_hands = TRUE
	can_uproot = FALSE
	flora_flags = FLORA_HERBAL

/obj/structure/flora/root/harvest(user, product_amount_multiplier)
	if(!..())
		return FALSE
	icon_state = "wild_root_no"
	return TRUE

/obj/structure/flora/root/regrow()
	..()
	icon_state = "wild_root[rand(1, 12)]"

/obj/structure/flora/root/Initialize()
	. = ..()
	icon_state = "wild_root[rand(1, 12)]"


// Potato
/obj/structure/flora/root/wild_potato
	name = "wild potato"
	desc = "Wild potatoes that have managed to survive in spite of everything, just in time for you to kill them."
	product_types = list(/obj/item/food/grown/potato = 1)
	harvest_message_low = "You fail to dig anything useful out from the roots."
	harvest_message_med = "You manage to unearth a wild potato."
	harvest_message_high = "You unearth a couple wild potatoes."

// Potato
/obj/structure/flora/root/wild_onion
	name = "wild onion"
	desc = "Wild onions that have managed to survive in spite of everything, just in time for you to kill them."
	product_types = list(/obj/item/food/grown/onion = 1)
	harvest_message_low = "You fail to dig anything useful out from the roots."
	harvest_message_med = "You manage to unearth a wild onion."
	harvest_message_high = "You unearth a couple wild onions."
