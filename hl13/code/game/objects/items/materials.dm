/obj/item/circuitmaterial
	name = "Circuit Pieces"
	desc = "A few circuits and chips for building electronics with."
	custom_price = 5
	inhand_icon_state = "electronic"
	icon = 'hl13/icons/obj/materials.dmi'
	icon_state = "scrap_electronic"
	obj_flags = CONDUCTS_ELECTRICITY
	w_class = WEIGHT_CLASS_SMALL
	grind_results = list(/datum/reagent/iron = 10, /datum/reagent/silicon = 10)

/obj/item/circuitmaterial/advanced
	name = "Advanced Circuit Chips"
	desc = "Complete circuitry boards for building advanced electronics."
	custom_price = 10
	icon_state = "chips"

/obj/item/halflife/antenna
	name = "Destabilizer Antenna"
	desc = "A smashed antenna from a destabilizer. Can be sold on the cargo shuttle, and is a useful proof for a loyalist to have for a deed well done."
	icon = 'hl13/icons/obj/materials.dmi'
	icon_state = "antenna"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/machinepiece
	icon = 'hl13/icons/obj/machines.dmi'

/obj/item/machinepiece/viscerator
	name = "Viscerator Frame"
	desc = "A framework for a Viscerator bot. You'll have to craft it into a functioning one."
	icon_state = "viscerator"
	w_class = WEIGHT_CLASS_SMALL
	//materials = list(/datum/material/iron=4000, /datum/material/glass=4000)

/obj/item/machinepiece/scanner
	name = "Scanner Frame"
	desc = "A framework for a Scanner bot. You'll have to craft it into a functioning one."
	icon_state = "cityscannerframe"
	w_class = WEIGHT_CLASS_NORMAL
	//materials = list(/datum/material/iron=12000, /datum/material/glass=4000)

/obj/item/machinepiece/multifunctiontool
	name = "Broken Multifunction Tool"
	desc = "A broken frame for a multifunction electrical tool. You may be able to craft it into a functioning one."
	icon_state = "alyxtool"

/obj/item/woodshaft
	name = "Wooden Shaft"
	desc = "A sturdy wooden shaft, generally used for making a spear."
	custom_price = 5
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "shaft"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/halflife/combine_battery
	name = "Combine Battery"
	desc = "A combine battery that can charge a suit up with power, or be used as a power cell for certain recipes."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "battery"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/halflife/combine_battery/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(istype(interacting_with, /obj/item/clothing))
		var/obj/item/clothing/suit = interacting_with
		if(suit.powered_suit)
			if(suit.suit_power < suit.max_suit_power)
				if(do_after(user, 1 SECONDS, suit))
					playsound(src, 'hl13/sound/effects/suitchargeok1.ogg', 40, FALSE)
					suit.adjust_suitpower(30)
					qdel(src)
					return ITEM_INTERACT_SUCCESS
		else
			to_chat(user, span_notice("This piece of clothing cannot be charged with this."))
	if(istype(interacting_with, /obj/item/melee/baton/security))
		var/obj/item/melee/baton/security/baton = interacting_with
		if(baton.cell)
			if(do_after(user, 1 SECONDS, baton))
				playsound(src, 'hl13/sound/effects/suitchargeok1.ogg', 40, FALSE)
				baton.cell.give(50000) //half of a standard baton cell
				qdel(src)
				return ITEM_INTERACT_SUCCESS
	return NONE
