/obj/item/hl2/loadout_picker
	name = "loadout beacon"
	desc = "Allows you to instantly equip yourself in a new loadout."
	icon = 'icons/obj/devices/remote.dmi'
	icon_state = "generic_delivery"
	inhand_icon_state = "generic_delivery"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	var/faction_belonging = NO_FACTION

/obj/item/hl2/loadout_picker/interact(mob/user)
	. = ..()
	if(!can_use_beacon(user))
		return

	if(user.client)
		if(user.client.deployment_faction != faction_belonging)
			to_chat(user, span_warning("Your faction cannot use this."))
			return

	var/area/place = get_area(src)
	if(faction_belonging == COMBINE_DEPLOYMENT_FACTION)
		if(!(istype(place, /area/halflife/indoors/combat_deployment/combine_base)))
			to_chat(user, span_warning("You need to use this in your spawn building."))
			return

	if(faction_belonging == REBEL_DEPLOYMENT_FACTION)
		if(!(istype(place, /area/halflife/indoors/combat_deployment/rebel_base)))
			to_chat(user, span_warning("You need to use this in your spawn building."))
			return

	open_options_menu(user)

/// Return the list that will be used in the choice selection.
/// Entries should be in (type.name = type) fashion.
/obj/item/hl2/loadout_picker/proc/generate_display_names()
	return list()

/// Checks if this mob can use the beacon, returns TRUE if so or FALSE otherwise.
/obj/item/hl2/loadout_picker/proc/can_use_beacon(mob/living/user)
	if(user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return TRUE

	playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 40, TRUE)
	return FALSE

/// Opens a menu and allows the mob to pick an option from the list
/obj/item/hl2/loadout_picker/proc/open_options_menu(mob/living/user)
	var/list/display_names = generate_display_names()
	if(!length(display_names))
		return
	var/choice = tgui_input_list(user, "Which loadout would you like?", "Select a Loadout", display_names)
	if(isnull(choice) || isnull(display_names[choice]))
		return
	if(!can_use_beacon(user))
		return

	to_chat(user, span_green("Equipping outfit..."))
	if(!do_after(user, 1 SECONDS))
		to_chat(user, span_warning("Equip failed."))
		return

	consume_use(display_names[choice], user)

/// Consumes a use of the beacon, sending the user a message and creating their item in the process
/obj/item/hl2/loadout_picker/proc/consume_use(datum/outfit/outfit_choice, mob/living/user)
	to_chat(user, span_hear("Loadout selected."))

	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user

		for(var/obj/item/item in human_user.get_equipped_items(INCLUDE_POCKETS))
			qdel(item)

		human_user.equipOutfit(outfit_choice) // Loadout
		human_user.regenerate_icons()

	do_sparks(3, source = src)
	qdel(src)

/obj/item/hl2/loadout_picker/rebel
	faction_belonging = REBEL_DEPLOYMENT_FACTION

/obj/item/hl2/loadout_picker/rebel/tier1/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/tier1/mosin_partisan,
			/datum/outfit/deployment_loadout/rebel/tier1/molotov_partisan,
			/datum/outfit/deployment_loadout/rebel/tier1/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/rebel/tier2/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/tier2/pistol_rebel,
			/datum/outfit/deployment_loadout/rebel/tier2/medic_rebel,
			/datum/outfit/deployment_loadout/rebel/tier2/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/rebel/tier3/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/tier3/mp7_rebel,
			/datum/outfit/deployment_loadout/rebel/tier3/bomber_rebel,
			/datum/outfit/deployment_loadout/rebel/tier3/vortigaunt,
			/datum/outfit/deployment_loadout/rebel/tier3/crossbow,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/rebel/tier4/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/tier4/ar2_rebel,
			/datum/outfit/deployment_loadout/rebel/tier4/corporal,
			/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt,
			/datum/outfit/deployment_loadout/rebel/tier4/crossbow,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/rebel/tier5/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/tier5/freeman,
			/datum/outfit/deployment_loadout/rebel/tier5/veteran,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

///////////////////////////// COMBINE LOADOUT PICKERS //////////////////////////////////////////////////////

/obj/item/hl2/loadout_picker/combine
	faction_belonging = COMBINE_DEPLOYMENT_FACTION

/obj/item/hl2/loadout_picker/combine/tier1/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier1/baton_cop,
			/datum/outfit/deployment_loadout/combine/tier1/infestation_control,
			/datum/outfit/deployment_loadout/combine/tier1/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/combine/tier2/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier2/viscerator_cop,
			/datum/outfit/deployment_loadout/combine/tier2/pistol_cop,
			/datum/outfit/deployment_loadout/combine/tier2/medic_cop,
			/datum/outfit/deployment_loadout/combine/tier1/infestation_control, //already pretty good for being tier 1
			/datum/outfit/deployment_loadout/combine/tier2/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/combine/tier3/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier3/grunt,
			/datum/outfit/deployment_loadout/combine/tier3/ota,
			/datum/outfit/deployment_loadout/combine/tier3/riotcop,
			/datum/outfit/deployment_loadout/combine/tier3/divisional,
			/datum/outfit/deployment_loadout/combine/tier3/medic_cop,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/combine/tier4/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier4/elite,
			/datum/outfit/deployment_loadout/combine/tier4/shotgunner,
			/datum/outfit/deployment_loadout/combine/tier4/sniper,
			/datum/outfit/deployment_loadout/combine/tier4/ordinal,
			/datum/outfit/deployment_loadout/combine/tier4/medic_cop,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/combine/tier5/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier5/hunter,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts
