/datum/quirk/eagle_eyed
	name = "Eagle Eyed"
	desc = "You are a perceptive individual with great vision. You can alt right click to look much further in a direction after a short delay, alongside having better aim with firearms."
	icon = FA_ICON_ARROWS_TO_EYE
	value = 7
	gain_text = "Your sight feels incredible."
	lose_text = "Your sight feels normal again"

/datum/quirk/eagle_eyed/add()
	quirk_holder.change_stat(STATKEY_PER, 3)

/datum/quirk/eagle_eyed/remove()
	quirk_holder.change_stat(STATKEY_PER, -3)
