//antlion grub
/mob/living/basic/halflife/grub
	name = "Antlion Grub"
	desc = "A large maggot filled with a green, glowing mass."
	icon = 'hl13/icons/mob/halflife.dmi'
	held_lh = 'icons/mob/inhands/animal_item_lefthand.dmi'
	held_rh = 'icons/mob/inhands/animal_item_righthand.dmi'
	icon_state = "grub"
	icon_living = "grub"
	icon_dead = "grub_dead"
	faction = list(FACTION_ANTLION)
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	mob_size = MOB_SIZE_SMALL
	maxHealth = 12
	health = 12
	light_range = 2
	light_power = 1
	light_color = "#67ac65"
	/// Loot this mob drops on death.
	var/list/loot = list(/obj/item/reagent_containers/pill/patch/grubnugget = 1, /obj/effect/decal/cleanable/insectguts = 1)
	can_be_held = TRUE
	held_state = "grub"
	death_sound = 'hl13/sound/creatures/grub/agrub_squish.ogg'
	density = FALSE
	//var/squish_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/grub/idle1.ogg','hl13/sound/creatures/grub/idle2.ogg', ,'hl13/sound/creatures/grub/idle3.ogg', ,'hl13/sound/creatures/grub/idle4.ogg')

	lighting_cutoff_green = 15
	lighting_cutoff = 35

	initial_language_holder = /datum/language_holder/zombie

/mob/living/basic/halflife/grub/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(25))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/basic/halflife/grub/Initialize(mapload)
	. = ..()
	if(LAZYLEN(loot))
		loot = string_list(loot)
		AddElement(/datum/element/death_drops, loot)

//commented out until i figure a way to make antlions not squash their own babies
/*
/mob/living/basic/halflife/grub/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/squashable, \
		squash_chance = squish_chance, \
		squash_damage = 6, \
		squash_flags = SQUASHED_ALWAYS_IF_DEAD|SQUASHED_DONT_SQUASH_IN_CONTENTS, \
	)
*/

/mob/living/basic/halflife/grub/deployment
	maxHealth = 25
	health = 25
	melee_damage_lower = 4
	melee_damage_upper = 8
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'hl13/sound/creatures/headcrabbite.ogg'
	faction = list(FACTION_ANTLION, FACTION_HEADCRAB)
	var/datum/action/cooldown/spell/conjure/antlions/deployment/antlions

/mob/living/basic/halflife/grub/deployment/Initialize(mapload)
	. = ..()
	antlions = new(src)
	antlions.Grant(src)

/datum/action/cooldown/spell/conjure/antlions/deployment
	name = "Call upon Antlions"
	desc = "Calls to Antlions deep in the ground, causing them to surface to protect you for a short while, or until they die."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "antlion"

	school = SCHOOL_CONJURATION
	cooldown_time = 10 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = NONE

	summon_amount = 2
	summon_lifespan = 30 SECONDS
	summon_radius = 2
	summon_type = list(/mob/living/simple_animal/hostile/halflife/antlion/digsound/zombie_faction)
