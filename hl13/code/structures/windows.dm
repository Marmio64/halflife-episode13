/obj/structure/window/fulltile/halflife/nosmooth
	name = "window"
	desc = "A normal looking window."
	icon = 'hl13/icons/obj/windows.dmi'
	max_integrity = 125
	smoothing_flags = 0
	smoothing_groups = null
	canSmoothWith = null

/obj/structure/window/fulltile/halflife/nosmooth/brick
	icon_state = "generic"
	base_icon_state = "generic"

/obj/structure/window/fulltile/halflife/nosmooth/generic
	icon_state = "generic"
	base_icon_state = "generic"

/obj/structure/window/fulltile/halflife/nosmooth/reinforced
	icon_state = "reinforced"
	base_icon_state = "reinforced"
	name = "reinforced window"
	desc = "A window reinforced with metal bars, making it rather difficult to break."
	max_integrity = 350
	damage_deflection = 20

/obj/structure/window/fulltile/halflife/nosmooth/reinforced/indestructible
	name = "highly reinforced window"
	desc = "A window reinforced with metal bars, making it rather difficult to break. This one looks incredibly durable, and near unbreakable."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/window/fulltile/halflife/combine
	name = "window"
	desc = "A combine window. Made of tougher materials than standard glass."
	icon = 'hl13/icons/obj/smooth_structures/cmwindow.dmi'
	icon_state = "cmwindow-0"
	base_icon_state = "cmwindow"
	max_integrity = 150
