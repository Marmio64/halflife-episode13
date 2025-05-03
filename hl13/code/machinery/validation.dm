/obj/machinery/validation_terminal
	name = "Validation Terminal"
	desc = "A console hooked up to a device which can intake IDs and validate them, returning their access levels to their job's standard level."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "validationterminal"

	max_integrity = 1500

/obj/machinery/validation_terminal/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id/advanced))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
		if(do_after(user, 5 SECONDS, src))
			var/obj/item/card/id/advanced/idcard = I
			idcard.access = idcard.trim.access
			say("Validation complete.")
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
