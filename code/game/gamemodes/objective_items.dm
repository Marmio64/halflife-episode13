/proc/add_item_to_steal(source, type)
	GLOB.steal_item_handler.objectives_by_path[type] += source
	return type

//Contains the target item datums for Steal objectives.
/datum/objective_item
	/// How the item is described in the objective
	var/name = "a silly bike horn! Honk!"
	/// Typepath of item
	var/targetitem = /obj/item/bikehorn
	/// Valid containers that the target item can be in.
	var/list/valid_containers = list()
	/// Who CARES if this item goes missing (no stealing unguarded items), often similar but not identical to the next list
	var/list/item_owner = list()
	/// Jobs which cannot generate this objective (no stealing your own stuff)
	var/list/excludefromjob = list()
	/// List of additional items which also count, for things like blueprints
	var/list/altitems = list()
	/// Items to provide to people in order to allow them to acquire the target
	var/list/special_equipment = list()
	/// Defines in which contexts the item can be given as an objective
	var/objective_type = OBJECTIVE_ITEM_TYPE_NORMAL
	/// Whether this item exists on the station map at the start of a round.
	var/exists_on_map = FALSE
	/**
	 * How hard it is to steal this item given normal circumstances, ranked on a scale of 1 to 5.
	 *
	 * 1 - Probably found in a public area
	 * 2 - Likely on someone's person, or in a less-than-public but otherwise unguarded area
	 * 3 - Usually on someone's person, or in a locked locker or otherwise secure area
	 * 4 - Always on someone's person, or in a secure area
	 * 5 - You know it when you see it. Things like the Nuke Disc which have a pointer to it at all times.
	 *
	 * Also accepts 0 as "extremely easy to steal" and >5 as "almost impossible to steal"
	 */
	var/difficulty = 0
	/// A hint explaining how one may find the target item.
	var/steal_hint = "The clown might have one."

/// For objectives with special checks (does that intellicard have an ai in it? etcetc)
/datum/objective_item/proc/check_special_completion(obj/item/thing)
	return TRUE

/// Takes a list of minds and returns true if this is a valid objective to give to a team of these minds
/datum/objective_item/proc/valid_objective_for(list/potential_thieves, require_owner = FALSE)
	if(!target_exists() || (require_owner && !owner_exists()))
		return FALSE
	for (var/datum/mind/possible_thief as anything in potential_thieves)
		var/datum/job/role = possible_thief.assigned_role
		if(role.title in excludefromjob)
			return FALSE
	return TRUE

/// Returns true if the target item exists
/datum/objective_item/proc/target_exists()
	return (exists_on_map) ? length(GLOB.steal_item_handler.objectives_by_path[targetitem]) : TRUE

/// Returns true if one of the item's owners exists somewhere
/datum/objective_item/proc/owner_exists()
	if (!length(item_owner))
		return TRUE
	for (var/mob/living/player as anything in GLOB.player_list)
		if ((player.mind?.assigned_role.title in item_owner) && player.stat != DEAD && !is_centcom_level(player.z))
			return TRUE
	return FALSE

/datum/objective_item/steal/New()
	. = ..()
	if(target_exists())
		GLOB.possible_items += src
	else
		qdel(src)

/datum/objective_item/steal/Destroy()
	GLOB.possible_items -= src
	return ..()

// Low risk steal objectives
/datum/objective_item/steal/traitor
	objective_type = OBJECTIVE_ITEM_TYPE_TRAITOR

// Unique-ish low risk objectives
/datum/objective_item/steal/traitor/fireaxe
	name = "a fire axe"
	targetitem = /obj/item/fireaxe
	excludefromjob = list(
		JOB_ATMOSPHERIC_TECHNICIAN,
		JOB_CAPTAIN,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_QUARTERMASTER,
		JOB_RESEARCH_DIRECTOR,
		JOB_STATION_ENGINEER,
	)
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "Only one exists in the district, in the town hall."

/obj/item/fireaxe/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/fireaxe)

