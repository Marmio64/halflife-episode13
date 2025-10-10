/obj/machinery/deployment_payload
	name = "Payload Cart"
	desc = "An old world nuke mounted atop a movable cart. Deliver it the combine as a little farewell gift to them."
	icon = 'hl13/icons/obj/nuke.dmi'
	icon_state = "idle"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	light_range = 3
	light_power = 1.1
	light_color = "#658cac"
	var/movable

	var/combine_time = 5 MINUTES
	var/grace_time = 3 MINUTES

	var/blocked = FALSE
	var/moving = TRUE

	/// Should the defender get a respawn change?
	var/alter_holder_respawn = FALSE

	/// Alternate respawn timer if above is enabled ^
	var/altered_respawn_speed = 35 SECONDS
	var/normal_respawn_speed = 20 SECONDS

	var/grace_period_up_text = "<span class='greentext big'>The grace period is up, the cart is now movable!</span>"
	var/grace_period_text = TRUE

/obj/machinery/deployment_payload/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)
	GLOB.deployment_combine_flag_time_left = combine_time
	GLOB.deployment_flag_grace_period = grace_time

/obj/machinery/deployment_payload/process()
	for(var/turf/closed/wall/W in RANGE_TURFS(1, get_turf(src))) //no walling off da cart
		W.dismantle_wall()

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!movable)
			movable = TRUE
			if(grace_period_text)
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(H, grace_period_up_text)
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(H, grace_period_up_text)
	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return

	GLOB.deployment_combine_flag_time_left -= 1 SECONDS
	if(alter_holder_respawn)
		GLOB.deployment_respawn_rate_combine = altered_respawn_speed
		GLOB.deployment_respawn_rate_rebels = normal_respawn_speed

	if(GLOB.deployment_combine_flag_time_left <= 0 && GLOB.deployment_win_team != REBEL_DEPLOYMENT_FACTION)
		priority_announce("Payload ceased, additional delegates inbound. Amputate all dissenters.", "Overwatch Priority Alert")
		GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
		SSticker.force_ending = FORCE_END_ROUND
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='userdanger'>The combine have captured the flag...</span>")
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='greentext big'>We have captured and held the flag!</span>")
		return PROCESS_KILL

	blocked = FALSE
	moving = FALSE
	for(var/mob/living/hooman in orange(1, src))
		if(hooman.stat != CONSCIOUS)
			return
		if(hooman.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			blocked = TRUE //STOP DAT CART
		if(hooman.deployment_faction == REBEL_DEPLOYMENT_FACTION)
			moving = TRUE //move dat cart

	if(!blocked && moving && GLOB.deployment_win_team != COMBINE_DEPLOYMENT_FACTION)
		move_cart()

/obj/machinery/deployment_payload/proc/move_cart()
	for(var/obj/effect/payload_path/P in range(1, src))
		forceMove(get_turf(P))
		if(istype(P, /obj/effect/payload_path/final_point))
			blow_up()

		qdel(P)
		return

/obj/machinery/deployment_payload/proc/blow_up()
	priority_announce("The payload has been delivered! Long live the resistance!", "Lambda Priority Alert")
	GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
	SSticker.force_ending = FORCE_END_ROUND
	explosion(src, 0, 10, 15, 5)
	for(var/X in GLOB.deployment_combine_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='userdanger'>The rebels have detonated the payload...</span>")
	for(var/X in GLOB.deployment_rebel_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='greentext big'>We have detonated the payload!</span>")
		return PROCESS_KILL


/obj/machinery/deployment_payload/examine(mob/user)
	. = ..()
	. += span_notice("Rebels can stand near the cart to push it along its path.")
	. += span_notice("The combine need to defend the cart for [(GLOB.deployment_combine_flag_time_left)/10] more seconds in order to win.")

/obj/effect/payload_path
	name = "payload path"
	icon_state = "x"
	anchored = TRUE
	layer = OBJ_LAYER
	plane = GAME_PLANE
	invisibility = INVISIBILITY_MAXIMUM
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/payload_path/final_point
	name = "payload capture point"
	icon_state = "x2"
