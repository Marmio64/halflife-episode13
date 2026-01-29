
/datum/quirk/stalwart
	name = "Stalwart"
	desc = "You're physically tougher than most, and can take more punishment and pain."
	icon = FA_ICON_SHIELD
	value = 11
	medical_record_text = "Patient has an unnaturally robust physique."

/datum/quirk/stalwart/add()
	if(iscarbon (quirk_holder))
		var/mob/living/tough_guy = quirk_holder
		tough_guy.maxHealth *= 1.1
		tough_guy.health *= 1.1
	quirk_holder.change_stat(STATKEY_END, 3)

/datum/quirk/stalwart/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/tough_guy = quirk_holder
		tough_guy.maxHealth /= 1.1
		tough_guy.health /= 1.1
	quirk_holder.change_stat(STATKEY_END, -3)

