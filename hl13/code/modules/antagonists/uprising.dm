/datum/outfit/uprising_preview
	name = "Uprising Ringleader (Preview only)"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/rebel
	head = /obj/item/clothing/head/helmet/halflife/military
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

/datum/antagonist/uprising
	name = "Uprising Ringleader"
	roundend_category = "uprising ring leaders"
	antagpanel_category = "Uprising Ringleaders"
	antag_hud_name = "traitor"
	job_rank = ROLE_OPERATIVE
	antag_moodlet = /datum/mood_event/rebel
	preview_outfit = /datum/outfit/uprising_preview
	show_in_antagpanel = TRUE
	/// Which uprising team are we on?
	var/datum/team/uprising/uprising_team
	/// Should they be sent to the rebel base?
	var/send_to_base = FALSE

	/// Outfit they should be equipped with, if they're loud
	var/uprising_outfit

	var/loud = FALSE

/datum/antagonist/uprising/loud
	name = "Uprising Ringleader (Loud)"
	send_to_base = TRUE
	loud = TRUE

	uprising_outfit = /datum/outfit/rebel

/datum/antagonist/uprising/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',50,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Uprising Ringleader!"))
	to_chat(owner, span_boldnotice("The time has come for this district to be freed from the tyranny of the combine."))
	to_chat(owner, span_notice("You have to lower the sociostability of the district low enough to allow you to set up a Super Destabilizer within the Nexus, and cut off the city from combine reinforcements."))
	to_chat(owner, span_notice("You can craft a Super Destabilizer beacon at an Electronics bench, located in the factory and other places in the city, sewers, and outlands."))
	to_chat(owner, span_boldnotice("Prepare for the final showdown by getting well equipped by looting, scavenging, and more. In addition, you are not alone! You'll recognise other ringleaders by the Lambda symbol near their head, and can communicate with them through a hidden channel at any time with the button in the top left of your screen."))
	to_chat(owner, span_notice("To better prepare, you should find a secure and secret location to laydown your uplink relay, and then break into secure locations to hack Combine Data Pod Terminals with a multifunction electrical tool. These datapods can be fed to your uplink relay to be able to purchase useful gear."))
	to_chat(owner, span_notice("For more information, visit the wiki page for this antagonist: https://halflifeepisode13.miraheze.org/wiki/Uprising_Ringleader"))
	owner.announce_objectives()

/datum/antagonist/uprising/on_removal()
	for(var/datum/action/cooldown/spell/uprising/buttons in owner.current.actions)
		qdel(buttons)

	return ..()

/datum/antagonist/uprising/on_gain()
	//Give uprising Objective
	var/datum/objective/uprising/uprising_objective = new
	uprising_objective.owner = owner

	var/mob/living/current = owner.current

	owner.teach_crafting_recipe(/datum/crafting_recipe/super_destabilizer)

	objectives += uprising_objective

	current.cmode_music = 'hl13/sound/music/combat/penultimatum.ogg'

	if(!loud)
		var/datum/action/cooldown/spell/uprising/calldown_relay/call_relay = new(owner)
		call_relay.Grant(current)
	else
		var/datum/action/cooldown/spell/uprising/calldown_relay/loud/call_relay = new(owner)
		call_relay.Grant(current)


	var/datum/action/cooldown/spell/uprising/comm/communications = new(owner)
	communications.Grant(current)

	var/datum/action/cooldown/spell/uprising/view_sociostability/view_soc = new(owner)
	view_soc.Grant(current)

	if(send_to_base)
		move_to_spawnpoint()

	equip_op()

	return ..()

/datum/antagonist/uprising/proc/equip_op()
	if(!ishuman(owner.current))
		return

	var/mob/living/carbon/human/operative = owner.current
	ADD_TRAIT(operative, TRAIT_NOFEAR_HOLDUPS, INNATE_TRAIT)

	if(!uprising_outfit) // they may be quiet or loud uprisings
		return

	operative.set_species(/datum/species/human)

	operative.delete_equipment()

	operative.equip_species_outfit(uprising_outfit)

	return TRUE

