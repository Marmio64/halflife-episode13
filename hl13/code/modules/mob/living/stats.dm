#define UPDATE_STRENGTH(...) STASTR = clamp(base_strength + modified_strength, 1, 20)
#define UPDATE_INTELLIGENCE(...) STAINT = clamp(base_intelligence + modified_intelligence, 1, 20)
#define UPDATE_DEXTERITY(...) STADEX = clamp(base_dexterity + modified_dexterity, 1, 20)

/mob/living
	/* Base stat values */
	var/base_strength = 10
	var/base_intelligence = 10
	var/base_dexterity = 10

	/* Cached modifier values, calculated when needed */
	VAR_PRIVATE/final/modified_strength
	VAR_PRIVATE/final/modified_intelligence
	VAR_PRIVATE/final/modified_dexterity
	/// Lazy-list of stat modifiers keyed with sources.
	var/list/stat_modifiers = null

	/* Calculated stat values, these are what you want to use. */
	var/final/STASTR = 10
	var/final/STAINT = 10
	var/final/STADEX = 10

	var/has_rolled_for_stats = FALSE

	var/zoomed = FALSE

	/// Current combat deployment faction of this very mob
	var/deployment_faction = NO_FACTION

///Rolls random stats base 10, +-1, and applies age stats.
/mob/living/proc/roll_mob_stats()
	if(has_rolled_for_stats)
		return FALSE

	base_strength += (prob(33) && pick(-1, 1))
	base_intelligence += (prob(33) && pick(-1, 1))
	base_dexterity += (prob(33) && pick(-1, 1))

	if(ishuman(src))
		var/mob/living/carbon/human/H = src

		switch(H.age)
			if(0 to 25)
				set_stat_modifier("innate_age", STATKEY_STR, -1)
				set_stat_modifier("innate_age", STATKEY_INT, -1)
				set_stat_modifier("innate_age", STATKEY_DEX, 2)
			// nothing for adults
			if(51 to 100)
				set_stat_modifier("innate_age", STATKEY_STR, -1)
				set_stat_modifier("innate_age", STATKEY_INT, 2)
				set_stat_modifier("innate_age", STATKEY_DEX, -1)

	has_rolled_for_stats = TRUE
	return TRUE

/mob/living/proc/set_stat_modifier(source, stat_key, amount)
	if(!source || !(stat_key in MOBSTATS) || !isnum(amount))
		return

	var/list/source_list = LAZYACCESS(stat_modifiers, source)

	if(LAZYACCESS(source_list, stat_key) != amount)
		if(!amount)
			LAZYREMOVE(source_list, stat_key)
		else
			LAZYSET(source_list, stat_key, amount)

		if(!LAZYLEN(source_list))
			LAZYREMOVE(source_list, stat_key)
		else
			LAZYSET(stat_modifiers, source, source_list)

		var/new_total = 0
		for(var/existing_sources in stat_modifiers)
			new_total += LAZYACCESS(stat_modifiers[existing_sources], stat_key)

		switch(stat_key) //I am sorry for this
			if(STATKEY_STR)
				modified_strength = new_total
				UPDATE_STRENGTH()
			if(STATKEY_INT)
				modified_intelligence = new_total
				UPDATE_INTELLIGENCE()
			if(STATKEY_DEX)
				modified_dexterity = new_total
				UPDATE_DEXTERITY()

/mob/living/proc/adjust_stat_modifier(source, stat_key, amount)
	if(!source || !(stat_key in MOBSTATS) || !amount)
		return

	var/list/source_list = LAZYACCESS(stat_modifiers, source)
	LAZYADDASSOC(source_list, stat_key, amount)
	LAZYSET(stat_modifiers, source, source_list)

	var/new_total = 0
	for(var/existing_sources in stat_modifiers)
		new_total += LAZYACCESS(stat_modifiers[existing_sources], stat_key)

	switch(stat_key) //I am sorry for this
		if(STATKEY_STR)
			modified_strength = new_total
			UPDATE_STRENGTH()
		if(STATKEY_INT)
			modified_intelligence = new_total
			UPDATE_INTELLIGENCE()
		if(STATKEY_DEX)
			modified_dexterity = new_total
			UPDATE_DEXTERITY()

/mob/living/proc/remove_stat_modifier(source)
	if(!source)
		return

	var/list/old_modifications = LAZYACCESS(stat_modifiers, source)
	LAZYREMOVE(stat_modifiers, source)

	for(var/stat_key in old_modifications)
		var/adjustment = old_modifications[stat_key]

		switch(stat_key) //I am sorry for this
			if(STATKEY_STR)
				modified_strength -= adjustment
				UPDATE_STRENGTH()
			if(STATKEY_INT)
				modified_intelligence -= adjustment
				UPDATE_INTELLIGENCE()
			if(STATKEY_DEX)
				modified_dexterity -= adjustment
				UPDATE_DEXTERITY()

///Returns the mob's stats in an associated list
/mob/living/proc/get_all_stats() as /list
	RETURN_TYPE(/list)

	return list(
		(STATKEY_STR) = STASTR,
		(STATKEY_INT) = STAINT,
		(STATKEY_DEX) = STADEX,
	)

