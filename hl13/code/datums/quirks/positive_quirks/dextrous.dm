/datum/quirk/dextrous
	name = "Dextrous"
	desc = "You are deft with your hands and feet. You can dodge more easily, run for longer, aim firearms more effectively, and more."
	icon = FA_ICON_HANDS
	value = 7
	medical_record_text = "Patient is rather dextrous"

/datum/quirk/dextrous/add()
	quirk_holder.change_stat(STATKEY_DEX, 3)

/datum/quirk/dextrous/remove()
	quirk_holder.change_stat(STATKEY_DEX, -3)
