/area/halflife
	name = "\improper Unexplored Location"
	icon_state = "away"
	has_gravity = TRUE
	ambience_index = AMBIENCE_HLOUTSIDE
	flags_1 = CAN_BE_DIRTY_1
	requires_power = FALSE
	max_ambience_cooldown = 240 SECONDS
	min_ambience_cooldown = 180 SECONDS
	var/dissipation_rate = 1.5 // higher numbers = quicker dissipation

/obj/effect/baseturf_helper/halflife
	baseturf = /turf/open/floor/plating/ground/dirt

/obj/effect/baseturf_helper/halflife/underground
	baseturf = /turf/open/floor/plating/ground/rockunder

/area/halflife/outdoors
	name = "\improper Outdoors"
	static_lighting = TRUE
	outdoors = TRUE
	sound_environment = SOUND_ENVIRONMENT_CITY
	ambient_buzz = 'hl13/sound/ambience/townambience.ogg'
	ambient_buzz_vol = 30

	uses_daylight = TRUE
	daylight_multiplier = 0.2

	first_time_text = "City Streets"

	ambientrain = RAIN_OUT

/area/halflife/outdoors/roofs
	name = "\improper Rooftops"
	daylight_multiplier = 0.25

	first_time_text = "City Upper Levels"

/area/halflife/outdoors/tracks
	name = "\improper City Train Tracks"
	daylight_multiplier = 0.25

	first_time_text = "City Train Tracks"

/area/halflife/outdoors/sewage_dump
	name = "\improper Sewage Dump"
	ambient_buzz = 'hl13/sound/ambience/toxic_ambience.ogg'
	daylight_multiplier = 0.3

/area/halflife/outdoors/plaza
	name = "\improper Plaza"
	ambient_buzz_vol = 35

	first_time_text = "Central Plaza"

/area/halflife/outdoors/alley
	name = "\improper Alley Ways"
	ambient_buzz = 'hl13/sound/ambience/tone_alley.ogg'

/area/halflife/outdoors/alley/dropshippad
	name = "\improper Labor Union Drop Ship Pad"

	first_time_text = "Supply Train Depot"

/area/halflife/outdoors/alley/slums
	name = "\improper Slums Alleys"

	first_time_text = "Slums Alleys"

/area/halflife/outdoors/alley/restrictedblock
	name = "\improper Restricted Block Streets"

	first_time_text = "Restricted Block"

/area/halflife/outdoors/forest
	name = "\improper Forested Outlands"
	ambient_buzz = 'hl13/sound/ambience/forest/wind_light02_loop.ogg'
	ambient_buzz_vol = 10
	ambience_index = AMBIENCE_HLFOREST
	sound_environment = SOUND_ENVIRONMENT_FOREST
	max_ambience_cooldown = 30 SECONDS
	min_ambience_cooldown = 10 SECONDS

	daylight_multiplier = 0.3

	first_time_text = "The Outlands"

/area/halflife/outdoors/forest/water
	name = "\improper Outlands Waterways"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'
	ambient_buzz_vol = 35

/area/halflife/indoors
	name = "\improper Indoors"
	icon_state = "away"
	base_lighting_alpha = 15
	light_power = 0.1
	light_range = 2
	ambience_index = AMBIENCE_HLINSIDE
	sound_environment = SOUND_ENVIRONMENT_ROOM
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

	ambientrain = RAIN_IN
	dissipation_rate = 0.75

/area/halflife/indoors/townhall
	name = "\improper Town Hall"
	ambient_buzz = 'hl13/sound/ambience/citadel_ambience.ogg'
	ambient_buzz_vol = 25

	first_time_text = "The Townhall"

/area/halflife/indoors/townhall/courtroom
	name = "\improper Town Hall Court Room"

/area/halflife/indoors/townhall/secondfloor
	name = "\improper Town Hall Second Floor"

	first_time_text = "Town Hall Second Floor"

/area/halflife/indoors/townhall/infirmary
	name = "\improper Nexus Infirmary"

	first_time_text = null

/area/halflife/indoors/townhall/civilprotection
	name = "\improper Nexus"

	first_time_text = "The Nexus"

/area/halflife/indoors/townhall/civilprotection/preproom
	name = "\improper Nexus Prep Room"

/area/halflife/indoors/townhall/civilprotection/equipmentroom
	name = "\improper Nexus Equipment Room"

/area/halflife/indoors/townhall/civilprotection/prison
	name = "\improper Nexus Prison"

/area/halflife/indoors/townhall/civilprotection/armory
	name = "\improper Nexus Armory"

/area/halflife/indoors/townhall/civilprotection/range
	name = "\improper Nexus Shooting Range"

/area/halflife/indoors/apartments/primary
	name = "\improper Primary Apartments"

/area/halflife/indoors/bar
	name = "\improper Bar"

	first_time_text = "District Bar"

/area/halflife/indoors/bar/apartments
	name = "\improper Bar Apartments"

	first_time_text = null

/area/halflife/indoors/dispatch
	name = "\improper Dispatch Core"

/area/halflife/indoors/restaurant
	name = "\improper Restaurant"

	first_time_text = "District Restaurant"

/area/halflife/indoors/trainstation
	name = "\improper Trainstation"

	first_time_text = "The Trainstation"

	ambient_buzz = 'hl13/sound/ambience/trainstation_ambient_loop1.ogg'
	ambient_buzz_vol = 25

/area/halflife/indoors/slums
	name = "\improper Slums"

	first_time_text = "City Slums"

/area/halflife/indoors/hospital
	name = "\improper Hospital"

	first_time_text = "The Hospital"

/area/halflife/indoors/hospital/virology
	name = "\improper Hospital Virology"

	first_time_text = null

/area/halflife/indoors/hospital/office
	name = "\improper Hospital Office"

	first_time_text = null

/area/halflife/indoors/hospital/storage
	name = "\improper Hospital Storage"

	first_time_text = null

/area/halflife/indoors/scienceunion
	name = "\improper Science Union"

	first_time_text = "The Science Union"

/area/halflife/indoors/store
	name = "\improper Store"

	first_time_text = "The Store"

/area/halflife/indoors/laborunion
	name = "\improper Labor Union"

	first_time_text = "The Labor Union"

/area/halflife/indoors/laborunion/dropship
	name = "\improper Labor Union Train Depot"

	first_time_text = "The Labor Union Train Depot"

////// FACTORY START

/area/halflife/indoors/distributioncenter
	name = "\improper Distribution Center"

	first_time_text = "The Distribution Center"

/area/halflife/indoors/hydroponics
	name = "\improper Hydroponics"

	first_time_text = "Hydroponics"

/area/halflife/indoors/productioncenter
	name = "\improper Production Center"
	ambient_buzz = 'hl13/sound/ambience/industrial3.ogg'
	ambient_buzz_vol = 100

	first_time_text = "The Factory"

/area/halflife/indoors/productioncenter/infestation
	name = "\improper Production Center Infestation Control"

	first_time_text = null

/area/halflife/indoors/productioncenter/office
	name = "\improper Production Center Foreman's Office"

	first_time_text = null

/area/halflife/indoors/productioncenter/upper
	name = "\improper Production Center Upper Floor"

	first_time_text = null

/////////FACTORY END

/area/halflife/indoors/laborcamp
	name = "\improper Labor Camp"

	first_time_text = "The Labor Camp"

/area/halflife/indoors/laborcamp/security
	name = "\improper Labor Camp Security Room"

///////// 'old' abandoned areas that are not in the slums

/area/halflife/indoors/old/chapel
	name = "\improper Abandoned Chapel"

/area/halflife/indoors/old/offices
	name = "\improper Abandoned Offices"


///////// 'old' areas end

/area/halflife/indoors/bunker
	ambient_buzz = 'hl13/sound/ambience/bunker2.ogg'
	ambient_buzz_vol = 70





/area/halflife/indoors/sewer
	name = "\improper Sewers"
	base_lighting_alpha = 5
	icon_state = "away"
	ambience_index = AMBIENCE_HLSEWERS
	sound_environment = SOUND_ENVIRONMENT_STONE_CORRIDOR
	ambient_buzz = 'hl13/sound/ambience/corridor.ogg'
	ambient_buzz_vol = 7
	mood_bonus = -2
	mood_message = "<span class='warning'>This place smells terrible.</span>\n"

	first_time_text = "City Sewers"

	ambientrain = RAIN_SEWER

/area/halflife/indoors/sewer/tunnel
	name = "\improper Tunnels"
	ambient_buzz = 'hl13/sound/ambience/bunker1.ogg'
	ambient_buzz_vol = 80

	mood_message = "<span class='warning'>This place is unnerving...</span>\n"

	first_time_text = null

/area/halflife/indoors/sewer/cave
	name = "\improper Mining Caves"

	ambient_buzz = 'hl13/sound/ambience/corridor.ogg'

	first_time_text = "The Mines"

	mood_message = "<span class='warning'>This place is unnerving...</span>\n"

/area/halflife/indoors/sewer/outlandscave
	name = "\improper Outlands Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

	mood_message = "<span class='warning'>I can hear the bugs all around me...</span>\n"

	first_time_text = "The Antlion Caves"

/area/halflife/indoors/sewer/antlioncave
	name = "\improper Infested Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

	mood_message = "<span class='warning'>I can hear the bugs all around me...</span>\n"


// coastal district areas

/area/halflife/indoors/old_harbor
	name = "Abandoned Harbor Buildings"

/area/halflife/outdoors/harbor
	name = "Abandoned Harbor"
	first_time_text = "Abandoned Harbor"

/area/halflife/outdoors/ocean
	name = "Ocean"
	first_time_text = "The Baltic Sea"

/area/halflife/indoors/abandoned_ship
	name = "Abandoned Ship"

// the names of the ships are just pseudo-random ones from last.txt and first_male.txt

/area/halflife/indoors/abandoned_ship/cargo
	name = "Abandoned Cargo Ship"
	first_time_text = "MV Reinhold Trzyński"

/area/halflife/indoors/abandoned_ship/tugboat
	name = "Abandoned Tugboat"
	first_time_text = "MV Sokal-5"

/area/halflife/indoors/abandoned_ship/wrecked_ferry
	name = "Wrecked Ferry"
	first_time_text = "MV Euzebiusz Weznikaz"

// centcom areas

/area/centcom/halflife
	name = "Overwatch Rail Interchange"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

	first_time_text = "City 13 Nexus"

/area/centcom/halflife/ota
	name = "Overwatch Rail Interchange Dispatch"
	ambient_buzz = 'hl13/sound/ambience/citadel_ambience.ogg'

/area/centcom/halflife/relocation_city
	name = "Relocation City"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

	static_lighting = TRUE
	outdoors = TRUE
	sound_environment = SOUND_ENVIRONMENT_CITY
	ambient_buzz = 'hl13/sound/ambience/townambience.ogg'
	ambient_buzz_vol = 25

	base_lighting_alpha = 10

	first_time_text = "Southwatch District"

/area/centcom/halflife/rebel
	name = "Resistance Outpost"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'
	first_time_text = "Resistance Safehouse"

/area/centcom/halflife/deepwaters
	name = "Deep Waters"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'

/area/shuttle/pirate
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'
