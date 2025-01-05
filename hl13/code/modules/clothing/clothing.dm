/obj/item/clothing
	//var/list/species_restricted = null //Only these species can wear this kit.
	///These power suit vars are mainly for combine uniforms and the HEV suit
	///Is this a powered suit that requires recharging to be fully effective?
	var/powered_suit = FALSE
	///How much active armor power does this suit have?
	var/suit_power = 0
	///What is the max amount of active armor power this suit can have?
	var/max_suit_power = 0
	///Slowdown inflicted when the suit is out of power
	var/unpoweredslowdown = 0

//adjust power level for powered clothing items
/obj/item/clothing/proc/adjust_suitpower(change, damage)
	if(!powered_suit)
		return
	if(damage)
		suit_power -= change/4
	else
		suit_power += change
	if(suit_power > max_suit_power)
		suit_power = max_suit_power
	if(suit_power < 0)
		suit_power = 0

/*
//BS12: Species-restricted clothing check.
/obj/item/clothing/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	//if we can't equip the item anyway, don't bother with species_restricted (also cuts down on spam)
	if(!..())
		return FALSE
	// Skip species restriction checks on non-equipment slots
	if(slot in list(ITEM_SLOT_BACKPACK, ITEM_SLOT_LPOCKET, ITEM_SLOT_RPOCKET))
		return TRUE
	if(species_restricted && ishuman(M))
		var/wearable
		var/exclusive
		var/mob/living/carbon/human/H = M
		if("exclude" in species_restricted)
			exclusive = TRUE
		if(H.dna.species)
			if(exclusive)
				if(!(H.dna.species.id in species_restricted))
					wearable = TRUE
			else
				if(H.dna.species.id in species_restricted)
					wearable = TRUE
			if(!wearable)
				to_chat(M, span_warning("Your species cannot wear [src]."))
				return FALSE
	return TRUE
*/
