
/datum/quirk/brainproblems
	name = "Brain Damage"
	desc = "You have longterm brain damage that has brought on a random form of trauma onto you, alongside making you less intelligent. There is no cure for your brain damage."
	icon = FA_ICON_BRAIN
	value = -14
	gain_text = span_danger("You feel smooth.")
	lose_text = span_notice("You feel wrinkled again.")
	medical_record_text = "Patient has severe past brain trauma."
	hardcore_value = 14

/datum/quirk/brainproblems/add()
	var/mob/living/carbon/human/H = quirk_holder

	H.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_ABSOLUTE)

	H.change_stat(STATKEY_INT, -4)

/datum/quirk/brainproblems/remove()
	quirk_holder.change_stat(STATKEY_INT, 4)
