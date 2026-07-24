GLOBAL_LIST_EMPTY(dogtag_holders)
GLOBAL_VAR_INIT(selected_crab, /client/)
GLOBAL_VAR_INIT(dogtags_left, 3)

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/sne
	can_jam = FALSE

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/sne/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

/obj/item/sne/dogtags
	name = "dogtags"
	desc = "Some dogtags. Only of any use to Old Crab. If you aren't that man, you should probably be working towards depriving him of these."
	icon = 'icons/obj/clothing/accessories.dmi'
	icon_state = "allergy"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/sne/dogtags/equipped(mob/living/user, slot)
	..()
	if(user.deployment_faction == XEN_DEPLOYMENT_FACTION)
		GLOB.dogtags_left--
		to_chat(user, span_notice("Dogtags successfully collected!"))
	else
		to_chat(user, span_notice("Crab has been denied the dogtags!"))
	qdel(src)

/obj/machinery/sne_time_counter
	name = "SNE counter"
	desc = "it be keepin' track of the dogtags and stuff"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "stationclock"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/candidates_left = 0

	var/time_ticking = FALSE

	var/pick_retries = 0

	var/round_length = 0

	var/crab_dead = FALSE

/obj/machinery/sne_time_counter/Initialize(mapload)
	..()
	GLOB.deployment_flag_grace_period = 3 MINUTES
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/sne_time_counter/LateInitialize()
	while(!SSticker.HasRoundStarted())
		sleep(1 SECONDS)
	candidates_left = 1
	sleep(12 SECONDS)
	to_chat(world, span_danger(span_slightly_larger(span_bold("The intruder will be selected and the game will begin in 35 Seconds."))))
	sleep(30 SECONDS)
	attempt_pick_intruder()

/obj/machinery/sne_time_counter/proc/start_game()
	GLOB.deployment_flag_grace_period = 5 SECONDS
	START_PROCESSING(SSprocessing, src)

/obj/machinery/sne_time_counter/proc/attempt_pick_intruder()
	if(candidates_left == 0 || 99 < pick_retries)
		start_game()
		return

	pick_retries++
	var/chosen_candidate = null
	var/list/total_players = GLOB.deployment_combine_players + GLOB.deployment_rebel_players
	chosen_candidate = pick(total_players)
	var/client/candidate_client = chosen_candidate
	if(ishuman(candidate_client.mob))
		var/mob/living/carbon/human/human_user = candidate_client.mob

		if(human_user.deployment_faction == XEN_DEPLOYMENT_FACTION)
			attempt_pick_intruder()
			return

		GLOB.selected_crab = candidate_client
		for(var/obj/item/item in human_user.get_all_gear())
			qdel(item)
		human_user.STASTR = 10
		human_user.STAINT = 10
		human_user.STADEX = 10
		for(var/datum/action/cooldown/buttons in human_user.actions)
			qdel(buttons)
		for(var/obj/item/implant/I in human_user.implants)
			if(I.type == /obj/item/implant/mindshield)
				I.removed(human_user)
		human_user.equipOutfit(/datum/outfit/deployment_loadout/intruder/solid/old/sne)
		human_user.regenerate_icons()
		human_user.deployment_faction = XEN_DEPLOYMENT_FACTION
		to_chat(human_user, span_bold(span_notice("It's Polacon, Crab. What's up? ...jeez, Crab, don't tell me you forgot your objective already? Alright, I'll go over it with you one more time.")))
		to_chat(human_user, span_notice("You've been deployed to this warzone in order to collect three dogtags from any member of any team."))
		to_chat(human_user, span_notice("In order to collect dogtags, I've modified one of your abilities. If you use your hold-up on an unconscious soldier, you will begin to search them for dogtags. Crab, don't forget that you will be vulnerable to attacks for 5 seconds during this!"))
		to_chat(human_user, span_notice("If you run out of time, or are killed three times, it's game over for you. So... try to come back in one piece, Crab? Please?"))
		to_chat(human_user, span_bold(span_danger("Crab, in this war, neither side is truly your enemy. Avoid killing them, except in self defense, as you will not be able to collect the dogtags of the dead.")))
		candidates_left--

	if(candidates_left == 0 || 99 < pick_retries)
		start_game()
		return
	else
		attempt_pick_intruder()

