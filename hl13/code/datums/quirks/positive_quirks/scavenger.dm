/datum/quirk/scavenger
	name = "Scavenger"
	desc = "You've been scrounging around places long before the combine came and took over, and are pretty good at unearthing hidden treasures from trash."
	icon = FA_ICON_TRASH
	value = 4
	medical_record_text = "Patient is an adept scavenger."

/datum/quirk/athletic/add()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/scavenging, 750)

/datum/quirk/athletic/remove()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/scavenging, 750)
