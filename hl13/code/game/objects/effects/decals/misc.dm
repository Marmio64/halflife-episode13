/obj/effect/decal/antlionblood
	name = "bloody mess"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'
	icon_state = "antsplatter"
	var/sound_to_play = 'sound/effects/blob/blobattack.ogg'

/obj/effect/decal/antlionblood/Initialize(mapload, mob/living/source_mob, list/datum/disease/diseases)
	. = ..()
	if(sound_to_play)
		playsound(src, sound_to_play, 40, TRUE)

/obj/effect/turf_decal/siding/street
	icon_state = "border"
	icon = 'hl13/icons/effects/border.dmi'

/obj/effect/turf_decal/siding/street/corner
	icon_state = "border_corner"
	icon = 'hl13/icons/effects/border.dmi'


/obj/effect/turf_decal/siding/street/end
	icon_state = "siding_street_end"

//Road Decals

/obj/effect/turf_decal/halflife/road
	icon = 'hl13/icons/effects/road_decals.dmi'

/*
/obj/effect/turf_decal/halflife/road/Initialize(mapload)
	. = ..()
	if(prob(35))
		icon_state = "[initial(icon_state)]-[rand(1,2)]"
*/

/obj/effect/turf_decal/halflife/road/horizontalline
	icon_state = "horizontal_line"

/obj/effect/turf_decal/halflife/road/verticalline
	icon_state = "vertical_line"

/obj/effect/turf_decal/halflife/road/horizontalcrossing
	icon_state = "horizontal_crossing"

/obj/effect/turf_decal/halflife/road/verticalcrossing
	icon_state = "vertical_crossing"
