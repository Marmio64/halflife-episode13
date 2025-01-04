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
	icon_state = "siding_street"

/obj/effect/turf_decal/siding/street/corner
	icon_state = "siding_street_corner"

/obj/effect/turf_decal/siding/street/end
	icon_state = "siding_street_end"
