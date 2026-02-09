/obj/machinery/repairpod
	name = "combine repair pod"
	desc = "A pod which can mend bodily injures of patients with a full biogel bath, healing all conditions including bone fractures and major hemmoraging. Incapable of reviving most people from death, unless they are very important. Alt-click to begin the process."
	density = TRUE
	icon = 'hl13/icons/obj/repairpod.dmi'
	icon_state = "harvester"
	state_open = FALSE
	idle_power_usage = 50
	light_color = LIGHT_COLOR_BLUE
	max_integrity = 400
	var/warming_up
	var/interval = 20
	var/harvesting = FALSE

	armor_type = /datum/armor/repair_pod

/datum/armor/repair_pod
	melee = 90
	bullet = 90
	laser = 90
	bomb = 25

/obj/machinery/repairpod/update_icon_state()
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

/obj/machinery/repairpod/open_machine(drop = TRUE, density_to_set = FALSE)
	if(panel_open)
		return
	. = ..()
	harvesting = FALSE

/obj/machinery/repairpod/attack_hand(mob/user)
	if(state_open)
		close_machine()
	else if(!harvesting)
		open_machine()

/obj/machinery/repairpod/click_alt(mob/user)
	if(harvesting || !user || !isliving(user) || state_open)
		return
	if(can_harvest())
		start_harvest()

/obj/machinery/repairpod/proc/can_harvest()
	if(!powered(AREA_USAGE_EQUIP) || state_open || !occupant || !isliving(occupant))
		return
	return TRUE

/obj/machinery/repairpod/proc/start_harvest()
	if(!occupant || !isliving(occupant))
		return
	var/mob/living/C = occupant
	if(!HAS_TRAIT(C, TRAIT_TDMCAPTAIN) && C.stat == DEAD)
		visible_message(span_notice("Only team captains can be revived from death."))
		return FALSE
	harvesting = TRUE
	visible_message(span_notice("The [name] begins warming up!"))
	say("Initializing healing protocol.")
	warming_up = TRUE
	update_appearance(UPDATE_ICON)
	addtimer(CALLBACK(src, PROC_REF(harvest)), interval)

/obj/machinery/repairpod/proc/harvest()
	warming_up = FALSE
	update_appearance(UPDATE_ICON)
	if(!harvesting || state_open || !powered(AREA_USAGE_EQUIP) || !occupant || !isliving(occupant))
		return
	playsound(src, 'hl13/sound/halflifemachines/terminals/startup.ogg', 40, 1)
	sleep(5 SECONDS)
	playsound(src, 'hl13/sound/effects/sewflesh.ogg', 40, 1)
	sleep(5 SECONDS)
	playsound(src, 'hl13/sound/effects/largemedkit1.ogg', 40, 0)
	sleep(5 SECONDS)
	end_harvesting()

/obj/machinery/repairpod/proc/end_harvesting()
	var/mob/living/C = occupant

	harvesting = FALSE
	open_machine()
	say("Process complete.")
	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 100, 0)

	C.fully_heal(ADMIN_HEAL_ALL)
	C.revive()

/obj/machinery/repairpod/screwdriver_act(mob/living/user, obj/item/I)
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

/obj/machinery/repairpod/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	if(default_change_direction_wrench(user, I))
		return TRUE

/obj/machinery/repairpod/crowbar_act(mob/living/user, obj/item/I)
	if(default_pry_open(I))
		return TRUE
	if(default_deconstruction_crowbar(I))
		return TRUE

/obj/machinery/repairpod/default_pry_open(obj/item/I) //wew
	. = !(state_open || panel_open || (obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION)) && I.tool_behaviour == TOOL_CROWBAR //We removed is_operational() here
	if(.)
		I.play_tool_sound(src, 50)
		visible_message(span_notice("[usr] pries open \the [src]."), span_notice("You pry open [src]."))
		open_machine()

/obj/machinery/repairpod/container_resist_act(mob/living/user)
	if(!harvesting)
		visible_message(span_notice("[occupant] emerges from [src]!"),
			span_notice("You climb out of [src]!"))
		open_machine()
	else
		to_chat(user,span_warning("[src] is active and can't be opened!")) //rip

/obj/machinery/repairpod/Exited(atom/movable/user)
	if (!state_open && user == occupant)
		container_resist_act(user)

/obj/machinery/repairpod/relaymove(mob/user)
	if (!state_open)
		container_resist_act(user)

/obj/machinery/repairpod/examine(mob/user)
	. = ..()
	if(machine_stat & BROKEN)
		return
	if(state_open)
		. += span_notice("[src] must be closed before starting.")
	else if(!harvesting)
		. += span_notice("Alt-click [src] to start the repair pod.")
