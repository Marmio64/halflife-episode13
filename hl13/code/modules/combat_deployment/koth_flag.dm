GLOBAL_VAR_INIT(deployment_rebels_flag_time_left, 5 MINUTES)
GLOBAL_VAR_INIT(deployment_combine_flag_time_left, 5 MINUTES)

/obj/machinery/deployment_koth_flag
	name = "Central Flag"
	desc = "A towering flag which must be held by one side of the conflict for a total of 5 minutes to win. Click on it to start changing the flag to your side."
	icon = 'hl13/icons/obj/koth_flag.dmi'
	icon_state = "empty"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	pixel_x = -32
	plane = -2

	light_range = 5
	light_power = 1
	light_color = "#658cac"
	var/current_faction_holder = NO_FACTION

/obj/machinery/deployment_koth_flag/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)

/obj/machinery/deployment_koth_flag/process()
	for(var/turf/closed/wall/W in RANGE_TURFS(3, get_turf(src))) //no walling off the flag
		W.dismantle_wall()

	if(current_faction_holder == COMBINE_DEPLOYMENT_FACTION)
		icon_state = "combine"
		GLOB.deployment_combine_flag_time_left -= 1 SECONDS

		if(GLOB.deployment_combine_flag_time_left <= 0)
			priority_announce("Central flag under Overwatch Control. Amputate all dissenters.", "Overwatch Priority Alert")
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

		if(GLOB.deployment_rebels_flag_time_left <= 0)
			priority_announce("The flag is under control of Lambda now, long live the resistance!", "Lambda Priority Alert")
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
