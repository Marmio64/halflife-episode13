/datum/crafting_recipe/customkey
	name = "Custom Key"
	result = /obj/item/customblank
	reqs = list(/obj/item/stack/sheet/iron = 5)
	time = 8 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/customlock
	name = "Custom Lock"
	result = /obj/item/customlock
	reqs = list(/obj/item/stack/sheet/iron = 5)
	time = 8 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/medkit
	name = "Medkit"
	result = /obj/item/reagent_containers/pill/patch/medkit/manufactured
	reqs = list(/obj/item/stack/sheet/iron = 1, /datum/reagent/medicine/biogel = 25)
	time = 2 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/makeshiftbandage
	name = "Makeshift Bandage"
	reqs = list(
		/obj/item/stack/sheet/cloth = 3,
	)
	result = /obj/item/stack/medical/bandage/makeshift
	category = CAT_TOOLS

/datum/crafting_recipe/makeshiftweldingtool
	name = "Makeshift Welding Tool"
	result = /obj/item/weldingtool/halflife/makeshift/empty
	reqs = list(/obj/item/stack/sheet/iron = 3, /obj/item/lighter = 1)
	time = 6 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL

/datum/crafting_recipe/lockpick
	name = "Makeshift Lockpick"
	result = /obj/item/lockpick/makeshift
	reqs = list(/obj/item/stack/sheet/scrap_metal = 4)
	time = 8 SECONDS
	category = CAT_MISC
	crafting_interface = CRAFTING_BENCH_GENERAL
