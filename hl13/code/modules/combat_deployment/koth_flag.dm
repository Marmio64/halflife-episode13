GLOBAL_VAR_INIT(deployment_rebels_flag_time_left, 5 MINUTES)
GLOBAL_VAR_INIT(deployment_combine_flag_time_left, 5 MINUTES)
GLOBAL_VAR_INIT(deployment_flag_grace_period, 3 MINUTES)
GLOBAL_VAR_INIT(deployment_respawn_rate_rebels, 25 SECONDS)
GLOBAL_VAR_INIT(deployment_respawn_rate_combine, 25 SECONDS)
GLOBAL_VAR_INIT(deployment_respawn_rate_xen, 12 SECONDS)
GLOBAL_VAR_INIT(deployment_win_team, null)

/obj/machinery/deployment_koth_flag
	name = "Central Flag"
	desc = "A towering flag which must be held by one side of the conflict for a certain amount of time to win. Click on it to start changing the flag to your side."
	icon = 'hl13/icons/obj/koth_flag.dmi'
	icon_state = "uncapturable"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	pixel_x = -32
	plane = -2

	light_range = 7
	light_power = 1.1
	light_color = "#658cac"
	var/current_faction_holder = NO_FACTION
	var/capturable

	var/starting_faction = null

	var/rebel_time = 5 MINUTES
	var/combine_time = 5 MINUTES
	var/grace_time = 3 MINUTES

	/// Should the current holder of the flag have a different respawn speed, as perhaps say a handicap of sorts?
	var/alter_holder_respawn = FALSE

	/// Alternate respawn timer if above is enabled ^
	var/altered_respawn_speed = 35 SECONDS
	var/normal_respawn_speed = 20 SECONDS

	var/grace_period_up_text = "<span class='greentext big'>The flag grace period is up, and it is now capturable!</span>"
	var/grace_period_text = TRUE

/obj/machinery/deployment_koth_flag/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)
	GLOB.deployment_combine_flag_time_left = combine_time
	GLOB.deployment_rebels_flag_time_left = rebel_time
	GLOB.deployment_flag_grace_period = grace_time

/obj/machinery/deployment_koth_flag/process()
	for(var/turf/closed/wall/W in RANGE_TURFS(3, get_turf(src))) //no walling off the flag
		W.dismantle_wall()

	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!capturable)
			capturable = TRUE
			icon_state = "empty"
			if(grace_period_text)
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')
					to_chat(H, grace_period_up_text)
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')
					to_chat(H, grace_period_up_text)
			if(starting_faction)
				current_faction_holder = starting_faction
	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS

	if(current_faction_holder == COMBINE_DEPLOYMENT_FACTION)
		icon_state = "combine"
		GLOB.deployment_combine_flag_time_left -= 1 SECONDS
		if(alter_holder_respawn)
			GLOB.deployment_respawn_rate_combine = altered_respawn_speed
			GLOB.deployment_respawn_rate_rebels = normal_respawn_speed

		if(GLOB.deployment_combine_flag_time_left <= 0)
			priority_announce("Central flag under Overwatch Control. Amputate all dissenters.", "Overwatch Priority Alert")
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

	if(current_faction_holder == REBEL_DEPLOYMENT_FACTION)
		icon_state = "rebel"
		GLOB.deployment_rebels_flag_time_left -= 1 SECONDS
		if(alter_holder_respawn)
			GLOB.deployment_respawn_rate_combine = normal_respawn_speed
			GLOB.deployment_respawn_rate_rebels = altered_respawn_speed

		if(GLOB.deployment_rebels_flag_time_left <= 0)
			priority_announce("The flag is under control of Lambda now, long live the resistance!", "Lambda Priority Alert")
			GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
				to_chat(H, "<span class='userdanger'>The rebels have captured the flag...</span>")
			for(var/X in GLOB.deployment_rebel_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
				to_chat(H, "<span class='greentext big'>We have captured and held the flag!</span>")
			return PROCESS_KILL

/obj/machinery/deployment_koth_flag/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(.)
		return
	add_fingerprint(H)

	if(H.deployment_faction != current_faction_holder)
		if(!capturable)
			to_chat(H, span_userdanger("The flag grace period is still on for another [(GLOB.deployment_flag_grace_period)/10] seconds, and cant be captured!"))
			return
		to_chat(H, span_green("Raising your team's flag!"))
		if(do_after(H, 5 SECONDS, src))
			to_chat(H, span_green("Flag raised!"))
			current_faction_holder = H.deployment_faction

			if(current_faction_holder == REBEL_DEPLOYMENT_FACTION)
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='userdanger'>The rebels are in control of the flag, take it down!</span>")
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='greentext big'>We are in control of the flag!</span>")
			if(current_faction_holder == COMBINE_DEPLOYMENT_FACTION)
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='userdanger'>The combine are in control of the flag, take it down!</span>")
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='greentext big'>We are in control of the flag!</span>")
		else
			to_chat(H, span_notice("The flag was not succesfully raised."))
	else
		to_chat(H, span_notice("Your team's flag is already raised."))

/obj/machinery/deployment_koth_flag/examine(mob/user)
	. = ..()
	. += span_notice("The rebels need to hold the flag for [(GLOB.deployment_rebels_flag_time_left)/10] seconds more in order to win.")
	. += span_notice("The combine need to hold the flag for [(GLOB.deployment_combine_flag_time_left)/10] seconds more in order to win.")

/obj/machinery/deployment_koth_flag/rebel_defend
	rebel_time = 7.5 MINUTES
	combine_time = 30 SECONDS
	grace_time = 1 MINUTES
	starting_faction = REBEL_DEPLOYMENT_FACTION
	alter_holder_respawn = TRUE
	grace_period_up_text = "<span class='reallybig'>The initial setup grace period is up, and the rebel flag is now capturable by the Combine.</span>"

/obj/effect/koth_grace_field
	name = "Grace Period Field"
	desc = "A strange field which stops anything from passing until a grace period has finished."
	icon_state = "m_shield"
	anchored = TRUE
	opacity = FALSE
	density = TRUE
	can_atmos_pass = ATMOS_PASS_DENSITY

/obj/effect/koth_grace_field/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/effect/koth_grace_field/process()
	if(SSticker.HasRoundStarted())
		if(GLOB.deployment_flag_grace_period < 1 SECONDS)
			STOP_PROCESSING(SSprocessing, src)
			qdel(src)
