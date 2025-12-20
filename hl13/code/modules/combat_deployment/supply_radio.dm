/obj/item/hl2/supply_radio
	name = "Supply Radio"
	desc = "A specialized supply radio tuned to a logistics base, allowing you to call in specialty items. Only accepts calls from authorised individuals."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "loadout_picker"
	var/faction_belonging = NO_FACTION
	var/max_cash = 0
	var/current_cash = 0
	var/cash_regeneration = 0

/obj/item/hl2/supply_radio/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/item/hl2/supply_radio/process()
	if(faction_belonging == COMBINE_DEPLOYMENT_FACTION)
		max_cash = (GLOB.deployment_combine_cash + 25)
		max_cash = ROUND_UP(max_cash)
		cash_regeneration = ROUND_UP(GLOB.deployment_combine_cash / 50)
		if(5 < cash_regeneration)
			cash_regeneration = 5
		if(current_cash < max_cash)
			current_cash += cash_regeneration
		if(max_cash < current_cash)
			current_cash = max_cash

	else if(faction_belonging == REBEL_DEPLOYMENT_FACTION)
		max_cash = (GLOB.deployment_rebels_cash + 25)
		max_cash = ROUND_UP(max_cash)
		cash_regeneration = ROUND_UP(GLOB.deployment_rebels_cash / 50)
		if(5 < cash_regeneration)
			cash_regeneration = 5
		if(current_cash < max_cash)
			current_cash += cash_regeneration
		if(max_cash < current_cash)
			current_cash = max_cash

/obj/item/hl2/supply_radio/interact(mob/user)
	. = ..()
	if(!can_use_beacon(user))
		return

	if(!HAS_TRAIT(user, TRAIT_TDMCAPTAIN))
		to_chat(user, span_warning("This supply radio is only accessible to faction captains."))
		return FALSE

	if(isliving(user))
		var/mob/living/livie = user
		if(livie.deployment_faction != faction_belonging)
			to_chat(user, span_warning("Your faction cannot use this."))
			return

	open_options_menu(user)

/// Return the list that will be used in the choice selection.
/// Entries should be in (type.name = type) fashion.
/obj/item/hl2/supply_radio/proc/generate_display_names()
	return list()

/// Checks if this mob can use the beacon, returns TRUE if so or FALSE otherwise.
/obj/item/hl2/supply_radio/proc/can_use_beacon(mob/living/user)
	if(user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return TRUE

	playsound(src, 'sound/machines/buzz/buzz-sigh.ogg', 40, TRUE)
	return FALSE

/// Opens a menu and allows the mob to pick an option from the list
/obj/item/hl2/supply_radio/proc/open_options_menu(mob/living/user)
	var/list/display_names = generate_display_names()
	if(!length(display_names))
		return
	var/choice = tgui_input_list(user, "POINTS AVAILABLE: [current_cash] MAX POINTS: [max_cash]", "Select an item to purchase", display_names)
	if(isnull(choice) || isnull(display_names[choice]))
		return
	if(!can_use_beacon(user))
		return

	var/datum/supply_beacon_option/new_option = display_names[choice]
	if(current_cash < new_option.cost)
		to_chat(user, span_warning("Not enough supply points."))
		return

	to_chat(user, span_green("Calling in item..."))
	if(!do_after(user, 3 SECONDS))
		to_chat(user, span_warning("Failed to call in item."))
		return

	consume_use(display_names[choice], user)

/// Consumes a use of the beacon, sending the user a message and creating their item in the process
/obj/item/hl2/supply_radio/proc/consume_use(datum/supply_beacon_option/option_choice, mob/living/user)
	var/datum/supply_beacon_option/new_option = option_choice
	var/item_to_spawn = new_option.spawn_path
	var/item_amount = new_option.amount

	to_chat(user, span_hear("Item purchased."))

	playsound(src, 'hl13/sound/effects/short_radio.ogg', 50, TRUE, extrarange = -3)

	new item_to_spawn(user.loc, item_amount)

	current_cash -= new_option.cost

	do_sparks(3, source = src)

/obj/item/hl2/supply_radio/rebel
	name = "Rebel Supply Radio"
	faction_belonging = REBEL_DEPLOYMENT_FACTION

/obj/item/hl2/supply_radio/combine
	name = "Combine Supply Radio"
	faction_belonging = COMBINE_DEPLOYMENT_FACTION

/obj/item/hl2/supply_radio/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/supply_beacon_option/ammocrate,
			/datum/supply_beacon_option/medcrate,
			/datum/supply_beacon_option/combine_turret,
			/datum/supply_beacon_option/fortifications_crate,
			/datum/supply_beacon_option/grenade_crate,
			/datum/supply_beacon_option/heavyammocrate,
			/datum/supply_beacon_option/canister_targeter,
			/datum/supply_beacon_option/emplacement_gun,
			/datum/supply_beacon_option/combine_tier5,
		)
		for(var/datum/supply_beacon_option/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.option_name)] = loadout
	return loadouts

