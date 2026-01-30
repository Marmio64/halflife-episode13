/datum/quirk/athletic
	name = "Athletic"
	desc = "You're a fit person, and have managed to stay so in spite of the combine occupation. You lift weights better, get a headstart on better stats through working out, and can run for longer."
	icon = FA_ICON_BOLT_LIGHTNING
	value = 6
	medical_record_text = "Patient is rather athletic and energetic."

/datum/quirk/athletic/add()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/athletics, 750)

/datum/quirk/athletic/remove()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/athletics, 750)
