/// Inhand items (Moves overrided items to backpack)
/datum/loadout_category/inhands
	category_name = "Inhand"
	category_ui_icon = FA_ICON_BRIEFCASE
	type_to_generate = /datum/loadout_item/inhand
	tab_order = /datum/loadout_category/head::tab_order + 4

/datum/loadout_item/inhand
	abstract_type = /datum/loadout_item/inhand

/datum/loadout_item/inhand/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(outfit.l_hand && !outfit.r_hand)
		outfit.r_hand = item_path
	else
		if(outfit.l_hand)
			LAZYADD(outfit.backpack_contents, outfit.l_hand)
		outfit.l_hand = item_path

/datum/loadout_item/inhand/cane
	name = "Cane"
	item_path = /obj/item/cane

/datum/loadout_item/inhand/cane_white
	name = "White Cane"
	item_path = /obj/item/cane/white

/datum/loadout_item/inhand/ration
	name = "Nutripaste"
	item_path = /obj/item/food/nutripaste/small

/datum/loadout_item/inhand/water
	name = "Low Grade Breen Water"
	item_path = /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow

/datum/loadout_item/inhand/wallet
	name = "Wallet"
	item_path = /obj/item/storage/wallet

/datum/loadout_item/inhand/suitcase
	name = "Suit Case"
	item_path = /obj/item/storage/halflife/suitcase

/datum/loadout_item/inhand/key
	name = "Blank Custom Key"
	item_path = /obj/item/customblank

/datum/loadout_item/inhand/rewardvoucher
	name = "Credit Reward Voucher"
	item_path = /obj/item/stack/credit_voucher
