GLOBAL_LIST_EMPTY(new_spawns)

/obj/effect/new_spawn
	name = "new spawn"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = OBJ_LAYER
	plane = GAME_PLANE
	invisibility = INVISIBILITY_MAXIMUM
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/team = NO_FACTION
	var/spawnid = 0 //both factions can share a spawnid if you want them to both change at the same time

/obj/effect/new_spawn/Initialize(mapload)
	.=..()
	GLOB.new_spawns += src

/obj/effect/new_spawn/rebel
	team = REBEL_DEPLOYMENT_FACTION

/obj/effect/new_spawn/combine
	team = COMBINE_DEPLOYMENT_FACTION

/proc/check_spawns(var/id = 0, var/rebels = TRUE, var/combine = TRUE) //id is the spawnid you want to check for, rebels and combine decide which team's spawns you are changing (or if it's both). by default you are changing both spawns
	if(rebels)
		GLOB.deployments_refugee = list()
	if(combine)
		GLOB.deployments_metrocop = list()
	for(var/obj/effect/new_spawn/S in GLOB.new_spawns)
		if(S.spawnid == id)
			if(rebels)
				if(S.team == REBEL_DEPLOYMENT_FACTION)
					GLOB.deployments_refugee += S.loc
			if(combine)
				if(S.team == COMBINE_DEPLOYMENT_FACTION)
					GLOB.deployments_metrocop += S.loc

/obj/machinery/example_objective //for testing originally but you can use it as an example of how to use this
	name = "the objective"
	desc = "cap this"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "quotaterminal"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE
	var/spawnid = 0
	var/complete = FALSE

/obj/machinery/example_objective/interact(mob/living/carbon/human/user)
	.=..()
	if(!complete)
		if(do_after(user, 5 SECONDS, src))
			complete = TRUE
			check_spawns(spawnid, TRUE, TRUE)
			say("Objective completed. Spawns should be changed now.")
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
		else
			say("Dumbass.")
			playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
	else
		say("Moron.")
		playsound(src, 'hl13/sound/effects/radio2.ogg', 15, TRUE, extrarange = 3)
