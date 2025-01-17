/// Neck Slot Items (Deletes overrided items)
/datum/loadout_category/neck
	category_name = "Neck"
	category_ui_icon = FA_ICON_USER_TIE
	type_to_generate = /datum/loadout_item/neck
	tab_order = /datum/loadout_category/head::tab_order + 2

/datum/loadout_item/neck
	abstract_type = /datum/loadout_item/neck

/datum/loadout_item/neck/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(outfit.neck)
		to_chat(equipper, "Your loadout neck item was not equipped directly due to your job outfit.")
		return

	outfit.neck = item_path

/datum/loadout_item/neck/necktie
	name = "Necktie (Colorable)"
	item_path = /obj/item/clothing/neck/tie

/datum/loadout_item/neck/necktie_loose
	name = "Necktie (Loose)"
	item_path = /obj/item/clothing/neck/tie/detective