/datum/objective_item/steal/traitor/telebaton
	name = "a head of staff's telescopic baton"
	targetitem = /obj/item/melee/baton/telescopic
	excludefromjob = list(
		JOB_RESEARCH_DIRECTOR,
		JOB_CAPTAIN,
		JOB_HEAD_OF_SECURITY,
		JOB_HEAD_OF_PERSONNEL,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_QUARTERMASTER,
	)
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "A self-defense weapon standard-issue for the administrator and labor lead. Rarely found off of their person."

/datum/objective_item/steal/traitor/telebaton/check_special_completion(obj/item/thing)
	return thing.type == /obj/item/melee/baton/telescopic

/obj/item/melee/baton/telescopic/add_stealing_item_objective()
	if(type == /obj/item/melee/baton/telescopic)
		return add_item_to_steal(src, /obj/item/melee/baton/telescopic)

/datum/objective_item/steal/traitor/cargo_budget
	name = "cargo's departmental budget"
	targetitem = /obj/item/card/id/departmental_budget/car
	excludefromjob = list(JOB_QUARTERMASTER, JOB_CARGO_TECHNICIAN)
	item_owner = list(JOB_QUARTERMASTER)
	exists_on_map = TRUE
	difficulty = 2
	steal_hint = "A card that grants access to Cargo's funds. \
		Normally found in the Labor Lead's office, but a particularly keen one may have it on their person or in their wallet."

/obj/item/card/id/departmental_budget/car/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/card/id/departmental_budget/car)

/datum/objective_item/steal/viscerator
	name = "a inactive viscerator drone"
	targetitem = /obj/item/grenade/spawnergrenade/manhacks
	exists_on_map = TRUE
	difficulty = 2
	steal_hint = "An inactive combat drone manufactured by the combine. Could be made in the laboratory or found in the armory."

/obj/item/viscerator/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/grenade/spawnergrenade/manhacks)

// High risk steal objectives

/datum/objective_item/steal/documents
	name = "any set of secret documents of any organization"
	valid_containers = list(/obj/item/folder)
	targetitem = /obj/item/documents
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "A set of papers belonging to a megaconglomerate. \
		Combine documents can easily be found in the warden's office. \
		For other factions, you may find them in strange and distant places. \
		A photocopy may also suffice."

/obj/item/documents/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/documents) //Any set of secret documents. Doesn't have to be NT's

/datum/objective_item/steal/hdd_extraction
	name = "the source code for Project Goon from the master R&D server mainframe"
	targetitem = /obj/item/computer_disk/hdd_theft
	excludefromjob = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST, JOB_GENETICIST)
	item_owner = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST)
	exists_on_map = TRUE
	difficulty = 4
	steal_hint = "The hard drive of the master research server, found in R&D's server room."

/obj/item/computer_disk/hdd_theft/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/computer_disk/hdd_theft)

/datum/objective_item/steal/hdd_extraction/New()
	special_equipment += /obj/item/paper/guides/antag/hdd_extraction
	return ..()

/datum/objective_item/steal/townhall_key
	name = "a key to the townhall"
	targetitem = /obj/item/hl2key/townhall
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "A key to the townhall. Often carried by command personnel or in their offices."

/obj/item/townhall_key/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/hl2key/townhall)

// Doesn't need item_owner = (JOB_AI) because this handily functions as a murder objective if there isn't one
/datum/objective_item/steal/functionalai
	name = "a functional AI"
	targetitem = /obj/item/aicard
	difficulty = 5
	steal_hint = "An intellicard (or MODsuit) containing an active, functional AI."

/datum/objective_item/steal/functionalai/New()
	. = ..()
	altitems += typesof(/obj/item/mod/control) // only here so we can account for AIs tucked away in a MODsuit.

/datum/objective_item/steal/functionalai/check_special_completion(obj/item/potential_storage)
	var/mob/living/silicon/ai/being

	if(istype(potential_storage, /obj/item/aicard))
		var/obj/item/aicard/card = potential_storage
		being = card.AI // why is this one capitalized and the other one not? i wish i knew.
	else if(istype(potential_storage, /obj/item/mod/control))
		var/obj/item/mod/control/suit = potential_storage
		if(isAI(suit.ai_assistant))
			being = suit.ai_assistant
	else
		stack_trace("check_special_completion() called on [src] with [potential_storage] ([potential_storage.type])! That's not supposed to happen!")
		return FALSE

	if(isAI(being) && being.stat != DEAD)
		return TRUE

	return FALSE

