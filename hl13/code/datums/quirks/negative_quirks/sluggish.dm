/datum/quirk/sluggish
	name = "Sluggish"
	desc = "You have trouble recovering your stamina, making you have to wait longer until it begins to regenerate after running or being hit by certain things like stun batons."
	icon = FA_ICON_LUNGS
	value = -6
	medical_record_text = "Patient has a sluggish demeanor, and low energy."

/datum/quirk/sluggish/add()
	if(iscarbon (quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.stamina_regen_time *= 1.5

/datum/quirk/sluggish/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.stamina_regen_time /= 1.5
