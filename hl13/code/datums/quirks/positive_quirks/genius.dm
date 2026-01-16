/datum/quirk/genius
	name = "Genius"
	desc = "You are an incredibly intelligent individual. You can craft faster, hack faster, more easily handle technology, and more. In addition, you know some rather advanced crafting recipes, available only to geniuses like you."
	icon = FA_ICON_BRAIN
	value = 14
	medical_record_text = "Patient is highly intelligent"
	gain_text = "You've gained additional weapons bench crafting, electrical bench crafting, and armor crafting knowledge."
	lose_text = "You've lost additional weapons bench crafting, electrical bench crafting, and armor crafting knowledge."

/datum/quirk/genius/add()
	quirk_holder.change_stat(STATKEY_INT, 6)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/makeshift_hazsuit)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/alyxtool_frame)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/usp_frame)

/datum/quirk/genius/remove()
	quirk_holder.change_stat(STATKEY_INT, -6)
