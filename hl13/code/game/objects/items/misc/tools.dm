/obj/item/weldingtool/halflife/makeshift
	name = "makeshift welding tool"
	desc = "A makeshift welding tool that was hand made. Seems to work well enough."
	icon_state = "miniwelder"
	max_fuel = 10
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)
	icon = 'icons/obj/tools.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	toolspeed = 2 //garbage

/obj/item/weldingtool/halflife/makeshift/flamethrower_screwdriver()
	return

/obj/item/weldingtool/halflife/makeshift/empty
	starting_fuel = FALSE

/obj/item/weldingtool/halflife
	name = "welding torch"
	desc = "A useful torch for welding with."
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	icon_state = "torch"
	inhand_icon_state = "torch"
	worn_icon_state = "torch"
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	change_icons = FALSE

/obj/item/screwdriver/halflife
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	icon_state = "screwdriver"
	random_color = FALSE

/obj/item/wrench/halflife
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	icon_state = "wrench"

/obj/item/wirecutters/halflife
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	icon_state = "wirecutter"
	random_color = FALSE
