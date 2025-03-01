/mob/living/carbon/human/proc/handle_pain()//BP/WOUND BASED PAIN
	if(HAS_TRAIT(src, TRAIT_NOPAIN))
		return
	if(!stat)
		adjust_temppain(-2)

		var/painpercent = get_complex_pain()

		if(world.time > last_painstun + painstuncooldown)
			var/probby = 50
			if(IsKnockdown())
				if(prob(3) && (painpercent >= 80) )
					emote("scream")
					last_painstun = world.time
			else
				if(painpercent >= 100)
					last_painstun = world.time
					if(prob(probby))
						shake_camera(src, 1, 1)
						Immobilize(1 SECONDS)
						emote("scream")
						flash_fullscreen("redflash3")
						adjust_stutter(8 SECONDS)
						adjust_confusion(10 SECONDS)
						if(painpercent >= 130)
							Paralyze(painpercent/3) //min amount is 130, so a third of that is a little over 4 seconds. (This goes in deciseconds)
					else
						emote("paingroan")
						adjust_stutter(5 SECONDS)
						flash_fullscreen("redflash2")
				else
					if(painpercent >= 60)
						if(prob(probby/4))
							emote("paingroan")
							adjust_stutter(3 SECONDS)
							flash_fullscreen("redflash2")

		if(painpercent >= 100)
			add_mood_event("pain", /datum/mood_event/maxpain)
		else if(painpercent >= 60)
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
		amt += (BPinteg) - (get_drunk_amount()/5) //inebriation reduces percieved pain
		if(HAS_TRAIT(src, TRAIT_LESSPAIN)) //lesspain simply reduces pain by an amount
			amt -= 10
	return amt

/mob/living/carbon/human/proc/adjust_temppain(amount)
	temporary_pain += amount

	if(temporary_pain > 100)
		temporary_pain = 100
	else if(temporary_pain < 0)
		temporary_pain = 0
