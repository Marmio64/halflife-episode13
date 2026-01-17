/// Glasses Slot Items (Moves overrided items to backpack)
/datum/loadout_category/glasses
	category_name = "Glasses"
	category_ui_icon = FA_ICON_GLASSES
	type_to_generate = /datum/loadout_item/glasses
	tab_order = /datum/loadout_category/head::tab_order + 1

/datum/loadout_item/glasses
	abstract_type = /datum/loadout_item/glasses

/datum/loadout_item/glasses/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(outfit.glasses)
		LAZYADD(outfit.backpack_contents, outfit.glasses)
	outfit.glasses = item_path

/datum/loadout_item/glasses/prescription_glasses
	name = "Glasses"
	item_path = /obj/item/clothing/glasses/regular
	additional_displayed_text = list("Prescription")

/datum/loadout_item/glasses/black_blindfold
	name = "Black Blindfold"
	item_path = /obj/item/clothing/glasses/blindfold

/datum/loadout_item/glasses/eyepatch
	name = "Eyepatch"
	item_path = /obj/item/clothing/glasses/eyepatch
