#define EMAG_LOCKED_SHUTTLE_COST (CARGO_CRATE_VALUE * 50)

/datum/map_template/shuttle/emergency
	port_id = "emergency"
	name = "Base Shuttle Template (Emergency)"
	///assoc list of shuttle events to add to this shuttle on spawn (typepath = weight)
	var/list/events
	///pick all events instead of random
	var/use_all_events = FALSE
	///how many do we pick
	var/event_amount = 1
	///do we empty the event list before adding our events
	var/events_override = FALSE

/datum/map_template/shuttle/emergency/New()
	. = ..()
	if(!occupancy_limit && who_can_purchase)
		CRASH("The [name] needs an occupancy limit!")
	if(HAS_TRAIT(SSstation, STATION_TRAIT_SHUTTLE_SALE) && credit_cost > 0 && prob(15))
		var/discount_amount = round(rand(25, 80), 5)
		name += " ([discount_amount]% Discount!)"
		var/discount_multiplier = 100 - discount_amount
		credit_cost = ((credit_cost * discount_multiplier) / 100)

///on post_load use our variables to change shuttle events
/datum/map_template/shuttle/emergency/post_load(obj/docking_port/mobile/mobile)
	. = ..()
	if(!events)
		return
	if(events_override)
		mobile.event_list.Cut()
	if(use_all_events)
		for(var/path in events)
			mobile.add_shuttle_event(path)
			events -= path
	else
		for(var/i in 1 to event_amount)
			var/path = pick_weight(events)
			events -= path
			mobile.add_shuttle_event(path)

/datum/map_template/shuttle/emergency/backup
	suffix = "backup"
	name = "Backup Shuttle"
	who_can_purchase = null

/datum/map_template/shuttle/emergency/box
	suffix = "box"
	name = "Standard Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * 4
	description = "The gold standard in relocation."
	occupancy_limit = "30"

/datum/map_template/shuttle/emergency/loyalist
	suffix = "loyalist"
	name = "Loyalist Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * 4
	description = "Seperated in two sections, this train lets loyalists transfer in comfort while all the undesirables rot."
	occupancy_limit = "20"

/datum/map_template/shuttle/emergency/razortrain
	suffix = "razortrain"
	name = "Transport Razor Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * 3
	description = "A borrowed razor transportation train. More heavy duty than civillian cargo and transport trains. Suitable for keeping all citizens seperated from one another, and for onsite stalkerizing."
	occupancy_limit = "25"

/datum/map_template/shuttle/emergency/overwatchrazortrain
	suffix = "overwatchrazortrain"
	name = "Transhuman Arm Razor Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * 32
	description = "A borrowed military grade train from the Overwatch Transhuman Arm. Equipped with turrets, a command area, an armory, supplies, and prison cells for anticitizens, this will cost you a pretty penny though."
	occupancy_limit = "25"

/datum/map_template/shuttle/emergency/priority
	suffix = "priority"
	name = "Priority-grade Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * 18
	description = "A very well equipped and enlarged transfer train. Makes both your and your citizen's transfers more comfortable, but at what price?"
	occupancy_limit = "35"

/datum/map_template/shuttle/emergency/scrapped
	suffix = "scrapped"
	name = "Salvaged Transfer Train"
	credit_cost = CARGO_CRATE_VALUE * -10
	description = "A salvaged together train. We'll pay into your district budget in exchange for taking this one off our hands, and us taking yours instead."
	movement_force = list("KNOCKDOWN" = 3, "THROW" = 2)
	occupancy_limit = "25"
	prerequisites = "This train is only offered for purchase when the district is low on funds."

/datum/map_template/shuttle/emergency/scrapped/prerequisites_met()
	return SSshuttle.shuttle_purchase_requirements_met[SHUTTLE_UNLOCK_SCRAPHEAP]

/datum/map_template/shuttle/emergency/poland
	suffix = "poland"
	name = "Polish Revolutionary Front Armoured Train"
	credit_cost = CARGO_CRATE_VALUE * 32
	description = "This is Warsaw Command speaking. For the right sum, we can loan you one of our armoured locomotives. It costs one hell of an amount but it's well-armoured, has a cache of weapons, and plenty of rations. Just - make sure to have someone override the firmware, or it'll still end up in a Combine depot!"
	emag_only = TRUE
	occupancy_limit = "25"

#undef EMAG_LOCKED_SHUTTLE_COST
