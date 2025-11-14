/datum/quirk/varied
	name = "Varied"
	desc = "How you feel depends on the day. Somedays you are stronger, more intelligent, more dextrous. Other days its the opposite. It is all up to chance."
	icon = FA_ICON_DNA
	value = 0

/datum/quirk/varied/add()
	quirk_holder.roll_mob_stats()
