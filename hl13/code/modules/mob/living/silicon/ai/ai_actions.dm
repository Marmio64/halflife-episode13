/datum/action/innate/ai/ranged/stimulant_injection
	name = "Remote Anti-Fatigue Activation"
	desc = "Remotely activate stimulants in someone wearing a charged combine suit, making them less tired."
	button_icon_state = "antifatigue"
	enable_text = span_notice("You prepare to remotely activate stimulants. Click a human wearing a charged combine suit.")
	disable_text = span_notice("You disable injection protocols.")
	cooldown_period = 15 SECONDS

/datum/action/innate/ai/ranged/stimulant_injection/do_ability(mob/living/clicker, atom/clicked_on)
	if (!isAI(clicker))
		return FALSE

	if(!ishuman(clicked_on))
		to_chat(owner, span_warning("You can only use this on humans!"))
		return FALSE
	var/mob/living/carbon/human/H = clicked_on

	if (H.w_uniform)
		if(H.w_uniform.powered_suit && H.w_uniform.suit_power > 25)
			H.w_uniform.adjust_suitpower(100, TRUE)
			unset_ranged_ability(owner)
			H.reagents.add_reagent(/datum/reagent/antifatigue_rations, 15)
			to_chat(owner, span_notice("You succesfully inject stimulants into [H]."))
			to_chat(H, span_notice("Attention unit, Anti-Fatigue Rations are now at 15mg."))
		else
			to_chat(owner, span_warning("Their suit is not able to inject stimulants, possibly due to not having enough charge!"))
			return FALSE
	else
		to_chat(owner, span_warning("They are not wearing a suit!"))
		return FALSE

/datum/action/innate/ai/ranged/med_injection
	name = "Remote Medication Activation"
	desc = "Remotely activate stimulants in someone wearing a charged combine suit, healing them."
	button_icon_state = "healthstim"
	enable_text = span_notice("You prepare to remotely activate stimulants. Click a human wearing a charged combine suit.")
	disable_text = span_notice("You disable injection protocols.")
	cooldown_period = 15 SECONDS

/datum/action/innate/ai/ranged/med_injection/do_ability(mob/living/clicker, atom/clicked_on)
	if (!isAI(clicker))
		return FALSE

	if(!ishuman(clicked_on))
		to_chat(owner, span_warning("You can only use this on humans!"))
		return FALSE
	var/mob/living/carbon/human/H = clicked_on

	if (H.w_uniform)
		if(H.w_uniform.powered_suit && H.w_uniform.suit_power > 25)
			H.w_uniform.adjust_suitpower(100, TRUE)
			unset_ranged_ability(owner)
			H.reagents.add_reagent(/datum/reagent/medicine/morphine, 3)
			H.reagents.add_reagent(/datum/reagent/medicine/omnizine, 3)
			H.reagents.add_reagent(/datum/reagent/medicine/c2/libital, 1)
			to_chat(owner, span_notice("You succesfully inject medications into [H]."))
			to_chat(H, span_notice("Attention unit, Class A-3 Medication Stimulants deployed."))
		else
			to_chat(owner, span_warning("Their suit is not able to inject stimulants, possibly due to not having enough charge!"))
			return FALSE
	else
		to_chat(owner, span_warning("They are not wearing a suit!"))
		return FALSE

/datum/action/innate/ai/ranged/ration_sanction
	name = "Ration Sanction"
	desc = "Remotely sanction an individual, lowering the ration grade they'll receive during the next ration dispension."
	button_icon_state = "sanction"
	enable_text = span_notice("You prepare to sanction an individual.")
	disable_text = span_notice("You disable sanction protocols.")
	cooldown_period = 15 SECONDS

/datum/action/innate/ai/ranged/ration_sanction/do_ability(mob/living/clicker, atom/clicked_on)
	if (!isAI(clicker))
		return FALSE

	if(!ishuman(clicked_on))
		to_chat(owner, span_warning("You can only use this on humans!"))
		return FALSE
	var/mob/living/carbon/human/H = clicked_on

	if (H.get_idcard())
		var/obj/item/card/id/advanced/idcard = H.get_idcard()
		if(idcard.registered_account)
			var/sanction_to_apply = input(usr, "How many ration points should they be sanctioned? (Up to three)", "Ration Points to Deduct (0-3)") as null|num
			sanction_to_apply = clamp(sanction_to_apply, 0, 3)
			if(!sanction_to_apply)
				to_chat(owner, span_notice("All sanctions cleared from individual."))
				idcard.registered_account.sanctioned = 0
				return FALSE
			idcard.registered_account.sanctioned = sanction_to_apply
			to_chat(owner, span_notice("You succesfully sanction [H] by [sanction_to_apply] points."))
			to_chat(H, span_notice("Attention citizen, you have received [sanction_to_apply] Ration Sanction points. Your next meal quality has been reduced."))
		else
			to_chat(owner, span_warning("They don't have a citizen account record on their ID!"))
			return FALSE
	else
		to_chat(owner, span_warning("They have no ID to sanction!"))
		return FALSE
