/obj/item/halflife/cannister_targeter
	name = "canister targeting tool"
	desc = "A tool that feeds coordinates to an offsite location, prompting them to send a headcrab canister at the target. Each canister deals a small amount of damage on impact and carries two headcrabs of random types. Click a visible tile to send a canister after a 2 second delay. Recharges uses overtime."
	icon = 'hl13/icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	var/charges = 3
	var/max_charges = 3
	var/recharges = TRUE
	var/use_time = 2 SECONDS

/obj/item/halflife/cannister_targeter/modified
	name = "modified canister targeting tool"
	desc = "A tool that feeds coordinates to an offsite location, prompting them to send a headcrab canister at the target. Each canister deals a large amount of damage on impact and carries three headcrabs of random types. Click a visible tile to send a canister after a 2 second delay. Does not recharge uses overtime"
	recharges = FALSE
	use_time = 1 SECONDS

/obj/item/halflife/cannister_targeter/Initialize(mapload, obj/item/seeds/newseed)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/halflife/cannister_targeter/process(seconds_per_tick)
	if(charges < max_charges && recharges)
		charges += 0.15 //about 12 seconds to restore a headcrab charge

/obj/item/halflife/cannister_targeter/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/halflife/cannister_targeter/examine(mob/user)
	. = ..()
	. += "It has [floor(charges)] charge\s out of [max_charges]."

/obj/item/halflife/cannister_targeter/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	. = ..()
	if(1 <= charges)
		if(!istype(interacting_with, /turf/open/openspace) && !istype(interacting_with, /turf/closed))
			if(do_after(user, use_time, src))
				launch_cannister(get_turf(interacting_with))
				charges--
			else
				to_chat(user, span_warning("Insufficient time given to calculate coordinates."))
		else
			to_chat(user, span_warning("Targeting failed, target is out of reach due to being at a different altitude level or is obstructed."))

/obj/item/halflife/cannister_targeter/proc/launch_cannister(turf/location)
	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/light_exp_canister,
		"spawn" = /obj/effect/spawner/random/halflife/random_headcrab/two,
	))

/obj/item/halflife/cannister_targeter/modified/launch_cannister(turf/location)
	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/med_exp_canister,
		"spawn" = /obj/effect/spawner/random/halflife/random_headcrab/three,
	))

/obj/structure/closet/supplypod/light_exp_canister
	style = /datum/pod_style/canister
	explosionSize = list(0,0,1,0)

/obj/structure/closet/supplypod/med_exp_canister
	style = /datum/pod_style/canister
	explosionSize = list(0,1,2,0)

/obj/item/halflife/missile_targeter
	name = "missile targeting tool"
	desc = "A tool that feeds coordinates to an offsite location, prompting them to send a missile at the target. Click a visible tile to send a missile. Does not recharge over time, and takes a while for the missile to land."
	icon = 'hl13/icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	var/charges = 2
	var/use_time = 1 SECONDS

/obj/item/halflife/missile_targeter/one_use
	charges = 1

/obj/item/halflife/missile_targeter/examine(mob/user)
	. = ..()
	. += "It has [floor(charges)] charge\s left."

/obj/item/halflife/missile_targeter/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	. = ..()
	if(1 <= charges)
		if(do_after(user, use_time, src))
			launch_missile(get_turf(interacting_with))
			charges--
		else
			to_chat(user, span_warning("Insufficient time given to calculate coordinates."))

/obj/item/halflife/missile_targeter/proc/launch_missile(turf/location)
	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/plf_missile,
	))

/obj/item/halflife/missile_targeter/one_use/launch_missile(turf/location)
	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/plf_missile/dangerous,
	))

/obj/structure/closet/supplypod/plf_missile
	name = "old missile"
	desc = "An old world missile that has been maintained just enough to still work. It has far less explosive power than it used to have, but its enough to blow open some fortifications."
	style = /datum/pod_style/missile/syndicate
	explosionSize = list(0,3,5,0)
	effectShrapnel = TRUE
	specialised = TRUE
	delays = list(POD_TRANSIT = 5 SECONDS, POD_FALLING = 0.4 SECONDS)
	effectMissile = TRUE
	shrapnel_type = /obj/projectile/bullet/shrapnel/short_range

/obj/structure/closet/supplypod/plf_missile/dangerous
	name = "old missile"
	desc = "An old world missile that has been maintained just enough to still work. It has far less explosive power than it used to have, but its enough to blow open some fortifications."
	style = /datum/pod_style/missile/syndicate
	explosionSize = list(0,4,6,0)
	effectShrapnel = TRUE
	specialised = TRUE
	delays = list(POD_TRANSIT = 5 SECONDS, POD_FALLING = 0.4 SECONDS)
	effectMissile = TRUE
	shrapnel_type = /obj/projectile/bullet/shrapnel
