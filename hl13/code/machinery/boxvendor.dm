/obj/machinery/box_vendor
	name = "\improper Factory Container Vendor"
	desc = "A machine which deposits containers for factory workers to fill, seal, and sell to the cargo dropship every afternoon."
	icon_state = "box_dispenser"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1500 //Because it is pretty important, and there probably will only be one of them.

	/// How many boxes are in this specific unit?
	var/boxes_stored = 0

	var/next_reminder = 0

	var/time_between_reminders = 2 MINUTES

	/// Additional reward that the foreman can take out of the machine for 100% completing quota. To be distributed, or kept entirely for him...
	var/cashprize = 0

/obj/machinery/box_vendor/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [boxes_stored] boxes left to dispense.")
	if(cashprize)
		. += span_notice("The vendor has a cash prize of [cashprize] credits stored inside for completing the quota. It can be redeemed by swiping a Foreman-level or higher card on it.")

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

/obj/machinery/box_vendor/process(delta_time)
	if(SSdaylight.day_cycle_active == DAY_CYCLE_AFTERNOON || SSdaylight.day_cycle_active == DAY_CYCLE_DUSK)
		if(next_reminder < world.time)
			next_reminder = world.time + time_between_reminders
			say("[SSdaylight.factory_containers_filled] containers out of the [SSdaylight.factory_container_goal] quota have been filled.") // Get to work

/obj/machinery/box_vendor/attackby(obj/item/item, mob/user, params)

	if(isliving(user))
		var/mob/living/living = user

		var/obj/item/card/id/card = living.get_idcard()
		if(card && cashprize)
			if(ACCESS_QM in card.GetAccess())
				to_chat(user, span_notice("Cash prize dispensed."))
				new /obj/item/stack/spacecash/c1(user.loc, cashprize)
				playsound(loc, 'hl13/sound/machines/atm/cardreader_insert.ogg', 30)
				cashprize = 0
			else
				to_chat(user, span_notice("This card does not have access to redeeming the vendor's cash prize."))
				return
