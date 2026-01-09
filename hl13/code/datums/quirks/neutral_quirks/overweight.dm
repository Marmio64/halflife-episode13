//being fat decreases mood, mobility, and dex, but you get a point of strength and don't have to worry about food
/datum/quirk/overweight
	name = "Overweight"
	desc = "You are very overweight (must've been stealing everyone's rations). You'll feel bad about this, move slow, and have lower dexterity until you drop some pounds, but at the least you won't have to worry about food for a long time."
	icon = FA_ICON_PLATE_WHEAT
	value = 0

/datum/quirk/overweight/add()
	if(iscarbon (quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.set_nutrition(NUTRITION_LEVEL_FAT * 2)
		human.overeatduration = 195 SECONDS

/datum/quirk/overweight/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.set_nutrition(NUTRITION_LEVEL_FED)
