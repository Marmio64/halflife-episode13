/datum/quirk/tunnelvision
	name = "Tunnel Vision"
	desc = "You have tunnel vision, and have a lower field of vision, limited to only 180 degrees infront of you."
	icon = FA_ICON_EYE_LOW_VISION
	value = -8
	medical_record_text = "The has a lack of peripheral vision."
	gain_text = "You have trouble seeing in your peripheral vision."
	lose_text = "You regain your peripheral vision."

/datum/quirk/tunnelvision/add(client/client_source)
	var/mob/living/carbon/human/human_owner = quirk_holder
	var/obj/item/organ/eyes/eyes = human_owner.get_organ_slot(ORGAN_SLOT_EYES)
	if (isnull(eyes))
		return

	eyes.native_fov = FOV_180_DEGREES

/datum/quirk/tunnelvision/remove()
	var/mob/living/carbon/human/human_owner = quirk_holder
	var/obj/item/organ/eyes/eyes = human_owner.get_organ_slot(ORGAN_SLOT_EYES)
	if (isnull(eyes))
		return

	eyes.native_fov = FOV_90_DEGREES
