/obj/item/halflife/cannister_targeter
	name = "canister targeting tool"
	desc = "A tool that feeds coordinates to an offsite location, prompting them to send a headcrab canister at the target. Each canister does not deal damage on impact and carries a random headcrab type. Click a visible tile to send a canister. Recharges uses overtime."
	icon = 'hl13/icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	var/charges = 3
	var/max_charges = 3

/obj/item/halflife/cannister_targeter/Initialize(mapload, obj/item/seeds/newseed)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/halflife/cannister_targeter/process(seconds_per_tick)
	if(charges < max_charges)
		charges += 0.25 //about 8 seconds to restore a headcrab charge

/obj/item/halflife/cannister_targeter/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/halflife/cannister_targeter/examine(mob/user)
	. = ..()
	. += "It has [floor(charges)] charge\s out of [max_charges]."

/obj/item/halflife/cannister_targeter/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	. = ..()
	if(1 <= charges)
		launch_cannister(get_turf(interacting_with))
		charges--

/obj/item/halflife/cannister_targeter/proc/launch_cannister(turf/location)
	var/headcrab_choice = /mob/living/basic/halflife/headcrab

	//Each of the four headcrabs have an equal random weight to being chosen!
	if(prob(25))
		headcrab_choice = /mob/living/basic/halflife/headcrab/armored
	if(prob(25))
		headcrab_choice = /mob/living/basic/halflife/headcrab/fast
	if(prob(25))
		headcrab_choice = /mob/living/basic/halflife/headcrab/poison

	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/light_exp_canister,
		"spawn" = headcrab_choice,
	))

/obj/structure/closet/supplypod/light_exp_canister
	style = /datum/pod_style/canister
	explosionSize = list(0,0,1,0)

/obj/item/halflife/missile_targeter
	name = "missile targeting tool"
	desc = "A tool that feeds coordinates to an offsite location, prompting them to send a missile at the target. Click a visible tile to send a canister. Does not recharge over time, and takes a while for the missile to land."
	icon = 'hl13/icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	var/charges = 2

/obj/item/halflife/missile_targeter/examine(mob/user)
	. = ..()
	. += "It has [floor(charges)] charge\s left."

/obj/item/halflife/missile_targeter/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	. = ..()
	if(1 <= charges)
		launch_missile(get_turf(interacting_with))
		charges--

/obj/item/halflife/missile_targeter/proc/launch_missile(turf/location)

	podspawn(list(
		"target" = location,
		"path" = /obj/structure/closet/supplypod/plf_missile,
	))

/obj/structure/closet/supplypod/plf_missile
	name = "old missile"
	desc = "An old world missile that has been maintained just enough to still work. It has far less explosive power than it used to have, but its enough to blow open some fortifications."
	style = /datum/pod_style/missile/syndicate
	explosionSize = list(0,4,6,0)
	effectShrapnel = TRUE
	specialised = TRUE
	delays = list(POD_TRANSIT = 5 SECONDS, POD_FALLING = 0.4 SECONDS)
	effectMissile = TRUE
	shrapnel_type = /obj/projectile/bullet/shrapnel/short_range
