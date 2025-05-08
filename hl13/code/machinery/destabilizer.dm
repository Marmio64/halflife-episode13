/obj/machinery/destabilizer
	name = "destabilizer"
	desc = "A hacked piece of combine machinery which emits radio signals that disrupt district wide systems and machinery, reducing sociostability over time."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "destabilizer"
	var/destabilization_rate = -1
	var/destabilization_chance = 80
	var/cumulative_destabilization = 0
	var/detonation_limit = 250
	var/blowing_up = FALSE

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
