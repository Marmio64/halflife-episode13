
/obj/machinery/water_miner
	name = "water harvester"
	desc = "Automatically harvests water from below, filters it, and packs it into easily carriable canisters which are often exported by combine cities."
	icon = 'hl13/icons/obj/machinery.dmi'
	icon_state = "harvester_off"
	density = TRUE
	anchored = 0
	var/full = FALSE
	var/mining = FALSE
	var/water_gather_progress = FALSE

/obj/machinery/water_miner/examine(mob/user)
	. = ..()
	if(full)
		. += span_notice("<b>Alt-click</b> it to remove the full water canister.")
	else if (!mining)
		. += span_notice("<b>Alt-click</b> it to start a harvesting cycle.")

/obj/machinery/water_miner/click_alt(mob/user)
	if(!user.can_perform_action(src, !issilicon(user)) || mining)
		return
	if(full)
		new	/obj/item/water_canister(src.loc)
		new /obj/item/stack/spacecash/c1(user.loc, 2)
		to_chat(user, span_notice("You remove the full water canister, along with the dispensed reward."))

		playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)

		full = FALSE
		update_icon_state()
		SSsociostability.modifystability(1) //Production brings stability.
		return
	if(mining)
		to_chat(user, span_warning("You stop the mining cycle."))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		mining = FALSE
		return

	if(!istype(loc, /turf/open/halflife/water) || !anchored) //turf/open/halflife/water
		to_chat(user, span_warning("The harvester needs to be anchored over water to be turned on!"))
		return

	to_chat(user, span_warning("You start the mining cycle."))
	playsound(src, 'hl13/sound/machines/combine_button3.ogg', 50, TRUE, extrarange = -3)
	mining = TRUE
	update_appearance(UPDATE_ICON)

	START_PROCESSING(SSfastprocess, src)

/obj/machinery/water_miner/process(delta_time)
	if(!mining)
		return PROCESS_KILL
	if(anchored)
		water_gather_progress++
		if(water_gather_progress > 499)
			water_gather_progress = 0
			full = TRUE
			mining = FALSE

			playsound(src, 'hl13/sound/halflifeeffects/steam_short.ogg', 50, TRUE, extrarange = -3)

			update_icon_state()
			return PROCESS_KILL
	else
		mining = FALSE
	return


/obj/machinery/water_miner/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WRENCH && I.use_tool(src, user, 20, volume=50))
		if(!anchored)
			if(istype(loc, /turf/open/halflife/water)) //turf/open/halflife/water
				anchored = 1
				user.visible_message( \
					"[user] sets \the [src] down into the water.", \
					span_notice("You burrow \the [src] into the water."),
					span_italics("You hear the splash of water."))

				playsound(src, 'sound/effects/splash.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(user, span_warning("This needs to be anchored over a harvestable source of water!"))
		else
			anchored = 0
			user.visible_message( \
				"[user] raises \the [src] from the water.", \
				span_notice("You raise \the [src] out from the water."),
				span_italics("You hear something rising from the water."))

/obj/machinery/water_miner/update_icon_state()
	. = ..()
	if(mining)
		icon_state = "harvester"
	else if(!full)
		icon_state = "harvester_off"
	else
		icon_state = "harvester_full"

/obj/item/water_canister
	name = "water canister"
	desc = "A reinforced canister containing filtered water. This can be sold to the benefactors via the dropship."
	force = 10
	icon = 'icons/obj/canisters.dmi'
	icon_state = "oxygen"
	inhand_icon_state = "oxygen_tank"
	lefthand_file = 'icons/mob/inhands/equipment/tanks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tanks_righthand.dmi'
	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BACK
	worn_icon = 'icons/mob/clothing/back.dmi' //since these can also get thrown into suit storage slots. if something goes on the belt, set this to null.
	hitsound = 'sound/items/weapons/smash.ogg'
	pickup_sound = 'sound/items/handling/gas_tank/gas_tank_pick_up.ogg'
	drop_sound = 'sound/items/handling/gas_tank/gas_tank_drop.ogg'
	sound_vary = TRUE
	force = 5
	throwforce = 10
	throw_speed = 1
	throw_range = 4
