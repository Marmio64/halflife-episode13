/datum/quirk/undextrous
	name = "Undextrous"
	desc = "You are clumsy with hands and feet. Dodging is more difficult, you can't run as long, can't aim as well, and more."
	icon = FA_ICON_HANDS
	value = -7
	medical_record_text = "Patient is rather undextrous"

/datum/quirk/undextrous/add()
	quirk_holder.change_stat(STATKEY_DEX, -3)

/datum/quirk/undextrous/remove()
	quirk_holder.change_stat(STATKEY_DEX, 3)
