//metal and wood sprites from tgmc, otherwise ms13
/turf/closed/wall/halflife
	name = "wall"
	desc = "A sturdy wall."
	max_integrity = 1000
	baseturfs = /turf/open/floor/plating/ground/dirt

/turf/closed/wall/halflife/wood
	name = "wooden wall"
	icon = 'hl13/icons/turf/walls/woodwall.dmi'
	desc = "A old wooden wall, somehow still standing after all this time."
	icon_state = "woodwall-0"
	base_icon_state = "woodwall"

/turf/closed/wall/halflife/wood/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_WOOD, -15, 8, 1)

/turf/closed/wall/halflife/brick
	name = "brick wall"
	icon = 'hl13/icons/turf/walls/brick.dmi'
	desc = "A sturdy wall made of bricks."
	icon_state = "wall-0"
	base_icon_state = "wall"
	sheet_type = /obj/item/stack/sheet/halflife/brick
	sheet_amount = 2

/turf/closed/wall/halflife/brick/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_BRICK, -15, 8, 1)

/turf/closed/wall/halflife/brick/try_decon() //can't weld through bricks
	return FALSE

/turf/closed/wall/halflife/brick/weak
	max_integrity = 300

/turf/closed/wall/halflife/brick/grey
	icon = 'hl13/icons/turf/walls/brickgrey.dmi'

/turf/closed/wall/halflife/concrete
	name = "concrete wall"
	icon = 'hl13/icons/turf/walls/concrete.dmi'
	desc = "A dirty wall of old concrete."
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/halflife/concrete/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_ROCK, -15, 8, 1)

/turf/closed/wall/halflife/concrete/try_decon() //can't weld through concrete
	return FALSE

/turf/closed/wall/halflife/concrete/alt
	icon = 'hl13/icons/turf/walls/concretealt.dmi'

/turf/closed/wall/halflife/sewer
	name = "concrete wall"
	icon = 'hl13/icons/turf/walls/sewer.dmi'
	desc = "A dirty wall of old concrete."
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/halflife/sewer/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_ROCK, -15, 8, 1)

/turf/closed/wall/halflife/sewer/try_decon() //can't weld through concrete
	return FALSE

/turf/closed/wall/halflife/metal
	name = "metal wall"
	icon = 'hl13/icons/turf/walls/combine.dmi'
	desc = "A strange metal wall made of the alloy that the combine use."
	icon_state = "wall-0"
	base_icon_state = "wall"
	slicing_duration = 150

/turf/closed/wall/halflife/metal/strong
	max_integrity = 1500
	explosive_resistance = 4
	slicing_duration = 200

/turf/closed/wall/halflife/metal/strong/train
	icon = 'hl13/icons/turf/walls/train.dmi'
	desc = "A green metal train wall."
	icon_state = "train1-0"
	base_icon_state = "train1"

/turf/closed/wall/halflife/metal/weak
	max_integrity = 300
	slicing_duration = 60

/turf/closed/wall/halflife/metal/weak/old
	icon = 'hl13/icons/turf/walls/metal.dmi'
	name = "old metal wall"
	desc = "A rusty old metal wall."
	icon_state = "urban_wall_regular-0"
	base_icon_state = "urban_wall_regular"
