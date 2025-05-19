// Xen soup
/datum/reagent/consumable/nutriment/soup/headcrab_jambalaya
	name = "Headcrab Jambalaya"
	description = "A thick stew made with headcrab stewed in a spicy broth with nutritious antlion grub juices."
	data = list("headcrab" = 1, "spice" = 1, "vortigaunt sauce" = 1)
	color = "#375f3f"

/datum/glass_style/has_foodtype/soup/headcrab_jambalaya
	required_drink_type = /datum/reagent/consumable/nutriment/soup/headcrab_jambalaya
	drink_type = VEGETABLES | MEAT

/datum/chemical_reaction/food/soup/headcrab_jambalaya
	required_reagents = list(/datum/reagent/water = 50, /datum/reagent/consumable/blackpepper = 10)
	required_ingredients = list(
		/obj/item/food/meat/cutlet/xen = 6,
		/obj/item/reagent_containers/pill/patch/grubnugget = 1,
		/obj/item/food/xen/xenbranch = 1,
	)
	results = list(
		/datum/reagent/consumable/nutriment/soup/headcrab_jambalaya = 60,
	)
