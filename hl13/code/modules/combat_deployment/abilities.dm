/datum/action/cooldown/spell/conjure_item/medkit
	name = "Procure Medkit"
	desc = "Procures a medkit to heal someone or yourself with."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/reagent_containers/pill/patch/medkit
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/medkit/slow
	cooldown_time = 35 SECONDS

/datum/action/cooldown/spell/conjure_item/medkit/the_hidden
	desc = "Procures a medkit to heal someone or yourself with. Deletes the last one summoned if it is still available."
	cooldown_time = 20 SECONDS
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/sandbag
	name = "Procure Sandbag"
	desc = "Procures a sandbag to use for building defenses."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "sandbag"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 40 SECONDS
	item_type = /obj/item/stack/sheet/mineral/sandbags/three
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/tinbomb
	name = "Procure Tinbomb"
	desc = "Procures a cheap, homemade tinbomb explosive for tossing. Removes the prior tinbomb you summon if it is unused!"
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "tinbomb"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/grenade/halflife/tinbomb
	requires_hands = TRUE
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/grenade
	name = "Procure Grenade"
	desc = "Procures a MK3A2 grenade for tossing."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "grenade"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 80 SECONDS
	item_type = /obj/item/grenade/syndieminibomb/bouncer
	requires_hands = TRUE
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/grenade/random_timer
	name = "Procure Grenade"
	desc = "Procures a MK3A2 grenade for tossing. The timer is randomized, throw it right away!"

	item_type = /obj/item/grenade/syndieminibomb/bouncer/random_timer

/datum/action/cooldown/spell/conjure_item/grenade/random_timer/short_cooldown
	cooldown_time = 60 SECONDS

/datum/action/cooldown/spell/aoe/rally
	name = "Rally the Troops"
	desc = "Inspire your nearby allies and self to rally for battle! Increases their morale and pain resistance temporarily, while recovering most of their stamina and a small amount of health. Has a lengthy cooldown."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "sacredflame"
	sound = 'hl13/sound/effects/rally.ogg'
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	school = SCHOOL_EVOCATION
	cooldown_time = 150 SECONDS

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	aoe_radius = 9

	var/faction_buff = NO_FACTION

/datum/action/cooldown/spell/aoe/rally/get_things_to_cast_on(atom/center)
	var/list/things = list()
	for(var/mob/living/nearby_mob in view(aoe_radius, center))
		things += nearby_mob

	return things

/datum/action/cooldown/spell/aoe/rally/cast_on_thing_in_aoe(mob/living/victim, mob/living/caster)

	if(victim.deployment_faction != faction_buff)
		return

	victim.add_mood_event("rally", /datum/mood_event/rallied)
	victim.adjustStaminaLoss(-60)
	victim.adjustBruteLoss(-20)
	victim.adjustFireLoss(-20)

	if(victim != caster)
		to_chat(victim, span_boldnicegreen("You feel inspired to fight!"))
	else
		to_chat(victim, span_boldnicegreen("You let out a rallying cry!"))

	if(ishuman(victim))
		var/mob/living/carbon/human/H = victim
		H.reagents.add_reagent(/datum/reagent/medicine/muscle_stimulant, 8)

/datum/action/cooldown/spell/aoe/rally/combine
	button_icon_state = "rally_combine"
	faction_buff = COMBINE_DEPLOYMENT_FACTION

/datum/action/cooldown/spell/aoe/rally/rebel
	button_icon_state = "rally_rebel"
	faction_buff = REBEL_DEPLOYMENT_FACTION
