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
