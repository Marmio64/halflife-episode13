//antlion grub
/mob/living/simple_animal/halflife/grub
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
	maxHealth = 12
	health = 12
	wander = 0
	light_range = 2
	light_power = 1
	light_color = "#67ac65"
	minbodytemp = 0
	speed = -1
	loot = list(/obj/item/reagent_containers/pill/patch/grubnugget = 1, /obj/effect/decal/cleanable/insectguts = 1)
	can_be_held = TRUE
	held_state = "grub"
	death_sound = 'hl13/sound/creatures/grub/agrub_squish.ogg'
	density = FALSE
	//var/squish_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/grub/idle1.ogg','hl13/sound/creatures/grub/idle2.ogg', ,'hl13/sound/creatures/grub/idle3.ogg', ,'hl13/sound/creatures/grub/idle4.ogg')

/mob/living/simple_animal/halflife/grub/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(25))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

//commented out until i figure a way to make antlions not squash their own babies
/*
/mob/living/simple_animal/halflife/grub/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/squashable, \
		squash_chance = squish_chance, \
		squash_damage = 6, \
		squash_flags = SQUASHED_ALWAYS_IF_DEAD|SQUASHED_DONT_SQUASH_IN_CONTENTS, \
	)
*/
