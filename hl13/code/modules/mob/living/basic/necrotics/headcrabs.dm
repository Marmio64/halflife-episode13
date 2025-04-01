//leaping headcrabs
/mob/living/basic/halflife/headcrab
	name = "Headcrab"
	desc = "A parasitic headcrab."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	faction = list(FACTION_HEADCRAB)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 30
	health = 30
	obj_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 10
	wound_bonus = 0
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_BITE
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'hl13/sound/creatures/headcrabbite.ogg'
	combat_mode = TRUE
	speed = 1.5
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/headcrabdeath.ogg'

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!

	ai_controller = /datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/headcrab

/datum/action/cooldown/mob_cooldown/halflife/jump/headcrab
	sound_cue = 'hl13/sound/creatures/headcrableap.ogg'
	times_to_attack = 1

/mob/living/basic/halflife/headcrab/proc/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/jump/headcrab = BB_HALFLIFE_JUMP_ABILITY,
	)
	return innate_abilities

/mob/living/basic/halflife/headcrab/Initialize(mapload)
	. = ..()
	grant_actions_by_list(get_innate_abilities())


/mob/living/basic/halflife/headcrab/armored
	name = "Armored Headcrab"
	desc = "A parasitic headcrab with a hardened fungal carapace."
	icon_state = "armoredheadcrab"
	icon_living = "armoredheadcrab"
	icon_dead = "armoredheadcrab_dead"
	maxHealth = 60
	health = 60
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1, /obj/item/stack/sheet/animalhide/goliath_hide = 1)

/mob/living/basic/halflife/headcrab/poison
	name = "Poison Headcrab"
	desc = "An extra large and dark headcrab, with pronounced fangs."
	icon_state = "poisonheadcrab"
	icon_living = "poisonheadcrab"
	icon_dead = "poisonheadcrab_dead"
	maxHealth = 45
	health = 45

	death_sound = 'hl13/sound/creatures/poison/ph_death.ogg'
	attack_sound = 'hl13/sound/creatures/poison/ph_poisonbite.ogg'

	var/poison_type = /datum/reagent/toxin/headcrab_venom
	var/poison_per_bite = 5

	/// How tough is our bite?
	var/bite_injection_flags = NONE

	var/aggro_sound = 'hl13/sound/creatures/poison/ph_rattle.ogg'
	var/idle_sounds = list('hl13/sound/creatures/poison/ph_talk1.ogg', 'hl13/sound/creatures/poison/ph_talk2.ogg', 'hl13/sound/creatures/poison/ph_talk3.ogg')

/datum/action/cooldown/mob_cooldown/halflife/jump/headcrab/poison
	sound_cue = 'hl13/sound/creatures/poison/ph_scream.ogg'

/mob/living/basic/halflife/headcrab/poison/get_innate_abilities()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/halflife/jump/headcrab/poison = BB_HALFLIFE_JUMP_ABILITY,
	)
	return innate_abilities

/mob/living/basic/halflife/headcrab/poison/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(20))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/basic/halflife/headcrab/poison/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/venomous, poison_type, poison_per_bite, injection_flags = bite_injection_flags)


/////////AI STUFF/////////////////////

/datum/ai_controller/basic_controller/simple_hostile_obstacles/halflife/headcrab
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/targeted_mob_ability/headcrab_jump,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/ai_planning_subtree/targeted_mob_ability/headcrab_jump
	ability_key = BB_HALFLIFE_JUMP_ABILITY
