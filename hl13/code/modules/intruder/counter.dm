GLOBAL_VAR_INIT(alert_phases, 0)
GLOBAL_VAR_INIT(alert_cooldown, 0 SECONDS)
GLOBAL_VAR_INIT(caution_phases, 0)
GLOBAL_VAR_INIT(caution_cooldown, 0 SECONDS)
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

	var/cautions = 0

	var/caution_active = FALSE

	var/objectives = 0

	var/candidates_left = 0

	var/combine_players = 30

	var/new_team_leaders = 0

	var/new_double_agents = 0

	var/team_leaders = 0

	var/double_agents = 0

	var/round_length = 0

	var/datum/action/cooldown/spell/squad_alert/alert = /datum/action/cooldown/spell/squad_alert //for squad leaders
	var/datum/action/cooldown/spell/conjure_item/medkit/intruder/tasty = /datum/action/cooldown/spell/conjure_item/medkit/intruder
	var/datum/action/cooldown/spell/recharge_lights/recharge = /datum/action/cooldown/spell/recharge_lights

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
	to_chat(world, span_danger(span_slightly_larger(span_bold("Conscripts will be randomly placed/assigned roles and Operation Head Crabber will begin in 15 Seconds."))))
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
		for(var/obj/item/implant/I in human_user.implants)
			if(I.type == /obj/item/implant/mindshield)
				I.removed(human_user)
		human_user.equipOutfit(/datum/outfit/deployment_loadout/intruder/solid)
		human_user.regenerate_icons()
		to_chat(human_user, span_bold(span_notice("Come in, Crab. This is PLF Colonel Czesław. Your objective is to infiltrate the Zewnetrzny Raj Base and acquire two pieces of data from specific nodes. You can activate other terminals to distract the guards, but they will not count towards completion. The node locations are as follows:")))
		for(var/obj/machinery/combine_node/N in GLOB.real_objectives)
			to_chat(human_user, span_danger("[get_area_name(N, TRUE)]"))
		to_chat(human_user, span_notice("I see you used the ventilation system to enter the building. Once your objectives are complete, you can use the vent you came in from- or any other similarly shaped vents- to exfiltrate. Be warned, Crab, you cannot exfiltrate while an alert is active. We can't risk you being followed back to HQ."))
		to_chat(human_user, span_notice("While you have already been provided a silenced pistol, a tranquilizer, a knife, and a radar system provided to us by Lambda scientists, you can procure more equipment on-site primarily found in- but not limited to- lockers, wooden crates, and storage rooms."))
		to_chat(human_user, span_notice("When a guard has a direct line of sight with you, they can activate their radio to call in an alert. During the alert phase, your radar will be jammed, your location will be revealed, and security will get tighter. Crab, I'm receiving word that there may be one or more PLF assets besides you disguised as guards. Try to get into contact with them, or let them go about their business."))
		to_chat(human_user, span_bold(span_danger("Crab, this is a stealth mission, taking out guards is not a priority. They outnumber you 30 to 1 and are armed with ID-tagged M4 rifles, and will arrive better prepared the more of them you kill or alert. Especially avoid killing the squad leaders wearing blue berets. They can call in alerts even after death. Good luck, Crab.")))
		candidates_left--

	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return
	else
		attempt_pick_intruder()

/obj/machinery/intruder_time_counter/proc/has_role(var/mob/living/carbon/human/target) //returns FALSE if the conscript does not have a role, otherwise returns TRUE
	if(istype(target.head, /obj/item/clothing/head/beret/durathread/unitednations)) //squad leader
		return TRUE
	if(istype(target.wear_mask, /obj/item/clothing/mask/balaclava/protective/guard/double_agent)) //double agent
		return TRUE
	if(istype(target.wear_suit, /obj/item/clothing/suit/jacket/det_suit/bullsquid)) //revolver bullsquid
		return TRUE
	return FALSE

/obj/machinery/intruder_time_counter/proc/attempt_pick_leaders()
	for(var/X in GLOB.deployment_combine_players)
		var/client/candidate_client = X
		var/mob/living/carbon/human/H = candidate_client.mob
		if(!has_role(H) && prob(50) && new_team_leaders > team_leaders && H.deployment_faction != REBEL_DEPLOYMENT_FACTION && ishuman(H))
			SEND_SOUND(H, 'hl13/sound/effects/intruderspecial.ogg')
			to_chat(H, span_userdanger("You have been promoted to squad leader, and have received special equipment!"))
			to_chat(H, span_notice("Although you and the other squad leaders only have as much authority as everyone else gives you, you can (and probably should) raise an alert on death, supply your teammates with rations and batteries, and you get a little bit of armor for your head."))
			to_chat(H, span_notice("You will also want to work together with fellow squad leaders to root out possible traitors. You can coordinate with them using your headset, but your channel is likely not secure. If you suspect someone is a spy, you can use your alert radio on them to check, though guessing wrong will make it blow up, and guessing right renders the radio useless."))
			var/head_item = H.get_item_by_slot(ITEM_SLOT_HEAD)
			if(head_item) //incase they're wearing a helmet from high alert status, it needs to be rid of
				qdel(head_item)
			team_leaders++
			ADD_TRAIT(H, TRAIT_INTRUDER_SQUAD_LEADER, OUTFIT_TRAIT)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/durathread/unitednations/guard, ITEM_SLOT_HEAD)
			H.equip_to_slot_or_del(new /obj/item/radio/headset, ITEM_SLOT_EARS)
			alert = new(H)
			alert.Grant(H)
			tasty = new(H)
			tasty.Grant(H)
			recharge = new(H)
			recharge.Grant(H)

