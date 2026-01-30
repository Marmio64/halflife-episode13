/datum/skill/athletics
	name = "Athletics"
	title = "Athlete"
	desc = "How athletic I am can help me run for longer durations, do acrobatic tasks quicker, and also increase my strength at high levels."
	// The skill value modifier effects the max duration that is possible for /datum/status_effect/exercised; The rands modifier determines block probability and crit probability while boxing against boxers
	modifiers = list(
		SKILL_VALUE_MODIFIER = list(
			1.5 MINUTES,
			2 MINUTES,
			2.5 MINUTES,
			3 MINUTES,
			3.5 MINUTES,
			4 MINUTES,
			5 MINUTES
		),
		SKILL_RANDS_MODIFIER = list(
			0,
			5,
			10,
			15,
			20,
			30,
			50
		)
	)

	skill_item_path = /obj/item/clothing/gloves/boxing/golden

/datum/skill/athletics/New()
	. = ..()
	levelUpMessages[SKILL_LEVEL_NOVICE] = span_nicegreen("I am just getting started on my [name] journey! I think I should be able to identify other people who are working to improve their body by sight.")
	levelUpMessages[SKILL_LEVEL_EXPERT] = span_nicegreen("I feel my body getting stronger and more resilient.")
	levelUpMessages[SKILL_LEVEL_MASTER] = span_nicegreen("I feel my body getting stronger and more resilient.")
	levelUpMessages[SKILL_LEVEL_LEGENDARY] = span_nicegreen("I feel my body getting stronger and more resilient.")

/datum/skill/athletics/level_gained(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level >= SKILL_LEVEL_NOVICE && old_level < SKILL_LEVEL_NOVICE)
		ADD_TRAIT(mind, TRAIT_EXAMINE_FITNESS, SKILL_TRAIT)
	if(new_level >= SKILL_LEVEL_EXPERT) //each level up starting at expert increase strength and endurance by 1 point. That means you can get up to +3 Strength and Endurance at Legendary athletics.
		mind.current.change_stat(STATKEY_STR, 1)
		mind.current.change_stat(STATKEY_END, 1)

/datum/skill/athletics/level_lost(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(old_level >= SKILL_LEVEL_NOVICE && new_level < SKILL_LEVEL_NOVICE)
		REMOVE_TRAIT(mind, TRAIT_EXAMINE_FITNESS, SKILL_TRAIT)
	if(old_level >= SKILL_LEVEL_EXPERT)
		mind.current.change_stat(STATKEY_STR, -1)
		mind.current.change_stat(STATKEY_END, -1)
