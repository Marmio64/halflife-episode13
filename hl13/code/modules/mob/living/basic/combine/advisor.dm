/mob/living/basic/halflife/advisor
	name = "Advisor"
	desc = "A great, grub-like creature covered in a bodysuit and artificial appendages. Your mind reels looking at this terrible thing."
	icon = 'hl13/icons/mob/halflife_large.dmi'
	icon_state = "advisor"
	icon_living = "advisor"
	icon_dead = "advisor_dead"
	faction = list(FACTION_COMBINE)
	movement_type = FLOATING
	maxHealth = 200
	health = 200
	obj_damage = 14
	melee_damage_lower = 20
	melee_damage_upper = 25
	sharpness = SHARP_POINTY
	armour_penetration = 15
	wound_bonus = -15
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'hl13/sound/creatures/hunter/hunter_skewer1.ogg'
	combat_mode = TRUE
	status_flags = CANPUSH
	speed = 0.25
	death_sound = 'hl13/sound/creatures/advisor/advisor_scream.ogg'
	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles
	initial_language_holder = /datum/language_holder/advisor

	deployment_faction = COMBINE_DEPLOYMENT_FACTION

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!
	lighting_cutoff_blue = 25
	lighting_cutoff = 8
	var/datum/action/cooldown/spell/list_target/telepathy/advisor/telepathy
	var/datum/action/cooldown/spell/aoe/repulse/wizard/advisor/repulse
	var/datum/action/cooldown/spell/pointed/advisorial_punish/punish
	var/datum/action/cooldown/spell/pointed/advisor_sooth/sooth

/mob/living/basic/halflife/advisor/Initialize(mapload)
	. = ..()
	telepathy = new(src)
	telepathy.Grant(src)
	repulse = new(src)
	repulse.Grant(src)
	punish = new(src)
	punish.Grant(src)
	sooth = new(src)
	sooth.Grant(src)

/mob/living/basic/halflife/advisor/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	adjust_health(-maxHealth*0.05) //10 health every 2 seconds

/datum/language_holder/advisor
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM))

/datum/action/cooldown/spell/list_target/telepathy/advisor
	desc = "Telepathically transmit a message to a target."
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	button_icon = 'hl13/icons/mob/actions/actions_advisor.dmi'
	button_icon_state = "telepathy"

/datum/action/cooldown/spell/aoe/repulse/wizard/advisor
	name = "Advisorial Repulse"
	desc = "Forcefully toss away nearby enemies through telepathic power."
	button_icon = 'hl13/icons/mob/actions/actions_advisor.dmi'
	button_icon_state = "repulse"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	invocation = null
	cooldown_time = 25 SECONDS
	aoe_radius = 3
	max_throw = 4
	cooldown_reduction_per_rank = 4 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	sound = 'hl13/sound/creatures/advisor/advisor_blast1.ogg'

/datum/action/cooldown/spell/pointed/advisorial_punish
	name = "Advisorial Punish"
	desc = "Subject a victim to terrible psionic attacks, breaking down their mind and making them weak and unable to fight effectively."
	button_icon = 'hl13/icons/mob/actions/actions_advisor.dmi'
	button_icon_state = "punish"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND
	ranged_mousepointer = 'icons/effects/mouse_pointers/blind_target.dmi'

	sound = 'hl13/sound/creatures/advisor/advisor_punish.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 12 SECONDS
	cooldown_reduction_per_rank = 6.25 SECONDS

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	active_msg = "You prepare to punish a target..."

	/// The amount of blurriness to apply
	var/eye_blur_duration = 10 SECONDS
	/// The amount of pain to apply
	var/temp_pain_amount = 150
	/// The amount of confusion to apply
	var/confusion_duration = 10 SECONDS
	/// The amount of stamina loss to apply
	var/stamina_damage = 40
	/// How long the stun duration should be
	var/stun_duration = 1.5 SECONDS

/datum/action/cooldown/spell/pointed/advisorial_punish/is_valid_target(atom/cast_on)
	. = ..()
	if(!.)
		return FALSE
	if(!ishuman(cast_on))
		return FALSE

	var/mob/living/carbon/human/human_target = cast_on
	return !human_target.is_blind()

/datum/action/cooldown/spell/pointed/advisorial_punish/cast(mob/living/carbon/human/cast_on)
	. = ..()

	to_chat(cast_on, span_warning("Your mind cries out in pain as a psionic wave washes over it!"))
	cast_on.throw_alert_text(/atom/movable/screen/alert/text/cry, "Your mind explodes in agony!", override = FALSE)
	cast_on.emote("scream")
	cast_on.set_eye_blur_if_lower(eye_blur_duration)
	cast_on.adjust_temppain(temp_pain_amount)
	cast_on.adjust_confusion(confusion_duration)
	cast_on.adjustStaminaLoss(stamina_damage)
	cast_on.Stun(stun_duration)
	return TRUE

/datum/action/cooldown/spell/pointed/advisor_sooth
	name = "Advisorial Sooth"
	desc = "Sooth a subjects mind through the power of psionic domination. Forces their brain and body to produce various chemicals to allow them to push through pain and injury, while also restoring a moderate amount of health."
	button_icon = 'hl13/icons/mob/actions/actions_advisor.dmi'
	button_icon_state = "sooth"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	sound = 'hl13/sound/creatures/advisor/advisor_sooth.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 10 SECONDS
	cooldown_reduction_per_rank = 6.25 SECONDS

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	active_msg = "You prepare to sooth a target..."

/datum/action/cooldown/spell/pointed/advisor_sooth/is_valid_target(atom/cast_on)
	. = ..()
	if(!.)
		return FALSE
	if(!isliving(cast_on))
		return FALSE

	return TRUE

/datum/action/cooldown/spell/pointed/advisor_sooth/cast(mob/living/cast_on)
	. = ..()

	to_chat(cast_on, span_boldnicegreen("An alien wave of psionic interference covers you, easing your pain!"))
	cast_on.throw_alert_text(/atom/movable/screen/alert/text/smallhappy, "You feel your pain melting away.", override = FALSE)
	if(ishuman(cast_on))
		var/mob/living/carbon/human/H = cast_on
		H.reagents.add_reagent(/datum/reagent/medicine/muscle_stimulant, 5)
	cast_on.adjustBruteLoss(-35)
	cast_on.adjustFireLoss(-35)
	return TRUE
