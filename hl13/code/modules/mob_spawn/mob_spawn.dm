/obj/effect/mob_spawn/ghost_role/human/bunkeroperator
	name = "sleeping pod"
	desc = "Some strange, old machine."
	prompt_name = "bunker operator"
	icon = 'icons/obj/mining_zones/spawners.dmi'
	icon_state = "terrarium"
	you_are_text = "You are a bunker comms operator."
	flavour_text = "Whether you fled here during the early occupation years to hide from the Combine or were sent here to keep watch by one of many resistance groups from the Polish Free State to Lambda, you've been here for years now and only just recently picked up a signal on your radio..."
	spawner_job_path = /datum/job/bunkeroperator
	outfit = /datum/outfit/bunkeroperator

/obj/effect/mob_spawn/ghost_role/human/bunkeroperator/Initialize(mapload)
	. = ..()
	if(prob(50)) //only has a 50% chance of existing, otherwise it'll just be a NPC
		new /mob/living/basic/trooper/rebel/mp7/plf/service_rifle(get_turf(src))
		return INITIALIZE_HINT_QDEL

/obj/effect/mob_spawn/ghost_role/cityscanner
	name = "dormant city scanner"
	desc = "A dormant city scanner bot. You'll have to wait for an available Overwatch AI subsystem to take control of it."
	icon = 'hl13/icons/obj/machines.dmi'
	icon_state = "cityscanner"
	density = FALSE
	anchored = FALSE

	prompt_name = "city scanner"
	mob_type = /mob/living/silicon/robot/cityscanner
	mob_name = "city scanner"
	flavour_text = "Scan the city for possible anti-citizens and report anything you see over the radio. You can prefix your message with '.b' to talk with Dispatch."

	you_are_text = "You are a City Scanner, constructed by the combine."
	flavour_text = "Scan the city for possible anti-citizens and report anything you see over the radio. You can prefix your message with '.b' to talk with Dispatch."
	important_text = "You are a machine, loyal and unquestioning, act the part."

/*
/obj/effect/mob_spawn/ghost_role/cityscanner/attack_ai(mob/user)
	var/result = input(usr, "Do you want to turn this scanner into a shell usable by only you?", "Take over shell") in list("Yes", "No")
	if(result == "Yes" && loc)
		new /mob/living/silicon/robot/cityscanner/dispatch_shell(src)
		qdel(src)
*/

/obj/effect/mob_spawn/ghost_role/human/refugee
	name = "\improper Improvised sleeping bag"
	desc = "A body bag poked with holes, currently being used as a sleeping bag. Someone seems to be sleeping inside of it."
	density = FALSE
	you_are_text = "You're a refugee from outside the prison, looking to survive by tending the lands and looting abandoned buildings"
	flavour_text = "You're here to survive, and maybe help anyone you see if you so please."
	icon = 'icons/obj/medical/bodybag.dmi'
	spawner_job_path = /datum/job/refugee
	outfit = /datum/outfit/job/refugee/armed

/obj/effect/mob_spawn/ghost_role/human/refugee/Initialize(mapload)
	. = ..()
	if(prob(50)) //only has a 25% chance of existing
		return INITIALIZE_HINT_QDEL

/obj/effect/mob_spawn/ghost_role/human/caravan
	name = "sensory deprivation pod"
	desc = "A luxury sensory deprivation pod. Someone appears to be sleeping in it to de-stress from all the chaos of smuggler life... forcing them out seems bound for nothing but chaos, guess you can only hope they get out soon."
	density = FALSE
	you_are_text = "You are an agent of the Black Market, managing a caravan and its traders."
	flavour_text = "You were called using a hacked combine communications console, and offered a sum of credits to bring over a group of traders. You have no care to who boards your train, as long as they're a paying customer- just try to keep any combine away from the PLF recruiter in the back of the train. Earn money via selling items with your uplink and ensure nothing is stolen from your traders, or worse, any are killed."
	important_text = "You are not openly friendly nor hostile to any rebel group or even the combine, save for fellow Black Market agents. Additionally, do not abandon the train (and if the train has not launched maybe you shouldn't have picked this role, just try and wait)."
	icon = 'icons/obj/mining_zones/spawners.dmi'
	icon_state = "terrarium"
	spawner_job_path = /datum/antagonist/blackmarket
	outfit = /datum/outfit/caravan_manager