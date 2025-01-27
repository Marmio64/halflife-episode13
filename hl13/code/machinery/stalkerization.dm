/obj/machinery/stalker_chamber
	name = "asset repurposement pod"
	desc = "A pod which accepts useless patients in order to render them into more agreeable subjects, often called 'Stalkers'."
	density = TRUE
	icon = 'icons/obj/machines/harvester.dmi'
	icon_state = "harvester"
	state_open = FALSE
	idle_power_usage = 50
	circuit = /obj/item/circuitboard/machine/harvester
	light_color = LIGHT_COLOR_BLUE
	var/warming_up
	var/interval = 20
	var/harvesting = FALSE
	var/list/operation_order = list() //Order of wich we harvest limbs.
	var/allow_clothing = FALSE

/obj/machinery/stalker_chamber/RefreshParts()
	..()
	interval = 0
	var/max_time = 40
	for(var/obj/item/stock_parts/micro_laser/L in component_parts)
		max_time -= L.rating
	interval = max(max_time,1)

/obj/machinery/stalker_chamber/update_icon_state()
	. = ..()
	if(warming_up)
		icon_state = initial(icon_state)+"-charging"
		return
	if(state_open)
		icon_state = initial(icon_state)+"-open"
	else if(harvesting)
		icon_state = initial(icon_state)+"-active"
	else
		icon_state = initial(icon_state)

/obj/machinery/stalker_chamber/open_machine(drop = TRUE, density_to_set = FALSE)
	if(panel_open)
		return
	. = ..()
	harvesting = FALSE

/obj/machinery/stalker_chamber/attack_hand(mob/user)
	if(state_open)
		close_machine()
	else if(!harvesting)
		open_machine()

/obj/machinery/stalker_chamber/click_alt(mob/user)
	if(harvesting || !user || !isliving(user) || state_open)
		return
	if(can_harvest())
		start_harvest()

/obj/machinery/stalker_chamber/proc/can_harvest()
	if(!powered(AREA_USAGE_EQUIP) || state_open || !occupant || !iscarbon(occupant))
		return
	var/mob/living/carbon/C = occupant
	if(!allow_clothing)
		for(var/A in C.held_items + C.get_equipped_items())
			if(!isitem(A))
				continue
			var/obj/item/I = A
			if(!(HAS_TRAIT(I, TRAIT_NODROP)))
				say("Subject may not have abiotic items on.")
				playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 30, 1)
				return
	if(!(C.mob_biotypes & MOB_ORGANIC))
		say("Subject is not organic.")
		playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 30, 1)
		return
	if(isstalker(C))
		say("Subject is already a converted asset.")
		playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 30, 1)
		return
	return TRUE

/obj/machinery/stalker_chamber/proc/start_harvest()
	if(!occupant || !iscarbon(occupant))
		return
	var/mob/living/carbon/C = occupant
	operation_order = reverseList(C.bodyparts)   //Chest and head are first in bodyparts, so we invert it to make them suffer more
	harvesting = TRUE
	visible_message(span_notice("The [name] begins warming up!"))
	say("Initializing conversion protocol.")
	warming_up = TRUE
	update_appearance(UPDATE_ICON)
	addtimer(CALLBACK(src, PROC_REF(harvest)), interval)

/obj/machinery/stalker_chamber/proc/harvest()
	warming_up = FALSE
	update_appearance(UPDATE_ICON)
	if(!harvesting || state_open || !powered(AREA_USAGE_EQUIP) || !occupant || !iscarbon(occupant))
		return
	playsound(src, 'sound/machines/juicer.ogg', 20, 1)
	var/mob/living/carbon/C = occupant
	if(!LAZYLEN(operation_order)) //The list is empty, so we're done here
		end_harvesting()
		return
	var/turf/target = get_turf(src)
	for(var/obj/item/bodypart/BP in operation_order) //first we do non-essential limbs
		if(BP.body_zone == "head") //don't grab head, since it will debrain and force the person out of the body
			operation_order.Remove(BP)
			break
		BP.drop_limb()
		C.emote("scream")
		if(BP.body_zone != "chest")
			BP.forceMove(target)    //Move the limbs right next to it, except chest, that's a weird one
			BP.drop_organs()
		operation_order.Remove(BP)
		break
	addtimer(CALLBACK(src, PROC_REF(harvest)), interval)

/obj/machinery/stalker_chamber/proc/end_harvesting()
	var/mob/living/carbon/C = occupant
	C.set_species(/datum/species/stalker)
	SSsociostability.modifystability(-5) //having scary stalkers walking around isn't amazing for stability, but isn't as bad as someone dying.
	C.emote("scream")

	harvesting = FALSE
	open_machine()
	say("Process complete.")
	playsound(src, 'sound/machines/microwave/microwave-end.ogg', 100, 0)

	C.fully_heal(ADMIN_HEAL_ALL) //As a last ditch, I suppose you can stalker the dead and dying to give them another chance?

/obj/machinery/stalker_chamber/screwdriver_act(mob/living/user, obj/item/I)
	. = TRUE
	if(..())
		return
	if(occupant)
		to_chat(user, span_warning("[src] is currently occupied!"))
		return
	if(state_open)
		to_chat(user, span_warning("[src] must be closed to [panel_open ? "close" : "open"] its maintenance hatch!"))
		return
	if(default_deconstruction_screwdriver(user, "[initial(icon_state)]-o", initial(icon_state), I))
		return
	return FALSE

/obj/machinery/stalker_chamber/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	if(default_change_direction_wrench(user, I))
		return TRUE

/obj/machinery/stalker_chamber/crowbar_act(mob/living/user, obj/item/I)
	if(default_pry_open(I))
		return TRUE
	if(default_deconstruction_crowbar(I))
		return TRUE

/obj/machinery/stalker_chamber/default_pry_open(obj/item/I) //wew
	. = !(state_open || panel_open || (obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION)) && I.tool_behaviour == TOOL_CROWBAR //We removed is_operational() here
	if(.)
		I.play_tool_sound(src, 50)
		visible_message(span_notice("[usr] pries open \the [src]."), span_notice("You pry open [src]."))
		open_machine()

/obj/machinery/stalker_chamber/container_resist_act(mob/living/user)
	if(!harvesting)
		visible_message(span_notice("[occupant] emerges from [src]!"),
			span_notice("You climb out of [src]!"))
		open_machine()
	else
		to_chat(user,span_warning("[src] is active and can't be opened!")) //rip

/obj/machinery/stalker_chamber/Exited(atom/movable/user)
	if (!state_open && user == occupant)
		container_resist_act(user)

/obj/machinery/stalker_chamber/relaymove(mob/user)
	if (!state_open)
		container_resist_act(user)

/obj/machinery/stalker_chamber/examine(mob/user)
	. = ..()
	if(machine_stat & BROKEN)
		return
	if(state_open)
		. += span_notice("[src] must be closed before converting an asset.")
	else if(!harvesting)
		. += span_notice("Alt-click [src] to start converting an asset.")
	if(in_range(user, src) || isobserver(user))
		. += "<span class='notice'>The status display reads: Conversion speed at <b>[interval*0.1]</b> seconds.<span>"
