/obj/structure/trap/deployment_spawn_prot
	name = "Spawn protection"
	desc = "Stay outta the enemy spawn!"
	icon_state = "trap"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/team = NO_FACTION
	time_between_triggers = 1
	anchored = TRUE
	alpha = 0

/obj/structure/trap/deployment_spawn_prot/examine(mob/user)
	return list()

/obj/structure/trap/deployment_spawn_prot/trap_effect(mob/living/living)
	if(living.deployment_faction != team)
		to_chat(living, span_bolddanger("Stay out of the enemy spawn!"))
		living.investigate_log("has died from entering the enemy spawn in CTF.", INVESTIGATE_DEATHS)
		living.apply_damage(300) //Damage instead of instant death so we trigger the damage signal.

/obj/structure/trap/deployment_spawn_prot/rebel
	team = REBEL_DEPLOYMENT_FACTION
	icon_state = "trap-fire"

/obj/structure/trap/deployment_spawn_prot/combine
	team = COMBINE_DEPLOYMENT_FACTION
	icon_state = "trap-frost"
