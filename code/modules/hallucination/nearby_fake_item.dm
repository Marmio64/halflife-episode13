/// A hallucination that delivers the illusion that someone nearby has pulled out a weapon or item.
/datum/hallucination/nearby_fake_item
	abstract_hallucination_parent = /datum/hallucination/nearby_fake_item
	random_hallucination_weight = 1

	/// The icon file to draw from for left hand icons
	var/left_hand_file
	/// The icon file to draw from for right hand icons
	var/right_hand_file
	/// The icon state of the files to make the image from
	var/image_icon_state
	/// The image we actually generate
	var/image/generated_image

/datum/hallucination/nearby_fake_item/Destroy()
	if(generated_image)
		hallucinator.client?.images -= generated_image
		generated_image = null
	return ..()

/datum/hallucination/nearby_fake_item/start()
	// This hallucination is purely visual, so we don't need to bother for clientless mobs
	if(!hallucinator.client)
		return FALSE

	var/list/mob_pool = list()
	for(var/mob/living/carbon/human/nearby_mob in view(7, hallucinator))
		if(nearby_mob == hallucinator)
			continue
		mob_pool += nearby_mob

	if(!length(mob_pool))
		return FALSE

	var/mob/living/carbon/human/who_has_the_item = pick(mob_pool)
	feedback_details += "Mob: [who_has_the_item.real_name]"

	if(who_has_the_item.get_empty_held_index_for_side(LEFT_HANDS))
		generated_image = generate_fake_image(who_has_the_item, file = left_hand_file)

	else if(who_has_the_item.get_empty_held_index_for_side(RIGHT_HANDS))
		generated_image = generate_fake_image(who_has_the_item, file = right_hand_file)

	if(generated_image)
		hallucinator.client?.images += generated_image
		addtimer(CALLBACK(src, PROC_REF(remove_image), who_has_the_item), rand(15 SECONDS, 25 SECONDS))
		return TRUE

	return FALSE

/// Generates the image with the given file on the passed mob.
/datum/hallucination/nearby_fake_item/proc/generate_fake_image(mob/living/carbon/human/holder, file)
	return image(file, holder, image_icon_state, layer = ABOVE_MOB_LAYER)

/// Remove the image when all's said and done.
/datum/hallucination/nearby_fake_item/proc/remove_image(mob/living/carbon/human/holder)
	if(QDELETED(src) || QDELETED(hallucinator) || !generated_image)
		return

	hallucinator.client?.images -= generated_image
	generated_image = null
	qdel(src)

/datum/hallucination/nearby_fake_item/baton
	left_hand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	right_hand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	image_icon_state = "baton"

/datum/hallucination/nearby_fake_item/baton/generate_fake_image(mob/living/carbon/human/holder, file)
	hallucinator.playsound_local(get_turf(holder), SFX_SPARKS, 75, TRUE, -1)
	return ..()

/datum/hallucination/nearby_fake_item/flash
	left_hand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	right_hand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	image_icon_state = "flashtool"

/datum/hallucination/nearby_fake_item/flash/generate_fake_image(mob/living/carbon/human/holder, file)
	hallucinator.playsound_local(get_turf(holder), 'sound/items/handling/component_pickup.ogg', 35, vary = FALSE)
	return ..()

/datum/hallucination/nearby_fake_item/flash/remove_image(mob/living/carbon/human/holder)
	if(!QDELETED(holder))
		hallucinator.playsound_local(get_turf(holder), 'sound/items/handling/component_drop.ogg', 35, vary = FALSE)
	return ..()

/datum/hallucination/nearby_fake_item/armblade
	left_hand_file = 'icons/mob/inhands/antag/changeling_lefthand.dmi'
	right_hand_file = 'icons/mob/inhands/antag/changeling_righthand.dmi'
	image_icon_state = "arm_blade"

/datum/hallucination/nearby_fake_item/armblade/generate_fake_image(mob/living/carbon/human/holder, file)
	hallucinator.playsound_local(get_turf(holder), 'sound/effects/blob/blobattack.ogg', 35, TRUE)
	return ..()

/datum/hallucination/nearby_fake_item/armblade/remove_image(mob/living/carbon/human/holder)
	if(!QDELETED(holder))
		hallucinator.playsound_local(get_turf(holder), 'sound/effects/blob/blobattack.ogg', 35, TRUE)
	return ..()

/datum/hallucination/nearby_fake_item/colt
	left_hand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	right_hand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'
	image_icon_state = "colt_python"
