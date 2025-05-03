/datum/quirk/scavenger
	name = "Scavenger"
	desc = "You've been scrounging around places long before the combine came and took over, and are pretty good at unearthing hidden treasures from trash."
	icon = FA_ICON_TRASH
	value = 4
	medical_record_text = "Patient is an adept scavenger."

/datum/quirk/scavenger/add()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/scavenging, 900)

/datum/quirk/scavenger/remove()
	if(ishuman(quirk_holder))
		var/mob/living/carbon/human/subject = quirk_holder
		subject.mind?.adjust_experience(/datum/skill/scavenging, 900)