/obj/machinery/intruder_time_counter/proc/attempt_pick_double_agents()
	for(var/X in GLOB.deployment_combine_players)
		var/client/candidate_client = X
		var/mob/living/carbon/human/H = candidate_client.mob
		if(!has_role(H) && prob(50) && new_double_agents > double_agents && H.deployment_faction != REBEL_DEPLOYMENT_FACTION && ishuman(H))
			SEND_SOUND(H, 'hl13/sound/effects/intruderspecial.ogg')
			to_chat(H, span_userdanger("You are a spy among the conscripts, and are working for the PLF!"))
			to_chat(H, span_notice("You are tasked with helping Solid Crab in his mission by any means necessary. You can take off your balaclava so he can identify you as an ally, but don't let other conscripts see you do this."))
			H.cmode_music = 'hl13/sound/music/combat/thepain.ogg'
			H.set_facial_hairstyle("Shaved")
			H.set_hairstyle("Bald")
			H.update_body()
			H.deployment_faction = REBEL_DEPLOYMENT_FACTION
			ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT) //slight buff to their capabilities
			var/mask_item = H.get_item_by_slot(ITEM_SLOT_MASK)
			if(mask_item)
				qdel(mask_item)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava/protective/guard/double_agent, ITEM_SLOT_MASK)
			double_agents++

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
	while(new_double_agents < round(GLOB.guards_spawned / 10)) //one spy per 10 guards spawned
		new_double_agents++
	if(new_team_leaders > team_leaders && time_ticking)
		attempt_pick_leaders()
	if(new_double_agents > double_agents && time_ticking)
		attempt_pick_double_agents()
	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		round_length += 2 SECONDS //it goes by process ticks, which are one per second

		if(13 MINUTES < round_length)
			GLOB.bonus_guard_preparedness += 1 //continuous increase

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
			var/final_score = GLOB.alert_phases
			to_chat(world, span_infoplain(span_bold("Alerts: [final_score]")))
			to_chat(world, span_infoplain(span_bold("Codename: Belligerent Bullsquid"))) //codename makes even more sense now since you have to kill the man himself to get his codename
			STOP_PROCESSING(SSprocessing, src)

		if(SSticker.tdm_rebel_deaths == 1 && SSticker.IsRoundInProgress())
			var/list/death_texts = list(
				"Crab, what happened?! Crab?! CRAAAAAAB!!"
				"Crab, answer me! Crab?! CRAAAAAAB!!"
				"What's wrong?! Crab?! CRAAAAAAB!!"
				"Crab, are you okay?! Crab?! CRAAAAAAB!!"
				"Stop kidding around... Crab?! CRAAAAAAB!!"
				"CRAAAAAAB!!"
			)
			priority_announce("[pick(death_texts)]", "PLF Priority Alert")
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
		caution_active = FALSE
		GLOB.caution_cooldown = 0 SECONDS
		GLOB.alert_cooldown = 30 SECONDS
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/alert_begin.ogg')
			to_chat(H, "<span class='userdanger'>The intruder has been spotted near [intruderlocation], sending reinforcements.</span>")
			to_chat(H, span_infoplain(span_bold("STATUS: ALERT")))
	else
		GLOB.alert_cooldown -= 1 SECONDS

	if(alert_active && GLOB.alert_cooldown < 1 SECONDS)
		alert_active = FALSE
		GLOB.caution_phases++

	if(caution_active && GLOB.caution_cooldown < 1 SECONDS)
		caution_active = FALSE
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/alert_end.ogg')
			to_chat(H, "<span class='greentext big'>All units, return to your positions and increase security.</span>")
			to_chat(H, span_infoplain(span_bold("STATUS: ALL CLEAR")))

	if(GLOB.caution_phases > cautions)
		cautions++
		caution_active = TRUE
		GLOB.caution_cooldown = 15 SECONDS
		if(GLOB.complete_objectives_total > objectives)
			objectives++
			var/intruderlocation = "Unknown Area"
			for(var/X in GLOB.deployment_rebel_players)
				var/client/intruder_client = X
				var/mob/living/carbon/human/H = intruder_client.mob
				intruderlocation = get_area_name(H, TRUE)
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/caution_begin.ogg')
				to_chat(H, "<span class='userdanger'>Something has been picked up near [intruderlocation], sending reinforcements to investigate.</span>")
				to_chat(H, span_infoplain(span_bold("STATUS: CAUTION")))
		else
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				to_chat(H, "<span class='userdanger'>We've lost the intruder, sending reinforcements to investigate.</span>")
				to_chat(H, span_infoplain(span_bold("STATUS: CAUTION")))

	else
		GLOB.caution_cooldown -= 1 SECONDS

