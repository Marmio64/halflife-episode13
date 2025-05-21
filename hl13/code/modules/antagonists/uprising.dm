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

/datum/antagonist/uprising/loud
	name = "Uprising Ringleader (Loud)"
	send_to_base = TRUE

	uprising_outfit = /datum/outfit/rebel

/datum/antagonist/uprising/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',50,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Uprising Ringleader!"))
	to_chat(owner, span_boldnotice("The time has come for this district to be freed from the tyranny of the combine."))
	to_chat(owner, span_notice("You have to lower the sociostability of the district low enough to allow you to set up a Super Destabilizer within the Nexus, and cut off the city from combine reinforcements."))
	to_chat(owner, span_notice("You can craft a Super Destabilizer beacon at an Electronics bench, located in the factory and other places in the city, sewers, and outlands."))
	to_chat(owner, span_boldnotice("Prepare for the final showdown by getting well equipped by looting, scavenging, and more. In addition, you are not alone! You'll recognise other ringleaders by the Lambda symbol near their head. Finding a headset and a custom communication frequency will be useful, or you can purchase a lambda encryption key and a headset in your uplink."))
	to_chat(owner, span_notice("Hint: If you need destabilizer antennas, buy them from the Refugee Smuggler in the outlands or using your uplink."))
	owner.announce_objectives()

/datum/antagonist/uprising/on_gain()
	//Give uprising Objective
	var/datum/objective/uprising/uprising_objective = new
	uprising_objective.owner = owner

	owner.teach_crafting_recipe(/datum/crafting_recipe/super_destabilizer)

	objectives += uprising_objective

	//var/obj/item/implant/radio/syndicate/uprising/imp = new(owner.current)
	//imp.implant(owner.current, null, TRUE)

	owner.current.cmode_music = 'hl13/sound/music/combat/penultimatum.ogg'

	owner.give_uplink(silent = FALSE, antag_datum = src)
	var/datum/component/uplink/U = owner.find_syndicate_uplink()
	if(U)
		U.uplink_handler.set_telecrystals(12)
		to_chat(owner, span_danger("You and each of your comrades have been supplied a Lambda teleportation uplink for purchasing a small amount of supplies."))

	if(send_to_base)
		owner.current.forceMove(pick(GLOB.nukeop_start))


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
