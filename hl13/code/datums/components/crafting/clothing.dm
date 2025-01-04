//armor up a citizen uniform and remove the scanners
/datum/crafting_recipe/rebel_uniform
	name = "Rebel Jumpsuit"
	result = /obj/item/clothing/under/citizen/rebel
	reqs = list(/obj/item/clothing/under/citizen = 1,
				/obj/item/clothing/under/combine/civilprotection = 1)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//very basic armor
/datum/crafting_recipe/armored_vest
	name = "Armored Vest"
	result = /obj/item/clothing/suit/armor/armored
	reqs = list(/obj/item/stack/sheet/cloth = 5,
				/obj/item/stack/sheet/iron = 4)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//very basic armor
/datum/crafting_recipe/upgrade_armored_vest
	name = "Upgrade Armored Vest"
	result = /obj/item/clothing/suit/armor/armored/upgraded
	reqs = list(/obj/item/clothing/suit/armor/armored = 1,
				/obj/item/stack/sheet/animalhide/goliath_hide = 2)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR
