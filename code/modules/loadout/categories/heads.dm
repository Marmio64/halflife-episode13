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

/datum/loadout_item/head/beanie
	name = "Beanie (Colorable)"
	item_path = /obj/item/clothing/head/beanie

/datum/loadout_item/head/beret
	name = "Beret (Colorable)"
	item_path = /obj/item/clothing/head/beret

/datum/loadout_item/head/black_cap
	name = "Cap (Black)"
	item_path = /obj/item/clothing/head/soft/black

/datum/loadout_item/head/blue_cap
	name = "Cap (Blue)"
	item_path = /obj/item/clothing/head/soft/blue

/datum/loadout_item/head/flatcap
	name = "Cap (Flat)"
	item_path = /obj/item/clothing/head/flatcap
