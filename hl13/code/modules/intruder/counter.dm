GLOBAL_VAR_INIT(alert_phases, 0)
GLOBAL_VAR_INIT(alert_cooldown, 0 SECONDS)
GLOBAL_VAR_INIT(guards_spawned, 0)
GLOBAL_LIST_EMPTY(real_objectives)

/obj/machinery/intruder_time_counter
	name = "intruder counter"
	desc = "it be keepin' track of the alert status and stuff"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "stationclock"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/grace_time = 15 SECONDS

	var/time_ticking = FALSE

	var/pick_retries = 0

	var/alerts = 0

	var/alert_active = FALSE

	var/candidates_left = 0

	var/combine_players = 30

	var/new_team_leaders = 0

	var/team_leaders = 0

	var/datum/action/cooldown/spell/squad_alert/alert = /datum/action/cooldown/spell/squad_alert //for squad leaders

/obj/machinery/intruder_time_counter/Initialize(mapload)
	..()
	GLOB.deployment_flag_grace_period = 3 MINUTES
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/intruder_time_counter/LateInitialize()
	while(!SSticker.HasRoundStarted())
		sleep(1 SECONDS)
	candidates_left = 1
	sleep(12 SECONDS)
	attempt_pick_objectives()
	to_chat(world, span_danger(span_slightly_larger(span_bold("The intruder will be selected in 10 Seconds."))))
	sleep(10 SECONDS)
	attempt_pick_intruder()

/obj/machinery/intruder_time_counter/proc/start_countdown()
	to_chat(world, span_danger(span_slightly_larger(span_bold("Conscripts will be randomly placed and Operation Head Crabber will begin in 15 Seconds."))))
	GLOB.deployment_flag_grace_period = grace_time
	START_PROCESSING(SSprocessing, src)

/obj/machinery/intruder_time_counter/proc/attempt_pick_intruder()
	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return

	pick_retries++
	var/chosen_candidate = null
	chosen_candidate = pick(GLOB.deployment_combine_players)
	var/client/candidate_client = chosen_candidate
	if(ishuman(candidate_client.mob))
		var/mob/living/carbon/human/human_user = candidate_client.mob

		if(human_user.deployment_faction == REBEL_DEPLOYMENT_FACTION)
			attempt_pick_intruder()
			return

		for(var/obj/item/item in human_user.get_all_gear())
			qdel(item)
		human_user.STASTR = 10
		human_user.STAINT = 10
		human_user.STADEX = 10
		for(var/datum/action/cooldown/buttons in human_user.actions)
			qdel(buttons)
		human_user.equipOutfit(/datum/outfit/deployment_loadout/intruder/solid)
		human_user.regenerate_icons()
		to_chat(human_user, span_notice("Come in, Crab. This is PLF Colonel Czesław. Your objective is to infiltrate the Zewnetrzny Raj Base and acquire two pieces of data from specific nodes. You will know if a node is a required objective upon examining it. You can activate other terminals to distract the guards, but they will not count towards completion."))
		to_chat(human_user, span_notice("I see you used the ventilation system to enter the building. Once your objectives are complete, you can use the vent you came in from- or any other similarly shaped vents- to exfiltrate. Be warned, Crab, you cannot exfiltrate while an alert is active. We can't risk you being followed back to HQ."))
		to_chat(human_user, span_notice("While you have already been provided a silenced pistol, a knife, and a radar system provided to us by Lambda scientists, you can procure more equipment on-site primarily found in- but not limited to- lockers and storage rooms."))
		to_chat(human_user, span_notice("Crab, this is a stealth mission, taking out guards is not a priority. They outnumber you 30 to 1 and are armed with ID-tagged M4 rifles. Especially avoid killing the squad leaders wearing blue berets. They can call in alerts even after death, allowing reinforcements to arrive, broadcasting your general location, and jamming your radar. Any guard is also capable of calling an alert on their radio if they have a direct line of sight with you. Good luck, Crab."))
		candidates_left--

	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return
	else
		attempt_pick_intruder()

