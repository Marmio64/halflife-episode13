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

/obj/item/ration_construction/purple_cans
	name = "unfiltered purple nutriment cans"
	desc = "A handful of unfiltered, sealed nutriment cans. Drinking (Eating?) them right now is out of the question, a machine will have to make them potable."
	icon_state = "purplecans"

/obj/item/ration_construction/nutripastes
	name = "unfiltered nutripastes"
	desc = "A handful of raw, unfiltered nutripaste tubes. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "nutripastes"

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

	///Are all ingredients inside?
	var/filled = FALSE
	///Is the box fully packed and sealed?
	var/completed = FALSE

	///How many rations are filled when this is completed?
	var/refill_rate = 3

	///How many credits to give when completed
	var/credit_reward = 2

	var/list/possible_picks = list(/obj/item/ration_construction/packs, /obj/item/ration_construction/boxes, /obj/item/ration_construction/bars, /obj/item/ration_construction/bags, /obj/item/ration_construction/blue_cans, /obj/item/ration_construction/yellow_cans, /obj/item/ration_construction/red_cans)

/obj/item/ration_construction/container/examine(mob/user)
	. = ..()


	if(completed)
		. += span_notice("The container is filled and sealed correctly, and can now be deposited into a ration vendor.")

	if(filled && !completed)
		. += span_notice("The container is filled correctly. You can now seal it by hand slowly, or use a sealing machine in the factory to seal it quickly.")

	if(required_item_1 && !item_1_fulfilled)
		. += span_notice("The container requires [required_item_1.name] to be put inside it.")
	if(required_item_2 && !item_2_fulfilled)
		. += span_notice("The container requires [required_item_2.name] to be put inside it.")
	if(required_item_3 && !item_3_fulfilled)
		. += span_notice("The container requires [required_item_3.name] to be put inside it.")

/obj/item/ration_construction/container/Initialize(mapload)
	. = ..()

	var/list/possible_items = possible_picks

	required_item_1 = pick_n_take(possible_items)
	required_item_2 = pick_n_take(possible_items)
	required_item_3 = pick_n_take(possible_items)

/obj/item/ration_construction/container/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ration_construction) || istype(I, /obj/item/food))
		if(istype(I, required_item_1) && !item_1_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_1_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold1.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return

		if(istype(I, required_item_2) && !item_2_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_2_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold2.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return

		if(istype(I, required_item_3) && !item_3_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_3_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold3.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return
	else
		to_chat(usr, span_notice("This is not the correct ingredient."))
		return

	if(item_1_fulfilled && item_2_fulfilled && item_3_fulfilled)
		to_chat(usr, span_notice("Container has been filled correctly. Seal with hands while holding to complete, or use a sealing machine."))
		filled = TRUE

/obj/item/ration_construction/container/attack_self(mob/user)
	if(filled && !completed)
		to_chat(usr, span_notice("Sealing box..."))
		if(do_after(user, 4 SECONDS, src))
			to_chat(usr, span_notice("Container succesfully sealed. Reward dispensed."))
			seal(user)
	else if(completed)
		to_chat(usr, span_notice("The box is already completed and sealed."))
		return
	else
		to_chat(usr, span_notice("The box isn't yet fully filled, and can not be sealed."))
		return

/obj/item/ration_construction/container/proc/seal(mob/user, reward = 0)
	reward += credit_reward
	playsound(src, 'hl13/sound/halflifeeffects/crafting/ducttape1.ogg', 50, TRUE, extrarange = -3)
	completed = TRUE
	new /obj/item/stack/spacecash/c1(user.loc, reward)
	icon_state = "container"
	SSsociostability.modifystability(1) //Working increases stability

/obj/item/ration_construction/used_container
	name = "deposited ration refill container"
	desc = "An empty ration refill container that has been marked as received by a ration vendor unit. You can send it back on the cargo shuttle for recycling to gain a small amount of credits for the district's cargo budget."
	icon_state = "container_used"

/obj/item/ration_construction/container/exotic
	name = "exotic ration refill container"
	desc = "A container which has a designated list of items it should contain. Once it has gotten these items, it can be put inside a ration vendor machine to refill it. This refill container has some exotic requirements."

	refill_rate = 5
	credit_reward = 5

	possible_picks = list(/obj/item/food/meat/slab/xen, /obj/item/food/grown/mushroom_stem, /obj/item/ration_construction/bags, /obj/item/ration_construction/nutripastes, /obj/item/ration_construction/purple_cans, /obj/item/food/grown/wheat)
