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
	var/recharges = TRUE
	var/in_use = FALSE
	var/list/vendoptions = list("USP Match", "Mosin", "MP7", "SPAS12", "Colt Python", "M4A1", "Pulse SMG", "AK-47", "AR2")

/obj/machinery/ammo_crate/low_health
	max_integrity = 150 //no body blocking crap with ammo crates
	ammo_max = 3

/obj/machinery/ammo_crate/process(delta_time)
	if(ammo_amount < ammo_max && recharges)
		ammo_amount += 0.05

	if(!recharges && ammo_amount < 1 && !in_use)
		qdel(src)

/obj/machinery/ammo_crate/examine(mob/user)
	. = ..()
	. += span_notice("It has [floor(ammo_amount)] uses currently. You can click it to take out ammo.")

/obj/machinery/ammo_crate/interact(mob/living/carbon/human/user)
	. = ..()

	if(ammo_amount < 1)
		say("No ammo available.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	ammo_amount-- //no duping
	in_use = TRUE
	var/choice = tgui_input_list(user, "Which ammo type would you like?", "Ammo Type", vendoptions)
	if(isnull(choice))
		ammo_amount++
		in_use = FALSE
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
		if("M4A1")
			ammo_to_dispense = /obj/item/ammo_box/magazine/m4a1
		if("Pulse SMG")
			ammo_to_dispense = /obj/item/ammo_box/magazine/pulsesmg
		if("AK-47")
			ammo_to_dispense = /obj/item/ammo_box/magazine/ak47
		if("AR2")
			ammo_to_dispense = /obj/item/ammo_box/magazine/ar2
		if("MK3A2 Grenade")
			ammo_to_dispense = /obj/item/grenade/syndieminibomb/bouncer
		if("Dark Energy Ball")
			ammo_to_dispense = /obj/item/ammo_casing/pulse/energyball
		if("20mm Grenade")
			ammo_to_dispense = /obj/item/ammo_casing/a20mm
		if("Rocket")
			ammo_to_dispense = /obj/item/ammo_casing/rocket_hl13

	if(ammo_to_dispense)
		playsound(src, 'hl13/sound/effects/ammocrate_open.ogg', 50, TRUE, extrarange = -3)
		if(do_after(user, 3 SECONDS, src))
			new ammo_to_dispense(loc)
			playsound(src, 'hl13/sound/effects/ammo_pickup.ogg', 50, TRUE, extrarange = -3)
			in_use = FALSE
		else
			ammo_amount++
			in_use = FALSE
	else
		ammo_amount++
		in_use = FALSE

/obj/machinery/ammo_crate/grenade_crate
	name = "Grenade Crate"
	desc = "A large grenade crate. You can pull out a grenade after a short delay. It does not recharge grenades."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "grenadecrate"
	anchored = TRUE
	density = TRUE
	max_integrity = 150
	ammo_amount = 4
	recharges = FALSE
	vendoptions = list("MK3A2 Grenade")

/obj/machinery/ammo_crate/heavy
	name = "Heavy Ammo Crate"
	desc = "A large ammo crate. Contains special ammo types that you can pull out after a short delay. It does not recharge."
	anchored = TRUE
	density = TRUE
	max_integrity = 150
	ammo_amount = 4
	recharges = FALSE
	vendoptions = list("Dark Energy Ball", "20mm Grenade", "Rocket")

/obj/machinery/ammo_crate/no_recharge
	desc = "A large ammo crate. It's somewhat slow to grab out of, and has a limited amount of ammo it can give."
	max_integrity = 150
	ammo_amount = 3
	recharges = FALSE