/// Actually moves our nukie to where they should be
/datum/antagonist/uprising/proc/move_to_spawnpoint()
	// Ensure that the nukiebase is loaded, and wait for it if required
	SSmapping.lazy_load_template(LAZY_TEMPLATE_KEY_NUKIEBASE)
	owner.current.forceMove(pick(GLOB.nukeop_start))
	if(!owner.current.onSyndieBase())
		message_admins("[ADMIN_LOOKUPFLW(owner.current)] is a NUKE OP and move_to_spawnpoint put them somewhere that isn't the syndie base, help please.")
		stack_trace("Nuke op move_to_spawnpoint resulted in a location not on the syndicate base.")

/// Gets the position we spawn at
/datum/antagonist/uprising/proc/get_spawnpoint()
	var/team_number = 1
	if(uprising_team)
		team_number = uprising_team.members.Find(owner)

	return GLOB.nukeop_start[((team_number - 1) % GLOB.nukeop_start.len) + 1]


/datum/objective/uprising
	explanation_text = "Turn on a super destabilizer in the nexus, and defend it until it completes."

/obj/item/encryptionkey/syndicate/uprising
	special_channels = RADIO_SPECIAL_SYNDIE // no hear all flags

/obj/item/implant/radio/syndicate/uprising
	radio_key = /obj/item/encryptionkey/syndicate/uprising

/obj/item/implant/radio/syndicate/uprising/Initialize(mapload)
	. = ..()

	radio.frequency = FREQ_SYNDICATE
	radio.freqlock = RADIO_FREQENCY_LOCKED

/datum/antagonist/uprising/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	add_team_hud(M, /datum/antagonist/uprising)

/datum/antagonist/uprising/create_team(datum/team/uprising/new_team)
	if(!new_team)
		//For now only one uprising at a time
		for(var/datum/antagonist/uprising/H in GLOB.antagonists)
			if(!H.owner)
				continue
			if(H.uprising_team)
				uprising_team = H.uprising_team
				return
		uprising_team = new /datum/team/uprising
		uprising_team.update_objectives()
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	uprising_team = new_team

/datum/objective/uprising
	name = "uprising"
	explanation_text = "Cutoff combine communications in the district with a super destabilizer."
	martyr_compatible = TRUE
	admin_grantable = TRUE

/datum/objective/uprising/check_completion()
	if(GLOB.station_was_cutoff)
		return TRUE
	return FALSE

/datum/team/uprising
	var/core_objective = /datum/objective/uprising

/datum/team/uprising/roundend_report()
	var/list/parts = list()
	parts += span_header("Uprising Insurgents:")

	switch(get_result())
		if(UPRISING_RESULT_WIN)
			parts += "<span class='greentext big'>Uprising Victory!</span>"
			parts += "<B>The insurgents have cutoff the district from combine communications!</B>"
		if(UPRISING_RESULT_LOSE)
			parts += "<span class='redtext big'>Combine Victory!</span>"
			parts += "<B>The uprising has failed, combine reinforcements are incoming!</B>"
		else
			parts += "<span class='neutraltext big'>Neutral Victory</span>"
			parts += "<B>Mission aborted!</B>"

	var/text = span_header("<br>The uprising insurgents were:")
	var/purchases = ""
	var/TC_uses = 0
	LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
	for(var/I in members)
		var/datum/mind/syndicate = I
		var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[syndicate.key]
		if(H)
			TC_uses += H.total_spent
			purchases += H.generate_render(show_key = FALSE)
	text += printplayerlist(members)
	text += "<br>"
	text += "(Uprising insurgents used [TC_uses] TC) [purchases]"
	if(TC_uses == 0 && GLOB.station_was_cutoff && !are_all_operatives_dead())
		text += "<BIG>[icon2html('icons/ui/antags/badass.dmi', world, "badass")]</BIG>"

	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/team/uprising/antag_listing_name()
	return "Insurgents"

/datum/team/uprising/proc/update_objectives()
	if(core_objective)
		var/datum/objective/O = new core_objective
		O.team = src
		objectives += O

/datum/team/uprising/proc/are_all_operatives_dead()
	for(var/datum/mind/operative_mind as anything in members)
		if(ishuman(operative_mind.current) && (operative_mind.current.stat != DEAD))
			return FALSE
	return TRUE

