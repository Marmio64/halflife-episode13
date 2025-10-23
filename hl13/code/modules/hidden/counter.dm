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

/obj/machinery/the_hidden_time_counter/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/the_hidden_time_counter/LateInitialize()
	sleep(12 SECONDS)
	to_chat(world, span_danger(span_slightly_larger(span_bold("The Hidden will be selected in 10 Seconds."))))
	sleep(10 SECONDS)
	attempt_pick_hidden(number_of_hidden)

/obj/machinery/the_hidden_time_counter/proc/start_countdown()
	to_chat(world, span_danger(span_slightly_larger(span_bold("The hunt will begin in 15 Seconds."))))
	GLOB.deployment_flag_grace_period = grace_time
	START_PROCESSING(SSprocessing, src)

/obj/machinery/the_hidden_time_counter/proc/attempt_pick_hidden(candidates_left)
	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return

	pick_retries++
	var/chosen_candidate = pick(GLOB.deployment_combine_players)
	var/client/candidate_client = chosen_candidate
	if(ishuman(candidate_client.mob))
		var/mob/living/carbon/human/human_user = candidate_client.mob

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
		attempt_pick_hidden(1)

/obj/machinery/the_hidden_time_counter/process()

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up, let the hunt begin."))))
	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return

