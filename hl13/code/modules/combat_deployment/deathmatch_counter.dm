/obj/machinery/deathmatch_counter
	name = "deathmatch counter"
	desc = "this shit keeps track of people dying and a timer! If you're reading this though, I have a love/hate relationship with you specifically."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "stationclock"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/grace_time = 15 SECONDS

	var/time_ticking = FALSE

	/// How many rebel deaths needed for combine to win
	var/combine_points_win = 32 //rebels have less survivability overall, so combine need two extra kills to make it a tiny bit more fair

	/// How many combine deaths needed for rebels to win
	var/rebel_points_win = 30

	var/last_time_reminder = 0

	var/time_left_match = 6.5 MINUTES

	var/respawn_speed = 15 SECONDS

/obj/machinery/deathmatch_counter/Initialize(mapload)
	..()
	GLOB.deployment_flag_grace_period = grace_time
	GLOB.deployment_respawn_rate_combine = respawn_speed
	GLOB.deployment_respawn_rate_rebels = respawn_speed

/obj/machinery/deathmatch_counter/process()

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up! The rebels need [rebel_points_win] kills to win, and the combine need [combine_points_win]"))))
			for(var/X in GLOB.deployment_rebel_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')

		time_left_match -= 1 SECONDS

		if(rebel_points_win <= SSticker.tdm_combine_deaths && SSticker.IsRoundInProgress())
			priority_announce("The combine forces are in shambles, long live the resistance!", "Lambda Priority Alert")
			GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("Enough combine were killed, the rebels win."))))
			STOP_PROCESSING(SSprocessing, src)

		if(combine_points_win <= SSticker.tdm_rebel_deaths && SSticker.IsRoundInProgress())
			priority_announce("Malignants amputated, code: Sweep, Contain, Excise.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("Enough rebels were killed, the Combine win."))))
			STOP_PROCESSING(SSprocessing, src)

		if(last_time_reminder < world.time)
			to_chat(world, span_infoplain(span_big(span_bold("[time_left_match/10] seconds remain in the mission."))))
			last_time_reminder = world.time + 120 SECONDS

		if(time_left_match <= 0 && SSticker.IsRoundInProgress())
			if(SSticker.tdm_rebel_deaths < SSticker.tdm_combine_deaths)
				priority_announce("The combine forces are in shambles, long live the resistance!", "Lambda Priority Alert")
				GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
				SSticker.force_ending = FORCE_END_ROUND
				to_chat(world, span_infoplain(span_slightly_larger(span_bold("The timer ran out, and more combine died than rebels. Rebels win."))))

			else if(SSticker.tdm_combine_deaths < SSticker.tdm_rebel_deaths)
				priority_announce("Malignants amputated, code: Sweep, Contain, Excise.", "Overwatch Priority Alert")
				GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
				SSticker.force_ending = FORCE_END_ROUND
				to_chat(world, span_infoplain(span_slightly_larger(span_bold("The timer ran out, and more rebels died than combine. Combine win."))))

			else
				priority_announce("Eh!? You guys... both lost!?", "&%!$% Priority Alert")
				SSticker.force_ending = FORCE_END_ROUND
				to_chat(world, span_infoplain(span_slightly_larger(span_bold("The timer ran out, and both sides had an equal amount of deaths. Stalemate! You're all failures."))))
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/stalemate.ogg')
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/stalemate.ogg')

			STOP_PROCESSING(SSprocessing, src)


	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return
