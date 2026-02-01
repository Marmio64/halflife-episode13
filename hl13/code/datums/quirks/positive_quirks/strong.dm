/datum/quirk/strong
	name = "Strong"
	desc = "You are of an able body. You can throw farther, parry more effectively with weapons, punch harder, and more."
	icon = FA_ICON_DUMBBELL
	value = 7
	medical_record_text = "Patient is rather strong"

/datum/quirk/strong/add()
	quirk_holder.change_stat(STATKEY_STR, 3)

/datum/quirk/strong/remove()
	quirk_holder.change_stat(STATKEY_STR, -3)