/datum/team/uprising/proc/get_result()
	var/station_was_cutoff = GLOB.station_was_cutoff


	if(station_was_cutoff)
		return UPRISING_RESULT_WIN
	else
		return UPRISING_RESULT_LOSE

	CRASH("[type] - got an undefined / unexpected result.")

/datum/team/uprising/add_member(datum/mind/new_member)
	..()
	SEND_SIGNAL(src, COMSIG_NUKE_TEAM_ADDITION, new_member.current)

/datum/action/cooldown/spell/uprising
	button_icon = 'hl13/icons/mob/actions/actions_uprising.dmi'
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"

/datum/action/cooldown/spell/uprising/comm
	name = "Hidden Uprising Communications Channel"
	desc = "Utilize a special communications channel to speak to fellow uprising ringleaders. Has a lengthy cooldown between uses.<br><b>Warning:</b>Nearby people can still hear you."
	button_icon_state = "comm"

	cooldown_time = 15 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = SPELL_REQUIRES_MIND
	antimagic_flags = 0
	spell_max_level = 1

/datum/action/cooldown/spell/uprising/comm/Activate()
	var/input = tgui_input_text(usr, "Message to tell to the other ringleaders", "Voice of Freedom", max_length = MAX_MESSAGE_LEN)
	if(!input || !IsAvailable(feedback = TRUE))
		return

	var/list/filter_result = CAN_BYPASS_FILTER(usr) ? null : is_ic_filtered(input)
	if(filter_result)
		REPORT_CHAT_FILTER_TO_USER(usr, filter_result)
		return

	var/list/soft_filter_result = CAN_BYPASS_FILTER(usr) ? null : is_soft_ic_filtered(input)
	if(soft_filter_result)
		if(tgui_alert(usr,"Your message contains \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\". \"[soft_filter_result[CHAT_FILTER_INDEX_REASON]]\", Are you sure you want to say it?", "Soft Blocked Word", list("Yes", "No")) != "Yes")
			return
		message_admins("[ADMIN_LOOKUPFLW(usr)] has passed the soft filter for \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\" they may be using a disallowed term. Message: \"[html_encode(input)]\"")
		log_admin_private("[key_name(usr)] has passed the soft filter for \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\" they may be using a disallowed term. Message: \"[input]\"")
	cultist_commune(usr, input)
	StartCooldown()

/datum/action/cooldown/spell/uprising/comm/proc/cultist_commune(mob/living/user, message)
	var/my_message
	if(!message || !user.mind)
		return
	user.whisper("Papa Lima Foxtrot...", language = /datum/language/common)
	user.whisper(html_decode(message), filterproof = TRUE)
	my_message = "<span class='cult italic'><b>Ringleader [findtextEx(user.name, user.real_name) ? user.name : "[user.real_name] (as [user.name])"]:</b> [message]</span>"
	for(var/mob/M as anything in GLOB.player_list)
		if(IS_RINGLEADER(M))
			to_chat(M, my_message)
		else if(M in GLOB.dead_mob_list)
			var/link = FOLLOW_LINK(M, user)
			to_chat(M, "[link] [my_message]")

	user.log_talk(message, LOG_SAY, tag="uprising")

/datum/action/cooldown/spell/uprising/view_sociostability
	name = "View Sociostability"
	desc = "Gives you a readout on what the current sociostability is."
	button_icon_state = "view_soc"

	cooldown_time = 3 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = SPELL_REQUIRES_MIND
	antimagic_flags = 0
	spell_max_level = 1

/datum/action/cooldown/spell/uprising/view_sociostability/cast(mob/living/cast_on)
	. = ..()

	to_chat(cast_on, span_notice("The current sociostability is [((SSsociostability.sociostability / SOCIOSTABILITY_GREAT)*100)]%"))
	if(SSsociostability.sociostability <= SOCIOSTABILITY_POOR)
		to_chat(cast_on, span_green("Sociostability is low enough for the super destabilizer to be deployed."))
	else
		to_chat(cast_on, span_warning("Sociostability is not low enough for the super destabilizer to be deployed."))
