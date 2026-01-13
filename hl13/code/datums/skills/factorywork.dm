/**
 * How good you are with factory work
 */
/datum/skill/factorywork
	name = "Factory Working"
	title = "Factory Worker"
	desc = "How good you are with operating industrial machinery, generally for factory work."
	modifiers = list(SKILL_VALUE_MODIFIER = list(8, 5, 4, 3, 2, 1, 0)) //will be used for probability to fail

/datum/skill/factorywork/level_gained(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level == SKILL_LEVEL_MASTER) //Requires you to seal 60 containers. 40 if you start as an engineer or prisoner since they know some factorywork already.
		mind.current.change_stat(STATKEY_DEX, 1)

/datum/skill/factorywork/level_lost(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(old_level == SKILL_LEVEL_MASTER)
		mind.current.change_stat(STATKEY_DEX, -1)
