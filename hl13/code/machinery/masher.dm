/obj/machinery/masher
	name = "masher"
	desc = "A crude processing instrument which tears things up into a mash, before solidifying it into something usable."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "masher"

/obj/machinery/masher/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with red, blue, or yellow mushrooms to mash them down into water tablets for use in the factory.")

/obj/machinery/masher/attackby(obj/item/I, mob/living/user, params)

	if(istype(I, /obj/item/food/grown/hl2shroom))
		var/obj/item/food/grown/hl2shroom/C = I
		to_chat(usr, span_notice("Mashing..."))
		playsound(src, 'hl13/sound/halflifeeffects/furniture/washer_close.ogg', 50, FALSE, extrarange = -1)
		if(do_after(user, 2 SECONDS, src))
			var/new_watermix = C.watermix_type
			qdel(C)
			new new_watermix(src.loc, 1)
			playsound(src, 'hl13/sound/halflifeeffects/impact/metal/metal_sheet_3.wav', 50, FALSE, extrarange = -1)
