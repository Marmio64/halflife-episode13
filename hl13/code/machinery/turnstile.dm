/obj/machinery/turnstile
	name = "turnstile"
	desc = "A mechanical door that permits one-way access to an area."
	//icon = 'icons/obj/objects.dmi'
	icon_state = "turnstile_map"
	power_channel = AREA_USAGE_ENVIRON
	density = TRUE
	max_integrity = 400
	anchored = TRUE
	use_power = FALSE
	idle_power_usage = 2
	resistance_flags = LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = OPEN_DOOR_LAYER
	var/forcefield = FALSE
	var/on = TRUE
	var/directional = TRUE //whether or not it actually permits one-way access.

/obj/machinery/turnstile/brig
	name = "Brig turnstile"
	//Seccies and brig phys may always pass, either way.
	req_access = list(ACCESS_BRIG_ENTRANCE)
	max_integrity = 600 /// Made of damn good steel
	damage_deflection = 24 /// Blocks most everything except heavy melee weapons like fireaxes/sledgehammers or dedicated destroying melee weapons like large crowbars.

/obj/machinery/turnstile/Initialize(mapload)
	. = ..()
	if(forcefield)
		icon_state = "forcefield"
	else
		icon_state = "turnstile"

/obj/machinery/turnstile/can_atmos_pass(turf/target_turf, vertical = FALSE)
	return TRUE

/obj/machinery/turnstile/Cross(atom/movable/mover)
	. = ..()
	if(istype(mover) && (mover.pass_flags & PASSGLASS))
		return TRUE
	if(!on) //you can pass freely if it is off...
		return TRUE
	if(istype(mover, /mob/living/simple_animal/bot))
		flick("operate", src)
		if(forcefield)
			playsound(src,'hl13/sound/halflifeeffects/forcefieldbuzz.ogg',50,0,3)
		else
			playsound(src,'hl13/sound/items/ratchet.ogg',50,0,3)
		return TRUE
	else if (!isliving(mover) && !istype(mover, /obj/vehicle/ridden/wheelchair))
		flick("deny", src)
		if(forcefield)
			playsound(src,'hl13/sound/halflifeeffects/forcefieldbuzz.ogg',50,0,3)
		else
			playsound(src,'sound/machines/beep/deniedbeep.ogg',50,0,3)
		return FALSE
	var/allowed = allowed(mover)
	//Sec can drag you out unceremoniously.
	if(!allowed && mover.pulledby)
		allowed = allowed(mover.pulledby)

	if(istype(mover, /obj/vehicle/ridden/wheelchair))
		for(var/mob/living/rider in mover.buckled_mobs)
			if(allowed(rider) && !mover.pulledby) //defer to the above dragging code if we are being dragged
				allowed = TRUE
	var/is_handcuffed = FALSE
	if(iscarbon(mover))
		var/mob/living/carbon/C = mover
		is_handcuffed = C.handcuffed
	if((get_dir(loc, mover.loc) == dir && !is_handcuffed && directional) || allowed) //Make sure looking at appropriate border, loc is first so the turnstyle faces the mover
		flick("operate", src)
		if(forcefield)
			playsound(src,'hl13/sound/halflifeeffects/forcefieldbuzz.ogg',50,0,3)
		else
			playsound(src,'hl13/sound/items/ratchet.ogg',50,0,3)
		return TRUE
	else
		flick("deny", src)
		if(forcefield)
			playsound(src,'hl13/sound/halflifeeffects/forcefieldbuzz.ogg',50,0,3)
		else
			playsound(src,'sound/machines/beep/deniedbeep.ogg',50,0,3)
		return FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/click_alt(mob/user)
	if(allowed(user) || HAS_SILICON_ACCESS(user))
		src.toggle_onoff()
	return

/obj/machinery/turnstile/brig/halflife/forcefield/proc/toggle_onoff()
	if(!malfunctioning)
		if(on)
			on = !on
			icon_state = "forcefield_off"
		else
			on = !on
			icon_state = "forcefield"
	else
		do_sparks(1, FALSE, src)

