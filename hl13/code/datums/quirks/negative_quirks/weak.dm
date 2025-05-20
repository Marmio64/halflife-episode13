/datum/quirk/weak
	name = "Weak"
	desc = "You have a weak and frail body. Parrying with weapons is more difficult, and pain more easily immobilizes you."
	icon = FA_ICON_DUMBBELL
	value = -6
	medical_record_text = "Patient is rather weak"

/datum/quirk/weak/add()
	quirk_holder.change_stat(STATKEY_STR, -3)

/datum/quirk/weak/remove()
	quirk_holder.change_stat(STATKEY_STR, 3)
