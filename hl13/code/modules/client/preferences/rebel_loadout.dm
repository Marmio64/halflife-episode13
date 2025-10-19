/// Which loadout do you want for your RP mode bunker rebel
/datum/preference/choiced/rebel_loadout
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	can_randomize = FALSE
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "prefered_rebel_loadout"

/datum/preference/choiced/rebel_loadout/init_possible_values()
	return GLOB.rebel_loadout_prefs

/datum/preference/choiced/rebel_loadout/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/rebel_loadout/create_default_value()
	return REBEL_LOADOUT_SCOUT
