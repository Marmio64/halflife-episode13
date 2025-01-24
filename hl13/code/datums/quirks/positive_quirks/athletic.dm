/datum/quirk/athletic
	name = "Athletic"
	desc = "You're a fit person, and have managed to stay so in spite of the combine occupation. You lift weights better, are slightly more resilient to stamina damage, and can run for longer."
	icon = FA_ICON_BOLT_LIGHTNING
	value = 6
	medical_record_text = "Patient is rather athletic and energetic."

/datum/quirk/athletic/add()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/athletics, 500)
		subject.physiology.stamina_mod *= 0.9

/datum/quirk/athletic/remove()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/athletics, 500)
		subject.physiology.stamina_mod /= 0.9
