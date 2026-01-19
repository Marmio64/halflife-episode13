/datum/quirk/cannibal
	name = "Cannibal"
	desc = "You can't get enough of the taste of raw flesh. Humans are what you first think of when thinking of a nice meal, but raw meat of any kind can do. In addition, the practice has made you much more resistant to diseases from eating raw meats."
	icon = FA_ICON_TEETH_OPEN
	value = 7
	mob_trait = TRAIT_CANNIBAL
	gain_text = "You crave the taste of flesh."
	lose_text = "Your flesh cravings subside."

/datum/quirk/cannibal/add(client/client_source)
	var/obj/item/organ/tongue/tongue = quirk_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(!tongue)
		return
	tongue.liked_foodtypes |= GORE
	tongue.liked_foodtypes |= RAW
	tongue.liked_foodtypes |= HUMAN
	tongue.disliked_foodtypes &= ~GORE
	tongue.disliked_foodtypes &= ~RAW
	tongue.disliked_foodtypes &= ~HUMAN

/datum/quirk/cannibal/remove()
	var/obj/item/organ/tongue/tongue = quirk_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(!tongue)
		return
	tongue.disliked_foodtypes |= ~GORE
	tongue.disliked_foodtypes |= ~RAW
	tongue.disliked_foodtypes |= ~HUMAN
	tongue.liked_foodtypes &= GORE
	tongue.liked_foodtypes &= RAW
	tongue.liked_foodtypes &= HUMAN
