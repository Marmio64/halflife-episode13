/obj/structure/lattice/catwalk/hl13
	name = "catwalk"
	desc = "A durable catwalk used mainly in industrial areas"
	icon = 'hl13/icons/obj/catwalk.dmi'

/obj/structure/pitgrate/hl13_bridge
	name = "bridge grate"
	icon = 'hl13/icons/obj/catwalk.dmi'
	icon_state = "catwalk-0"
	base_icon_state = "catwalk"

	resistance_flags = INDESTRUCTIBLE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_CATWALK + SMOOTH_GROUP_LATTICE + SMOOTH_GROUP_OPEN_FLOOR
	canSmoothWith = SMOOTH_GROUP_CATWALK
