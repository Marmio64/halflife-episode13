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

/datum/controller/subsystem/sociostability/fire(resumed = 0)
	if(sociostability < SOCIOSTABILITY_GREAT)
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
