GLOBAL_VAR_INIT(distress_terminals, 5)

/obj/machinery/combine_distressterminal
	name = "combine distress terminal"
	desc = "A server terminal which is capable of sending out a distress signal when activated. Activating all five of the terminals in the location will win the game for the Combine."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "datapodterminal_hacked"

	light_range = 2
	light_power = 1.1
	light_color = "#658cac"
	resistance_flags = INDESTRUCTIBLE

	var/completed = FALSE
	var/busy = FALSE

	density = TRUE

/obj/machinery/combine_distressterminal/proc/completed()
	if(completed)
		return

	do_sparks(1, FALSE, src)
	completed = TRUE
	icon_state = "datapodterminal"

	GLOB.distress_terminals--

	to_chat(world, span_infoplain(span_slightly_larger(span_bold("A distress terminal has been activated. [GLOB.distress_terminals] terminals remain."))))

	if(GLOB.distress_terminals < 1)
		priority_announce("Distress signal received, additional delegates incoming.", "Overwatch Priority Alert")
		GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
		SSticker.force_ending = FORCE_END_ROUND
		to_chat(world, span_infoplain(span_slightly_larger(span_bold("All distress terminals activated, the Combine win."))))

/obj/machinery/combine_distressterminal/examine(mob/user)
	. = ..()
	if(completed)
		. += span_notice("It seems to have been succesfully activated.")
	else
		. += span_notice("It could be activated to have it send it's part of a distress signal.")

/obj/machinery/combine_distressterminal/interact(mob/living/carbon/human/user)
	. = ..()

	if(completed)
		say("Terminal already activated.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(busy)
		say("Terminal is currently in use.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	busy = TRUE
	if(!do_after(user, 30 SECONDS, src))
		to_chat(usr, span_warning("The terminal failed to send a signal."))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		busy = FALSE
		return

	completed()
