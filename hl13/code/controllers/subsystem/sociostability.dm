SUBSYSTEM_DEF(sociostability)
	name = "Sociostability"
	wait = 3 MINUTES
	init_order = INIT_ORDER_SOCIOSTABILITY
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT
	var/sociostability = SOCIOSTABILITY_GOOD
	var/okay_package_received = FALSE
	var/poor_package_received = FALSE
	var/bad_package_received = FALSE

	/// Has the administrator made an announcement during this cycle? Stops unlimited sociostability farming.
	var/announcement_made = FALSE

	/// Keeps track of if a distress beacon has been succesfully sent yet. You can only have one succesful one in a round.
	var/distress_beacon_success = FALSE

/datum/controller/subsystem/sociostability/fire(resumed = 0)
	if(SSmapping.current_map.minetype == "combat_deployment")
		return

	if(prob(50))
		unit_encouragement()

	announcement_made = FALSE

	modifystability(SOCIOSTABILITY_PASSIVE_GAIN)


	if(sociostability < SOCIOSTABILITY_POOR) //Poor sociostability means a poor district. Buying power will be reduced by 20%.
		SSeconomy.pack_price_modifier = 1.2
	else
		SSeconomy.pack_price_modifier = 1


	for(var/mob/living/silicon/ai/A in GLOB.ai_list)	//Alert Dispatch of sociostability level
		to_chat(A, span_warning("Sociostability matrix levels calculated and compiled. Percentage is at [((sociostability / SOCIOSTABILITY_GREAT)*100)]%"))
		if(sociostability >= SOCIOSTABILITY_GREAT)
			to_chat(A, span_warning("Sociostability is at an esteemed level."))
		else if(sociostability >= SOCIOSTABILITY_GOOD)
			to_chat(A, span_warning("Sociostability is at an esteemed level."))
		else if(sociostability >= SOCIOSTABILITY_OKAY)
			to_chat(A, span_warning("Sociostability is at an acceptable level."))
		else if(sociostability >= SOCIOSTABILITY_POOR)
			to_chat(A, span_warning("Sociostability is at a poor level. Correct immediately."))
		else if(sociostability >= SOCIOSTABILITY_BAD)
			to_chat(A, span_warning("Sociostability is very low. Correct immediately."))
		else if(sociostability >= SOCIOSTABILITY_TERRIBLE)
			to_chat(A, span_warning("Sociostability is at an unacceptable level. Possible judgement waiver imbound."))

	//////packages and alert levels///////

	if(sociostability < SOCIOSTABILITY_OKAY && !okay_package_received)
		drop_package()
		okay_package_received = TRUE

	if(sociostability < SOCIOSTABILITY_POOR)
		if(!poor_package_received)
			drop_package()
			poor_package_received = TRUE
		if(SSsecurity_level.get_current_level_as_number() < SEC_LEVEL_BLUE)
			priority_announce("Socio-fracture in progress, your district's alert level has been raised.", "Overwatch Alert")
			SSsecurity_level.set_level(SEC_LEVEL_BLUE)
			return

	if(sociostability < SOCIOSTABILITY_BAD)
		if(!bad_package_received)
			drop_package()
			bad_package_received = TRUE

			SSdynamic.unfavorable_situation()

			for(var/mob/M as anything in GLOB.player_list)
				if(IS_RINGLEADER(M))
					to_chat(M, "Sociostability has dropped low enough for the super destabilizer to be deployed. If you don't have a beacon for one already, create one at an electrical tinkering bench and place it down in the district Nexus.")
		if(SSsecurity_level.get_current_level_as_number() < SEC_LEVEL_RED)
			priority_announce("Sociocide in progress, your district's alert level has been raised.", "Overwatch Alert")
			SSsecurity_level.set_level(SEC_LEVEL_RED)
			return


/datum/controller/subsystem/sociostability/proc/drop_package(amount)
	var/datum/round_event_control/care_package/PackageControl = new /datum/round_event_control/care_package()
	var/datum/round_event/care_package/package = PackageControl.run_event()
	package.setup()

/datum/controller/subsystem/sociostability/proc/modifystability(amount)
	sociostability += amount
	if(sociostability > SOCIOSTABILITY_GREAT)
		sociostability = SOCIOSTABILITY_GREAT
	else if (sociostability < SOCIOSTABILITY_TERRIBLE)
		sociostability = SOCIOSTABILITY_TERRIBLE

///This just gets the amount of sociostability that has been lost in comparison to the max/starting value.
/datum/controller/subsystem/sociostability/proc/getloss()
	var/loss = abs(sociostability - SOCIOSTABILITY_GREAT) //ex: stability is 700. 700-1000 = -300, then absolute value is 300. 300 stability has been lost.
	return loss

