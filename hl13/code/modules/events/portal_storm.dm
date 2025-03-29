/datum/round_event_control/xen
	name = "Portal Storm: Xenian Creatures"
	typepath = /datum/round_event/portal_storm/xen
	weight = 2
	max_occurrences = 1
	min_players = 15
	earliest_start = 45 MINUTES
	description = "Zombies and antlions pour out of portals."

/datum/round_event/portal_storm/xen
	boss_types = list(/mob/living/basic/halflife/zombie/zombine = 2, /mob/living/simple_animal/hostile/halflife/zombie/poison = 1)
	hostile_types = list(/mob/living/basic/halflife/zombie = 6,\
						/mob/living/simple_animal/hostile/halflife/headcrab/poison = 2,\
						/mob/living/simple_animal/hostile/halflife/zombie/fast = 1,\
						/mob/living/simple_animal/hostile/halflife/antlion = 4,
						/mob/living/simple_animal/hostile/halflife/headcrab = 4)
