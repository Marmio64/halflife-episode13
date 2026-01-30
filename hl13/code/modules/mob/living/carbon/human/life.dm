/mob/living/carbon/human/proc/handle_pain()//BP/WOUND BASED PAIN
	if(HAS_TRAIT(src, TRAIT_ANALGESIA))
		return
	if(!stat)
		if(temporary_pain > 100)
			adjust_temppain(-3) //higher levels of temp pain go away faster than lower levels
		else
			adjust_temppain(-2)

		var/painpercent = get_complex_pain()

		if(world.time > last_painstun + painstuncooldown)
			var/probby = 50 - (get_stat_level(STATKEY_END) * 2) //each point of endurance reduces chance for the pain stun, 30% at 10 endurance, 10% at 20 endurance.
			if(IsKnockdown())
				if(prob(3) && (painpercent >= 80) )
					emote("scream")
					last_painstun = world.time
			else
				if(painpercent >= 100)
					if(prob(probby))
						last_painstun = world.time
						shake_camera(src, 1, 1)
						Immobilize(1 SECONDS)
						emote("agony")
						flash_fullscreen("redflash3")
						adjust_stutter(8 SECONDS)
						adjust_confusion(10 SECONDS)
						adjust_dizzy(4 SECONDS)
						var/list/usedp = list("F-FUCK, IT HURTS SO BAD!", "I CANT TAKE THIS PAIN MUCH LONGER!", "J-JUST KILL ME ALREADY!", "I N-NEED TO NUMB THIS PAIN!", "THE PAIN IS UNBEARABLE!")
						if(HAS_TRAIT(src, TRAIT_MASOCHIST))
							usedp = list("THE PAIN, I LOVE AND HATE IT!!", "PAIN IS A CRUEL MASTER!", "HOW MUCH MORE CAN I TAKE? HAHAHAHA!", "CRIMSON FLOODS MY VISION!", "THE PAIN SHALL GO ON!")
						to_chat(src, span_userdanger("[pick(usedp)]"))
						if(painpercent >= 130)
							Paralyze(painpercent/3) //min amount is 130, so a third of that is a little over 4 seconds. (This goes in deciseconds)
					else
						if(prob(probby/3))
							emote("paingroan")
							adjust_stutter(5 SECONDS)
							flash_fullscreen("redflash2")
							if(prob(25))
								var/list/usedp = list("I'm in a lot of pain right now...", "I need something to dull the pain...", "The pain is incessant...", "When will the pain end?", "I can't take this pain for much longer...")
								if(!HAS_TRAIT(src, TRAIT_MASOCHIST))
									to_chat(src, span_warning("[pick(usedp)]"))
				else
					if(painpercent >= 60)
						if(prob(probby/3))
							emote("paingroan")
							adjust_stutter(3 SECONDS)
							flash_fullscreen("redflash2")
							if(prob(25))
								var/list/usedp = list("I'm in a lot of pain right now...", "I need something to dull the pain...", "The pain is incessant...", "When will the pain end?", "I can't take this pain for much longer...")
								if(!HAS_TRAIT(src, TRAIT_MASOCHIST))
									to_chat(src, span_warning("[pick(usedp)]"))

		if(painpercent >= 100)
			if(HAS_TRAIT(src, TRAIT_MASOCHIST))
				add_mood_event("pain", /datum/mood_event/maxpain_maso)
			else
				add_mood_event("pain", /datum/mood_event/maxpain)
		else if(painpercent >= 60)
			if(HAS_TRAIT(src, TRAIT_MASOCHIST))
				add_mood_event("pain", /datum/mood_event/seriouspain_maso)
			else
				add_mood_event("pain", /datum/mood_event/seriouspain)
		else
			clear_mood_event("pain")

/mob/living/carbon/human/proc/get_complex_pain()
	var/amt = temporary_pain
	for(var/I in bodyparts)
		var/obj/item/bodypart/BP = I
		if(BP.bodytype == BODYTYPE_ROBOTIC)
			continue
		var/BPinteg
		//pain from base damage is amplified based on how much con you have
		BPinteg = ((BP.brute_dam / BP.max_damage) * 100) + BPinteg
		BPinteg = ((BP.burn_dam / BP.max_damage) * 100) + BPinteg
		for(var/W in BP.wounds) //wound damage is added normally and stacks higher than 100
			var/datum/wound/WO = W
			if(WO.woundpain > 0)
				BPinteg += WO.woundpain
//		BPinteg = min(((totwound / BP.max_damage) * 100) + BPinteg, initial(BP.max_damage))
//		if(BPinteg > amt) //this is here to ensure that pain doesn't add up, but is rather picked from the worst limb
		amt += (BPinteg) - (get_drunk_amount()/4) //inebriation reduces percieved pain

		if(1 <= amt) //only check endurance if there is a noticeable level of pain, since otherwise low endurance can result in you having severe pain even without anything being wrong with you
			amt -= (get_stat_level(STATKEY_END) - 10) //low endurance increases perceived pain, high strength decreases it

		if(HAS_TRAIT(src, TRAIT_LESSPAIN_MAJOR)) //about -90 pain
			amt -= 15
		if(HAS_TRAIT(src, TRAIT_LESSPAIN)) //lesspain simply reduces pain by an amount, about -60
			amt -= 10
		if(HAS_TRAIT(src, TRAIT_LESSPAIN_MINOR)) //-30 pain felt, about as much as one wound
			amt -= 5

	return amt

/mob/living/carbon/proc/adjust_temppain(amount)
	temporary_pain += amount

	if(temporary_pain > 150)
		temporary_pain = 150
	else if(temporary_pain < 0)
		temporary_pain = 0

//Combat deployment things

GLOBAL_LIST_EMPTY(deployment_combine_players)
GLOBAL_LIST_EMPTY(deployment_rebel_players)
GLOBAL_LIST_EMPTY(deployment_xen_players)
GLOBAL_LIST_EMPTY(deployment_hidden_players)

/mob/living/carbon/human/proc/setdeploymentfaction(faction)
	if(client)
		client.player_details.deployment_faction = faction //this should make it persistent across logouts
		deployment_faction = faction
		switch(faction)
			if(COMBINE_DEPLOYMENT_FACTION)
				GLOB.deployment_combine_players |= client
			if(REBEL_DEPLOYMENT_FACTION)
				GLOB.deployment_rebel_players |= client
			if(XEN_DEPLOYMENT_FACTION)
				GLOB.deployment_xen_players |= client
			if(HIDDEN_DEPLOYMENT_FACTION)
				GLOB.deployment_hidden_players |= client