///A chance to send a message to civil protection masks, giving them some encouragement
/datum/controller/subsystem/sociostability/proc/unit_encouragement()
	var/encouragements = list('hl13/sound/voice/dispatchradio/politistablizationmarginal.ogg', 'hl13/sound/voice/dispatchradio/recalibratesocioscan.ogg', 'hl13/sound/voice/dispatchradio/reminder100credits.ogg', 'hl13/sound/voice/dispatchradio/remindermemoryreplacement.ogg', 'hl13/sound/voice/dispatchradio/teamsreportstatus.ogg')

	for(var/atom/movable/mask in GLOB.cpmasks)
		if(mask.loc &&ismob(mask.loc))
			if(prob(35))
				var/chosen_sound = pick(encouragements)
				playsound(mask.loc, chosen_sound, 40, FALSE)
	return

/datum/controller/subsystem/sociostability/proc/send_distress_beacon()
	priority_announce("A distress beacon has been deployed by the facility. A response is not guaranteed.", "Overwatch Alert")
	sociostability = 0
	distress_beacon_success = TRUE

	if(prob(66))
		if(prob(33))
			addtimer(CALLBACK(src, PROC_REF(trigger_Emergencyresponseteam), /datum/ert/overwatch), 45 SECONDS)
		else if(prob(50))
			addtimer(CALLBACK(src, PROC_REF(trigger_Emergencyresponseteam), /datum/ert/riotpolice), 45 SECONDS)
		else
			addtimer(CALLBACK(src, PROC_REF(trigger_Emergencyresponseteam), /datum/ert/police), 45 SECONDS)
	else
		SSdynamic.unfavorable_situation()

	return TRUE

