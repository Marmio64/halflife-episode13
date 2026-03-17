/datum/quirk/light_drinker
	name = "Teetotaler"
	desc = "You've always hated drinking alcohol. Your abstinence will make you get drunk quickly, and you just hate the taste of alcohol in general. Most importantly, you cannot let yourself get drunk."
	icon = FA_ICON_COCKTAIL
	value = -2
	mob_trait = TRAIT_TEETOTALER
	gain_text = span_notice("Just the thought of drinking alcohol makes your head spin.")
	lose_text = span_danger("You're no longer severely affected by alcohol.")
	medical_record_text = "Patient demonstrates a low tolerance for alcohol. (Wimp)"
	hardcore_value = 3
	mail_goodies = list(/obj/item/reagent_containers/cup/glass/waterbottle)

/datum/quirk/light_drinker/add(client/client_source)
	var/obj/item/organ/tongue/tongue = quirk_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(!tongue)
		return
	tongue.disliked_foodtypes |= ALCOHOL

/datum/quirk/light_drinker/remove()
	var/obj/item/organ/tongue/tongue = quirk_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(!tongue)
		return
	tongue.disliked_foodtypes &= ALCOHOL
