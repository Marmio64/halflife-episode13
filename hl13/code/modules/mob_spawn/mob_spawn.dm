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
