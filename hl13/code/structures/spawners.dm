/obj/structure/spawner/halflife/antlion
	name = "antlion den"
	desc = "A hole dug into the ground, allowing antlions to escape from."
	icon_state = "hole"
	max_integrity = 200
	max_mobs = 3
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	spawn_text = "crawls out of"
	mob_types = list(
		/mob/living/simple_animal/hostile/halflife/antlion/digsound,
	)
	faction = list(FACTION_ANTLION)

/obj/structure/spawner/halflife/antlion/small
	name = "small antlion den"
	max_integrity = 100
	max_mobs = 1

/obj/structure/spawner/halflife/antlion/small/worker
	mob_types = list(
		/mob/living/basic/halflife/antlion_worker,
	)

/obj/structure/spawner/halflife/headcrab
	name = "headcrab hole"
	desc = "A hole dug into the ground, allowing headcrabs to escape from."
	icon_state = "hole"
	max_integrity = 200
	max_mobs = 3
	icon = 'icons/mob/simple/lavaland/nest.dmi'
	spawn_text = "crawls out of"
	mob_types = list(
		/mob/living/simple_animal/hostile/halflife/headcrab,
	)
	faction = list(FACTION_HEADCRAB)
