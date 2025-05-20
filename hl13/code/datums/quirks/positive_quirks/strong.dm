/datum/quirk/strong
	name = "Strong"
	desc = "You are of an able body. You can shrug off pain more easily and parry more effectively with weapons."
	icon = FA_ICON_DUMBBELL
	value = 6
	medical_record_text = "Patient is rather strong"

/datum/quirk/strong/add()
	quirk_holder.change_stat(STATKEY_STR, 3)

/datum/quirk/strong/remove()
	quirk_holder.change_stat(STATKEY_STR, -3)
