/obj/machinery/combine_recharger
	name = "combine recharger"
	desc = "A wall mounted recharger unit which can refill the battery capacity of combine suits. It slowly restores power over time."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "suitcharger"
	//circuit = /obj/item/circuitboard/machine/combinerecharger
	var/capacity = 50
	var/capacity_max = 100

	/// The total amount of charge that has been used up over time
	var/cumulative_charge = 0

	/// How much cumulative charge will eventually wear down the components and make it require fixing.
	var/malfunction_point = -500

	var/malfunctioning = FALSE

	var/round_start = FALSE

/obj/machinery/combine_recharger/round_start
	round_start = TRUE //so that it deducts sociostability when destroyed

/obj/machinery/combine_recharger/proc/adjust_capacity(change)
	capacity += change
	if(capacity > capacity_max)
		capacity = capacity_max
	if(capacity < 0)
		capacity = 0

	cumulative_charge += change

	if(cumulative_charge <= malfunction_point)
		malfunction()

/obj/machinery/combine_recharger/proc/malfunction()
	malfunctioning = TRUE

/obj/machinery/combine_recharger/process(delta_time)
	if(capacity < capacity_max)
		capacity++
		update_icon_state()

/obj/machinery/combine_recharger/examine(mob/user)
	. = ..()
	. += span_notice("Its capacity is at '[(capacity/capacity_max)*100]%'.")
	if(malfunctioning)
		. += span_notice("The warning light is flashing. You'll have to use a wrench to get it working again.")

/obj/machinery/combine_recharger/wrench_act(mob/living/user, obj/item/O)
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
	cumulative_charge = 0
	return TRUE


/obj/machinery/combine_recharger/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(.)
		return
	add_fingerprint(H)

	if(malfunctioning)
		to_chat(H, span_warning("Warning. Excessive wear upon machine detected. Please contact a technician to repair components."))
		playsound(src, 'hl13/sound/effects/suitchargeno1.ogg', 40, FALSE)
		return

	if (H.w_uniform)
		if(H.w_uniform.powered_suit)
			if(H.w_uniform.suit_power < H.w_uniform.max_suit_power && capacity > 19)
				playsound(src, 'hl13/sound/effects/suitcharge1.ogg', 40, FALSE)
				if(do_after(H, 2 SECONDS, src))
					H.w_uniform.adjust_suitpower(20)
					adjust_capacity(-20)
					playsound(src, 'hl13/sound/effects/suitchargeok1.ogg', 40, FALSE)
					update_icon_state()
				else
					playsound(src, 'hl13/sound/effects/suitchargeno1.ogg', 40, FALSE)
			else
				playsound(src, 'hl13/sound/effects/suitchargeno1.ogg', 40, FALSE)
		else
			to_chat(H, span_warning("You do not have a compatible suit for recharging."))
			playsound(src, 'hl13/sound/effects/suitchargeno1.ogg', 40, FALSE)
	return

/obj/machinery/combine_recharger/update_icon_state()
	. = ..()
	if(capacity > 60)
		icon_state = "suitcharger_01"
	else if(capacity > 20)
		icon_state = "suitcharger_02"
	else
		icon_state = "suitcharger_03"

/obj/machinery/combine_recharger/deconstruct(disassembled = TRUE)
	. = ..()
	if(round_start)
		SSsociostability.modifystability(-20) //Destroying vital roundstart placed combine rechargers is bad for stability.
