/datum/quirk/illiterate
	name = "Illiterate"
	desc = "You dropped out of school and are unable to read or write. This affects reading, writing, using computers and other electronics."
	icon = FA_ICON_GRADUATION_CAP
	value = -6 //hl13 edit, because most occupations dont even need to read
	mob_trait = TRAIT_ILLITERATE
	medical_record_text = "Patient is not literate."
	hardcore_value = 8
	mail_goodies = list(/obj/item/pai_card) // can read things for you