/datum/objective_item/steal/blueprints
	name = "the district blueprints"
	targetitem = /obj/item/blueprints
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	item_owner = list(JOB_CHIEF_ENGINEER)
	altitems = list(/obj/item/photo)
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "The blueprints of the district, oftentimes in the possession of the foreman. A picture may suffice."

/obj/item/blueprints/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/blueprints)

/datum/objective_item/steal/blueprints/check_special_completion(obj/item/I)
	if(istype(I, /obj/item/blueprints))
		return TRUE
	if(istype(I, /obj/item/photo))
		var/obj/item/photo/P = I
		if(P.picture.has_blueprints) //if the blueprints are in frame
			return TRUE
	return FALSE

// A number of special early-game steal objectives intended to be used with the steal-and-destroy objective.
// They're basically items of utility or emotional value that may be found on many players or lying around the station.
/datum/objective_item/steal/traitor/insuls
	name = "some insulated gloves"
	targetitem = /obj/item/clothing/gloves/color/yellow
	excludefromjob = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_ATMOSPHERIC_TECHNICIAN, JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER)
	item_owner = list(JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER)
	exists_on_map = TRUE
	difficulty = 1
	steal_hint = "A basic pair of insulated gloves, often found on engineers."

/obj/item/clothing/gloves/color/yellow/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/gloves/color/yellow)

/datum/objective_item/steal/traitor/denied_stamp
	name = "cargo's denied stamp"
	targetitem = /obj/item/stamp/denied
	excludefromjob = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_SHAFT_MINER)
	exists_on_map = TRUE
	difficulty = 1
	steal_hint = "Cargo often has multiple of these red stamps lying around to process paperwork."

/obj/item/stamp/denied/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/stamp/denied)

/datum/objective_item/steal/traitor/granted_stamp
	name = "cargo's granted stamp"
	targetitem = /obj/item/stamp/granted
	excludefromjob = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_SHAFT_MINER)
	exists_on_map = TRUE
	difficulty = 1
	steal_hint = "Cargo often has multiple of these green stamps lying around to process paperwork."

/obj/item/stamp/granted/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/stamp/granted)

/datum/objective_item/steal/traitor/hardhat
	name = "a hardhat"
	targetitem = /obj/item/clothing/head/utility/hardhat
	excludefromjob = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER, JOB_SHAFT_MINER, JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN)
	exists_on_map = TRUE
	difficulty = 1
	steal_hint = "The factory usually has these in abundance."

/obj/item/clothing/head/utility/hardhat/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/head/utility/hardhat)

/datum/objective_item/steal/spy
	objective_type = OBJECTIVE_ITEM_TYPE_SPY

/datum/objective_item/steal/spy/shotgun
	name = "a spas-12 shotgun"
	targetitem = /obj/item/gun/ballistic/shotgun/spas12
	excludefromjob = list(
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	exists_on_map = TRUE
	difficulty = 3
	steal_hint = "A shotgun found in the district's Armory for riot suppression. Doesn't miss."

/obj/item/gun/ballistic/shotgun/riot/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/gun/ballistic/shotgun/spas12)

/datum/objective_item/steal/spy/sunglasses
	name = "some sunglasses"
	targetitem = /obj/item/clothing/glasses/sunglasses
	excludefromjob = list(
		JOB_CAPTAIN,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_LAWYER,
		JOB_QUARTERMASTER,
		JOB_RESEARCH_DIRECTOR,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	difficulty = 1
	steal_hint = "A pair of sunglasses. Heads of staff may wear these. \
		You can also obtain a pair from dissassembling hudglasses."

/datum/objective_item/steal/spy/stun_baton
	name = "a stun baton"
	targetitem = /obj/item/melee/baton/security
	excludefromjob = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	difficulty = 2
	steal_hint = "Steal any stun baton from Security."

/datum/objective_item/steal/spy/stun_baton/check_special_completion(obj/item/thing)
	return !istype(thing, /obj/item/melee/baton/security/cattleprod)
