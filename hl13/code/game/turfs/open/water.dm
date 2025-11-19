

#define TURF_LAYER_WATER 2
#define TURF_LAYER_MOB_WATER 1.95
#define TURF_LAYER_WATER_UNDER 1.94
#define TURF_LAYER_WATER_BASE 1.93

#define iswater(A) (istype(A, /turf/open/halflife/water))

/turf/open/halflife/water
	name = "water"
	desc = "Cold dirty water."
	icon = 'hl13/icons/turf/floor/water.dmi'
	baseturfs = /turf/open/halflife/water
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	plane = FLOOR_PLANE
	layer = TURF_LAYER_WATER_BASE
	slowdown = 1
	light_power = 0.25 //water is reflective, or has glowing contaminants inside of it...
	light_range = 0.25
	light_color = "#0486b9"
	// What type of water it'll give you when you fill a container from it.
	var/dispensedreagent = /datum/reagent/water/unpurified/river
	var/next_splash = 1
	var/atom/watereffect = /obj/effect/overlay/halflife/water/medium
	var/atom/watertop = /obj/effect/overlay/halflife/water/top/medium
	var/depth = 0
	var/coldness = -100
	var/sewer = FALSE
	var/saltwater = FALSE
	var/toxic = FALSE //is this water completely hazardous to even step in?
	var/leeches = FALSE //will leeches eat your flesh inside?
	///Boolean on whether something is currently being washed, preventing multiple people from cleaning at once.
	var/busy = FALSE

