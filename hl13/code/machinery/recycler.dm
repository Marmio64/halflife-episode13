/obj/machinery/recycle_intake
	name = "\improper Recycling Intake Machine"
	desc = "A machine which accepts certain trash items like breen cans, empty ammo casings, and emptied out ration bags in exchange for credits. Afterwards, it processes them back into their base materials to be used again."
	icon_state = "recycler"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1000
	var/plastic = 0
	var/scrap = 0
	var/bags = 0

/obj/machinery/recycle_intake/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/storage/box/halflife) || istype(I, /obj/item/reagent_containers/cup/soda_cans/breenwater) || istype(I, /obj/item/trash/can) || istype(I, /obj/item/stack/bulletcasings))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
		new /obj/item/stack/spacecash/c1(user.loc, 1)
		qdel(I)
		if(istype(I, /obj/item/reagent_containers/cup/soda_cans/breenwater) || istype(I, /obj/item/trash/can) || istype(I, /obj/item/stack/bulletcasings))
			scrap++
		if(istype(I, /obj/item/storage/box/halflife))
			bags++
			if(bags >= 3)
				bags -= 3
				plastic++
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

/obj/machinery/recycle_intake/interact(mob/living/carbon/human/user)
	. = ..()

	if(plastic < 1 && scrap < 1)
		say("No retrievable materials.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	playsound(src, 'hl13/sound/machines/combine_button3.ogg', 50, TRUE, extrarange = -3)

	if(scrap)
		new /obj/item/stack/sheet/scrap_metal(loc, scrap)
	if(plastic)
		new /obj/item/stack/sheet/halflife/plastic(loc, plastic)

	return

/obj/machinery/recycle_intake/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [plastic] plastic and [scrap] metal scrap stored. Use your hand on it to retrieve any materials.")