//for semi-secure areas. Labor lead, city admin, metropolice, and perhaps trusted citizens may be allowed in.
/obj/machinery/turnstile/brig/halflife/forcefield
	name = "Combine Forcefield"
	desc = "A forcefield which only allows those to pass who have proper access, or if you enter from a certain side. You may be able to turn it off with the proper access."
	icon = 'hl13/icons/obj/forcefield.dmi'
	icon_state = "forcefield_map"
	forcefield = TRUE
	interaction_flags_click = ALLOW_SILICON_REACH

	var/malfunctioning = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(atom_integrity < 100 && !malfunctioning) //At very low health, the field just turns off.
		malfunctioning = TRUE

/obj/machinery/turnstile/brig/halflife/forcefield/examine(mob/user)
	. = ..()
	if(malfunctioning)
		. += span_notice("The blue highlights are flickering, indicating a malfunctioning part. You'll have to use a wrench to get it working again.")

/obj/machinery/turnstile/brig/halflife/forcefield/wrench_act(mob/living/user, obj/item/O)
	. = ..()
	if(!O.tool_behaviour == TOOL_WRENCH)
		return FALSE

	if(!malfunctioning)
		balloon_alert(user, "Doesn't need fixing")
		return FALSE

	playsound(loc, 'sound/items/tools/ratchet.ogg', 25, 1)
	balloon_alert_to_viewers("Starts repairing [src]'s internals")
	if(!do_after(user, 10 SECONDS, src))
		return FALSE

	if(!HAS_TRAIT(user, TRAIT_ENGINEER))
		if(prob(80))
			to_chat(user, span_notice("That might have fixed it... Wait, no. Hm, it might be better to get a trained technician to handle this..."))
			return FALSE
		else
			to_chat(user, span_notice("Wow, that actually worked?"))

	playsound(loc, 'sound/items/tools/ratchet.ogg', 25, 1)
	malfunctioning = FALSE

	if(atom_integrity < max_integrity) //Also fixes it up
		atom_integrity = max_integrity

	SSsociostability.modifystability(2) //Refunds lost sociostability from the malfunction
	return TRUE

/// The forcefield experiences an issue, sparks, toggles, and now requires fixing.
/obj/machinery/turnstile/brig/halflife/forcefield/proc/malfunction()
	do_sparks(1, FALSE, src)
	toggle_onoff()
	if(!malfunctioning)
		malfunctioning = TRUE
		SSsociostability.modifystability(-2) //Sociostability damage until fixed.

/obj/machinery/turnstile/brig/halflife/forcefield/attack_ai(mob/user)
	click_alt(user)
	to_chat(user, span_notice("Forcefield succesfully toggled."))

/obj/machinery/turnstile/brig/halflife/forcefield/emag_act(mob/user, obj/item/card/emag/emag_card)
	malfunction()
	return TRUE

/obj/machinery/turnstile/brig/halflife/forcefield/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

//for high access areas, only civil protection and the city admin should access
/obj/machinery/turnstile/brig/halflife/forcefield/civilprotection
	req_access = list(ACCESS_SECURITY)

/obj/machinery/turnstile/brig/halflife/forcefield/civilprotection/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

//highest security areas, only for the divisional lead and city admin
/obj/machinery/turnstile/brig/halflife/forcefield/armory
	req_access = list(ACCESS_ARMORY)

/obj/machinery/turnstile/brig/halflife/forcefield/armory/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/medical
	req_access = list(ACCESS_MEDICAL)

/obj/machinery/turnstile/brig/halflife/forcefield/medical/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/cargo
	req_access = list(ACCESS_CARGO)

/obj/machinery/turnstile/brig/halflife/forcefield/cargo/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/science
	req_access = list(ACCESS_SCIENCE)

/obj/machinery/turnstile/brig/halflife/forcefield/science/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/botany
	req_access = list(ACCESS_HYDROPONICS)

/obj/machinery/turnstile/brig/halflife/forcefield/botany/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE

/obj/machinery/turnstile/brig/halflife/forcefield/maint
	name = "Combine Work Zone Forcefield"
	req_access = list(ACCESS_ENGINEERING)

/obj/machinery/turnstile/brig/halflife/forcefield/maint/nodirectional
	desc = "A forcefield which only allows those to pass who have proper access. You may be able to turn it off with the proper access."
	directional = FALSE
