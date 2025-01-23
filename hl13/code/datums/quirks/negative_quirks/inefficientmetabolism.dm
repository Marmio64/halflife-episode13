
/datum/quirk/inefficientmetabolism
	name = "Inefficient Metabolism"
	desc = "Your natural metabolism does not process liquids and foods efficiently, requiring you to eat and drink more to survive."
	icon = FA_ICON_PLATE_WHEAT
	value = -4
	medical_record_text = "Patient has a inefficient metabolism."

/datum/quirk/inefficientmetabolism/add()
	if(iscarbon (quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.physiology.hunger_mod *= 1.25

/datum/quirk/inefficientmetabolism/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.physiology.hunger_mod /= 1.25
