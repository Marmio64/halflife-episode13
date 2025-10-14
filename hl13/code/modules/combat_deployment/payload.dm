/obj/machinery/deployment_payload
	name = "Payload Cart"
	desc = "An old world nuke mounted atop a movable cart. Deliver it to the combine as a little farewell gift to them. Moves faster the more people are pushing it."
	icon = 'hl13/icons/obj/nuke.dmi'
	icon_state = "idle"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/projectile_passchance = 50

	light_range = 3
	light_power = 1.1
	light_color = "#658cac"
	var/movable

	var/combine_time = 5 MINUTES // each checkpoint is plus 1.5 minutes, so totals to 8 minutes if both checkpoints are reached
	var/grace_time = 1 MINUTES

	var/blocked = FALSE
	var/moving = TRUE

	var/last_scream = 0

	var/last_time_reminder = 0

	var/friendlies_present = 0

	/// Should the defender get a respawn change?
	var/alter_holder_respawn = TRUE

	/// Alternate respawn timer if above is enabled ^
	var/altered_respawn_speed = 30 SECONDS
	var/normal_respawn_speed = 20 SECONDS

	var/grace_period_up_text = "<span class='greentext big'>The grace period is up, the cart is now movable!</span>"
	var/grace_period_text = TRUE

	var/time_left_match = 0

/obj/machinery/deployment_payload/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(istype(mover, /obj/projectile))
		if(!projectile_passchance)
			return
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob((projectile_passchance)))
			return TRUE
		return FALSE

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
					to_chat(H, "<span class='greentext big'>The grace period is up, the cart is now movable!</span>")
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(H, "<span class='userdanger'>The grace period is up, the cart is now movable!</span>")
	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return

	time_left_match = GLOB.deployment_combine_flag_time_left

	if(last_time_reminder < world.time)
		to_chat(world, span_infoplain(span_big(span_bold("[time_left_match/10] seconds remain in the mission."))))
		last_time_reminder = world.time + 120 SECONDS

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
			to_chat(H, "<span class='userdanger'>The combine have stopped the cart...</span>")
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='greentext big'>We have stopped the cart from detonating!</span>")
		return PROCESS_KILL

	blocked = FALSE
	moving = FALSE
	friendlies_present = 0
	for(var/mob/living/hooman in orange(2, src))
		if(hooman.stat != CONSCIOUS)
			return
		if(hooman.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			blocked = TRUE //STOP DAT CART
		if(hooman.deployment_faction == REBEL_DEPLOYMENT_FACTION)
			moving = TRUE //move dat cart
			friendlies_present++

	if(!blocked && moving && GLOB.deployment_win_team != COMBINE_DEPLOYMENT_FACTION)
		move_cart()
		if(3 <= friendlies_present)
			addtimer(CALLBACK(src, PROC_REF(move_cart)), 0.5 SECONDS) //Bonus move speed for having at least 3 people on the cart!

/obj/machinery/deployment_payload/proc/move_cart()
	for(var/obj/effect/payload_path/P in range(1, src))
		if(last_scream < world.time)
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(H, "<span class='userdanger'>The payload cart is being pushed, stop it!</span>")
			last_scream = world.time + 30 SECONDS
		forceMove(get_turf(P))
		playsound(src, 'hl13/sound/effects/cartmove.ogg', 15, TRUE, extrarange = -1)
		if(istype(P, /obj/effect/payload_path/final_point))
			blow_up()
		if(istype(P, /obj/effect/payload_path/checkpoint))
			checkpoint_reached()

		qdel(P)
		return

/obj/machinery/deployment_payload/proc/blow_up()
	priority_announce("The payload has been delivered! Long live the resistance!", "Lambda Priority Alert")
	GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
	SSticker.force_ending = FORCE_END_ROUND
	explosion(src, 1, 20, 30, 5)
	for(var/X in GLOB.deployment_combine_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/cart_explode.ogg')
		to_chat(H, "<span class='userdanger'>The rebels have detonated the payload...</span>")
	for(var/X in GLOB.deployment_rebel_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/cart_explode.ogg')
		to_chat(H, "<span class='greentext big'>We have detonated the payload!</span>")
		return PROCESS_KILL

/obj/machinery/deployment_payload/proc/checkpoint_reached()
	GLOB.deployment_combine_flag_time_left += 90 SECONDS
	for(var/X in GLOB.deployment_combine_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
		to_chat(H, "<span class='userdanger'>The payload has reached a checkpoint, granting the rebels additional time!</span>")
	for(var/X in GLOB.deployment_rebel_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
		to_chat(H, "<span class='greentext big'>The payload has reached a checkpoint, granting us additional time!</span>")
		return PROCESS_KILL

/obj/machinery/deployment_payload/examine(mob/user)
	. = ..()
	. += span_notice("Rebels can stand near the cart to push it along its path.")
	. += span_notice("The combine need to defend the cart for [(GLOB.deployment_combine_flag_time_left)/10] more seconds in order to win.")

/obj/effect/payload_path
	name = "payload path"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = OBJ_LAYER
	plane = GAME_PLANE
	invisibility = INVISIBILITY_MAXIMUM
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/payload_path/final_point
	name = "payload capture point"
	icon_state = "x2"

/obj/effect/payload_path/checkpoint
	name = "payload checkpoint"
	icon_state = "x2"