///Returns: the difference in value between the opponents stat key and ours.
///EG: Our endurace - opp endurance.
/mob/living/proc/stat_difference_to(mob/living/opponent,stat_key)
	if(!opponent || !stat_key)
		return
	switch(stat_key)
		if(STATKEY_STR)
			return STASTR - opponent.STASTR
		if(STATKEY_INT)
			return STAINT - opponent.STAINT
		if(STATKEY_DEX)
			return STADEX - opponent.STADEX
	return
///Returns: Difference betwen our_stat and opponents opp_stat.
///EG: Our STR - opp CON
/mob/living/proc/stat_fight(mob/living/opponent, opp_stat_key, our_stat_key)
	if(!opponent || !opp_stat_key || !our_stat_key)
		return
	var/opponent_stat
	var/our_stat
	switch(opp_stat_key)
		if(STATKEY_STR)
			opponent_stat = opponent.STASTR
		if(STATKEY_INT)
			opponent_stat = opponent.STAINT
		if(STATKEY_DEX)
			opponent_stat = opponent.STADEX
	switch(our_stat_key)
		if(STATKEY_STR)
			our_stat = STASTR
		if(STATKEY_INT)
			our_stat = STAINT
		if(STATKEY_DEX)
			our_stat = STADEX
	return our_stat - opponent_stat

///Effectively rolls a d20, with each point in the stat being a chance_per_point% chance to succeed per point in the stat. If no stat is provided, just returns 0.
///dee_cee is a difficulty mod, a positive value makes the check harder, a negative value makes it easier.
///invert_dc changes it from stat - dc to dc - stat, for inverted checks.
///EG: A person with 10 luck and a dc of -10 effectively has a 100% chance of success. Or an inverted DC with 10 means 0% chance of success.
/mob/living/proc/stat_roll(stat_key,chance_per_point = 5, dee_cee = null, invert_dc = FALSE)
	if(!stat_key)
		return FALSE
	var/tocheck
	switch(stat_key)
		if(STATKEY_STR)
			tocheck = STASTR
		if(STATKEY_INT)
			tocheck = STAINT
		if(STATKEY_DEX)
			tocheck = STADEX
	if(invert_dc)
		return isnull(dee_cee) ? prob(tocheck * chance_per_point) : prob(clamp((dee_cee - tocheck) * chance_per_point,0,100))
	else
		return isnull(dee_cee) ? prob(tocheck * chance_per_point) : prob(clamp((tocheck - dee_cee) * chance_per_point,0,100))

/mob/living/proc/get_stat_level(stat_key)
	switch(stat_key)
		if(STATKEY_STR)
			return STASTR
		if(STATKEY_INT)
			return STAINT
		if(STATKEY_DEX)
			return STADEX

#define LEGACY_SOURCE "do not fucking edit or remove this admins i swear to god"

/// ~~Adjusts stat values of mobs. set_stat == true to set directly.~~
/mob/living/proc/change_stat(stat_key, adjust_amount)
	//! DEPRECATED PROC
	if(!stat_key || !adjust_amount)
		return

	adjust_stat_modifier(LEGACY_SOURCE, stat_key, adjust_amount)

#undef LEGACY_SOURCE

/// Recalculates all of a mob's stats and stat modifiers. Don't use this more than you **need** to.
/mob/living/proc/recalculate_stats(including_modifiers = TRUE)
	if(including_modifiers)
		// we discard all of our mods and compile them again
		modified_strength = 0
		modified_intelligence = 0
		modified_dexterity = 0

		for(var/source in stat_modifiers)
			var/sourced_modifiers = LAZYACCESS(stat_modifiers, source)
			for(var/stat_key in sourced_modifiers)
				var/adjustment = LAZYACCESS(sourced_modifiers, stat_key)
				switch(stat_key) //I am sorry for this
					if(STATKEY_STR)
						modified_strength += adjustment
					if(STATKEY_INT)
						modified_intelligence += adjustment
					if(STATKEY_DEX)
						modified_dexterity += adjustment

	UPDATE_STRENGTH()
	UPDATE_INTELLIGENCE()
	UPDATE_DEXTERITY()

/mob/living/proc/stat_to_description(statinput = 10)
	if(18 < statinput)
		return "Extraordinary"

	else if(15 < statinput)
		return "Amazing"

	else if(13 < statinput)
		return "Exceptional"

	else if(11 < statinput)
		return "Honed"

	else if(10 < statinput)
		return "Higher than Average"

	else if(10 == statinput)
		return "Average"

	else if(8 < statinput)
		return "Lower than Average"

	else if(7 < statinput)
		return "Dwindled"

	else if(5 < statinput)
		return "Very Poor"

	else if(3 < statinput)
		return "Terrible"

	else if(-INFINITY < statinput)
		return "Non-existant"

	else
		return "Unknown"

/mob/living/verb/check_stats()
	set name = "Check Stats"
	set category = "IC"

	var/strength = get_stat_level(STATKEY_STR)
	var/intelligence = get_stat_level(STATKEY_INT)
	var/dexterity = get_stat_level(STATKEY_DEX)

	to_chat(src, span_notice("*-----------------------------------------------"))
	to_chat(src, span_notice("Your Strength is [stat_to_description(strength)]."))
	to_chat(src, span_notice("Your Intelligence is [stat_to_description(intelligence)]"))
	to_chat(src, span_notice("Your Dexterity is [stat_to_description(dexterity)]"))
	to_chat(src, span_notice("-----------------------------------------------*"))


#undef UPDATE_STRENGTH
#undef UPDATE_INTELLIGENCE
#undef UPDATE_DEXTERITY
