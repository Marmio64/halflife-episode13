/datum/techweb_node/syndicate_basic
	id = TECHWEB_NODE_SYNDICATE_BASIC
	display_name = "Illegal Technology"
	description = "Dangerous research used to create dangerous objects."
	design_ids = list(
		"advanced_camera",
		"ai_cam_upgrade",
		"borg_syndicate_module",
		"donksoft_refill",
		"donksofttoyvendor",
		"largecrossbow",
		"mag_autorifle",
		"mag_autorifle_ap",
		"mag_autorifle_ic",
		"rapidsyringe",
		"suppressor",
		"super_pointy_tape",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	hidden = TRUE

/datum/techweb_node/syndicate_basic/New() //Crappy way of making syndicate gear decon supported until there's another way.
	. = ..()
	if(!SSearly_assets.initialized)
		RegisterSignal(SSearly_assets, COMSIG_SUBSYSTEM_POST_INITIALIZE, PROC_REF(register_uplink_items))
	else
		register_uplink_items()

/datum/techweb_node/syndicate_basic/proc/register_uplink_items()
	SIGNAL_HANDLER
	UnregisterSignal(SSearly_assets, COMSIG_SUBSYSTEM_POST_INITIALIZE)
	required_items_to_unlock = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/item = SStraitor.uplink_items_by_type[item_path]
		if(!item.item || !(item.uplink_item_flags & SYNDIE_ILLEGAL_TECH))
			continue
		required_items_to_unlock |= item.item //allows deconning to unlock.
