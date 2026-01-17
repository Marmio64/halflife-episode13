/// Head Slot Items (Deletes overrided items)
/datum/loadout_category/head
	category_name = "Head"
	category_ui_icon = FA_ICON_HAT_COWBOY
	type_to_generate = /datum/loadout_item/head
	tab_order = 1

/datum/loadout_item/head
	abstract_type = /datum/loadout_item/head

/datum/loadout_item/head/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(equipper.dna?.species?.outfit_important_for_life)
		if(!visuals_only)
			to_chat(equipper, "Your loadout helmet was not equipped directly due to your species outfit.")
			LAZYADD(outfit.backpack_contents, item_path)
	else
		outfit.head = item_path
