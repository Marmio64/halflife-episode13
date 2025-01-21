
/datum/quirk/stalwart
	name = "Stalwart"
	desc = "You are built tough and don't die easily."
	icon = FA_ICON_SHIELD
	value = 12
	medical_record_text = "Patient has a robust physique."
	medical_record_text = "Patient has an unnaturally robust physique."

/datum/quirk/stalwart/add()
	if(iscarbon (quirk_holder))
		var/mob/living/tough_guy = quirk_holder
		tough_guy.maxHealth *= 1.2
		tough_guy.health *= 1.2

/datum/quirk/stalwart/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/tough_guy = quirk_holder
		tough_guy.maxHealth /= 1.2
		tough_guy.health /= 1.2