/obj/item/hl2/supply_radio/rebel/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/supply_beacon_option/ammocrate,
			/datum/supply_beacon_option/medcrate,
			/datum/supply_beacon_option/rebel_turret,
			/datum/supply_beacon_option/fortifications_crate,
			/datum/supply_beacon_option/grenade_crate,
			/datum/supply_beacon_option/heavyammocrate,
			/datum/supply_beacon_option/missile_targeter,
			/datum/supply_beacon_option/rocket_launcher,
			/datum/supply_beacon_option/emplacement_gun,
			/datum/supply_beacon_option/rebel_tier5,
		)
		for(var/datum/supply_beacon_option/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.option_name)] = loadout
	return loadouts

/datum/supply_beacon_option
	var/option_name
	var/cost
	var/spawn_path
	var/amount = 1

/datum/supply_beacon_option/ammocrate
	option_name = "Stationary Ammo Crate (150 Points)"
	cost = 150
	spawn_path = /obj/machinery/ammo_crate/low_health

/datum/supply_beacon_option/medcrate
	option_name = "Medical Supplies Crate (200 Points)"
	cost = 200
	spawn_path = /obj/structure/closet/crate/halflife/wooden/med_supplies

/datum/supply_beacon_option/combine_turret
	option_name = "Turret Beacon (225 Points)"
	cost = 225
	spawn_path = /obj/item/sbeacondrop/combine_turret

/datum/supply_beacon_option/rebel_turret
	option_name = "Turret Beacon (225 Points)"
	cost = 225
	spawn_path = /obj/item/sbeacondrop/rebel_turret

/datum/supply_beacon_option/fortifications_crate
	option_name = "Fortifications Crate (275 Points)"
	cost = 275
	spawn_path = /obj/structure/closet/crate/halflife/wooden/fortifications

/datum/supply_beacon_option/grenade_crate
	option_name = "Grenade Crate (300 Points)"
	cost = 300
	spawn_path = /obj/machinery/ammo_crate/grenade_crate

/datum/supply_beacon_option/heavyammocrate
	option_name = "Heavy Ammo Crate (325 Points)"
	cost = 325
	spawn_path = /obj/machinery/ammo_crate/heavy

/datum/supply_beacon_option/missile_targeter
	option_name = "One-use Missile Targeter (400 Points)"
	cost = 400
	spawn_path = /obj/item/halflife/missile_targeter/one_use

/datum/supply_beacon_option/rocket_launcher
	option_name = "Rocket Launcher (400 Points)"
	cost = 400
	spawn_path = /obj/item/gun/ballistic/rocketlauncher/halflife

/datum/supply_beacon_option/canister_targeter
	option_name = "Modified Canister Targeter (300 Points)"
	cost = 300
	spawn_path = /obj/item/halflife/cannister_targeter/modified

/datum/supply_beacon_option/emplacement_gun
	option_name = "AR2 Emplacement Turret (425 Points)"
	cost = 425
	spawn_path = /obj/machinery/deployable_turret/combine

/datum/supply_beacon_option/rebel_tier5
	option_name = "Tier 5 Loadout Beacon (500 Points)"
	cost = 500
	spawn_path = /obj/item/hl2/loadout_picker/rebel/tier5/nonstick

/datum/supply_beacon_option/combine_tier5
	option_name = "Tier 5 Loadout Beacon (500 Points)"
	cost = 500
	spawn_path = /obj/item/hl2/loadout_picker/combine/tier5/nonstick
