/datum/quirk/unintelligent
	name = "Unintelligent"
	desc = "You are not a very intelligent individual. You'll find it harder to craft items, and hack/use technology, among other things."
	icon = FA_ICON_BRAIN
	value = -5
	medical_record_text = "Patient is rather unintelligent"

/datum/quirk/unintelligent/add()
	quirk_holder.change_stat(STATKEY_INT, -3)

/datum/quirk/unintelligent/remove()
	quirk_holder.change_stat(STATKEY_INT, 3)
