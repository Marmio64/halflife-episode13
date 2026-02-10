/obj/machinery/sealer
	name = "sealing machine"
	desc = "An industrial piece of machinery for sealing packages and goods easier and quicker than by hand. In addition, it is able to unseal certain packages as well. There is a faded label stating that improper use may result in injury."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "sealer"
	var/malfunctioning = FALSE
	var/dangerous_malfunction = FALSE

/obj/machinery/sealer/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with something that needs sealing, like a ration refill container, to seal it quickly.")
	. += span_notice("Certain packages may also be unsealed by using this machine.")
	if(malfunctioning)
		. += span_notice("The machine is off. It'll need to be opened and cleaned by using a screwdriver on it.")
		if(dangerous_malfunction)
			. += span_notice("It is also emitting a faint odor of smoke. It may be dangerous to try to operate or fix this if you aren't experienced...")

/obj/machinery/sealer/update_icon_state()
	. = ..()
	if(malfunctioning)
		icon_state = "sealer_bloody"
	else
		icon_state = "sealer"

/obj/machinery/sealer/proc/breakdown()
	if(malfunctioning)
		return FALSE

	visible_message("[src] suddenly makes a loud grinding sound before shutting down with a large pop!")
	malfunctioning = TRUE
	if(prob(20))
		dangerous_malfunction = TRUE

/obj/machinery/sealer/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/bodypart/arm = user.get_bodypart(user.active_hand_index % 2 ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)

	if(malfunctioning)
		if(dangerous_malfunction)
			to_chat(usr, span_notice("The sealer is currently not working. A faint odor of smoke emanates from it."))
			if(prob(1))
				to_chat(user, span_userdanger("Upon trying to turn it on anyways, a spark flies out and ignites the machine into a raging inferno!"))
				explode_in_flames()
			return FALSE
		else
			to_chat(usr, span_notice("The sealer is currently not working."))
			return FALSE

	if(istype(I, /obj/item/ration_construction/container))
		var/obj/item/ration_construction/container/C = I
		if(C.filled == TRUE && C.completed == FALSE)
			to_chat(usr, span_notice("Sealing box..."))
			if(do_after(user, 1 SECONDS, src))
				to_chat(usr, span_notice("Container successfully sealed. Reward dispensed."))
				C.seal(user, 1) //Using the sealer gets you bonus money
				playsound(src, 'hl13/sound/effects/pneumaticpress.ogg', 50, FALSE, extrarange = -1)
				if(prob(user.mind?.get_skill_modifier(/datum/skill/factorywork, SKILL_VALUE_MODIFIER)))
					if(HAS_TRAIT(user, TRAIT_CURSED))
						to_chat(user, span_userdanger("You lose focus, and the machine slices off a large strip of flesh from your arm, holy fuck!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/severe)
						arm.receive_damage(25)
						user.emote("scream")
					else
						to_chat(user, span_userdanger("You lose focus, and the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
					malfunctioning = TRUE
					if(prob(5))
						dangerous_malfunction = TRUE
					update_appearance(UPDATE_ICON)
					to_chat(user, span_userdanger("The machine shudders as it gets gummed up from blood, before shutting off."))
				else
					user.mind?.adjust_experience(/datum/skill/factorywork, 25)
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
				C.seal(user, 2) //Using the sealer gets you bonus money
				playsound(src, 'hl13/sound/effects/pneumaticpress.ogg', 50, FALSE, extrarange = -1)
				if(prob(user.mind?.get_skill_modifier(/datum/skill/factorywork, SKILL_VALUE_MODIFIER)))
					if(HAS_TRAIT(user, TRAIT_CURSED))
						to_chat(user, span_userdanger("You lose focus, and the machine slices off a large strip of flesh from your arm, holy fuck!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/severe)
						arm.receive_damage(25)
						user.emote("scream")
					else
						to_chat(user, span_userdanger("You lose focus, and the machine seals one of your fingers inside the container!"))
						arm.force_wound_upwards(/datum/wound/slash/flesh/moderate)
						arm.receive_damage(15)
						user.emote("scream")
					malfunctioning = TRUE
					if(prob(5))
						dangerous_malfunction = TRUE
					update_appearance(UPDATE_ICON)
					to_chat(user, span_userdanger("The machine shudders as it gets gummed up from blood, before shutting off."))
				else
					user.mind?.adjust_experience(/datum/skill/factorywork, 25)
		else
			to_chat(usr, span_notice("This ration container is not yet filled."))

/obj/machinery/sealer/screwdriver_act(mob/living/user, obj/item/O)
	. = ..()
	if(!O.tool_behaviour == TOOL_SCREWDRIVER)
		return FALSE

	if(!malfunctioning)
		balloon_alert(user, "Doesn't need fixing")
		return FALSE

	playsound(loc, 'sound/items/tools/screwdriver_operating.ogg', 25, 1)
	balloon_alert_to_viewers("Starts repairing [src]'s internals")
	if(!do_after(user, 12 SECONDS, src))
		return FALSE

	if(!HAS_TRAIT(user, TRAIT_ENGINEER))
		if(prob(80))
			if(prob(75))
				if(dangerous_malfunction)
					to_chat(user, span_userdanger("Shit, you fucked up bad, the machine just exploded in flames!"))
					explode_in_flames()
					return FALSE
				else
					to_chat(user, span_notice("That might have fixed it... Wait, no. Hm, it might be better to get a trained technician to handle this..."))
					return FALSE
			else
				to_chat(user, span_notice("The sealer suddenly turns on, destroying the screwdriver with a vicious grinding sound, your hand nearly getting caught along the way. It might be better to get a trained technician to handle this..."))
				qdel(O)
				return FALSE
		else
			to_chat(user, span_notice("Wow, that actually worked?"))

	playsound(loc, 'sound/items/tools/screwdriver_operating.ogg', 25, 1)
	malfunctioning = FALSE
	update_appearance(UPDATE_ICON)

	if(atom_integrity < max_integrity) //Also fixes it up
		atom_integrity = max_integrity

	to_chat(user, span_notice("Repair reward dispensed."))
	new /obj/item/stack/spacecash/c1(user.loc, 4)
	return TRUE

/obj/machinery/sealer/proc/explode_in_flames()
	flame_radius(4, get_turf(src))
	playsound(loc, 'hl13/sound/halflifeeffects/explosion_fire_grenade.ogg', 30, TRUE, 4)
	visible_message("[src] explodes into flames!")
