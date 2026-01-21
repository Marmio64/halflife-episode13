/datum/quirk/clumsy
	name = "Clumsy"
	desc = "You're often times a very clumsy, stupid person. You may find yourself utterly screwing up many tasks that are even somewhat difficult. You also have less dexterity and intelligence than others."
	icon = FA_ICON_FACE_DIZZY
	value = -12
	mob_trait = TRAIT_CLUMSY
	gain_text = span_danger("You feel your IQ sink like your brain is liquid.")
	lose_text = span_notice("You feel like your IQ went up to at least average.")
	medical_record_text = "Patient has demonstrated an extreme difficulty with high motor skill paired with an inability to demonstrate critical thinking."

/datum/quirk/clumsy/add()
	quirk_holder.change_stat(STATKEY_DEX, -2)
	quirk_holder.change_stat(STATKEY_INT, -2)


/datum/quirk/clumsy/remove()
	quirk_holder.change_stat(STATKEY_DEX, 2)
	quirk_holder.change_stat(STATKEY_INT, 2)
