/obj/machinery/recycle_intake
	name = "\improper Recycling Intake Machine"
	desc = "A machine which accepts certain trash items like breen cans and emptied out ration bags in exchange for credits."
	icon_state = "recycler"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1000

/obj/machinery/recycle_intake/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/storage/box/halflife) || istype(I, /obj/item/reagent_containers/cup/soda_cans/breenwater) || istype(I, /obj/item/trash/can))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
		new /obj/item/stack/spacecash/c1(user.loc, 1)
		qdel(I)
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
