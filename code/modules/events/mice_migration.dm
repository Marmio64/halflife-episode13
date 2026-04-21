/datum/round_event_control/mice_migration
	name = "Mice Migration"
	typepath = /datum/round_event/mice_migration
	weight = 5
	max_occurrences = 1
	category = EVENT_CATEGORY_ENTITIES
	description = "A horde of mice arrives to any exposed wires. Mostly only applicable for the rebel bunker in Outlands RP."

	map_flags = EVENT_PRISON_RP_BANNED | EVENT_CITY_RP_BANNED

/datum/round_event/mice_migration
	var/minimum_mice = 2
	var/maximum_mice = 5

/datum/round_event/mice_migration/start()
	SSminor_mapping.trigger_migration(rand(minimum_mice, maximum_mice))
