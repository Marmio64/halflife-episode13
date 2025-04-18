/datum/language/vortigese
	name = "Vortigese"
	desc = "A strange language, only understood and spoken by vortigaunts."
	key = "v"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD | NO_STUTTER
	space_chance = 100
	syllables = list(
		"Cher", "Ala", "Gung", "Gher", "Glit", "Lung", "Chela",
		"Chur", "Galunga", "Ter", "H'ler", "Gaullll...", "Laaaung...", "Gaaaluuung...",
	)
	default_priority = 70
	icon_state = "vortigese"

/datum/language/vortigese/get_random_name(
	gender = NEUTER,
	name_count = 2,
	syllable_min = 2,
	syllable_max = 4,
	force_use_syllables = FALSE,
)
	return "vortigaunt ([rand(1, 999)])"
