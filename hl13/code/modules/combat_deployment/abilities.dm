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

/datum/action/cooldown/spell/conjure_item/medkit/intruder
	name = "Procure Ration"
	desc = "Procures a ration to feed someone or yourself with. Deletes the last one summoned if it is still available."
	item_type = /obj/item/reagent_containers/pill/patch/medkit/ration
	cooldown_time = 30 SECONDS
	delete_old = TRUE
	sound = 'hl13/sound/effects/spawnration.ogg'
	sound_varies = FALSE

/datum/action/cooldown/spell/conjure_item/medkit/the_hidden
	desc = "Procures a medkit to heal someone or yourself with. Deletes the last one summoned if it is still available."
	item_type = /obj/item/reagent_containers/pill/patch/medkit/hidden
	cooldown_time = 20 SECONDS
	delete_old = TRUE

/datum/action/cooldown/spell/conjure_item/medkit/the_hidden/faster
	cooldown_time = 15 SECONDS

/datum/action/cooldown/spell/conjure_item/bloodloss
	name = "Procure Bloodloss Shot"
	desc = "Procures a anti-bloodloss shot to heal someone or yourself with."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "bloodloss"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 45 SECONDS
	item_type = /obj/item/reagent_containers/hypospray/medipen/blood
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/bloodloss/slow
	cooldown_time = 80 SECONDS

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

/datum/action/cooldown/spell/conjure_item/construction_voucher
	name = "Procure Construction Token Voucher"
	desc = "Procures a voucher that can be redeemed in your engineering radio in order to purchase engineering supplies."
	button_icon = 'hl13/icons/obj/misc_items.dmi'
	button_icon_state = "certificate"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 100 SECONDS
	item_type = /obj/item/construction_token
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/construction_voucher/slow
	cooldown_time = 140 SECONDS

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
	cooldown_time = 15 SECONDS
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
	cooldown_time = 24 SECONDS
	item_type = /obj/item/ammo_casing/rocket/hl13
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/svd_ammo
	name = "Procure SVD Dragunov Magazine"
	desc = "Procures a magazine for you to use in your sniper rifle."
	button_icon = 'hl13/icons/obj/guns/ammo.dmi'
	button_icon_state = "m308small"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 30 SECONDS
	item_type = /obj/item/ammo_box/magazine/svd
	requires_hands = TRUE
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/svd_ammo/fast
	cooldown_time = 12 SECONDS

/datum/action/cooldown/spell/conjure_item/overseer_viscerator
	name = "Procure Shielded Viscerator"
	desc = "Procures a deployable, shielded viscerator."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "viscerator"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/grenade/spawnergrenade/manhacks/shielded
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

/datum/action/cooldown/spell/conjure_item/grenade/incendiary
	name = "Procure Incendiary Grenade"
	desc = "Procures a incendiary grenade for tossing. Deletes the old one if it is not used."
	item_type = /obj/item/grenade/incendiary_grenade
	cooldown_time = 25 SECONDS


/datum/action/cooldown/spell/aoe/rally
	name = "Rally the Troops"
	desc = "Inspire your nearby allies and self to rally for battle! Increases their morale and pain resistance temporarily, while recovering most of their stamina and a small amount of health. Has a lengthy cooldown."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "sacredflame"
	sound = 'hl13/sound/effects/rally.ogg'
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	school = SCHOOL_EVOCATION
	cooldown_time = 110 SECONDS

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	aoe_radius = 9

	var/faction_buff = NO_FACTION
	var/physical_heal = -30

/datum/action/cooldown/spell/aoe/rally/get_things_to_cast_on(atom/center)
	var/list/things = list()
	for(var/mob/living/nearby_mob in view(aoe_radius, center))
		things += nearby_mob

	return things

/datum/action/cooldown/spell/aoe/rally/cast_on_thing_in_aoe(mob/living/victim, mob/living/caster)

	if(victim.deployment_faction != faction_buff || victim.stat == DEAD)
		return

	victim.add_mood_event("rally", /datum/mood_event/rallied)
	victim.adjustStaminaLoss(-60)
	victim.adjustBruteLoss(physical_heal)
	victim.adjustFireLoss(physical_heal)
	victim.adjustOxyLoss(physical_heal)
	victim.set_eye_blur_if_lower(-6 SECONDS)
	victim.adjust_confusion(-6 SECONDS)
	victim.AdjustImmobilized(-3 SECONDS)
	victim.AdjustStun(-3 SECONDS)

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
	cooldown_time = 75 SECONDS // cell leaders and lieutenants are more charismatic than the evil bine commanders
	physical_heal = -50

/datum/action/cooldown/spell/aoe/rally/rebel/short
	cooldown_time = 45 SECONDS

/datum/action/cooldown/spell/revive_tdmlead
	name = "Revive"
	desc = "You have had advanced micromachines known as nanites surgically implanted into you, whether combine given or stolen and modified, that are capable of slowly reviving you after death if you are left alone for two minutes."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "revive"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	check_flags = NONE
	cooldown_time = 0 //no cooldown to the ability
	var/actual_cooldown = 2 MINUTES //cooldown applied when revived
	var/reviving = FALSE
	var/revive_timer

