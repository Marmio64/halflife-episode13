/datum/crafting_recipe/skeleton_key
	name = "Skeleton Key"
	time = 3 SECONDS
	reqs = list(/obj/item/stack/sheet/bone = 5)
	result = /obj/item/skeleton_key
	category = CAT_MISC
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/clipboard
	name = "Clipboard"
	result = /obj/item/clipboard
	time = 3 SECONDS
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 1,
		/obj/item/stack/rods = 1,
	)
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_MISC

/datum/crafting_recipe/cardboard_id
	name = "Cardboard ID Card"
	tool_behaviors = list(TOOL_WIRECUTTER)
	result = /obj/item/card/cardboard
	time = 4 SECONDS
	reqs = list(
		/obj/item/stack/sheet/cardboard = 1,
	)
	category = CAT_MISC
