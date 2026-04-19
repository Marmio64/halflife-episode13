/obj/item/combine_tagger
	name = "Combine DB Tagger"
	desc = "A combine device that tags DBs of hostile xenian lifeforms and anticitizens, and increases the cargo budget in return. More dangerous targets are worth more. The more you clear out, the more resources you'll have at your disposal."
	icon = 'icons/obj/medical/syringe.dmi'
	inhand_icon_state = "sampler"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	icon_state = "sampler"
	item_flags = NOBLUDGEON

/obj/item/combine_tagger/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if (!isliving(interacting_with))
		return NONE

	if (tag_target(interacting_with, user))
		return ITEM_INTERACT_SUCCESS

	return ITEM_INTERACT_BLOCKING

/obj/item/combine_tagger/proc/tag_target(atom/target, mob/user)
	var/target_value = 35
	var/datum/bank_account/cargo_budget = SSeconomy.get_dep_account(ACCOUNT_CAR)

	if(HAS_TRAIT(target, TRAIT_COMBINE_TAGGED))
		to_chat(user, span_notice("Target has already been tagged."))
		return

	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.stat != DEAD)
			to_chat(user, span_notice("Humanoid data must be deceased for tagging."))
			return
		if(FACTION_COMBINE in human_target.faction)
			to_chat(user, span_notice("Humanoid data is not eligible for tagging."))
			return
		if(FACTION_REFUGEE in human_target.faction)
			to_chat(user, span_notice("Known anticitizen data detected."))
			target_value += 50
		if(isvortigaunt(human_target))
			to_chat(user, span_alert("Biotic data detected."))
			target_value += 50 //Adds on top of the standard value
		playsound(src, 'hl13/sound/effects/alyx_select.ogg', 30)
		balloon_alert(user, "db tagged")
		cargo_budget.adjust_money(target_value, "DB Tagged")
		ADD_TRAIT(human_target, TRAIT_COMBINE_TAGGED, TRAIT_GENERIC)
		return TRUE

	var/static/list/non_simple_animals = typecacheof(list(/mob/living/carbon/alien))
	if(!isanimal_or_basicmob(target) && !is_type_in_typecache(target, non_simple_animals) && !ismonkey(target))
		return

	var/mob/living/living_target = target

	if(living_target.stat != DEAD)
		to_chat(user, span_notice("Target data must be deceased for tagging."))
		return

	if(living_target.mob_biotypes & MOB_XENIAN)

		if(istype(target, /mob/living/basic/halflife/zombie/gonome) || istype(target, /mob/living/basic/halflife/antlion_guard))
			to_chat(user, span_notice("High-value Xenian data detected. Administering large bonus reward."))
			target_value = 250
		if(istype(target, /mob/living/basic/halflife/zombie/zombie_grunt) || istype(target, /mob/living/basic/halflife/zombie/zombine))
			to_chat(user, span_notice("Parasitized delegate data detected. Administering small bonus reward."))
			target_value = 40 //just a slight extra bonus for the flavor value of it
		if(istype(target, /mob/living/basic/halflife/headcrab) || istype(target, /mob/living/simple_animal/hostile/halflife/antlion) || istype(target, /mob/living/basic/halflife/antlion_worker) || istype(target, /mob/living/basic/halflife/grub))
			to_chat(user, span_notice("Low-value Xenian data detected."))
			target_value = 10 //antlions can be farmed and headcrabs are really easy to kill
		else
			to_chat(user, span_notice("Medium-value Xenian data detected."))

		playsound(src, 'hl13/sound/effects/alyx_select.ogg', 30)
		balloon_alert(user, "db tagged")
		cargo_budget.adjust_money(target_value, "DB Tagged")
		ADD_TRAIT(living_target, TRAIT_COMBINE_TAGGED, TRAIT_GENERIC)
		return TRUE
