/datum/quirk/intelligent
	name = "Intelligent"
	desc = "You are an intelligent individual. You can craft faster, hack faster, more easily handle technology, and more."
	icon = FA_ICON_BRAIN
	value = 5
	medical_record_text = "Patient is rather intelligent"

/datum/quirk/intelligent/add()
	quirk_holder.change_stat(STATKEY_INT, 3)

/datum/quirk/intelligent/remove()
	quirk_holder.change_stat(STATKEY_INT, -3)
