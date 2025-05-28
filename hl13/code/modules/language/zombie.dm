/datum/language/zombie
	name = "Zombie"
	desc = "A somehow communicable way of thinking between zombies and headcrabs."
	key = "w"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD | NO_STUTTER | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	space_chance = 0
	syllables = list(
		"...",
	)
	default_priority = 100
	icon_state = "zombie"

/datum/language_holder/zombie
	understood_languages = list(/datum/language/zombie = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/zombie = list(LANGUAGE_ATOM))
	blocked_languages = list(/datum/language/common = list(LANGUAGE_ATOM))
