/obj/machinery/combine_health_station
	name = "combine health station"
	desc = "A wall mounted healing station. Does not recharge over time, and will accept grub nuggets as replenishment."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "healthcharger"
	//circuit = /obj/item/circuitboard/machine/combinerecharger
	var/capacity = 60
	var/capacity_max = 100

	/// The total amount of charge that has been used up over time
	var/cumulative_charge = 0

	/// How much cumulative charge will eventually wear down the components and make it require fixing.
	var/malfunction_point = -500

	var/malfunctioning = FALSE

	var/round_start = FALSE

/obj/machinery/combine_health_station/round_start
	round_start = TRUE //so that it deducts sociostability when destroyed

/obj/machinery/combine_health_station/proc/adjust_capacity(change)
	capacity += change
	if(capacity > capacity_max)
		capacity = capacity_max
	if(capacity < 0)
		capacity = 0

	if(change < 0)
		cumulative_charge += change

	if(cumulative_charge <= malfunction_point)
		malfunction()

	update_icon_state()

/obj/machinery/combine_health_station/proc/malfunction()
	malfunctioning = TRUE

/obj/machinery/combine_health_station/examine(mob/user)
	. = ..()
	. += span_notice("Its capacity is at '[(capacity/capacity_max)*100]%'.")
	if(malfunctioning)
		. += span_notice("The warning light is flashing. You'll have to use a wrench to get it working again.")

/obj/machinery/combine_health_station/wrench_act(mob/living/user, obj/item/O)
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
	to_chat(user, span_notice("Repair reward dispensed."))
	new /obj/item/stack/spacecash/c1(user.loc, 5)
	return TRUE


/obj/machinery/combine_health_station/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(.)
		return
	add_fingerprint(H)

	if(malfunctioning)
		to_chat(H, span_warning("Warning. Excessive wear upon machine detected. Please contact a technician to repair components."))
		playsound(src, 'hl13/sound/effects/medshotno1.ogg', 40, FALSE)
		return

	if(capacity > 19 && H.health < H.maxHealth)
		playsound(src, 'hl13/sound/effects/medcharge4.ogg', 40, FALSE)
		if(do_after(H, 0.8 SECONDS, src))
			H.reagents.add_reagent(/datum/reagent/medicine/concentrated_biogel,6)
			adjust_capacity(-10)
			playsound(src, 'hl13/sound/effects/largemedkit1.ogg', 40, FALSE)
			update_icon_state()
			return
	else
		playsound(src, 'hl13/sound/effects/medshotno1.ogg', 40, FALSE)
	return

/obj/machinery/combine_health_station/update_icon_state()
	. = ..()
	if(capacity > 60)
		icon_state = "healthcharger_01"
	else if(capacity > 20)
		icon_state = "healthcharger_02"
	else
		icon_state = "healthcharger_03"

/obj/machinery/combine_health_station/deconstruct(disassembled = TRUE)
	. = ..()
	if(round_start)
		SSsociostability.modifystability(-20) //Destroying vital roundstart placed combine health chargers is bad for stability.

/obj/machinery/combine_health_station/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/pill/patch/grubnugget))
		if(70 > capacity) //dont allow it to rip you off too much
			adjust_capacity(40)
			qdel(I)
