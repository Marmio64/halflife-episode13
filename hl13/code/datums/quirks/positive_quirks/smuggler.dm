
/datum/quirk/item_quirk/smuggler
	name = "Smuggler"
	desc = "You've managed to sneak a few pieces of random items (which may include contraband) within an allowed suitcase, alongside a pouch. You'll probably want to make sure nobody finds out."
	icon = FA_ICON_SUITCASE
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_HIDE_FROM_SCAN
	value = 4

/datum/quirk/item_quirk/smuggler/add_unique(client/client_source)
	var/obj/item/storage/halflife/suitcase/smuggler/case = new
	give_item_to_holder(case, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK, LOCATION_HANDS = ITEM_SLOT_HANDS))

/obj/item/storage/halflife/suitcase/smuggler/PopulateContents()
	new /obj/item/storage/belt/pouch(src)
	new /obj/effect/spawner/random/halflife/loot(src)
	new /obj/effect/spawner/random/halflife/loot(src)
	new /obj/effect/spawner/random/halflife/loot(src)
	..()
