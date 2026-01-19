//real hungry
/datum/quirk/underweight
	name = "Underweight"
	desc = "You are very underweight and malnourished. You'll be near starving to death at the beginning of your shift, but you'll at least be able to gain back your pounds assuming you eat enough."
	icon = FA_ICON_PLANT_WILT
	value = -2

/datum/quirk/underweight/add()
	if(iscarbon (quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.set_nutrition(NUTRITION_LEVEL_STARVING)

/datum/quirk/underweight/remove()
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/human/human = quirk_holder
		human.set_nutrition(NUTRITION_LEVEL_FED)
