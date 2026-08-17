GLOBAL_VAR_INIT(complete_objectives, 0)
GLOBAL_VAR_INIT(complete_objectives_total, 0) //includes fake ones, for caution phase
GLOBAL_VAR_INIT(bonus_guard_preparedness, 0) //any actual bonus guard preparedness from misc sources
GLOBAL_LIST_EMPTY(guard_objectives)
GLOBAL_LIST_EMPTY(node_terminals)

/obj/machinery/escape_vent
	name = "vent"
	desc = "A vent used to infiltrat- err... move air... to and from places."
	icon = 'hl13/icons/obj/storage/storage.dmi'
	icon_state = "vent"
	resistance_flags = INDESTRUCTIBLE
	pixel_y = 24
	density = FALSE
	var/static/list/completion_titles = list(
		"Colossal Cell Leader",
		"Naked Crab",
		"Solid Crab",
		"Crab",
		"Houndeye",
		"Grub",
	)

/obj/machinery/escape_vent/interact(mob/living/carbon/human/user)
	.=..()

	if(user.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
		to_chat(user, span_notice("Just a vent..."))
		return

	if(!HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		to_chat(user, span_notice("We aren't well trained enough to sneak through this."))
		return

	if(GLOB.complete_objectives < 2)
		to_chat(user, span_warning("You haven't completed your mission yet!"))
		return

	if(GLOB.alert_cooldown >= 1 SECONDS)
		to_chat(user, span_warning("You cannot exfiltrate in alert mode."))
		return

	if(do_after(user, 5 SECONDS, src))
		priority_announce("We're receiving the data now, mission complete. Excellent work, Crab.", "PLF Priority Alert")
		GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
		SSticker.force_ending = FORCE_END_ROUND
		to_chat(world, span_infoplain(span_slightly_larger(span_bold("All objectives complete, the intruder wins."))))
		var/final_score = GLOB.alert_phases
		var/title = completion_titles[min(final_score + 1, 6)]
		to_chat(world, span_infoplain(span_bold("Alerts: [final_score]")))
		to_chat(world, span_infoplain(span_bold("Codename: [title]")))
		if(GLOB.osp_mode)
			to_chat(world, span_infoplain(span_bold("OSP Run Confirmed")))
		qdel(user)

/obj/machinery/combine_node
	name = "combine node"
	desc = "A computer terminal possibly containing useful secrets for any would-be intruders. Will set off an alert when activated."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "datapodterminal"

	light_range = 2
	light_power = 1.1
	light_color = "#658cac"
	resistance_flags = INDESTRUCTIBLE

	var/completed = FALSE
	var/activating

	var/attempts_to_complete = 0 //swapped it around purely to make the ingame messages easier for me

	/// Time to complete one activation code
	var/activation_time = 7 SECONDS

	var/real_terminal = FALSE //can still be activated as a distraction, but won't count towards the objective.

	density = TRUE

/obj/machinery/combine_node/Initialize(mapload)
	.=..()
	GLOB.node_terminals += src

/obj/machinery/combine_node/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		if(HAS_TRAIT(human_user, TRAIT_THE_INTRUDER))
			if(real_terminal)
				. += span_warning("This node appears to be one of your objectives!")
			else
				. += span_notice("This node is not one of your objectives.")

/obj/machinery/combine_node/interact(mob/living/carbon/human/user)
	. = ..()

	if(user.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
		to_chat(user, span_warning("Your brainwashing forbids you from reading combine secrets!"))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(!HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		to_chat(user, span_warning("You can't blow your cover, and don't know the password or how to hack through anyways!"))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(completed)
		say("ERROR: Node data not found.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(GLOB.alert_cooldown >= 1 SECONDS)
		say("This node has been temporarily locked by System Admin. Try again later.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(activating)
		say("Node data is already being transferred.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	activating = TRUE
	if(do_after(user, activation_time, src))
		attempts_to_complete++
		if(attempts_to_complete == 3)
			say("3/3 files transferred. Node data transfer complete. System Admin has been notified.")
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
			do_sparks(1, FALSE, src)
			completed = TRUE
			icon_state = "datapodterminal_hacked"
			if(real_terminal)
				GLOB.complete_objectives++
			else
				to_chat(user, span_warning("This data isn't good enough to complete your objective, but netted you a nice reward!"))
				new /obj/effect/spawner/random/halflife/loot/intruder/crab/rare/guaranteed/four(loc)
			GLOB.complete_objectives_total++
			GLOB.caution_phases++
		else
			say("File transferred successfully. [attempts_to_complete]/3 files transferred.")
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
	else
		say("File transfer interrupted. [attempts_to_complete]/3 files transferred.")
	activating = FALSE

//////// OBJECTIVES: GUARD MODE /////////

/datum/guard_objective
	var/datum/mind/owner
	var/objective_type
	var/objective_stage = 0
	var/static/list/possible_objectives = list( //mostly stuff thats kind of slacking off to give the intruder a chance to do things
		"shower", //checklist done
		"nap", //done
		"workout", //done
		"radio", //done
		"tv", //done
		"coffee", //done
	)
	var/music_timer //timer for the music specifically, if you dont listen for the full ten seconds it doesnt count towards your objective
	var/gave_hud = FALSE

/datum/guard_objective/New()
	GLOB.guard_objectives += src

/datum/guard_objective/Destroy()
	to_chat(owner, span_notice("You no longer feel a need to complete your guard objectives..."))
	GLOB.guard_objectives -= src

/datum/guard_objective/proc/get_new_objective()
	if(!gave_hud)
		var/datum/action/guard_info/info_button
		info_button = new(src)
		info_button.Grant(owner.current)
		gave_hud = TRUE
	if(objective_stage == 3)
		to_chat(owner, span_green("You received a requisition point for taking good care of your mental and physical health.")) //the combine are such nice people
		objective_stage = 1
		var/list/owner_memories = owner.memories
		var/datum/memory/key/account/owner_key = owner_memories[/datum/memory/key/account]
		var/new_bank_id = (istype(owner_key) && owner_key.remembered_id) || 11111
		var/datum/bank_account/account = SSeconomy.bank_accounts_by_id["[new_bank_id]"]
		account.requisition_points++
	else
		objective_stage++
	var/message
	if(objective_type)
		switch(objective_type)
			if("shower")
				message = "That shower was refreshing. "
			if("nap")
				message = "This was a comfortable enough nap. "
			if("workout")
				message = "That was a great workout. "
			if("radio")
				message = "That was a good song. "
			if("tv")
				message = "That was a good show. "
			if("coffee")
				message = "That cup of coffee hit the spot. "
	message += "[4 - objective_stage] until your next requisition point."
	to_chat(owner, span_notice(message))
	var/previous_objective_type = objective_type
	var/objective_acceptable = FALSE
	var/mob/living/carbon/human/human_owner = owner.current
	while(objective_type == previous_objective_type || !objective_acceptable)
		objective_type = pick(possible_objectives)
		switch(objective_type)
			if("shower")
				if(human_owner.hygiene <= HYGIENE_LEVEL_DIRTY)
					objective_acceptable = TRUE
			if("nap", "coffee")
				if(human_owner.tiredness >= TIREDNESS_TIRED_THRESHOLD)
					objective_acceptable = TRUE
			if("workout", "radio", "tv")
				objective_acceptable = TRUE
	switch(objective_type)
		if("shower")
			to_chat(owner, span_notice("You could probably use a shower..."))
		if("nap")
			to_chat(owner, span_notice("Taking a nap on a nice comfortable bed sounds good right about now..."))
		if("workout")
			to_chat(owner, span_notice("Why not lift some weights sometime soon?"))
		if("radio")
			to_chat(owner, span_notice("Some music would probably improve your mood."))
		if("tv")
			to_chat(owner, span_notice("Some TV would probably improve your mood."))
		if("coffee")
			to_chat(owner, span_notice("You could go for a cup of joe."))

/datum/action/guard_info
	name = "Get current objective"
	button_icon_state = "round_end"
	show_to_observers = FALSE

/datum/action/guard_info/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return

	for(var/datum/guard_objective/O in GLOB.guard_objectives)
		if(O.owner == owner.mind)
			switch(O.objective_type)
				if("shower")
					to_chat(owner, span_notice("You could probably use a shower..."))
				if("nap")
					to_chat(owner, span_notice("Taking a nap on a nice comfortable bed sounds good right about now..."))
				if("workout")
					to_chat(owner, span_notice("Why not lift some weights sometime soon?"))
				if("radio")
					to_chat(owner, span_notice("Some music would probably improve your mood."))
				if("tv")
					to_chat(owner, span_notice("Some TV would probably improve your mood."))
				if("coffee")
					to_chat(owner, span_notice("You could go for a cup of joe."))
