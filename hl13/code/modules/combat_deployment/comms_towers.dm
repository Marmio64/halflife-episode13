
/obj/machinery/deployment_comms_tower
	name = "Comms Tower"
	desc = "A vital piece of instructure that ensures backup and supplies continues to come to this area."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "destabilizer"
	max_integrity = 1500
	anchored = TRUE
	density = TRUE
	var/last_scream = 0

/obj/machinery/deployment_comms_tower/combine
	name = "Combine Comms Tower"

/obj/machinery/deployment_comms_tower/rebel
	name = "Rebel Comms Tower"

/obj/machinery/deployment_comms_tower/combine/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = TRUE, attack_dir, armour_penetration = 0)
	. = ..()
	if(last_scream < world.time)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>Our comms tower is taking damage!</span>")
		last_scream = world.time + 600

/obj/machinery/deployment_comms_tower/rebel/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = TRUE, attack_dir, armour_penetration = 0)
	. = ..()
	if(last_scream < world.time)
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/H = X
			SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(H, "<span class='userdanger'>Our comms tower is taking damage!</span>")
		last_scream = world.time + 600

/obj/machinery/deployment_comms_tower/combine/deconstruct(disassembled = TRUE)
	priority_announce("Combine communication tower destroyed! The rebels have won!", "Lambda Priority Alert")
	SSticker.force_ending = FORCE_END_ROUND
	return PROCESS_KILL

/obj/machinery/deployment_comms_tower/rebel/deconstruct(disassembled = TRUE)
	priority_announce("Rebel communication tower destroyed. All dissenting individuals will be amputated.", "Overwatch Priority Alert")
	SSticker.force_ending = FORCE_END_ROUND
	return PROCESS_KILL
