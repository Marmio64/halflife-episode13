/obj/machinery/stabilizer
	name = "stabilizer"
	desc = "A piece of combine machinery which searches through combine networks to reformat corrupt data, eliminate viruses, and strengthen security in order to restore sociostability."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "destabilizer"
	anchored = TRUE
	var/stabilization_rate = 1
	var/stabilization_chance = 80

/obj/machinery/stabilizer/process(delta_time)
	if(prob(stabilization_chance))
		SSsociostability.modifystability(stabilization_rate) //Slowly increases stability
