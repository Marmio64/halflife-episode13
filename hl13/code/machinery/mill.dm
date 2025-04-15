/obj/machinery/mill
	name = "mill machine"
	desc = "An industrial piece of machinery which mills metal to shape it into other forms."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "mill"

/obj/machinery/mill/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with metal sheets to mill them into ingots.")
	. += span_notice("You can hit it with metal ingots to mill them into scrap parts.")
	. += span_notice("You can hit it with scrap parts to mill them into scrap metal pieces.")

/obj/machinery/mill/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)

	if(istype(I, /obj/item/stack/sheet/iron))
		var/obj/item/stack/sheet/iron/C = I
		if(C.amount < 2)
			to_chat(usr, span_notice("You'll need at least two sheets to mill an ingot."))
			return
		to_chat(usr, span_notice("Milling metal..."))
		playsound(src, 'hl13/sound/halflifemachines/turret_close.ogg', 50, FALSE, extrarange = -1)
		if(do_after(user, 3 SECONDS, src))
			C.use(2)
			new /obj/item/stack/sheet/ironingot(src.loc, 1)
			playsound(src, 'hl13/sound/halflifeeffects/impact/metal/metal_sheet_3.wav', 50, FALSE, extrarange = -1)
		else if(prob(5))
			to_chat(user, span_userdanger("You prematurely stop milling the metal, and your arm gets caught in the mill!"))
			arm.force_wound_upwards(/datum/wound/blunt/bone/moderate)
			arm.receive_damage(15)
			user.emote("scream")

	if(istype(I, /obj/item/stack/sheet/ironingot))
		var/obj/item/stack/sheet/ironingot/C = I
		if(C.amount < 2)
			to_chat(usr, span_notice("You'll need at least two ingots to mill some parts."))
			return
		to_chat(usr, span_notice("Milling metal..."))
		playsound(src, 'hl13/sound/halflifemachines/turret_close.ogg', 50, FALSE, extrarange = -1)
		if(do_after(user, 3 SECONDS, src))
			C.use(2)
			new /obj/item/stack/sheet/scrap_parts(src.loc, 1)
			playsound(src, 'hl13/sound/halflifeeffects/impact/metal/metal_sheet_3.wav', 50, FALSE, extrarange = -1)
		else if(prob(5))
			to_chat(user, span_userdanger("You prematurely stop milling the metal, and your arm gets caught in the mill!"))
			arm.force_wound_upwards(/datum/wound/blunt/bone/moderate)
			arm.receive_damage(15)
			user.emote("scream")

	if(istype(I, /obj/item/stack/sheet/scrap_parts))
		var/obj/item/stack/sheet/scrap_parts/C = I
		to_chat(usr, span_notice("Milling metal..."))
		playsound(src, 'hl13/sound/halflifemachines/turret_close.ogg', 50, FALSE, extrarange = -1)
		if(do_after(user, 3 SECONDS, src))
			C.use(1)
			new /obj/item/stack/sheet/scrap_metal(src.loc, 4)
			playsound(src, 'hl13/sound/halflifeeffects/impact/metal/metal_sheet_3.wav', 50, FALSE, extrarange = -1)
		else if(prob(5))
			to_chat(user, span_userdanger("You prematurely stop milling the metal, and your arm gets caught in the mill!"))
			arm.force_wound_upwards(/datum/wound/blunt/bone/moderate)
			arm.receive_damage(15)
			user.emote("scream")

/obj/machinery/mill/interact(mob/living/carbon/human/user)
	. = ..()
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)
	if(prob(5))
		to_chat(user, span_userdanger("You reach out to touch the mill, and accidentally set it off on your hand!"))
		arm.force_wound_upwards(/datum/wound/blunt/bone/moderate)
		arm.receive_damage(15)
		user.emote("scream")
