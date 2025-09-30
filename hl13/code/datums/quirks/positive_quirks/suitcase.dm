
/datum/quirk/item_quirk/suitcase
	name = "Suitcase and Wallet"
	desc = "You have your old suitcase, wallet, and a bit of cash from your prior transfer. Useful for carrying extra things around."
	icon = FA_ICON_SUITCASE
	value = 3

/datum/quirk/item_quirk/suitcase/add_unique(client/client_source)
	var/obj/item/storage/halflife/suitcase/wallet_filled/case = new
	give_item_to_holder(case, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK, LOCATION_HANDS = ITEM_SLOT_HANDS))

/obj/item/storage/halflife/suitcase/wallet_filled/PopulateContents()
	new /obj/item/storage/wallet(src)
	new /obj/item/stack/spacecash/c10(src)
	..()
