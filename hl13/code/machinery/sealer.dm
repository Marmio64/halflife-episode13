/obj/machinery/sealer
	name = "sealing machine"
	desc = "An industrial piece of machinery for sealing packages and goods easier and quicker than by hand. In addition, it is able to unseal certain packages as well. There is a faded label stating that improper use may result in injury."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "sealer"

/obj/machinery/sealer/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with something that needs sealing, like a ration refill container, to seal it quickly.")
	. += span_notice("Certain packages may also be unsealed by using this machine.")

/obj/machinery/sealer/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)

	if(istype(I, /obj/item/ration_construction/container))
		var/obj/item/ration_construction/container/C = I
		if(C.filled == TRUE && C.completed == FALSE)
			to_chat(usr, span_notice("Sealing box..."))
			if(do_after(user, 1 SECONDS, src))
				to_chat(usr, span_notice("Container successfully sealed. Reward dispensed."))
				C.seal(user, 1) //Using the sealer gets you bonus money
				playsound(src, 'hl13/sound/effects/pneumaticpress.ogg', 50, FALSE, extrarange = -1)
				if(user.job == "Union Worker")
					if(prob(2))
						to_chat(user, span_userdanger("You lose focus, and the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
				else
					if(prob(5))
						to_chat(user, span_userdanger("Due to your inexperience, the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
		else if(C.completed)
			to_chat(usr, span_notice("This ration container is already sealed."))
		else
			to_chat(usr, span_notice("This ration container is not yet filled."))
	if(istype(I, /obj/item/factory_construction/container))
		var/obj/item/factory_construction/container/C = I
		if(C.filled == TRUE)
			to_chat(usr, span_notice("Sealing box..."))
			if(do_after(user, 1 SECONDS, src))
				to_chat(usr, span_notice("Container successfully sealed. Reward dispensed."))
				C.seal(user, 3) //Using the sealer gets you bonus money
				playsound(src, 'hl13/sound/effects/pneumaticpress.ogg', 50, FALSE, extrarange = -1)
				if(user.job == "Union Worker")
					if(prob(2))
						to_chat(user, span_userdanger("You lose focus, and the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
				else
					if(prob(5))
						to_chat(user, span_userdanger("Due to your inexperience, the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
		else
			to_chat(usr, span_notice("This ration container is not yet filled."))

