/obj/item/grenade/empgrenade
	name = "MK5A3 EMP Grenade"
	desc = "A specialized combine grenade that was designed to combat hacked and stolen Combine machinery being repurposed by rebels. It has seen little success, as the EMP grenades themselves often end up getting stolen and used against the Combine."
	icon = 'hl13/icons/obj/grenade.dmi'
	icon_state = "emp"
	inhand_icon_state = "emp"
	det_time = 3.5 SECONDS

/obj/item/grenade/empgrenade/detonate(mob/living/lanced_by)
	. = ..()
	if(!.)
		return

	update_mob()
	empulse(src, 3, 6)
	qdel(src)
