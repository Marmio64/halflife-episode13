/obj/effect/mine/explosive/combine
	name = "hopper mine"
	desc = "A combine produced mine which detonates if an unauthorized individual steps on it."
	density = FALSE
	anchored = TRUE
	icon = 'hl13/icons/obj/hoppermines.dmi'
	icon_state = "hopper"
	base_icon_state = "hopper"

/obj/effect/mine/explosive/combine/can_trigger(atom/movable/on_who)
	var/mob/living/living_mob
	if(ismob(on_who))
		if(!isliving(on_who)) //no ghosties.
			return FALSE
		living_mob = on_who

		if("combine" in living_mob.faction) //do not detonate on combine people
			return FALSE

	return ..()
