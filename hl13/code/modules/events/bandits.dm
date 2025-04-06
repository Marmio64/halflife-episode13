/datum/round_event_control/bandits
	name = "Bandits"
	typepath = /datum/round_event/bandits
	weight = 5
	max_occurrences = 1
	min_players = 20
	dynamic_should_hijack = TRUE
	category = EVENT_CATEGORY_INVASION
	description = "A band of bandits show up by boat to rob the district."

/datum/round_event/bandits/start()
	spawn_bandits()

/datum/round_event/bandits/proc/spawn_bandits(datum/comm_message/threat)

	var/list/candidates = SSpolling.poll_ghost_candidates("Do you wish to be considered for a [span_notice("bandit crew?")]", check_jobban = ROLE_TRAITOR, alert_pic = /obj/item/claymore/cutlass, role_name_text = "bandit crew")
	shuffle_inplace(candidates)

	var/template_key = "pirate_bandit"
	var/datum/map_template/shuttle/pirate/ship = SSmapping.shuttle_templates[template_key]
	var/x = 116
	var/y = 67
	var/z = 1
	var/turf/T = locate(x,y,z)
	if(!T)
		CRASH("Bandit event found no turf to load in")

	if(!ship.load(T))
		CRASH("Loading bandit ship failed!")

	for(var/turf/area_turf as anything in ship.get_affected_turfs(T))
		for(var/obj/effect/mob_spawn/ghost_role/human/pirate/spawner in area_turf)
			if(candidates.len > 0)
				var/mob/our_candidate = candidates[1]
				var/mob/spawned_mob = spawner.create_from_ghost(our_candidate)
				candidates -= our_candidate
				notify_ghosts(
					"The flying dutchman has an object of interest: [spawned_mob]!",
					source = spawned_mob,
					header = "bandits!",
				)
			else
				notify_ghosts(
					"The flying dutchman has an object of interest: [spawner]!",
					source = spawner,
					header = "Bandit Spawn Here!",
				)

/obj/machinery/computer/shuttle/bandits
	name = "bandit boat console"
	shuttleId = "bandit"
	possible_destinations = "pirate_away;pirate_home"

/obj/effect/mob_spawn/ghost_role/human/pirate/bandit
	name = "\improper Improvised sleeper"
	desc = "A body bag poked with holes, currently being used as a sleeping bag. Someone seems to be sleeping inside of it."
	density = FALSE
	you_are_text = "You're a bandit from outside the city, looking to survive by robbing defenceless refugees and citizens on the outskirts of cities"
	flavour_text = "Time to put food on the table, and money in our wallets."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bodybag"
	fluff_spawn = null
	prompt_name = "a bandit"
	outfit = /datum/outfit/pirate/bandit
	rank = "Bandit"

/datum/outfit/pirate/bandit
	name = "Bandit"

	id = null
	glasses = null
	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	back = /obj/item/storage/backpack/halflife/satchel
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	mask = /obj/item/clothing/mask/balaclava
	shoes = /obj/item/clothing/shoes/boots
	l_pocket = /obj/item/flashlight

/datum/map_template/shuttle/pirate/bandit
	suffix = "bandit"
	name = "bandit ship"
