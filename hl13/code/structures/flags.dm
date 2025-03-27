/obj/item/hl13_small_flag
	name = "base flag pole"
	icon = 'hl13/icons/obj/flags32x64.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	force = 18 //Solid wood, in a shape similar to a spear
	throwforce = 10
	w_class = WEIGHT_CLASS_BULKY

/obj/item/hl13_small_flag/poland
	name = "polish flag"
	desc = "A pole brandishing the colors of the once proud nation of Poland."
	icon_state = "flagpole_poland"
	inhand_icon_state = "flagpole_poland"

/obj/item/hl13_small_flag/combine
	name = "combine flag"
	desc = "A pole brandishing the colors of the occupying Universal Union."
	icon_state = "flagpole_combine"
	inhand_icon_state = "flagpole_combine"

/obj/item/hl13_small_flag/attack_self(mob/user)
	src.forceMove(get_turf(user))
	src.pixel_x = 0
	src.pixel_y = 0
