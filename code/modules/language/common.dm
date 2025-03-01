// 'basic' language; spoken by default.
/datum/language/common
	name = "Polish"
	desc = "The common spoken tongue."
	key = "0"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100

	space_chance = 100

	icon_state = "galcom"
	// Default namelist is the human namelist, and common is the human language, so might as well.
	// Feel free to remove this at some point because common can generate some pretty cool names.
	always_use_default_namelist = TRUE
	/**
	 * HL13 EDIT, THIS IS POLISH NOW, KURWA!!!
	 */
	syllables = list(
		"tydzień", "dzień", "gdzie", "jest", "kosztuje", "dwie", "kawy", "na", "drzwi", "pieniądze", "książka", "mówisz", "zadzwoń",
		"jesteś", "zdrowie", "kurwa", "cię", "poznać", "przepraszam", "dobranoc", "dziękuję", "proszę", "poprawiona", "masz",
		"powinien", "już", "wyśmiać", "dobrym", "twórcy", "najpierw", "umiejętności", "świetny", "więcej", "rozproszonych",
		"tak", "nie", "oczywiście", "bardzo", "rozumiem", "smacznego", "warzywo", "cześć", "zgadzam", "pomoc", "trzcinie",
	)
