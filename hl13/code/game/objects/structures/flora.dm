/obj/structure/flora/tree/halflife/pine
	desc = "A large, verdant green tree, seemingly unbothered by the destruction the combine have wrought upon the environment."
	icon = 'hl13/icons/obj/trees.dmi'
	icon_state = "pine_1"
	pixel_x = -16
	pixel_y = 6

/obj/structure/flora/tree/halflife/pine/get_seethrough_map()
	return SEE_THROUGH_MAP_THREE_X_THREE

/obj/structure/flora/tree/halflife/pine/style_random/Initialize(mapload)
	. = ..()
	icon_state = "pine_[rand(1, 4)]"
	update_appearance()

/obj/structure/flora/tree/halflife/pine/dead
	desc = "Another casualty in the combine's war on Earth."
	icon_state = "pine_5"
