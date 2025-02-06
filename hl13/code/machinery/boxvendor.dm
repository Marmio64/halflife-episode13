/obj/machinery/box_vendor
	name = "\improper Factory Container Vendor"
	desc = "A machine which deposits containers for factory workers to fill, seal, and sell to the cargo dropship every afternoon."
	icon_state = "box_dispenser"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1500 //Because it is pretty important, and there probably will only be one of them.

	/// How many boxes are in this specific unit?
	var/boxes_stored = 0

/obj/machinery/box_vendor/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [boxes_stored] boxes left to dispense.")

/obj/machinery/box_vendor/interact(mob/living/carbon/human/user)
	. = ..()

	if(boxes_stored < 1)
		say("Machine has no stored boxes. Wait until next work period.") // Refill immediately!
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	playsound(src, 'hl13/sound/machines/combine_button3.ogg', 50, TRUE, extrarange = -3)

	if(!do_after(user, 3 SECONDS, src))
		to_chat(usr, span_warning("The machine did not finish depositing a box."))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	playsound(src, 'hl13/sound/machines/combine_button5.ogg', 50, TRUE, extrarange = -3)

	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)

	boxes_stored--

	new /obj/item/factory_construction/container(loc)

	return
