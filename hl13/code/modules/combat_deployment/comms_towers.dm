
/obj/machinery/deployment_comms_tower
	name = "Comms Tower"
	desc = "A vital piece of infrastructure that ensures backup and supplies continues to come to this area. It needs a wide berth to continue sending information, so it cannot be walled off. It appears to be particularly weak against melee attacks."
	icon = 'hl13/icons/obj/port/comm_tower2.dmi'
	icon_state = "comm_tower_on"
	max_integrity = 1500
	anchored = TRUE
	density = TRUE
	var/last_scream = 0

	light_range = 5
	light_power = 1
	light_color = "#658cac"
	armor_type = /datum/armor/deployment_comms_tower

/obj/machinery/deployment_comms_tower/ex_act(severity, target)
	if(QDELETED(src))
		return TRUE
	if(target == src)
		take_damage(rand(150, 240), BRUTE, BOMB, 0)
		return TRUE
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(150, 240), BRUTE, BOMB, 0)
		if(EXPLODE_HEAVY)
			take_damage(rand(60, 100), BRUTE, BOMB, 0)
		if(EXPLODE_LIGHT)
			take_damage(rand(10, 60), BRUTE, BOMB, 0)

	return TRUE

/datum/armor/deployment_comms_tower
	melee = -30 //the tower is generally surrounded by sandbags, so slight reward for being able to get so close.

/obj/machinery/deployment_comms_tower/combine
	name = "Combine Comms Tower"

/obj/machinery/deployment_comms_tower/rebel
	name = "Rebel Comms Tower"

/obj/machinery/deployment_comms_tower/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)

/obj/machinery/deployment_comms_tower/process()
	for(var/turf/closed/wall/W in RANGE_TURFS(3, get_turf(src))) //no walling off the tower
		W.dismantle_wall()

/obj/machinery/deployment_comms_tower/combine/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = TRUE, attack_dir, armour_penetration = 0)
	. = ..()
	if(last_scream < world.time)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>Our comms tower is taking damage!</span>")
		last_scream = world.time + 200

/obj/machinery/deployment_comms_tower/rebel/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = TRUE, attack_dir, armour_penetration = 0)
	. = ..()
	if(last_scream < world.time)
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>Our comms tower is taking damage!</span>")
		last_scream = world.time + 200

/obj/machinery/deployment_comms_tower/combine/deconstruct(disassembled = TRUE)
	priority_announce("Combine communication tower destroyed! The rebels have won!", "Lambda Priority Alert")
	GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
	SSticker.force_ending = FORCE_END_ROUND
	for(var/X in GLOB.deployment_rebel_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='greentext big'>We have destroyed the enemy's comms tower, we win!</span>")
	for(var/X in GLOB.deployment_combine_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='userdanger'>Our tower was destroyed, we have lost...</span>")
	return PROCESS_KILL

/obj/machinery/deployment_comms_tower/rebel/deconstruct(disassembled = TRUE)
	priority_announce("Rebel communication tower destroyed. All dissenting individuals will be amputated.", "Overwatch Priority Alert")
	GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
	SSticker.force_ending = FORCE_END_ROUND
	for(var/X in GLOB.deployment_rebel_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='userdanger'>Our tower was destroyed, we have lost...</span>")
	for(var/X in GLOB.deployment_combine_players)
		var/mob/living/carbon/human/H = X
		SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
		to_chat(H, "<span class='greentext big'>We have destroyed the enemy's comms tower, we win!</span>")
	return PROCESS_KILL

/obj/machinery/deployment_comms_tower/rebel/xen_defense/deconstruct(disassembled = TRUE)
	if(GLOB.deployment_win_team != REBEL_DEPLOYMENT_FACTION)
		priority_announce("Rebel communication tower destroyed... Let the feast begin.", "#!?@SDz..(% Priority Alert")
		GLOB.deployment_win_team = XEN_DEPLOYMENT_FACTION
		SSticker.force_ending = FORCE_END_ROUND
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='userdanger'>Our tower was destroyed, we have lost...</span>")
		for(var/X in GLOB.deployment_xen_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='greentext big'>We have destroyed the enemy's comms tower, we win!</span>")
	return PROCESS_KILL

/obj/machinery/deployment_comms_tower/rebel/xen_defense
	var/rebel_time = 10 MINUTES
	var/grace_time = 90 SECONDS

	var/grace_period_text = TRUE
	var/capturable = FALSE

/obj/machinery/deployment_comms_tower/rebel/xen_defense/Initialize(mapload)
	. = ..()
	GLOB.deployment_rebels_flag_time_left = rebel_time
	GLOB.deployment_flag_grace_period = grace_time

/obj/machinery/deployment_comms_tower/rebel/xen_defense/process()
	. = ..()
	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!capturable)
			capturable = TRUE
			if(grace_period_text)
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')
					to_chat(H, "<span class='greentext big'>The grace period is up, fight for your life and protect the Communications Tower!</span>")
				for(var/X in GLOB.deployment_xen_players)
					var/mob/living/carbon/human/H = X
					SEND_SOUND(H, 'hl13/sound/effects/siren.ogg')
					to_chat(H, "<span class='greentext big'>The grace period is up, kill the humans and destroy their Communications Tower!</span>")
	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS

	if(capturable)
		GLOB.deployment_rebels_flag_time_left -= 1 SECONDS

	if(GLOB.deployment_rebels_flag_time_left <= 0 && GLOB.deployment_win_team != XEN_DEPLOYMENT_FACTION)
		priority_announce("Reinforcements have arrived, long live the resistance!", "Lambda Priority Alert")
		GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
		SSticker.force_ending = FORCE_END_ROUND
		for(var/X in GLOB.deployment_xen_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='userdanger'>The rebels have survived long enough for reinforcements...</span>")
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/commstower_destroyed.ogg')
			to_chat(H, "<span class='greentext big'>We have survived long enough for reinforcements to arrive!</span>")
		return PROCESS_KILL

/obj/machinery/deployment_comms_tower/rebel/xen_defense/examine(mob/user)
	. = ..()
	. += span_notice("The rebels need to defend the tower for [(GLOB.deployment_rebels_flag_time_left)/10] more seconds in order to win.")
