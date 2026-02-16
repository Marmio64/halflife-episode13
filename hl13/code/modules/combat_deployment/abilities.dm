/datum/action/cooldown/spell/conjure_item/medkit
	name = "Procure Medkit"
	desc = "Procures a medkit to heal someone or yourself with."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 22 SECONDS
	item_type = /obj/item/reagent_containers/pill/patch/medkit
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/medkit/slow
	cooldown_time = 35 SECONDS

/datum/action/cooldown/spell/conjure_item/medkit/the_hidden
	desc = "Procures a medkit to heal someone or yourself with. Deletes the last one summoned if it is still available."
	cooldown_time = 20 SECONDS
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/medkit/the_hidden/faster
	cooldown_time = 15 SECONDS

/datum/action/cooldown/spell/conjure_item/sandbag
	name = "Procure Sandbag"
	desc = "Procures some sandbags to use for building defenses."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "sandbag"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 40 SECONDS
	item_type = /obj/item/stack/sheet/mineral/sandbags/three
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/razor_wire
	name = "Procure Razor Wire"
	desc = "Procures some razor wire to use for building defenses."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "razorwire"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 50 SECONDS
	item_type = /obj/item/stack/razorwire/small_stack
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/razor_wire/slow
	cooldown_time = 80 SECONDS

/datum/action/cooldown/spell/conjure_item/tinbomb
	name = "Procure Tinbomb"
	desc = "Procures a cheap, homemade tinbomb explosive for tossing. Removes the prior tinbomb you summon if it is unused!"
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "tinbomb"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 20 SECONDS
	item_type = /obj/item/grenade/halflife/tinbomb
	requires_hands = TRUE
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/rocket
	name = "Procure RPG Rocket"
	desc = "Procures a rocket for you to use in rocket launchers."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "rocket"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/ammo_casing/rocket/hl13
	requires_hands = TRUE
	delete_old = FALSE

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

	item_type = /obj/item/grenade/syndieminibomb/bouncer/random_timer/hidden

/datum/action/cooldown/spell/conjure_item/grenade/New(Target, original = TRUE) //starts on cooldown
	. = ..()
	StartCooldown()

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
	victim.adjustBruteLoss(-25)
	victim.adjustFireLoss(-25)

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

/datum/action/cooldown/mob_cooldown/talk_xen
	name = "Xen Communication"
	desc = "Speak with all fellow xenian creatures remotely."
	button_icon = 'icons/mob/actions/actions_revenant.dmi'
	button_icon_state = "discordant_whisper"
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	check_flags = AB_CHECK_CONSCIOUS
	cooldown_time = 0
	melee_cooldown_time = 0
	shared_cooldown = NONE
	click_to_activate = FALSE

/datum/action/cooldown/mob_cooldown/talk_xen/Activate(trigger_flags)
	var/input = tgui_input_text(owner, "Input a message to send to fellow Xenians.", "Command", max_length = MAX_MESSAGE_LEN)
	if(!input || QDELETED(src) || QDELETED(owner) || !IsAvailable(feedback = TRUE))
		return
	xen_communication(owner, input)
	StartCooldown()

/**
 * Sends a big message to all spiders from the target.
 *
 * Allows the user to send a message to all spiders that exist.  Ghosts will also see the message.
 * Arguments:
 * * user - The spider sending the message
 * * message - The message to be sent
 */
/datum/action/cooldown/mob_cooldown/talk_xen/proc/xen_communication(mob/living/user, message)
	var/my_message = format_message(user,message)
	for(var/X as anything in GLOB.deployment_xen_players)
		to_chat(X, my_message)
	for(var/ghost in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(ghost, user)
		to_chat(ghost, "[link] [my_message]")
	user.log_talk(message, LOG_SAY, tag = "xen communication")

/**
 * Formats the string to have an appropiate size and text color
 */
/datum/action/cooldown/mob_cooldown/talk_xen/proc/format_message(mob/living/user, message)
	return span_changeling("<b>Communication from [user]:</b> [message]")
