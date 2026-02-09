/datum/skill/mining
	name = "Mining"
	title = "Miner"
	desc = "There is more to mining than merely hitting stone."
	modifiers = list(SKILL_SPEED_MODIFIER = list(1, 0.95, 0.9, 0.85, 0.75, 0.6, 0.5),SKILL_PROBS_MODIFIER=list(10, 15, 20, 25, 30, 35, 40))

/datum/skill/mining/level_gained(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level == SKILL_LEVEL_MASTER)
		mind.current.change_stat(STATKEY_STR, 1)

/datum/skill/mining/level_lost(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(old_level == SKILL_LEVEL_MASTER)
		mind.current.change_stat(STATKEY_STR, -1)
