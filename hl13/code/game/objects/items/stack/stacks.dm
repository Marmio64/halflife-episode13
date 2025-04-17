/obj/item/stack/sheet/scrap_metal
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "scrap metal"
	desc = "Pieces of scrap metal. Not very useful on it's own, but maybe with the right tools you can make it more usable."
	singular_name = "scrap metal"
	icon_state = "sheet-scrapmetal"
	inhand_icon_state = "sheet-metal"
	throwforce = 10
	obj_flags = CONDUCTS_ELECTRICITY
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/scrap_metal
	grind_results = list(/datum/reagent/iron = 10)
	tableVariant = /obj/structure/table/halflife/metal/constructed/cobbled
	matter_amount = 2

/obj/item/stack/sheet/scrap_metal/two
	amount = 2

/obj/item/stack/sheet/ironingot
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "iron ingots"
	desc = "Solid chunks of iron. Unusable in this state, it'll have to be pressed out into sheets."
	singular_name = "iron ingot"
	icon_state = "ironingot"
	throwforce = 10
	obj_flags = CONDUCTS_ELECTRICITY
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/ironingot
	grind_results = list(/datum/reagent/iron = 20)
	tableVariant = /obj/structure/table/halflife/metal/constructed
	matter_amount = 2
	novariants = TRUE

/obj/item/stack/sheet/ironpowder
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "iron powder"
	desc = "Finely pulverized iron. Might be useful for certain factory goods, but you're not sure what else."
	singular_name = "iron powder"
	icon_state = "ironpowder"
	throwforce = 10
	obj_flags = CONDUCTS_ELECTRICITY
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/ironpowder
	grind_results = list(/datum/reagent/iron = 20)
	matter_amount = 2
	novariants = TRUE

/obj/item/stack/sheet/scrap_parts
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "scrap parts"
	desc = "Random spare metal parts."
	singular_name = "scrap parts"
	icon_state = "sheet-scrapparts"
	base_icon_state = "sheet-scrapparts"
	throwforce = 10
	obj_flags = CONDUCTS_ELECTRICITY
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/scrap_parts
	grind_results = list(/datum/reagent/iron = 20)
	matter_amount = 2


/obj/item/stack/sheet/mineral/scrap_wood
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "scrap wood"
	desc = "Destroyed scraps of wood. Not very useful by itself, but maybe with enough you can sift through for a usable plank of wood."
	singular_name = "scrap wood"
	icon_state = "sheet-scrapwood"
	inhand_icon_state = "sheet-wood"
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/sheet/mineral/scrap_wood
	grind_results = list(/datum/reagent/cellulose = 10) //no lignocellulose or lignin reagents yet
	pickup_sound = 'sound/items/handling/materials/wood_pick_up.ogg'
	drop_sound = 'sound/items/handling/materials/wood_drop.ogg'
	tableVariant = /obj/structure/table/halflife/wood/constructed/cobbled

/obj/item/stack/sheet/halflife/plastic
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "plastic"
	desc = "Pieces of plastic. Might be useful for some kind of construction."
	singular_name = "plastic"
	icon_state = "plastic"
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/halflife/plastic
	grind_results = list(/datum/reagent/plastic_polymers = 10)

/obj/item/stack/sheet/halflife/plastic/twenty
	amount = 20

/obj/item/stack/bulletcasings
	name = "empty ammo casings"
	desc = "A pile of empty ammo casings in good condition, for making ammunition from."
	custom_price = 5
	icon = 'hl13/icons/obj/materials.dmi'
	singular_name = "empty ammo casing"
	merge_type = /obj/item/stack/bulletcasings
	icon_state = "casings"
	w_class = WEIGHT_CLASS_TINY
	obj_flags = CONDUCTS_ELECTRICITY
	grind_results = list(/datum/reagent/iron = 20)

/obj/item/stack/sheet/halflife/brick
	name = "brick"
	singular_name = "brick"
	desc = "A simple brick. Surpisingly deadly."
	icon = 'hl13/icons/obj/stack_objects.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	icon_state = "brick"
	inhand_icon_state = "brick"
	hitsound = 'hl13/sound/halflifeweapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'hl13/sound/halflifeweapons/meleesounds/general_grip.ogg'
	drop_sound = null
	attack_verb_continuous = list("clonks", "smacks", "clocks", "nails", "bludgeons", "whacks", "bonks", "bricks")
	attack_verb_simple = list("clonk", "smack", "clock", "nail", "bludgeon", "whack", "bonk", "brick")
	force = 15
	armour_penetration = 10
	throwforce = 20 //brick
	throw_speed = 1.5
	throw_range = 6
	wound_bonus = 5
	w_class = WEIGHT_CLASS_SMALL
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF

	sheettype = "brick"
	max_amount = 3
	walltype = /turf/closed/wall/halflife/brick/weak
	material_type = /datum/material/brick

/datum/material/brick
	name = "brick"
	desc = "Solid fire dried clay."

/obj/item/stack/kevlar
	name = "kevlar"
	desc = "Old world kevlar, fit for some serious armor despite its age."
	custom_price = 5
	icon = 'hl13/icons/obj/stack_objects.dmi'
	singular_name = "kevlar"
	merge_type = /obj/item/stack/kevlar
	max_amount = 5
	icon_state = "kevlar"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/stack/kevlar/two
	amount = 2

/obj/item/stack/kevlar/five
	amount = 5
