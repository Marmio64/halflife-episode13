///// A ration creation system. These items can be ordered at cargo, and a container will randomly pick 3 of these ingredient items to be required to be put inside.
///// Once all three of the ingredients are put in, you can then take the container and hit a ration vendor with it to refill it with more rations.

/obj/item/ration_construction
	name = "base ration construction item"
	desc = "Do not use this."
	icon = 'hl13/icons/obj/ration_construction.dmi'

/obj/item/ration_construction/packs
	name = "unfiltered nutrient packs"
	desc = "A handful of unfiltered, raw nutrient bars. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "packs"

/obj/item/ration_construction/boxes
	name = "unfiltered nutrient boxes"
	desc = "A handful of unfiltered, raw nutrient boxes. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "boxes"

/obj/item/ration_construction/bars
	name = "unfiltered flavor bars"
	desc = "A handful of unfiltered, raw flavor bars. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "bars"

/obj/item/ration_construction/bags
	name = "empty ration bags"
	desc = "A handful of empty, uncolored bags for putting rations inside of."
	icon_state = "bags"

/obj/item/ration_construction/blue_cans
	name = "unfiltered breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "cans"

/obj/item/ration_construction/yellow_cans
	name = "unfiltered yellow breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "yellowcans"

/obj/item/ration_construction/red_cans
	name = "unfiltered red breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "redcans"

/obj/item/ration_construction/container
	name = "ration refill container"
	desc = "A container which has a designated list of items it should contain. Once it has gotten these items, it can be put inside a ration vendor machine to refill it."
	icon_state = "container_empty"

	var/obj/required_item_1 = null
	var/obj/required_item_2 = null
	var/obj/required_item_3 = null

	var/item_1_fulfilled = FALSE
	var/item_2_fulfilled = FALSE
	var/item_3_fulfilled = FALSE

	var/completed = FALSE

/obj/item/ration_construction/container/examine(mob/user)
	. = ..()


	if(completed)
		. += span_notice("The container is filled correctly, and can now be deposited into a ration vendor.")

	if(required_item_1 && !item_1_fulfilled)
		. += span_notice("The container requires [required_item_1.name] to be put inside it.")
	if(required_item_2 && !item_2_fulfilled)
		. += span_notice("The container requires [required_item_2.name] to be put inside it.")
	if(required_item_3 && !item_3_fulfilled)
		. += span_notice("The container requires [required_item_3.name] to be put inside it.")

/obj/item/ration_construction/container/Initialize(mapload)
	. = ..()

	var/list/possible_items = list(/obj/item/ration_construction/packs, /obj/item/ration_construction/boxes, /obj/item/ration_construction/bars, /obj/item/ration_construction/bags, /obj/item/ration_construction/blue_cans, /obj/item/ration_construction/yellow_cans, /obj/item/ration_construction/red_cans)

	required_item_1 = pick_n_take(possible_items)
	required_item_2 = pick_n_take(possible_items)
	required_item_3 = pick_n_take(possible_items)

/obj/item/ration_construction/container/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ration_construction))
		if(istype(I, required_item_1) && !item_1_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_1_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold1.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return
	if(istype(I, /obj/item/ration_construction))
		if(istype(I, required_item_2) && !item_2_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_2_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold2.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return
	if(istype(I, /obj/item/ration_construction))
		if(istype(I, required_item_3) && !item_3_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_3_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold3.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return

	if(item_1_fulfilled && item_2_fulfilled && item_3_fulfilled)
		to_chat(usr, span_notice("Container succesfully completed. Reward dispensed."))
		new /obj/item/stack/spacecash/c1(user.loc, 3)
		completed = TRUE
		icon_state = "container"
		playsound(src, 'hl13/sound/halflifeeffects/crafting/ducttape1.ogg', 50, TRUE, extrarange = -3)

/obj/item/ration_construction/used_container
	name = "deposited ration refill container"
	desc = "An empty ration refill container that has been marked as received by a ration vendor unit. You can send it back on the cargo shuttle for recycling to gain a small amount of credits for the district's cargo budget."
	icon_state = "container_used"
