/datum/action/cooldown/spell/conjure_item/medkit
	name = "Procure Medkit"
	desc = "Procures a medkit to heal someone or yourself with."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/reagent_containers/pill/patch/medkit
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/sandbag
	name = "Procure Sandbag"
	desc = "Procures a sandbag to use for building defenses."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "sandbag"

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 45 SECONDS
	item_type = /obj/item/stack/sheet/mineral/sandbags/three
	requires_hands = TRUE
	delete_old = FALSE
