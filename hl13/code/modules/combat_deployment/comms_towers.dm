
/obj/machinery/deployment_comms_tower
	name = "Comms Tower"
	desc = "A vital piece of instructure that ensures backup and supplies continues to come to this area. It needs a wide berth to continue sending information, so it cannot be walled off. It appears to be particularly weak against melee attacks."
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
		take_damage(rand(150, 250), BRUTE, BOMB, 0)
		return TRUE
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(150, 250), BRUTE, BOMB, 0)
		if(EXPLODE_HEAVY)
			take_damage(rand(60, 120), BRUTE, BOMB, 0)
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