/obj/machinery/intruder_time_counter/proc/attempt_pick_leaders()
	for(var/X in GLOB.deployment_combine_players)
		var/client/candidate_client = X
		var/mob/living/carbon/human/H = candidate_client.mob
		if(!istype(H.head, /obj/item/clothing/head/beret/durathread/unitednations) && prob(50) && new_team_leaders > team_leaders && H.deployment_faction != REBEL_DEPLOYMENT_FACTION)
			to_chat(H, span_notice("You have been promoted to squad leader! Although you and the other squad leaders only have as much authority as everyone else gives you, you can (and probably should) raise an alert on death, plus you get a little bit of armor for your head."))
			team_leaders++
			H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/durathread/unitednations/guard, ITEM_SLOT_HEAD)
			alert = new(H)
			alert.Grant(H)

/obj/machinery/intruder_time_counter/proc/attempt_pick_objectives()
	if(length(GLOB.real_objectives) == 2)
		return
	var/chosen_node = null
	chosen_node = pick(GLOB.node_terminals)
	var/obj/machinery/combine_node/node = chosen_node
	if(node.real_terminal)
		attempt_pick_objectives()
		return
	node.real_terminal = TRUE
	GLOB.real_objectives += node
	if(length(GLOB.real_objectives) == 2)
		return
	else
		attempt_pick_objectives()

/obj/machinery/intruder_time_counter/process()
	while(new_team_leaders < CEILING(GLOB.guards_spawned / 4, 1))
		new_team_leaders++
	if(new_team_leaders > team_leaders && time_ticking)
		attempt_pick_leaders()
	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up, let the operation commence."))))
			for(var/X in GLOB.deployment_combine_players)
				var/client/guard_client = X
				var/mob/living/carbon/human/H = guard_client.mob
				var/list/spawn_locs = list()
				for(var/Y in GLOB.intruder_guards)
					spawn_locs += Y

				if(!spawn_locs.len)
					message_admins("No valid spawn locations found, aborting...")
					return MAP_ERROR

				if(H.deployment_faction == COMBINE_DEPLOYMENT_FACTION) //players are not removed from the global list if their deployment faction changes, just also added to the other faction list. fix this shit marmio (im lazy)
					H.forceMove(pick(spawn_locs))

		if(combine_players <= SSticker.tdm_combine_deaths && SSticker.IsRoundInProgress())
			priority_announce("Crab, you are aware that this was a stealth mission, right? Oh well, mission complete.", "PLF Priority Alert")
			GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All conscripts are dead, the intruder wins by default."))))
			var/final_score = GLOB.alert_phases - GLOB.false_alerts
			to_chat(world, span_infoplain(span_bold("Alerts: [final_score]")))
			to_chat(world, span_infoplain(span_bold("Codename: Belligerent Bullsquid")))
			STOP_PROCESSING(SSprocessing, src)

		if(SSticker.tdm_rebel_deaths == 1 && SSticker.IsRoundInProgress())
			priority_announce("Crab, what happened?! Crab?! CRAAAAAAB!!", "PLF Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("The intruder was killed, the conscripts win."))))
			STOP_PROCESSING(SSprocessing, src)


	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return
	if(GLOB.alert_phases > alerts)
		var/intruderlocation = "Unknown Area"
		for(var/X in GLOB.deployment_rebel_players)
			var/client/intruder_client = X
			var/mob/living/carbon/human/H = intruder_client.mob
			intruderlocation = get_area_name(H, TRUE)
		alerts++
		alert_active = TRUE
		GLOB.alert_cooldown = 30 SECONDS
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>The intruder has been spotted near [intruderlocation], sending reinforcements.</span>")
	else
		GLOB.alert_cooldown -= 1 SECONDS

	if(alert_active && GLOB.alert_cooldown < 1 SECONDS)
		alert_active = FALSE
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='greentext big'>All units, return to your positions and increase security.</span>")
