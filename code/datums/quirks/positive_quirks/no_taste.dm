/datum/quirk/no_taste //hl13 edit, ageusia is now a minor positive quirk, since most food (rations) taste bad
	name = "Ageusia"
	desc = "You can't taste anything! Generally useful since most combine served food tends to taste horrible. Toxic food will still poison you."
	icon = FA_ICON_MEH_BLANK
	value = 3
	mob_trait = TRAIT_AGEUSIA
	gain_text = span_notice("You can't taste anything!")
	lose_text = span_notice("You can taste again!")
	medical_record_text = "Patient suffers from ageusia and is incapable of tasting food or reagents."
	mail_goodies = list(/obj/effect/spawner/random/food_or_drink/condiment) // but can you taste the salt? CAN YOU?!
