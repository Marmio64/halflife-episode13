/obj/machinery/ammo_crate
	name = "Ammo Crate"
	desc = "A large ammo crate. It's somewhat slow to grab out of, and has a limited amount of ammo it can give before it must recharge, but is an infinite source of ammunition."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "ammocrate"
	anchored = TRUE
	density = TRUE
	max_integrity = 400
	var/ammo_amount = 3
	var/ammo_max = 10
	var/list/vendoptions = list("USP Match", "Mosin", "MP7", "SPAS12", "Colt Python", "Service Rifle", "Pulse SMG", "AK-47", "AR2")

/obj/machinery/ammo_crate/low_health
	max_integrity = 150 //no body blocking crap with ammo crates

/obj/machinery/ammo_crate/process(delta_time)
	if(ammo_amount < ammo_max)
		ammo_amount += 0.05

/obj/machinery/ammo_crate/examine(mob/user)
	. = ..()
	. += span_notice("It has [floor(ammo_amount)] uses currently. You can click it to take out ammo.")

/obj/machinery/ammo_crate/interact(mob/living/carbon/human/user)
	. = ..()

	if(ammo_amount < 1)
		say("No ammo available.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	var/choice = tgui_input_list(user, "Which ammo type would you like?", "Ammo Type", vendoptions)
	if(isnull(choice))
		return
	var/ammo_to_dispense = null
	switch(choice)
		if("USP Match")
			ammo_to_dispense = /obj/item/ammo_box/magazine/usp9mm
		if("Mosin")
			ammo_to_dispense = /obj/item/ammo_box/strilka310/a762
		if("MP7")
			ammo_to_dispense = /obj/item/ammo_box/magazine/mp7
		if("SPAS12")
			ammo_to_dispense = /obj/item/storage/box/lethalshot/halflife
		if("Colt Python")
			ammo_to_dispense = /obj/item/ammo_box/colta357
		if("Service Rifle")
			ammo_to_dispense = /obj/item/ammo_box/magazine/m4a1/service
		if("Pulse SMG")
			ammo_to_dispense = /obj/item/ammo_box/magazine/pulsesmg
		if("AK-47")
			ammo_to_dispense = /obj/item/ammo_box/magazine/ak47
		if("AR2")
			ammo_to_dispense = /obj/item/ammo_box/magazine/ar2

	if(ammo_to_dispense)
		playsound(src, 'hl13/sound/effects/ammocrate_open.ogg', 50, TRUE, extrarange = -3)
		if(do_after(user, 3 SECONDS, src))
			ammo_amount--
			new ammo_to_dispense(loc)
			playsound(src, 'hl13/sound/effects/ammo_pickup.ogg', 50, TRUE, extrarange = -3)
