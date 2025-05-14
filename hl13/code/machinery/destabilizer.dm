/obj/machinery/destabilizer
	name = "destabilizer"
	desc = "A hacked piece of combine machinery which emits radio signals that disrupt district wide systems and machinery, reducing sociostability over time."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "destabilizer"
	anchored = TRUE
	var/destabilization_rate = -1
	var/destabilization_chance = 80
	var/cumulative_destabilization = 0
	var/detonation_limit = 250
	var/blowing_up = FALSE
	var/show_timer = FALSE

/obj/machinery/destabilizer/process(delta_time)
	if(prob(destabilization_chance) && (cumulative_destabilization < detonation_limit))// each destabilizer can only eat 25% of sociostability
		SSsociostability.modifystability(destabilization_rate) //Slowly wittles down stability
		cumulative_destabilization++
	if(detonation_limit <= cumulative_destabilization)
		addtimer(CALLBACK(src, PROC_REF(blow_up)), 10 SECONDS)
		blowing_up = TRUE

/obj/machinery/destabilizer/examine(mob/user)
	. = ..()
	. += span_notice("It's currently disrupting district sociostability. You can destroy it to halt this.")
	if(blowing_up)
		. += span_notice("It's shaking rapidly, and getting very hot. You might want to step away from it, quickly.")
	if(show_timer)
		. += span_notice("Its [(cumulative_destabilization/detonation_limit)*100]% of the way complete.")

/obj/machinery/destabilizer/deconstruct(disassembled = TRUE)
	SSsociostability.modifystability(10) //Good for stability to break it.
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		new /obj/item/circuitmaterial(loc)
		new /obj/item/halflife/antenna(loc)
	qdel(src)

/obj/machinery/destabilizer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Disruptive Signal")

/obj/machinery/destabilizer/proc/blow_up()
	explosion(src, heavy_impact_range = 1, light_impact_range = 3, flash_range = 2)

/obj/machinery/destabilizer/makeshift
	name = "makeshift destabilizer"
	desc = "A shoddily made piece of machinery made from spare combine machinery parts. Emits radio signals that disrupt district wide systems and machinery, reducing sociostability over time."
	destabilization_chance = 50
	detonation_limit = 300 //can go on for slightly longer to account for it eating less stability

/obj/machinery/destabilizer/makeshift/Initialize(mapload)
	. = ..()
	priority_announce("Warning. Disruptive sociostability threat detected in your district. Local protection team units, contain immediately. A GPS signal has been assigned to the threat.", "Overwatch Alert")

/obj/machinery/destabilizer/super
	name = "super destabilizer"
	desc = "A massive abomination of tampered combine machinery that is emanating such a powerful signal, it even hurts your head to be around it. If it isn't broken quick, it might shut down all the combine systems in the entire district, and maybe even the whole city!"
	icon_state = "superdestabilizer"
	destabilization_chance = 100
	show_timer = TRUE
	processing_flags = START_PROCESSING_MANUALLY
	anchored = FALSE
	var/on = FALSE
	var/mid_alert = FALSE

/obj/machinery/destabilizer/super/process()
	if(prob(destabilization_chance) && (cumulative_destabilization < detonation_limit))
		SSsociostability.modifystability(destabilization_rate)
		cumulative_destabilization++
	if(detonation_limit <= cumulative_destabilization)
		to_chat(world, span_bold("The Rebels have completely disabled all District systems, leaving it cutoff and helpless!"))
		SSticker.force_ending = FORCE_END_ROUND
		return PROCESS_KILL
	else if((detonation_limit < cumulative_destabilization/2) && !mid_alert)
		mid_alert = TRUE
		minor_announce("Alert, Alert. Singularity approaching. Overwatch system damage detected. Destabilization halfway complete.", "ERROR ER0RR $R0RRO$!R41.%%!!(%$^^__+ @#F0E4", TRUE)

/obj/machinery/destabilizer/super/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(!on)
		var/area/place = get_area(src)
		if(!(istype(place, /area/halflife/indoors/townhall/civilprotection)))
			to_chat(H, span_warning("This will only work if activated in the nexus!"))
			return

		to_chat(H, span_warning("You begin arming the destabilizer... No going back once it starts, and the entire district will be notified once it is armed."))
		if(!do_after(H, 6 SECONDS, src))
			to_chat(H, span_warning("You did not finish arming the destabilizer!"))
			playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
			return
		if(on) //sanity check
			return
		turn_on()

/obj/machinery/destabilizer/super/proc/turn_on(mapload)
	on = TRUE
	anchored = TRUE
	START_PROCESSING(SSfastprocess, src)
	priority_announce("Alert, Alert. Priority sociocide-class disruptor detected on systems. All units converge upon Nexus immediately to contain, Code-3. A GPS signal has been assigned to the threat.", "Overwatch Priority Alert")
	SSsecurity_level.set_level(SEC_LEVEL_DELTA)
