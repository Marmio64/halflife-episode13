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

/obj/item/extinguisher/halflife
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'

/obj/item/climbing_hook/halflife/makeshift
	name = "makeshift climbing hook"
	desc = "A cheap makeshift climbing hook formed out of scrap and cloth. It's unlikely to withstand more than a couple uses."
	uses = 2
	climb_time = 4 SECONDS

//Comparable to a tire iron as a weapon, though has 2 less weapon defense and 1 less damage in exchange for being small enough to fit in your pocket. Also, can do crowbar stuff too.
/obj/item/crowbar/halflife_hammer
	name = "claw hammer"
	desc = "An old wood shafted hammer with a pry bar on one side of the head. Not as good as a dedicate crowbar, but can do the job. Juuuust small enough to go in your pocket."
	force = 17
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/weapons/hammer.dmi'
	icon_state = "clawhammer"
	lefthand_file = 'icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/hammers_righthand.dmi'
	inhand_icon_state = "clawhammer"
	inside_belt_icon_state = "clawhammer"
	throwforce = 10
	throw_range = 5
	throw_speed = 3
	toolspeed = 2
	custom_materials = list(/datum/material/wood=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/iron=SMALL_MATERIAL_AMOUNT*0.7)
	armour_penetration = 10

	can_parry = TRUE
	wdefense = 1
