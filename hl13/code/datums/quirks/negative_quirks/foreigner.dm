/datum/quirk/foreigner
	name = "American Transfer"
	desc = "You come from the far away united states, and do not know a lick of polish."
	icon = FA_ICON_LANGUAGE
	value = -3
	gain_text = span_notice("The words being spoken around you don't make any sense.")
	lose_text = span_notice("You've developed fluency in Polish.")
	medical_record_text = "Patient does not speak Polish and may require an interpreter."
	mail_goodies = list(/obj/item/taperecorder) // for translation

/datum/quirk/foreigner/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.add_blocked_language(/datum/language/common)
	human_holder.grant_language(/datum/language/uncommon, source = LANGUAGE_QUIRK)

/datum/quirk/foreigner/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.remove_blocked_language(/datum/language/common)
	human_holder.remove_language(/datum/language/uncommon)

/datum/quirk/russian_foreigner
	name = "Russian Transfer"
	desc = "You come from far away Russia, and do not know a lick of polish."
	icon = FA_ICON_LANGUAGE
	value = -3
	gain_text = span_notice("The words being spoken around you don't make any sense.")
	lose_text = span_notice("You've developed fluency in Polish.")
	medical_record_text = "Patient does not speak Polish and may require an interpreter."
	mail_goodies = list(/obj/item/taperecorder) // for translation

/datum/quirk/russian_foreigner/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.add_blocked_language(/datum/language/common)
	human_holder.grant_language(/datum/language/russian, source = LANGUAGE_QUIRK)

/datum/quirk/russian_foreigner/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.remove_blocked_language(/datum/language/common)
	human_holder.remove_language(/datum/language/russian)
