/datum/disease/gutworms
	form = "Disease"
	name = "Gut Worms"
	max_stages = 5
	spread_text = "Foodborne"
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Penicillin, or waiting until it clears up naturally"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "microscopic pathogenic worms"
	viable_mobtypes = list(/mob/living/carbon/human)
	cure_chance = 6
	desc = "A dangerous food-borne parasite that infests raw food and will cause severe stomach issues, but will eventually pass on it's own."
	required_organ = ORGAN_SLOT_STOMACH
	severity = DISEASE_CYCLES_MINOR
	disease_flags = CURABLE|CAN_CARRY //you cant build up resistance to gutworms

/datum/disease/gutworms/stage_act()
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			if(prob(5))
				to_chat(affected_mob, span_danger("Your stomach rumbles, and a dull ache emanates from your gut."))
				affected_mob.adjust_nutrition(-10)
				affected_mob.adjust_hydration(-10)
			if(prob(5))
				to_chat(affected_mob, span_danger("You feel weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(20)
		if(4)
			if(prob(4))
				to_chat(affected_mob, span_userdanger("You feel terrible, as a deep pain appears in your gut."))
				affected_mob.adjust_dizzy(3)
				affected_mob.adjust_confusion(3 SECONDS)
			if(prob(4))
				to_chat(affected_mob, span_danger("Your stomach rumbles violently, prickles of pain emanating from your gut."))
				affected_mob.adjust_nutrition(-15)
				affected_mob.adjust_hydration(-15)
		if(5)
			if(prob(4))
				to_chat(affected_mob, span_danger("A deep ache appears in your stomach, as you suddenly hurl!"))
				affected_mob.vomit(20)
			if(prob(8))
				to_chat(affected_mob, span_danger("You feel very weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(30)
			if(prob(10))
				to_chat(affected_mob, span_danger("Your stomach rumbles violently, prickles of pain emanating from your gut."))
				affected_mob.adjust_nutrition(-25)
				affected_mob.adjust_hydration(-15)
			if(prob(8))
				to_chat(affected_mob, span_danger("You vomit violently, and you can see worms wriggling inside the expulsion! Maybe it's over now..."))
				affected_mob.vomit(20)
				cure()
	return

/datum/disease/cholera
	form = "Disease"
	name = "Cholera"
	max_stages = 5
	spread_text = "Foodborne"
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Penicillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "bacteria"
	viable_mobtypes = list(/mob/living/carbon/human)
	cure_chance = 6
	desc = "A dangerous pathogen which inhabits raw food and unclean water. Causes severe dehydration, among other issues"
	required_organ = ORGAN_SLOT_STOMACH
	severity = DISEASE_CYCLES_MEDIUM
	disease_flags = CURABLE|CAN_CARRY //you cant build up resistance to cholera

/datum/disease/cholera/stage_act()
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			if(prob(5))
				to_chat(affected_mob, span_danger("Your mouth feels dry."))
			if(prob(5))
				to_chat(affected_mob, span_danger("You feel weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(20)
		if(4)
			if(prob(4))
				to_chat(affected_mob, span_userdanger("You feel terrible, as a deep pain appears in your gut."))
				affected_mob.adjust_dizzy(4)
				affected_mob.adjust_confusion(4 SECONDS)
			if(prob(4))
				to_chat(affected_mob, span_danger("A deep pain appears in your stomach, as you suddenly hurl!"))
				affected_mob.vomit(20)
		if(5)
			if(prob(4))
				to_chat(affected_mob, span_danger("A deep pain appears in your stomach, as you suddenly hurl!"))
				affected_mob.vomit(20)
			if(prob(8))
				to_chat(affected_mob, span_danger("You feel very weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(30)
				affected_mob.adjust_tiredness(20)
			if(prob(10))
				to_chat(affected_mob, span_danger("You feel parched..."))
				affected_mob.adjust_hydration(-40)
			if(prob(10))
				to_chat(affected_mob, span_danger("The pain in your stomach is getting unbearable..."))
				affected_mob.adjust_temppain(50)
	return

/datum/disease/fungosis
	name = "Fungosis"
	desc = "A moderate sickness brought on by xenian fungus species. Induces moderate sickness and fatigue, but passes on it's own."
	max_stages = 3
	cure_text = "Rest & Penicillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "fungal spores"
	viable_mobtypes = list(/mob/living/carbon/human)
	spreading_modifier = 0.1
	spread_text = "Airborne"
	severity = DISEASE_SEVERITY_MEDIUM
	required_organ = ORGAN_SLOT_LUNGS


/datum/disease/fungosis/stage_act(seconds_per_tick, times_fired)
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.infectious_sneeze(src, TRUE)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
		if(3)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.infectious_sneeze(src, TRUE)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("You feel rather tired."))
				affected_mob.adjust_tiredness(10)
				affected_mob.adjustStaminaLoss(20)
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_warning("[pick("You have a coughing fit!", "You can't stop coughing!")]"))
				affected_mob.Immobilize(20)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_LUNGS, 4) //lungs hurt hurt ouchy
				affected_mob.emote("cough")
				addtimer(CALLBACK(affected_mob, TYPE_PROC_REF(/mob/, emote), "cough"), 0.6 SECONDS)
				addtimer(CALLBACK(affected_mob, TYPE_PROC_REF(/mob/, emote), "cough"), 1.2 SECONDS)
			if((affected_mob.body_position == LYING_DOWN && SPT_PROB(10, seconds_per_tick)) || SPT_PROB(0.005, seconds_per_tick))
				to_chat(affected_mob, span_notice("You feel better."))
				cure()
				return FALSE