/turf/open/halflife/water/attackby(obj/item/W, mob/user, params)
	. = ..()

	if(istype(W, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/container = W
		if(container.is_refillable())
			if(!container.reagents.holder_full())
				container.reagents.add_reagent(dispensedreagent, min(container.volume - container.reagents.total_volume, container.amount_per_transfer_from_this))
				to_chat(user, span_notice("You fill [container] from [src]."))
				return TRUE
			to_chat(user, span_notice("\The [container] is full."))
			return FALSE

/turf/open/halflife/water/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(!iscarbon(user))
		return
	if(!Adjacent(user))
		return
	if(toxic || sewer || leeches)
		return

	if(busy)
		to_chat(user, span_warning("Someone's already washing here!"))
		return
	var/selected_area = user.parse_zone_with_bodypart(user.zone_selected)
	var/washing_face = FALSE
	if(selected_area in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))
		washing_face = TRUE
	user.visible_message(
		span_notice("[user] starts washing [user.p_their()] [washing_face ? "face" : "hands"]..."),
		span_notice("You start washing your [washing_face ? "face" : "hands"]..."))
	busy = TRUE

	if(!do_after(user, 4 SECONDS, target = src))
		busy = FALSE
		return

	busy = FALSE

	if(washing_face)
		SEND_SIGNAL(user, COMSIG_COMPONENT_CLEAN_FACE_ACT, CLEAN_WASH)
	else if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		if(!human_user.wash_hands(CLEAN_WASH))
			to_chat(user, span_warning("Your hands are covered by something!"))
			return
	else
		user.wash(CLEAN_WASH)

	user.visible_message(
		span_notice("[user] washes [user.p_their()] [washing_face ? "face" : "hands"] using [src]."),
		span_notice("You wash your [washing_face ? "face" : "hands"] using [src]."),
	)

/turf/open/halflife/water/can_have_cabling()
	return

/turf/open/halflife/water/deep
	name = "deep water"
	desc = "Cold dirty water, it looks pretty deep."
	icon_state = "water_deep"
	baseturfs = /turf/open/halflife/water/deep
	watereffect = /obj/effect/overlay/halflife/water/deep
	watertop = /obj/effect/overlay/halflife/water/top/deep
	depth = 3

/turf/open/halflife/water/medium
	icon_state = "water_medium"
	baseturfs = /turf/open/halflife/water/medium
	watereffect = /obj/effect/overlay/halflife/water/medium
	watertop = /obj/effect/overlay/halflife/water/top/medium
	depth = 2

/turf/open/halflife/water/shallow
	icon_state = "water_shallow"
	baseturfs = /turf/open/halflife/water/shallow
	watereffect = /obj/effect/overlay/halflife/water/shallow
	watertop = /obj/effect/overlay/halflife/water/top/shallow
	depth = 1

/turf/open/halflife/water/Initialize()
	. = ..()
	//new watereffect(src)
	//new watertop(src)

/turf/open/halflife/water/Initialize(mapload)
	. = ..()
	if(sewer)
		add_lazy_fishing(/datum/fish_source/sewer)
	else if(saltwater)
		add_lazy_fishing(/datum/fish_source/halflifesalt)
	else
		add_lazy_fishing(/datum/fish_source/halfliferiver)

/obj/effect/overlay/halflife/water
	name = "water"
	icon = 'hl13/icons/turf/floor/water.dmi'
	density = FALSE
	mouse_opacity = 0
	layer = TURF_LAYER_WATER
	plane = FLOOR_PLANE
	anchored = TRUE

/obj/effect/overlay/halflife/water/deep
	icon_state = "water_deep_bottom"

/obj/effect/overlay/halflife/water/medium
	icon_state = "water_medium_bottom"

/obj/effect/overlay/halflife/water/shallow
	icon_state = "water_shallow_bottom"

/obj/effect/overlay/halflife/water/top
	layer = TURF_LAYER_WATER_UNDER
	light_power = 0.25 //water is reflective, or has glowing contaminants inside of it...
	light_range = 0.25
	light_color = "#0486b9"

/obj/effect/overlay/halflife/water/top/deep
	icon_state = "water_deep_top"

/obj/effect/overlay/halflife/water/top/medium
	icon_state = "water_medium_top"

/obj/effect/overlay/halflife/water/top/shallow
	icon_state = "water_shallow_top"

/mob/living
	var/swimming = FALSE

/*
/turf/open/halflife/water/MouseDrop(mob/living/M, mob/living/user)
	..()
	if(!M.swimming) //can't put yourself up if you are not swimming
		return
	switch(depth)
		if(3)
			if(user == M)
				M.visible_message("<span class='notice'>[user] is getting out the deep water", \
								"<span class='notice'>You start getting out of the deep water.</span>")
				if(do_after(user, M, 20))
					M.swimming = FALSE
					M.forceMove(src)
					to_chat(user, "<span class='notice'>You get out of the deep water.</span>")
			else
				user.visible_message("<span class='notice'>[M] is being dragged out the water by [user].</span>", \
								"<span class='notice'>You start getting [M] out of the deep water.")
				if(do_after(user, M, 20))
					M.swimming = FALSE
					M.forceMove(src)
					to_chat(user, "<span class='notice'>You get [M] out of the deep water.</span>")
					return
		else
			return

/turf/open/halflife/water/MouseDrop(mob/living/M, mob/living/user)
	..()
	if(user.stat || user.body_position == LYING_DOWN || !Adjacent(user) || !M.Adjacent(user)|| !iscarbon(M))
		return
	if(M.swimming) //can't lower yourself again
		return
	else
		switch(depth)
			if(3)
				if(user == M)
					M.visible_message("<span class='notice'>[user] is descending in the deep water", \
									"<span class='notice'>You start lowering yourself in the deep water.</span>")
					if(do_after(user, M, 20))
						M.swimming = TRUE
						//addtimer(CALLBACK(src, PROC_REF(transfer_mob_layer), M), 0.2 SECONDS)
						M.forceMove(src)
						to_chat(user, "<span class='notice'>You lower yourself in the deep water.</span>")
						//M.adjust_bodytemperature(coldness)
						//M.Jitter(20)
				else
					user.visible_message("<span class='notice'>[M] is being put in the deep water by [user].</span>", \
									"<span class='notice'>You start lowering [M] in the deep water.")
					if(do_after(user, M, 20))
						M.swimming = TRUE
						//addtimer(CALLBACK(src, PROC_REF(transfer_mob_layer), M), 0.2 SECONDS)
						M.forceMove(src)
						to_chat(user, "<span class='notice'>You lower [M] in the deep water.</span>")
						//M.adjust_bodytemperature(coldness)
						//M.Jitter(20)
						return
			else
				return

*/

/turf/open/halflife/water/Exited(atom/movable/gone, direction)
	..()
	if(isliving(gone))
		var/mob/living/M = gone
		if(!iswater(get_step(src, direction)))
			M.swimming = FALSE
			M.layer = initial(M.layer)
			//M.plane =  PLANE_TO_TRUE((initial(M.plane)))
			SET_PLANE_EXPLICIT(M, PLANE_TO_TRUE((initial(M.plane))), src)

/turf/open/halflife/water/Entered(atom/A, turf/OL)
	..()
	for(var/obj/structure/lattice/catwalk/C in get_turf(A))
		return

	if(isliving(A))
		var/mob/living/M = A
		//addtimer(CALLBACK(src, PROC_REF(transfer_mob_layer), M), 0.2 SECONDS)

		if(!ishuman(M))
			return

		if(M.movement_type & MOVETYPES_NOT_TOUCHING_GROUND || !M.has_gravity()) //you're flying over it.
			return

		if(M.throwing) // throw someone or jump to bypass dangerous water safely
			return

		var/mob/living/carbon/human/H = M

		if(!sewer)
			if(H.hygiene < HYGIENE_LEVEL_NORMAL)
				H.adjust_hygiene(20) //Cleans you up a little if it is clean water
		else
			H.adjust_hygiene(-40) //Otherwise, fucking disgusting

		if(toxic)
			if(!SSradiation.wearing_rad_protected_clothing(H))
				H.visible_message("<span class='danger'>[H] is burnt by the sludge!</span>",
											"<span class='userdanger'>This water is hazardous, your flesh burns!</span>")
				H.adjustFireLoss(40)
				H.emote("scream")
		if(leeches)
			H.visible_message("<span class='danger'>[H] is bit up by leeches!</span>",
										"<span class='userdanger'>This water is filled with leeches, get out!</span>")
			H.adjustBruteLoss(15)
			H.emote("scream")
		if(!(M.swimming))
			switch(depth)
				if(3)
					H.wash(CLEAN_WASH)
					if(iscarbon(M) && H.wear_mask && H.wear_mask.flags_cover & MASKCOVERSMOUTH)
						H.visible_message("<span class='danger'>[H] falls in the water!</span>",
											"<span class='userdanger'>You fall in the water!</span>")
						playsound(src, 'hl13/sound/halflifeeffects/splash.ogg', 60, 1, 1)
						H.Knockdown(20)
						H.swimming = TRUE
						//M.adjust_bodytemperature(coldness)
						return
					else
						H.dropItemToGround(H.get_active_held_item())
						H.adjustOxyLoss(5)
						H.emote("cough")
						H.visible_message("<span class='danger'>[H] falls in and takes a drink!</span>",
											"<span class='userdanger'>You fall in and swallow some water!</span>")
						playsound(src, 'hl13/sound/halflifeeffects/splash.ogg', 60, 1, 1)
						H.Knockdown(40)
						H.swimming = TRUE
						//M.adjust_bodytemperature(coldness)
				else
					H.swimming = TRUE
					//M.adjust_bodytemperature(coldness)
		if(H.body_position == LYING_DOWN)
			if(M.stat == DEAD)
				return
			switch(depth)
				if(3)
					H.visible_message("<span class='danger'>[H] flails in the water!</span>",
										"<span class='userdanger'>You're drowning, stop and try to get up!</span>")
					H.Knockdown(20)
					//M.adjust_bodytemperature(coldness)
					M.adjustStaminaLoss(16)
					M.adjustOxyLoss(8)
					M.adjustOrganLoss(ORGAN_SLOT_LUNGS, 3)
					playsound(src, 'hl13/sound/halflifeeffects/drown.ogg', 30, 1, 1)
				if(2)
					H.visible_message("<span class='danger'>[H] flails in the shallow water!</span>",
										"<span class='userdanger'>You're drowning, stop and try to get up!</span>")
					H.Knockdown(10)
					//M.adjust_bodytemperature(coldness)
					M.adjustStaminaLoss(8)
					M.adjustOxyLoss(4)
					M.adjustOrganLoss(ORGAN_SLOT_LUNGS, 3)
					playsound(src, 'hl13/sound/halflifeeffects/drown.ogg', 30, 1, 1)
		else //wading
			switch(depth)
				if(3)
					M.wash(CLEAN_WASH)
					//M.adjust_bodytemperature(coldness)
					//M.Jitter(20)
					M.adjustStaminaLoss(3)
				if(2)
					M.wash(CLEAN_WASH)
					//M.adjust_bodytemperature(coldness)
					//M.Jitter(20)
					M.adjustStaminaLoss(1)
				/*else
					M.adjust_bodytemperature(coldness)
					M.Jitter(20)*/
			return

/turf/open/halflife/water/proc/transfer_mob_layer(var/mob/living/carbon/M)
	if(iswater(get_turf(M)))
		M.layer = TURF_LAYER_MOB_WATER
		SET_PLANE_EXPLICIT(M, PLANE_TO_TRUE(FLOOR_PLANE), src)
		M.update_icon(UPDATE_OVERLAYS)
	else
		return

/turf/open/halflife/water/sewer
	name = "sewer water"
	desc = "Murky and foul smelling water, if you could call it that."
	baseturfs = /turf/open/halflife/water/sewer
	dispensedreagent = /datum/reagent/water/dirty/sewer
	light_color = "#013b09"
	sewer = TRUE
	slowdown = 2 //very thick, disgusting slop, slows you down more than water

/turf/open/halflife/water/sewer/deep
	name = "deep water"
	desc = "Cold rancid sewer water, it looks pretty deep."
	icon_state = "sewer_deep"
	baseturfs = /turf/open/halflife/water/sewer/deep
	watereffect = /obj/effect/overlay/halflife/sewer/deep
	watertop = /obj/effect/overlay/halflife/sewer/top/deep
	depth = 3

/turf/open/halflife/water/sewer/medium
	icon_state = "sewer_medium"
	baseturfs = /turf/open/halflife/water/sewer/medium
	watereffect = /obj/effect/overlay/halflife/sewer/medium
	watertop = /obj/effect/overlay/halflife/sewer/top/medium
	depth = 2

/turf/open/halflife/water/sewer/shallow
	icon_state = "sewer_shallow"
	baseturfs = /turf/open/halflife/water/sewer/shallow
	watereffect = /obj/effect/overlay/halflife/sewer/shallow
	watertop = /obj/effect/overlay/halflife/sewer/top/shallow
	depth = 1

/obj/effect/overlay/halflife/sewer
	name = "water"
	icon = 'hl13/icons/turf/floor/water.dmi'
	density = FALSE
	mouse_opacity = 0
	layer = TURF_LAYER_WATER
	plane = FLOOR_PLANE
	anchored = TRUE

/obj/effect/overlay/halflife/sewer/deep
	icon_state = "sewer_deep_bottom"

/obj/effect/overlay/halflife/sewer/medium
	icon_state = "sewer_medium_bottom"

/obj/effect/overlay/halflife/sewer/shallow
	icon_state = "sewer_shallow_bottom"

/obj/effect/overlay/halflife/sewer/top
	layer = TURF_LAYER_WATER_UNDER
	light_power = 0.25 //water is reflective, or has glowing contaminants inside of it...
	light_range = 0.25
	light_color = "#013b09"

/obj/effect/overlay/halflife/sewer/top/deep
	icon_state = "sewer_deep_top"

/obj/effect/overlay/halflife/sewer/top/medium
	icon_state = "sewer_medium_top"

/obj/effect/overlay/halflife/sewer/top/shallow
	icon_state = "sewer_shallow_top"


/turf/open/halflife/water/sludge
	name = "toxic sludge"
	desc = "Bubbling, frothy green goo which stings the air, and your flesh."
	baseturfs = /turf/open/halflife/water/sludge
	dispensedreagent = /datum/reagent/water/dirty/sludge
	light_color = "#013b09"
	sewer = TRUE
	toxic = TRUE
	slowdown = 2 //very thick, disgusting slop, slows you down more than water

/turf/open/halflife/water/sludge/deep
	name = "deep toxic sludge"
	desc = "Bubbling, frothy green goo which stings the air, and your flesh, it looks pretty deep."
	icon_state = "sludge_deep"
	baseturfs = /turf/open/halflife/water/sewer/deep
	watereffect = /obj/effect/overlay/halflife/sewer/deep
	watertop = /obj/effect/overlay/halflife/sewer/top/deep
	depth = 3

/turf/open/halflife/water/sludge/medium
	icon_state = "sludge_medium"
	baseturfs = /turf/open/halflife/water/sewer/medium
	watereffect = /obj/effect/overlay/halflife/sewer/medium
	watertop = /obj/effect/overlay/halflife/sewer/top/medium
	depth = 2

/turf/open/halflife/water/sludge/shallow
	icon_state = "sludge_shallow"
	baseturfs = /turf/open/halflife/water/sewer/shallow
	watereffect = /obj/effect/overlay/halflife/sewer/shallow
	watertop = /obj/effect/overlay/halflife/sewer/top/shallow
	depth = 1

/turf/open/halflife/water/salt
	name = "salt water"
	desc = "Salty seawater. Your skin burns a bit when you enter it, you might not want to go too deep."
	baseturfs = /turf/open/halflife/water/salt
	saltwater = TRUE
	dispensedreagent = /datum/reagent/water/dirty/salt
	slowdown = 1.5 //Heavy, salt filled water?

/turf/open/halflife/water/salt/deep
	name = "deep water"
	desc = "Salty seawater. The depths conceal wriggling masses of leeches."
	icon_state = "water_deep"
	baseturfs = /turf/open/halflife/water/salt/deep
	watereffect = /obj/effect/overlay/halflife/water/deep
	watertop = /obj/effect/overlay/halflife/water/top/deep
	depth = 3
	leeches = TRUE

/turf/open/halflife/water/salt/medium
	icon_state = "water_medium"
	baseturfs = /turf/open/halflife/water/salt/medium
	watereffect = /obj/effect/overlay/halflife/water/medium
	watertop = /obj/effect/overlay/halflife/water/top/medium
	depth = 2

/turf/open/halflife/water/salt/shallow
	icon_state = "water_shallow"
	baseturfs = /turf/open/halflife/water/salt/shallow
	watereffect = /obj/effect/overlay/halflife/water/shallow
	watertop = /obj/effect/overlay/halflife/water/top/shallow
	depth = 1