/datum/controller/subsystem/sociostability/proc/trigger_Emergencyresponseteam(datum/ert/ertemplate = null)
	if (ertemplate)
		ertemplate = new ertemplate
	else
		ertemplate = new /datum/ert/administrative

	var/human_authority_setting = CONFIG_GET(string/human_authority)

	var/list/settings = list(
		"mainsettings" = list(
		"template" = list("desc" = "Template", "value" = ertemplate.type),
		"teamsize" = list("desc" = "Team Size", "type" = "number", "value" = ertemplate.teamsize),
		"mission" = list("desc" = "Mission", "type" = "string", "value" = ertemplate.mission),
		"polldesc" = list("desc" = "Ghost poll description", "type" = "string", "value" = ertemplate.polldesc),
		"enforce_human" = list("desc" = "Enforce human authority", "type" = "boolean", "value" = "[(human_authority_setting == HUMAN_AUTHORITY_ENFORCED ? "Yes" : "No")]"),
		"open_armory" = list("desc" = "Open armory doors", "type" = "boolean", "value" = "[(ertemplate.opendoors ? "Yes" : "No")]"),
		"leader_experience" = list("desc" = "Pick an experienced leader", "type" = "boolean", "value" = "[(ertemplate.leader_experience ? "Yes" : "No")]"),
		"random_names" = list("desc" = "Randomize names", "type" = "boolean", "value" = "[(ertemplate.random_names ? "Yes" : "No")]"),
		"spawn_admin" = list("desc" = "Spawn yourself as briefing officer", "type" = "boolean", "value" = "[(ertemplate.spawn_admin ? "Yes" : "No")]"),
		"use_custom_shuttle" = list("desc" = "Use the ERT's custom shuttle (if it has one)", "type" = "boolean", "value" = "[(ertemplate.use_custom_shuttle ? "Yes" : "No")]"),
		"mob_type" = list("desc" = "Base Species", "type" = "datum", "path" = "/mob/living/carbon/human", "subtypesonly" = TRUE, "value" = ertemplate.mob_type),
		)
	)

	var/list/prefs = settings["mainsettings"]

	var/templtype = prefs["template"]["value"]
	if (!ispath(prefs["template"]["value"]))
		templtype = text2path(prefs["template"]["value"]) // new text2path ... doesn't compile in 511

	if (ertemplate.type != templtype)
		ertemplate = new templtype

	ertemplate.teamsize = prefs["teamsize"]["value"]
	ertemplate.mission = prefs["mission"]["value"]
	ertemplate.polldesc = prefs["polldesc"]["value"]
	ertemplate.enforce_human = prefs["enforce_human"]["value"] == "Yes" // these next 6 are effectively toggles
	ertemplate.opendoors = prefs["open_armory"]["value"] == "Yes"
	ertemplate.leader_experience = prefs["leader_experience"]["value"] == "Yes"
	ertemplate.random_names = prefs["random_names"]["value"] == "Yes"
	ertemplate.spawn_admin = prefs["spawn_admin"]["value"] == "Yes"
	ertemplate.use_custom_shuttle = prefs["use_custom_shuttle"]["value"] == "Yes"
	ertemplate.mob_type = prefs["mob_type"]["value"]

	var/list/spawnpoints = GLOB.emergencyresponseteamspawn
	var/index = 0

	var/list/mob/dead/observer/candidates = SSpolling.poll_ghost_candidates("Do you wish to be considered for [span_notice(ertemplate.polldesc)]?", check_jobban = "deathsquad", alert_pic = /obj/item/card/id/advanced/centcom/ert, role_name_text = "emergency response team")
	var/teamSpawned = FALSE

	// This list will take priority over spawnpoints if not empty
	var/list/spawn_turfs = list()

	// Takes precedence over spawnpoints[1] if not null
	var/turf/brief_spawn

	if(!length(candidates))
		return FALSE

	if(ertemplate.use_custom_shuttle && ertemplate.ert_template)
		var/datum/map_template/shuttle/ship = new ertemplate.ert_template
		var/x = rand(TRANSITIONEDGE, world.maxx - TRANSITIONEDGE - ship.width)
		var/y = rand(TRANSITIONEDGE, world.maxy - TRANSITIONEDGE - ship.height)
		var/z = SSmapping.empty_space.z_value
		var/turf/located_turf = locate(x, y, z)
		if(!located_turf)
			CRASH("ERT shuttle found no place to load in")

		if(!ship.load(located_turf))
			CRASH("Loading ERT shuttle failed!")

		var/list/shuttle_turfs = ship.get_affected_turfs(located_turf)

		for(var/turf/affected_turf as anything in shuttle_turfs)
			for(var/obj/effect/landmark/ert_shuttle_spawn/spawner in affected_turf)
				spawn_turfs += get_turf(spawner)

			if(!brief_spawn)
				brief_spawn = get_turf(locate(/obj/effect/landmark/ert_shuttle_brief_spawn) in affected_turf)

		if(!length(spawn_turfs))
			stack_trace("ERT shuttle loaded but found no spawnpoints, placing the ERT at wherever inside the shuttle instead.")

			for(var/turf/open/floor/open_turf in shuttle_turfs)
				if(!is_safe_turf(open_turf))
					continue
				spawn_turfs += open_turf

	//Pick the (un)lucky players
	var/numagents = min(ertemplate.teamsize, length(candidates))

	//Create team
	var/datum/team/ert/ert_team = new ertemplate.team()
	if(ertemplate.rename_team)
		ert_team.name = ertemplate.rename_team

	//Assign team objective
	var/datum/objective/missionobj = new ()
	missionobj.team = ert_team
	missionobj.explanation_text = ertemplate.mission
	missionobj.completed = TRUE
	ert_team.objectives += missionobj
	ert_team.mission = missionobj

	var/mob/dead/observer/earmarked_leader
	var/leader_spawned = FALSE // just in case the earmarked leader disconnects or becomes unavailable, we can try giving leader to the last guy to get chosen

	if(ertemplate.leader_experience)
		var/list/candidate_living_exps = list()
		for(var/i in candidates)
			var/mob/dead/observer/potential_leader = i
			candidate_living_exps[potential_leader] = potential_leader.client?.get_exp_living(TRUE)

		candidate_living_exps = sort_list(candidate_living_exps, cmp=/proc/cmp_numeric_dsc)
		if(candidate_living_exps.len > 3)
			candidate_living_exps.Cut(3+1) // pick from the top ERT_EXPERIENCED_LEADER_CHOOSE_TOP contenders in playtime
		earmarked_leader = pick(candidate_living_exps)
	else
		earmarked_leader = pick(candidates)

	while(numagents && candidates.len)
		var/turf/spawnloc
		if(length(spawn_turfs))
			spawnloc = pick(spawn_turfs)
		else
			spawnloc = spawnpoints[index+1]
			//loop through spawnpoints one at a time
			index = (index + 1) % spawnpoints.len

		var/mob/dead/observer/chosen_candidate = earmarked_leader || pick(candidates) // this way we make sure that our leader gets chosen
		candidates -= chosen_candidate
		if(!chosen_candidate?.key)
			continue

		//Spawn the body
		var/mob/living/carbon/human/ert_operative
		if(ertemplate.mob_type)
			ert_operative = new ertemplate.mob_type(spawnloc)
		else
			ert_operative = new /mob/living/carbon/human(spawnloc)
			chosen_candidate.client.prefs.safe_transfer_prefs_to(ert_operative, is_antag = TRUE)
		ert_operative.key = chosen_candidate.key

		if(ertemplate.enforce_human || !(ert_operative.dna.species.changesource_flags & ERT_SPAWN))
			ert_operative.set_species(/datum/species/human)

		//Give antag datum
		var/datum/antagonist/ert/ert_antag

		if((chosen_candidate == earmarked_leader) || (numagents == 1 && !leader_spawned))
			ert_antag = new ertemplate.leader_role ()
			earmarked_leader = null
			leader_spawned = TRUE
		else
			ert_antag = ertemplate.roles[WRAP(numagents,1,length(ertemplate.roles) + 1)]
			ert_antag = new ert_antag ()
		ert_antag.random_names = ertemplate.random_names

		ert_operative.mind.add_antag_datum(ert_antag,ert_team)
		ert_operative.mind.set_assigned_role(SSjob.get_job_type(ert_antag.ert_job_path))

		//Logging and cleanup
		ert_operative.log_message("has been selected as \a [ert_antag.name].", LOG_GAME)
		numagents--
		teamSpawned++

	if (teamSpawned)
		message_admins("[ertemplate.polldesc] has spawned with the mission: [ertemplate.mission]")

	//Open the Armory doors
	if(ertemplate.opendoors)
		for(var/obj/machinery/door/poddoor/ert/door as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/poddoor/ert))
			door.open()
			CHECK_TICK
	return TRUE
