/datum/preference/numeric/longtermaccount
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "longtermaccount"
	savefile_identifier = PREFERENCE_CHARACTER

	minimum = 0
	maximum = 255

/datum/preference/numeric/longtermaccount/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/numeric/longtermaccount/create_default_value(datum/preferences/preferences)
	return 0
