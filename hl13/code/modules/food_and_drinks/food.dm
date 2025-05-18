/obj/item/food/meat/slab/xen
	name = "xen flesh"
	desc = "A slab of alien flesh. May not be entirely safe to eat."
	icon_state = "xenomeat"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/toxin = 1)
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = RAW | MEAT | GROSS | XEN
	jerky_type = /obj/item/food/sosjerky/healthy/xenian

/obj/item/food/meat/slab/xen/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/xen, rand(40 SECONDS, 70 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/xen/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/xen, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut")

/obj/item/food/sosjerky/healthy/xenian
	name = "homemade xen jerky"
	desc = "Homemade xen jerky made from most likely the finest headcrabs."
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3, //little less than steak, but tastes pretty good
	)
	junkiness = 0

/obj/item/food/meat/steak/xen
	name = "xen steak"
	desc = "Cooked alien flesh. Should be safe to eat, although still unappetizing."
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = MEAT | GROSS | XEN

/obj/item/food/meat/rawcutlet/xen
	name = "raw xen cutlet"
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = RAW | MEAT | GROSS | XEN

/obj/item/food/meat/rawcutlet/xen/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/xen, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/cutlet/xen
	name = "xen cutlet"
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = MEAT | GROSS | XEN

/obj/item/food/meat/slab/halflife/zombie
	name = "meat (rotten)"
	icon_state = "rottenmeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/raw = 4, //raw nutriment is always going to be dangerous no matter what
		/datum/reagent/toxin/bad_food = 4,
	)
	desc = "Meat sliced from the flesh of a dead zombie. Are you seriously considering eating this?"
	tastes = list("maggots" = 1, "meat" = 1)
	foodtypes = RAW | MEAT | TOXIC | GORE | GROSS

	jerky_type = /obj/item/food/sosjerky/healthy/zombie

/obj/item/food/sosjerky/healthy/zombie
	name = "homemade zombie jerky"
	desc = "Dried from already rotting flesh. You may want to seriously reconsider eating this."
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/raw = 2,
		/datum/reagent/toxin/bad_food = 4,
	)
	foodtypes = MEAT | TOXIC | GORE | GROSS

/obj/item/food/meat/slab/halflife/zombie/make_grillable()
	return //no grilling. No possible way you want to ever eat this.

/obj/item/food/meat/slab/halflife/zombie/make_processable()
	return //no cutlets
