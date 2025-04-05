/obj/item/cigarette/halflife
	name = "cigarette"
	desc = "A roll of tobacco and nicotine. It is not food."
	icon = 'hl13/icons/obj/smokeables/smokeables.dmi'
	//worn_icon = 'hl13/icons/obj/smokeables/smokeables_mob.dmi'
	type_butt = /obj/item/cigbutt/halflife
	list_reagents = list(/datum/reagent/drug/nicotine = 15, /datum/reagent/medicine/omnizine = 3)
	lung_harm = 0.75

/obj/item/cigbutt/halflife
	name = "cigarette butt"
	desc = "A manky old cigarette butt."
	icon = 'hl13/icons/obj/smokeables/smokeables.dmi'
	icon_state = "cigbutt"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	grind_results = list(/datum/reagent/carbon = 2)

