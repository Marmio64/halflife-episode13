GLOBAL_VAR_INIT(distress_terminals, 0)

/obj/machinery/combine_distressterminal
	name = "combine distress terminal"
	desc = "A server terminal which is capable of sending out a distress signal when activated. Activating all of the terminals in the location will win the game for the Combine."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "datapodterminal_hacked"

	light_range = 2
	light_power = 1.1
	light_color = "#658cac"
	resistance_flags = INDESTRUCTIBLE

	var/completed = FALSE
	var/activating

	/// The name that will show up to the hidden when being activated
	var/terminal_name = "Unknown"

	var/attempts_to_complete = 6 //attempts last 5 seconds, so it amounts to 30 seconds
	var/last_hidden_warning = 0

	density = TRUE

/obj/machinery/combine_distressterminal/proc/completed(faction_complete = 0) //0 = combine, 1 = rebel
	if(completed)
		return

	do_sparks(1, FALSE, src)
	completed = TRUE
	if(faction_complete == 0)
		icon_state = "datapodterminal"
	else if(faction_complete == 1)
		icon_state = "datapodterminal_l"

	GLOB.distress_terminals--

	to_chat(world, span_infoplain(span_slightly_larger(span_bold("A distress terminal has been activated. [GLOB.distress_terminals] terminals remain."))))

	if(GLOB.distress_terminals < 1)
		if(faction_complete == 0)
			priority_announce("Distress signal received, additional delegates incoming.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All distress terminals activated, the Combine win."))))
		else if(faction_complete == 1)
			priority_announce("We've received your distress signal, reinforcements are inbound.", "Lambda Priority Alert")
			GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All distress terminals activated, the Rebels win."))))


	STOP_PROCESSING(SSprocessing, src)

/obj/machinery/combine_distressterminal/examine(mob/user)
	. = ..()
	if(completed)
		. += span_notice("It seems to have been succesfully activated.")
	else
		. += span_notice("It could be activated to have it send it's part of a distress signal.")

/obj/machinery/combine_distressterminal/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)
	GLOB.distress_terminals += 1

//a mix of the old and new, progress is saved but hidden has a chance to interrupt. also, no chance someone (who will remain anonymous) makes a mistake and a dead/dying person is able to activate the terminal
/obj/machinery/combine_distressterminal/interact(mob/living/carbon/human/user)
	. = ..()

	if(completed)
		say("Terminal already activated.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(activating)
		say("Terminal is currently in use.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	activating = TRUE
	if(last_hidden_warning < world.time)
		for(var/X in GLOB.deployment_hidden_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>The [terminal_name] terminal is currently being activated.</span>")
		last_hidden_warning = world.time + 45 SECONDS
	if(do_after(user, 5 SECONDS, src))
		attempts_to_complete -= 1
		if(attempts_to_complete == 0)
			say("All activation codes accepted. Activating terminal.")
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
			if(user.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
				completed(0)
			if(user.deployment_faction == REBEL_DEPLOYMENT_FACTION)
				completed(1)
		else
			say("Activation code accepted. [attempts_to_complete] activation codes needed until terminal activation.") //i dont know, sounds computery enough
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
	else
		say("Invalid activation code received. [attempts_to_complete] activation codes needed until terminal activation.")
		playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
	activating = FALSE

/obj/machinery/combine_distressterminal/lambda
	name = "rebel distress terminal"
	desc = "A repurposed combine server terminal which is capable of sending out a distress signal when activated. Activating all of the terminals in the location will win the game for the Rebels."
	icon_state = "datapodterminal_hacked_l"