/obj/machinery/sne_time_counter/process()
	var/list/total_players = GLOB.deployment_combine_players + GLOB.deployment_rebel_players

	for(var/client/X in total_players)
		if(X == GLOB.selected_crab)
			if(isliving(X.mob))
				var/mob/living/carbon/human/H = X.mob
				if(H.deployment_faction != XEN_DEPLOYMENT_FACTION)
					if(SSticker.tdm_xen_deaths < 3)
						for(var/obj/item/item in H.get_all_gear())
							qdel(item)
						H.STASTR = 10
						H.STAINT = 10
						H.STADEX = 10
						for(var/datum/action/cooldown/buttons in H.actions)
							qdel(buttons)
						for(var/obj/item/implant/I in H.implants)
							if(I.type == /obj/item/implant/mindshield)
								I.removed(H)
						H.equipOutfit(/datum/outfit/deployment_loadout/intruder/solid/old/sne)
						H.regenerate_icons()
						H.deployment_faction = XEN_DEPLOYMENT_FACTION
					else
						to_chat(H, span_warning("You've already used all of your slots! Wait for the game to end!"))
						qdel(H)

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		round_length += 2 SECONDS //it goes by process ticks, which are one per second

		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up, the game has begun."))))
			for(var/X in total_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/sne_start.ogg')

		if(GLOB.dogtags_left == 0 && SSticker.IsRoundInProgress())
			priority_announce("Nice work, Crab! We did it!", "#!?@SDz..(% Priority Alert") //in my metal synth solid canon old crab no longer works for the plf (although he is still on good terms) and instead be gay and do crimes with his boyfriend
			GLOB.deployment_win_team = XEN_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("Old Crab has completed his objective. Crab wins, Conscripts and Mercs lose!"))))
			STOP_PROCESSING(SSprocessing, src)

		if(SSticker.tdm_xen_deaths >= 3 && SSticker.IsRoundInProgress() && !crab_dead)
			var/list/death_texts = list(
				"Crab, what happened?! Crab?! CRAAAAAAB!!",
				"Crab, answer me! Crab?! CRAAAAAAB!!",
				"What's wrong?! Crab?! CRAAAAAAB!!",
				"Crab, are you okay?! Crab?! CRAAAAAAB!!",
				"Stop kidding around... Crab?! CRAAAAAAB!!",
				"CRAAAAAAB!!",
			)
			priority_announce("[pick(death_texts)]", "#!?@SDz..(% Priority Alert")
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("Old Crab has lost, but it's not over yet. Defeat the enemy team!"))))
			crab_dead = TRUE

		if(7 MINUTES < round_length && SSticker.IsRoundInProgress())
			if(SSticker.tdm_rebel_deaths < SSticker.tdm_combine_deaths)
				priority_announce("The conscript forces are in shambles, good work! We'll pay you all handsomely for this.", "Lambda Priority Alert")
				GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
				SSticker.force_ending = FORCE_END_ROUND
				to_chat(world, span_infoplain(span_slightly_larger(span_bold("The timer ran out, and more conscripts died than mercs. Mercs win, Crab and Conscripts lose!"))))

			else if(SSticker.tdm_combine_deaths < SSticker.tdm_rebel_deaths)
				priority_announce("Malignants amputated, code: Sweep, Contain, Excise.", "Overwatch Priority Alert")
				GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
				SSticker.force_ending = FORCE_END_ROUND
				to_chat(world, span_infoplain(span_slightly_larger(span_bold("The timer ran out, and more mercs died than conscripts. Conscripts win, Crab and Mercs lose!"))))

			else
				priority_announce("Eh!? You guys... all lost!?", "&%!$% Priority Alert")
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
