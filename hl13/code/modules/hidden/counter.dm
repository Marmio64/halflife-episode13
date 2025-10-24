GLOBAL_VAR_INIT(number_of_hidden, 0)

/obj/machinery/the_hidden_time_counter
	name = "time counter"
	desc = "it be countin' and stuff"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "stationclock"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/grace_time = 15 SECONDS

	var/time_ticking = FALSE

	var/number_of_hidden = 1

	var/pick_retries = 0

	var/candidates_left = 0

	var/combine_players = 12

/obj/machinery/the_hidden_time_counter/double_players
	number_of_hidden = 2
	combine_players = 24

/obj/machinery/the_hidden_time_counter/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/the_hidden_time_counter/LateInitialize()
	while(!SSticker.HasRoundStarted())
		sleep(1 SECONDS)
	candidates_left = number_of_hidden
	sleep(12 SECONDS)
	to_chat(world, span_danger(span_slightly_larger(span_bold("The Hidden will be selected in 10 Seconds."))))
	sleep(10 SECONDS)
	attempt_pick_hidden(number_of_hidden)

/obj/machinery/the_hidden_time_counter/proc/start_countdown()
	to_chat(world, span_danger(span_slightly_larger(span_bold("The hunt will begin in 15 Seconds."))))
	GLOB.deployment_flag_grace_period = grace_time
	START_PROCESSING(SSprocessing, src)

/obj/machinery/the_hidden_time_counter/proc/attempt_pick_hidden()
	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return

	pick_retries++
	var/chosen_candidate = pick(GLOB.deployment_combine_players)
	var/client/candidate_client = chosen_candidate
	if(ishuman(candidate_client.mob))
		var/mob/living/carbon/human/human_user = candidate_client.mob

		if(human_user.deployment_faction == HIDDEN_DEPLOYMENT_FACTION)
			attempt_pick_hidden()
			return

		for(var/obj/item/item in human_user.get_all_gear())
			qdel(item)
		human_user.STASTR = 10
		human_user.STAINT = 10
		human_user.STADEX = 10
		for(var/datum/action/cooldown/buttons in human_user.actions)
			qdel(buttons)
		human_user.equipOutfit(/datum/outfit/deployment_loadout/hidden/the_hidden)
		human_user.regenerate_icons()
		to_chat(human_user, span_notice("You were chosen to be The Hidden!"))
		candidates_left--

	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return
	else
		attempt_pick_hidden()

/obj/machinery/the_hidden_time_counter/process()

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up, let the hunt begin."))))

		if(combine_players <= SSticker.tdm_combine_deaths && SSticker.IsRoundInProgress())
			priority_announce("All delegate biosignals lost. Mission failure detected.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = HIDDEN_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All Combine are dead, the Hidden win."))))
			STOP_PROCESSING(SSprocessing, src)

		if(GLOB.number_of_hidden < 1 && SSticker.IsRoundInProgress())
			priority_announce("All priority subjects amputated. Mission complete.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All Hidden were killed, the Combine win."))))
			STOP_PROCESSING(SSprocessing, src)


	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return

