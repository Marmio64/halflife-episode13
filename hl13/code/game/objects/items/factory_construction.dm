

/obj/item/factory_construction
	icon = 'hl13/icons/obj/factory_construction.dmi'

/obj/item/factory_construction/container
	name = "factory goods container"
	desc = "A container which has a designated list of items it should contain. Once it has gotten these items, it can be sealed and sold on the cargo dropship."
	icon_state = "container_empty"

	var/obj/required_item_1 = null
	var/obj/required_item_2 = null
	var/obj/required_item_3 = null

	var/item_1_fulfilled = FALSE
	var/item_2_fulfilled = FALSE
	var/item_3_fulfilled = FALSE

	///Are all ingredients inside?
	var/filled = FALSE

/obj/item/factory_construction/container/examine(mob/user)
	. = ..()



	if(filled)
		. += span_notice("The container is filled correctly. You can now seal it by hand slowly, or use a sealing machine in the factory to seal it quickly.")

	if(required_item_1 && !item_1_fulfilled)
		. += span_notice("The container requires [required_item_1.name] to be put inside it.")
	if(required_item_2 && !item_2_fulfilled)
		. += span_notice("The container requires [required_item_2.name] to be put inside it.")
	if(required_item_3 && !item_3_fulfilled)
		. += span_notice("The container requires [required_item_3.name] to be put inside it.")

/obj/item/factory_construction/container/Initialize(mapload)
	. = ..()

	var/list/possible_items = list(/obj/item/stack/sheet/iron,
									/obj/item/stack/sheet/ironpowder,
									/obj/item/stack/sheet/ironingot,
									/obj/item/stack/sheet/scrap_parts,
									/obj/item/stack/sheet/scrap_metal,
									/obj/item/stack/rods)

	required_item_1 = pick_n_take(possible_items)
	required_item_2 = pick_n_take(possible_items)
	required_item_3 = pick_n_take(possible_items)

/obj/item/factory_construction/container/attackby(obj/item/I, mob/user, params)
	if(istype(I, required_item_1) && !item_1_fulfilled)
		if(do_after(user, 1.5 SECONDS, src))
			if(istype(I, /obj/item/stack))
				I.use(1)
			else
				qdel(I)
			item_1_fulfilled = TRUE
			to_chat(usr, span_notice("Ingredient inserted."))
			playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold1.ogg', 50, TRUE, extrarange = -3)
		else
			to_chat(usr, span_notice("Packing Failed."))
			return

	if(istype(I, required_item_2) && !item_2_fulfilled)
		if(do_after(user, 1.5 SECONDS, src))
			if(istype(I, /obj/item/stack))
				I.use(1)
			else
				qdel(I)
			item_2_fulfilled = TRUE
			to_chat(usr, span_notice("Ingredient inserted."))
			playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold2.ogg', 50, TRUE, extrarange = -3)
		else
			to_chat(usr, span_notice("Packing Failed."))
			return

	if(istype(I, required_item_3) && !item_3_fulfilled)
		if(do_after(user, 1.5 SECONDS, src))
			if(istype(I, /obj/item/stack))
				I.use(1)
			else
				qdel(I)
			item_3_fulfilled = TRUE
			to_chat(usr, span_notice("Ingredient inserted."))
			playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold3.ogg', 50, TRUE, extrarange = -3)
		else
			to_chat(usr, span_notice("Packing Failed."))
			return
	else
		to_chat(usr, span_notice("This is not the correct ingredient."))

		if(item_1_fulfilled && item_2_fulfilled && item_3_fulfilled) //Sanity check
			to_chat(usr, span_notice("Container has been filled correctly. Seal with hands while holding to complete, or use a sealing machine."))
			filled = TRUE

		return

	if(item_1_fulfilled && item_2_fulfilled && item_3_fulfilled)
		to_chat(usr, span_notice("Container has been filled correctly. Seal with hands while holding to complete, or use a sealing machine."))
		filled = TRUE

/obj/item/factory_construction/container/attack_self(mob/user)
	if(filled)
		to_chat(usr, span_notice("Sealing box..."))
		if(do_after(user, 5 SECONDS, src))
			to_chat(usr, span_notice("Container succesfully sealed. Reward dispensed."))
			seal(user)
	else
		to_chat(usr, span_notice("The box isn't yet fully filled, and can not be sealed."))
		return

/obj/item/factory_construction/container/proc/seal(mob/user, reward = 3)
	playsound(src, 'hl13/sound/halflifeeffects/crafting/ducttape1.ogg', 50, TRUE, extrarange = -3)
	new /obj/item/factory_construction/full_container(user.loc)
	new /obj/item/stack/spacecash/c1(user.loc, reward)
	SSsociostability.modifystability(2) //Working increases stability
	SSdaylight.factory_containers_filled++ //Work to earn the right to work. To earn the right to work...
	qdel(src)

/obj/item/factory_construction/full_container
	name = "sealed factory container"
	desc = "A full factory goods container which has been sealed correctly. You can send it on the cargo shuttle for exporting to gain some credits for the district's cargo budget."
	icon_state = "container"