/datum/action/cooldown/spell/revive_tdmlead/cast(mob/living/user)
	. = ..()
	if(!isliving(user))
		return
	if(user.stat != DEAD)
		to_chat(user, span_notice("We aren't dead enough to do that yet!"))
		return
	var/mob/living/L = user
	reviving = !reviving
	if(reviving)
		to_chat(L, span_notice("Our nanites begin to revive us... this will take 2 minutes."))
		deltimer(revive_timer)
		revive_timer = addtimer(CALLBACK(src, PROC_REF(revive), L), 2 MINUTES, TIMER_UNIQUE | TIMER_STOPPABLE)
	else
		to_chat(L, span_notice("We are already reviving."))
		return

/datum/action/cooldown/spell/revive_tdmlead/proc/revive(mob/living/carbon/user)
	if(user.stat != DEAD) //if they revive before it goes off
		return
	if(!iscarbon(user))
		return
	StartCooldownSelf(actual_cooldown)//start the cooldown when the revive actually happens
	user.fully_heal(ADMIN_HEAL_ALL)
	user.revive()

	user.visible_message(span_warning("[user] jolts awake from death!"), span_notice("We get back up."))

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

/datum/action/cooldown/spell/conjure_item/missile_targeter_general
	name = "Procure Missile Targeter"
	desc = "Procures a missile targeter, for sending down a missile strike on a location. Only ONE can be active at once."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "radio"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 25 SECONDS
	item_type = /obj/item/halflife/missile_targeter/missile_targeter_general
	requires_hands = TRUE

/datum/action/cooldown/spell/conjure/boss_rebel_soldier
	name = "Call upon MP7 Allies"
	desc = "Call upon soldiers of the Polish Free State. Armed with MP7s, they will back you up with their life, but will eventually despawn after about a minute."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "mp7"

	sound = 'hl13/sound/effects/rally.ogg'

	school = SCHOOL_CONJURATION
	cooldown_time = 15 SECONDS

	invocation_type = INVOCATION_SHOUT
	invocation = "COMRADES, TO ME!"
	spell_requirements = NONE

	summon_amount = 2
	summon_lifespan = 65 SECONDS
	summon_radius = 1
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/plf/boss)

/datum/action/cooldown/spell/conjure/boss_rebel_soldier/blu
	desc = "Call upon soldiers of the Benefactor's Loyal Unionists. Armed with MP7s, they will back you up with their life, but will eventually despawn after about a minute."
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/plf/boss/blu)

/datum/action/cooldown/spell/conjure/boss_rebel_soldier/red
	desc = "Call upon soldiers of the Rebellious Expert Demolitionists. Armed with MP7s, they will back you up with their life, but will eventually despawn after about a minute."
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/plf/boss/red)

/datum/action/cooldown/spell/conjure/boss_veteran
	name = "Summon PLF Veteran"
	desc = "Have a PLF Veteran teleported directly to you, using experimental Lambda teleportation technology. They'll stay forever, and are very durable and powerful. However, the cooldown is very long and they move very slowly!"
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "ak47"

	sound = 'hl13/sound/effects/rally.ogg'

	school = SCHOOL_CONJURATION
	cooldown_time = 150 SECONDS

	invocation_type = INVOCATION_SHOUT
	invocation = "POLAND IS NOT YET DEAD!!"
	spell_requirements = NONE

	summon_amount = 1
	summon_radius = 1
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/veteran/boss)

/datum/action/cooldown/spell/conjure/boss_veteran/blu
	desc = "Have a BLU Veteran teleported directly to you, using experimental Lambda teleportation technology. They'll stay forever, and are very durable and powerful. However, the cooldown is very long and they move very slowly!"
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/veteran/boss/blu)

/datum/action/cooldown/spell/conjure/boss_veteran/red
	desc = "Have a RED Veteran teleported directly to you, using experimental Lambda teleportation technology. They'll stay forever, and are very durable and powerful. However, the cooldown is very long and they move very slowly!"
	summon_type = list(/mob/living/basic/trooper/rebel/mp7/veteran/boss/red)

/datum/action/cooldown/spell/summonitem/plf_general
	name = "Instant Summon Teleportation"
	desc = "This spell can be used to teleport back a previously marked item to your hand from anywhere in the universe."
	button_icon_state = "summons"

	cooldown_time = 12 SECONDS

	invocation = null
	invocation_type = INVOCATION_NONE

/datum/action/cooldown/spell/squad_alert
	name = "Squad Alert"
	desc = "You have had advanced micromachines known as nanites surgically implanted into you, which when activated will transmit a recording of your last moments to Overwatch in order to raise an alert. It will take them a few seconds to review the footage, however."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "revive"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	check_flags = NONE
	cooldown_time = 0
	var/can_report = TRUE
	var/transmitting = FALSE
	var/transmission_timer

