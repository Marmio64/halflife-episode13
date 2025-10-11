GLOBAL_LIST_EMPTY(dead_players_during_shift)
/mob/living/carbon/human/gib_animation()
	new /obj/effect/temp_visual/gib_animation(loc, dna.species.gib_anim)

/mob/living/carbon/human/spawn_gibs(drop_bitflags=NONE)
	if(flags_1 & HOLOGRAM_1)
		return
	if(drop_bitflags & DROP_BODYPARTS)
		new /obj/effect/gibspawner/human(drop_location(), src, get_static_viruses())
	else
		new /obj/effect/gibspawner/human/bodypartless(drop_location(), src, get_static_viruses())

/mob/living/carbon/human/spawn_dust(just_ash)
	if(just_ash)
		return ..()

	var/bone_type = /obj/effect/decal/remains/human
	if(isplasmaman(src))
		bone_type = /obj/effect/decal/remains/plasma

	var/obj/effect/decal/remains/human/bones = new bone_type(loc)
	bones.pixel_z = -6
	bones.pixel_w = rand(-1, 1)

/mob/living/carbon/human/death(gibbed)
	if(stat == DEAD)
		return
	stop_sound_channel(CHANNEL_HEARTBEAT)
	var/obj/item/organ/heart/human_heart = get_organ_slot(ORGAN_SLOT_HEART)
	human_heart?.beat = BEAT_NONE
	human_heart?.Stop()

	. = ..()

	if(HAS_TRAIT(src, TRAIT_TDMCAPTAIN))
		if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
			for(var/X in GLOB.deployment_rebel_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(H, "<span class='userdanger'>Our Cell Leader died, recover their body and revive them at a repair pod before their corpse is destroyed!</span>")
		if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(H, "<span class='userdanger'>Our Sectoral Commander died, recover their body and revive them at a repair pod before their corpse is destroyed!</span>")

	if(client && !HAS_TRAIT(src, TRAIT_SUICIDED) && !(client in GLOB.dead_players_during_shift))
		GLOB.dead_players_during_shift += client

		//HL13 EDIT START
		var/area/diedin_area = get_area(src)
		var/check_player_mob = mind && mind.name && mind.active
		var/isvalid_area_check = !diedin_area || !(diedin_area.area_flags & NO_DEATH_MESSAGE)

		if(check_player_mob)
			if(isvalid_area_check)
				SSsociostability.modifystability(-20) //Sociostability is reduced by 2% for any person's death, on top of the mindshield sociostability loss

			if(HAS_TRAIT(src, TRAIT_MINDSHIELD))
				SSsociostability.modifystability(-20) //If they were mindshielded, they were probably somewhat important.

	//HL13 EDIT END

	if(SSticker.HasRoundStarted())
		SSblackbox.ReportDeath(src)
		log_message("has died (BRUTE: [src.getBruteLoss()], BURN: [src.getFireLoss()], TOX: [src.getToxLoss()], OXY: [src.getOxyLoss()]", LOG_ATTACK)
		if(key) // Prevents log spamming of keyless mob deaths (like xenobio monkeys)
			investigate_log("has died at [loc_name(src)].<br>\
				BRUTE: [src.getBruteLoss()] BURN: [src.getFireLoss()] TOX: [src.getToxLoss()] OXY: [src.getOxyLoss()] STAM: [src.getStaminaLoss()]<br>\
				<b>Brain damage</b>: [src.get_organ_loss(ORGAN_SLOT_BRAIN) || "0"]<br>\
				<b>Blood volume</b>: [src.blood_volume]cl ([round((src.blood_volume / BLOOD_VOLUME_NORMAL) * 100, 0.1)]%)<br>\
				<b>Reagents</b>:<br>[reagents_readout()]", INVESTIGATE_DEATHS)
	to_chat(src, span_warning("You have died. Barring complete bodyloss, you can in most cases be revived by other players. If you do not wish to be brought back, use the \"Do Not Resuscitate\" verb in the ghost tab."))
	to_chat(src, span_warning("If you'd like to respawn, you can click 'Respawn' in the OOC tab in the top right once the timer has elapsed, so long as you have another character to play as.")) //hl13 edit

/mob/living/carbon/human/proc/reagents_readout()
	var/readout = "Blood:"
	for(var/datum/reagent/reagent in reagents?.reagent_list)
		readout += "<br>[round(reagent.volume, 0.001)] units of [reagent.name]"

	readout += "<br>Stomach:"
	var/obj/item/organ/stomach/belly = get_organ_slot(ORGAN_SLOT_STOMACH)
	for(var/datum/reagent/bile in belly?.reagents?.reagent_list)
		if(!belly.food_reagents[bile.type])
			readout += "<br>[round(bile.volume, 0.001)] units of [bile.name]"

	return readout

/mob/living/carbon/human/proc/makeSkeleton()
	ADD_TRAIT(src, TRAIT_DISFIGURED, TRAIT_GENERIC)
	set_species(/datum/species/skeleton)
	return TRUE

/mob/living/carbon/proc/Drain()
	become_husk(CHANGELING_DRAIN)
	ADD_TRAIT(src, TRAIT_BADDNA, CHANGELING_DRAIN)
	blood_volume = 0
	return TRUE
