//armor up a citizen uniform and remove the scanners
/datum/crafting_recipe/rebel_uniform
	name = "Rebel Jumpsuit"
	result = /obj/item/clothing/under/citizen/rebel
	reqs = list(/obj/item/clothing/under/citizen = 1,
				/obj/item/clothing/under/combine/civilprotection = 1)

	blacklist = list(
	/obj/item/clothing/under/citizen/rebel,
	/obj/item/clothing/under/citizen/refugee,
	)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//same as above, but use kevlar instead of a combine suit
/datum/crafting_recipe/rebel_uniform_kevlar
	name = "Rebel Jumpsuit (Kevlar)"
	result = /obj/item/clothing/under/citizen/rebel
	reqs = list(/obj/item/clothing/under/citizen = 1,
				/obj/item/stack/kevlar = 3)

	blacklist = list(
	/obj/item/clothing/under/citizen/rebel,
	/obj/item/clothing/under/citizen/refugee,
	)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//very basic armor
/datum/crafting_recipe/armored_vest
	name = "Armored Vest"
	result = /obj/item/clothing/suit/armor/armored
	reqs = list(/obj/item/stack/sheet/cloth = 5,
				/obj/item/stack/sheet/iron = 4)
	time = 8 SECONDS
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

//some good stuff
/datum/crafting_recipe/kevlar_vest
	name = "Kevlar Vest"
	result = /obj/item/clothing/suit/armor/halflife/kevlar
	reqs = list(/obj/item/stack/kevlar = 5)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//even better, at a cost
/datum/crafting_recipe/kevlar_vest_heavy
	name = "Heavy Kevlar Vest"
	result = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	reqs = list(/obj/item/stack/kevlar = 2,
				/obj/item/clothing/suit/armor/halflife/kevlar = 2)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//pretty bad, but head protection can be hard to find
/datum/crafting_recipe/handmade_helmet
	name = "Hand-made helmet"
	result = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	reqs = list(/obj/item/stack/kevlar = 1,
				/obj/item/stack/sheet/iron = 4)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//scavenging some kevlar from a vest if you dont need the vest
/datum/crafting_recipe/rip_apart_vest
	name = "Rip Apart Kevlar Vest"
	result = /obj/item/stack/kevlar
	result_amount = 2
	reqs = list(/obj/item/clothing/suit/armor/halflife/kevlar = 1)
	time = 10 SECONDS
	category = CAT_ARMOR
	tool_behaviors = list(TOOL_KNIFE)

//Strap on some extra random metal and pieces of cloth and boom, your armor is slightly better.
/datum/crafting_recipe/resistance_light_armor
	name = "Armored Rebel Vest"
	result = /obj/item/clothing/suit/armor/rebel/light
	reqs = list(/obj/item/clothing/suit/armor/civilprotection = 1,
				/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/iron = 2)
	time = 10 SECONDS
	category = CAT_ARMOR
	crafting_interface = CRAFTING_BENCH_ARMTAILOR

//my armor is a bit crabby
/datum/crafting_recipe/headcrab_helmet
	name = "Headcrab Helmet"
	result = /obj/item/clothing/head/helmet/halflife/headcrab
	reqs = list(/obj/item/food/meat/slab/xen = 1,
				/obj/item/stack/sheet/sinew = 1,
				/obj/item/stack/sheet/bone = 1,
				/obj/item/stack/sheet/animalhide/goliath_hide = 1)
	time = 10 SECONDS
	category = CAT_ARMOR

//my armor is very crabby
/datum/crafting_recipe/headcrab_armor
	name = "Fungal Plate Armor"
	result = /obj/item/clothing/suit/armor/platearmor
	reqs = list(/obj/item/stack/sheet/sinew = 3,
				/obj/item/stack/sheet/bone = 3,
				/obj/item/stack/sheet/animalhide/goliath_hide = 3)
	time = 12 SECONDS
	category = CAT_ARMOR

/datum/crafting_recipe/sinewbandana
	name = "Sinew Bandana"
	result = /obj/item/clothing/mask/bandana/sinew
	reqs = list(/obj/item/stack/sheet/sinew = 2)
	time = 6 SECONDS
	category = CAT_CLOTHING

//Stuff a jacket with extra cloth. Simple, inconspicuous, and easy. Not as protective as an armored vest though.
/datum/crafting_recipe/padded_jacket_blue
	name = "Pad Jacket (Blue)"
	result = /obj/item/clothing/suit/bluejacket/padded
	reqs = list(/obj/item/stack/sheet/cloth = 5,
				/obj/item/clothing/suit/bluejacket = 1)
	time = 12 SECONDS
	category = CAT_ARMOR

/datum/crafting_recipe/padded_jacket_green
	name = "Pad Jacket (Green)"
	result = /obj/item/clothing/suit/greenjacket/padded
	reqs = list(/obj/item/stack/sheet/cloth = 5,
				/obj/item/clothing/suit/greenjacket = 1)
	time = 12 SECONDS
	category = CAT_ARMOR
