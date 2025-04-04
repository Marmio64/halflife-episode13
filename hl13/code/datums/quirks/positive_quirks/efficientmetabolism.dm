/datum/quirk/efficientmetabolism
	name = "Efficient Metabolism"
	desc = "Your natural metabolism processes liquids and foods more efficiently, requiring you to eat and drink less to survive."
	icon = FA_ICON_PLATE_WHEAT
	value = 4
	medical_record_text = "Patient has a efficient metabolism."

/datum/quirk/efficientmetabolism/add()
	if(iscarbon (quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.physiology.hunger_mod *= 0.8

/datum/quirk/efficientmetabolism/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.physiology.hunger_mod /= 0.8
