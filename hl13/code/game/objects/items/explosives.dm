/obj/item/grenade/syndieminibomb/bouncer
	name = "MK3A2 Grenade"
	desc = "Called a 'Bouncer' or 'Extractor' by Combine teams, these grenades are designed for flushing out enemy combatants via shrapnel, and a powerful though short ranged explosion."
	icon = 'hl13/icons/obj/grenade.dmi'
	icon_state = "bouncer"
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 2
	det_time = 35
	ex_dev = 0
	ex_heavy = 2
	ex_light = 3
	ex_flame = 0

/obj/item/grenade/stingbang/halflife
	name = "stinger grenade"
	desc = "A less-lethal grenade filled with rubber pellets. Useful for dispersing crowds."
	icon = 'hl13/icons/obj/grenade.dmi'
	icon_state = "stinger"

/obj/item/grenade/halflife/tinbomb
	name = "Tinbomb"
	desc = "A scrap metal tin housing an explosive propellant and a bunch of shrapnel. The explosion isn't too strong, but it does send a decent amount of shrapnel flying."
	icon = 'hl13/icons/obj/throwables/grenades_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/grenades_inhand_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/grenades_inhand_right.dmi'
	icon_state = "tinbomb"
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 2
	det_time = 35
	ex_dev = 0
	ex_heavy = 0
	ex_light = 2
	ex_flame = 0

/obj/item/grenade/halflife/tinbomb/detonate(mob/living/lanced_by)
	. = ..()
	if(!.)
		return

	update_mob()
	qdel(src)

/obj/item/grenade/halflife/molotov
	name = "molotov cocktail"
	desc = "The firestarters best friend, a very simple grenade consisting of a rag and a bottle of alcohol. Light those suckers up."
	icon = 'hl13/icons/obj/throwables/grenades_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/grenades_inhand_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/grenades_inhand_right.dmi'
	icon_state = "molotov"
	throwforce = 10
	throw_speed = 1.5
	w_class = WEIGHT_CLASS_NORMAL //Kind of weird but I don't want people running around with pocket molotovs - Hekzder
	var/extra_POWER // Used for scaling flame power based on alcoholpwr. This number, usually 0-100, will be divided by 75 to get the flame radius.
	var/arm_sound = 'sound/items/tools/welder.ogg'

/obj/item/grenade/halflife/molotov/Initialize()
	. = ..()
	det_time = rand(30,60) //3-6 seconds

/obj/item/grenade/halflife/molotov/attackby(obj/item/I, mob/user, params)
	if(I.get_temperature() && !active)
		arm_grenade()
		to_chat(user, "<span class='info'>You light [src] on fire.</span>")
		return

/obj/item/grenade/halflife/molotov/attack_self(mob/user)
	return //lighting only

/obj/item/grenade/halflife/molotov/arm_grenade(mob/user, delayoverride, msg = TRUE, volume = 60)
	var/turf/T = get_turf(src)
	log_grenade(user, T) //Inbuilt admin procs already handle null users
	if(user)
		add_fingerprint(user)
		if(msg)
			to_chat(user, "<span class='warning'>You prime [src]! [capitalize(DisplayTimeText(det_time))]!</span>")
	if(shrapnel_type && shrapnel_radius)
		shrapnel_initialized = TRUE
		AddComponent(/datum/component/pellet_cloud, projectile_type=shrapnel_type, magnitude=shrapnel_radius)
	playsound(src, arm_sound, volume, TRUE)
	active = TRUE
	icon_state = icon_state + "_active"
	inhand_icon_state = icon_state
	SEND_SIGNAL(src, COMSIG_GRENADE_ARMED, det_time, delayoverride)
	addtimer(CALLBACK(src, PROC_REF(detonate)), isnull(delayoverride)? det_time : delayoverride)
	update_icon()

/obj/item/grenade/halflife/molotov/detonate(mob/living/lanced_by)
	playsound(loc, 'sound/effects/hit_on_shattered_glass.ogg', 35, TRUE, 4)
	flame_radius(extra_POWER, get_turf(src))
	playsound(loc, 'hl13/sound/halflifeeffects/explosion_fire_grenade.ogg', 30, TRUE, 4)
	qdel(src)

/obj/item/grenade/halflife/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(istype(loc, /turf/open/openspace))
		return
	if(!. && active)
		detonate()
	else
		playsound(src, "shatter", 70, TRUE)
		new /obj/item/shard(src.loc)
		qdel(src)

/obj/item/grenade/halflife/cs_gas
	name = "CS Gas Grenade"
	desc = "A grenade which unleashes a slow spreading cloud of CS gas upon detonation. Works to nonlethally disable targets who aren't wearing a gas mask, but be careful with how long it lingers indoors."
	icon = 'hl13/icons/obj/grenade.dmi'
	icon_state = "csgas"

/obj/item/grenade/halflife/cs_gas/detonate(mob/living/lanced_by)
	playsound(loc, 'sound/effects/smoke.ogg', 35, TRUE, 4)
	var/turf/my_turf = get_turf(src)
	my_turf.VapourTurf(/datum/vapours/cs_gas, 3000)
	qdel(src)
