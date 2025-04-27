/obj/structure/fluff/traveltile
	name = "travel"
	icon_state = "travel"
	desc = "Seems like you can probably travel somewhere else from here."
	icon = 'hl13/icons/turf/floor/floors.dmi'
	density = FALSE
	anchored = TRUE
	layer = ABOVE_OPEN_TURF_LAYER
	max_integrity = 0
	var/aportalid = "REPLACETHIS"
	var/aportalgoesto = "REPLACETHIS"
	var/aallmig

/obj/structure/fluff/traveltile/Initialize()
	GLOB.traveltiles += src
	. = ..()

/obj/structure/fluff/traveltile/Destroy()
	GLOB.traveltiles -= src
	. = ..()

/obj/structure/fluff/traveltile/attack_ghost(mob/dead/observer/user)
	if(user.Adjacent(src))
		if(!aportalgoesto)
			return
		var/fou
		for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
			if(T.aportalid == aportalgoesto)
				if(T == src)
					continue
				user.forceMove(T.loc)
				fou = TRUE
				break
		if(!fou)
			to_chat(user, "<b>It is a dead end.</b>")


/obj/structure/fluff/traveltile/attack_hand(mob/user)
	var/fou
	if(!aportalgoesto)
		return
	for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
		if(T.aportalid == aportalgoesto)
			if(T == src)
				continue
			if(!can_go(user))
				return
			if(user.pulledby)
				return
			to_chat(user, "<b>I begin to travel...</b>")
			if(do_after(user, 4 SECONDS, target = src))
				var/mob/living/L = user
				var/atom/movable/pullingg = L.pulling
				L.recent_travel = world.time
				if(pullingg)
					pullingg.forceMove(T.loc)
					pullingg.recent_travel = world.time
				L.forceMove(T.loc)
				if(pullingg)
					L.start_pulling(pullingg, supress_message = TRUE)
			fou = TRUE
			break
	if(!fou)
		to_chat(user, "<b>It is a dead end.</b>")
	. = ..()

/obj/structure/fluff/traveltile/proc/can_go(atom/movable/AM)
	if(AM.recent_travel)
		if(world.time < AM.recent_travel + 12 SECONDS)
			return FALSE
	return TRUE

/atom/movable
	var/recent_travel = 0

/*

/obj/structure/fluff/traveltile/Crossed(atom/movable/AM)
	. = ..()
	var/fou
	if(!aportalgoesto)
		return
	if(!isliving(AM))
		return
	for(var/obj/structure/fluff/traveltile/T in shuffle(GLOB.traveltiles))
		if(T.aportalid == aportalgoesto)
			if(T == src)
				continue
			if(!can_go(AM))
				return
			if(AM.pulledby)
				return
			to_chat(AM, "<b>I begin to travel...</b>")
			if(do_after(AM, 50, target = src))
				if(!can_go(AM))
					return
				var/mob/living/L = AM
				var/atom/movable/pullingg = L.pulling
				L.recent_travel = world.time
				if(pullingg)
					pullingg.forceMove(T.loc)
					pullingg.recent_travel = world.time
				L.forceMove(T.loc)
				if(pullingg)
					L.start_pulling(pullingg, supress_message = TRUE)
			fou = TRUE
			break
	if(!fou)
		to_chat(AM, "<b>It is a dead end.</b>")

*/
