/datum/preference/numeric/rankpoints
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "rankpoints"
	savefile_identifier = PREFERENCE_CHARACTER

	minimum = 0
	maximum = 125

/datum/preference/numeric/rankpoints/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/numeric/rankpoints/create_default_value(datum/preferences/preferences)
	return 0