/datum/action/cooldown/spell/squad_alert/cast(mob/living/user)
	. = ..()
	if(!can_report || GLOB.alert_cooldown >= 1 SECONDS) //cant go into alert while already on alert
		return
	if(!isliving(user))
		return
	if(user.stat != DEAD)
		to_chat(user, span_notice("We aren't dead enough to do that yet!"))
		return
	var/mob/living/L = user
	transmitting = !transmitting
	if(transmitting)
		to_chat(L, span_notice("Alert will be raised in 5 seconds."))
		deltimer(transmission_timer)
		transmission_timer = addtimer(CALLBACK(src, PROC_REF(squadalert), L), 5 SECONDS, TIMER_UNIQUE | TIMER_STOPPABLE)
	else
		to_chat(L, span_notice("The alert is already being raised."))
		return

/datum/action/cooldown/spell/squad_alert/proc/squadalert(mob/living/carbon/user)
	can_report = FALSE //cant do it again
	GLOB.alert_phases++
	user.do_alert_animation()
	playsound(user.loc, 'hl13/sound/effects/alert.ogg', 50, FALSE, -5)
	to_chat(user, span_notice("Alert phase has been activated and will end in one minute."))

/datum/action/cooldown/spell/recharge_lights
	name = "Recharge Flashlights"
	desc = "Procure a few spare batteries and give them out to everyone within 2 tiles of you."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "charge"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	check_flags = NONE
	cooldown_time = 60 SECONDS //if you stay by your leader for the entire round, you shouldn't run out of battery.

/datum/action/cooldown/spell/recharge_lights/cast(mob/living/user)
	. = ..()
	for(var/mob/living/carbon/human/H in range(2, user))
		if(HAS_TRAIT(H, TRAIT_THE_INTRUDER))
			continue //no recharges for snake if he steals a flashlight for some reason
		for(var/obj/item/flashlight/seclite/guard/L in H.get_all_gear())
			L.fuel = 60 SECONDS
	user.visible_message(span_notice("[user] begins to pass out batteries for all carried flashlights in a 2 tile radius."))

/datum/action/cooldown/spell/touch/holdup
	name = "Ready Hold-up"
	desc = "Ready a hand to perform a hold-up. While behind an enemy and holding any kind of weapon in your offhand, perform a hold-up that freezes them for a short time and can provide you with extra loot after two seconds. Doesn't work in alert."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "knife"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	hand_path = /obj/item/melee/touch_attack/holdup

	spell_requirements = NONE
	invocation_type = INVOCATION_NONE
	check_flags = NONE
	cooldown_time = 17 SECONDS

	var/armed = FALSE

/obj/item/melee/touch_attack/holdup
	name = "Free Hand"
	desc = "Your hand. It's ready for a hold-up."
	icon_state = "greyscale"
	inhand_icon_state = null
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'

/datum/action/cooldown/spell/touch/holdup/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/human/caster)

	if(!ishuman(victim))
		return FALSE
	var/mob/living/carbon/human/human_victim = victim

	if(human_victim.stat == DEAD)
		caster.balloon_alert(caster, "can't hold-up the dead!")
		return FALSE

	if(human_victim.deployment_faction != COMBINE_DEPLOYMENT_FACTION)
		caster.balloon_alert(caster, "can't hold-up allies!")
		return FALSE

	if(GLOB.alert_cooldown > 0 SECONDS)
		caster.balloon_alert(caster, "can't hold-up during an alert!")
		return FALSE

	if(!istype(caster.get_inactive_held_item(), /obj/item/gun) && !istype(caster.get_inactive_held_item(), /obj/item/knife))
		caster.balloon_alert(caster, "no weapon equipped!")
		return FALSE

	if(!check_behind(caster, human_victim))
		caster.balloon_alert(caster, "not behind enemy!")
		return FALSE

	//finally after all that we can actually perform a hold up.
	caster.say("#Freeze!")
	SEND_SOUND(caster, sound('hl13/sound/voice/solid/snakefreeze.ogg'))
	SEND_SOUND(human_victim, sound('hl13/sound/voice/solid/snakefreeze.ogg'))
	human_victim.drop_all_held_items() //no alerting
	human_victim.Immobilize(7 SECONDS)
	human_victim.Stun(7 SECONDS)
	human_victim.set_silence_if_lower(7 SECONDS)
	to_chat(human_victim, span_danger("You suddenly feel a weapon behind you and you freeze up in fear! Someone begins to search your pockets!"))
	to_chat(caster, span_notice("You begin to search [human_victim]'s pockets."))
	if(do_after(caster, 2 SECONDS, human_victim))
		new /obj/effect/spawner/random/halflife/loot/intruder/crab/rare/guaranteed(human_victim.loc)
		to_chat(caster, span_notice("Something falls out of one of [human_victim]'s pockets!"))
		to_chat(human_victim, span_warning("Something falls out of one of your pockets!"))
		SEND_SOUND(caster, sound('hl13/sound/effects/spawnration.ogg'))
		SEND_SOUND(human_victim, sound('hl13/sound/effects/spawnration.ogg'))
	else
		to_chat(caster, span_warning("You fail to find anything useful. Maybe look a little harder next time?"))
	return TRUE

