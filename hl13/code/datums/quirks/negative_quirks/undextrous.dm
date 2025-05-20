/datum/quirk/undextrous
	name = "Undextrous"
	desc = "You are are clumsy with hands and feet. Dodging is more difficult, you can't run as long, and can't aim as well."
	icon = FA_ICON_HANDS
	value = -6
	medical_record_text = "Patient is rather undextrous"

/datum/quirk/undextrous/add()
	quirk_holder.change_stat(STATKEY_DEX, -3)

/datum/quirk/undextrous/remove()
	quirk_holder.change_stat(STATKEY_DEX, 3)
