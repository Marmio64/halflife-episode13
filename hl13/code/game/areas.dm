/area/halflife
	name = "\improper Unexplored Location"
	icon_state = "away"
	has_gravity = TRUE
	ambience_index = "none"
	flags_1 = CAN_BE_DIRTY_1
	requires_power = FALSE
	max_ambience_cooldown = 340 SECONDS
	min_ambience_cooldown = 280 SECONDS
	var/dissipation_rate = 1.5 // higher numbers = quicker dissipation

/obj/effect/baseturf_helper/halflife
	baseturf = /turf/open/floor/plating/ground/dirt

/obj/effect/baseturf_helper/halflife/underground
	baseturf = /turf/open/floor/plating/ground/rockunder

/area/halflife/outdoors
	name = "\improper Outdoors"
	static_lighting = TRUE
	outdoors = TRUE
	//ambience_index = AMBIENCE_HLOUTSIDE
	max_ambience_cooldown = 30 SECONDS
	min_ambience_cooldown = 15 SECONDS
	sound_environment = SOUND_ENVIRONMENT_CITY
	ambient_buzz = 'hl13/sound/ambience/townambience.ogg'
	ambient_buzz_vol = 25

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
	ambient_buzz_vol = 30

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

	first_time_text = "The Outlands"
	first_time_sound = 'hl13/sound/ambience/hl2_song11.ogg'
	first_time_sound_vol = 50

/area/halflife/outdoors/forest/water
	name = "\improper Outlands Waterways"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'
	ambient_buzz_vol = 30
	first_time_sound = null

/area/halflife/outdoors/outlands_city
	name = "\improper Condemned City"
	ambient_buzz = 'hl13/sound/ambience/town_abandoned.ogg'

	first_time_text = "The Outlands"

	ambient_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_03.ogg'
	ambient_music_vol = 20

	//ambience_index = AMBIENCE_HLSEWERS

	daylight_multiplier = 0.15

/area/halflife/outdoors/deployment_city
	name = "\improper City 13"
	ambience_index = AMBIENCE_HLDEATHMATCH
	min_ambience_cooldown = 5 SECONDS
	max_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/deathmatch/deathmatchbuzz.ogg'
	ambient_buzz_vol = 12

	first_time_text = null

	ambient_music_vol = 20

/area/halflife/outdoors/deployment_city/zombies

	ambient_buzz = 'hl13/sound/ambience/town_abandoned.ogg'
	ambient_buzz_vol = 25

	ambient_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_03.ogg'

	ambient_music_vol = 20
	daylight_multiplier = 0.15

/area/halflife/outdoors/deployment_city/zombies/xen_base
	name = "\improper Infested Zone"

/area/halflife/outdoors/deployment_city/forest
	daylight_multiplier = 0.35

/area/halflife/indoors/combat_deployment
	ambient_music_vol = 20
	first_time_text = null

/area/halflife/indoors/combat_deployment/combine_base
	name = "\improper Combine Nexus"

/area/halflife/indoors/combat_deployment/rebel_base
	name = "\improper Rebel Hideout"

/area/halflife/indoors
	name = "\improper Indoors"
	icon_state = "away"
	base_lighting_alpha = 15
	light_power = 0.1
	light_range = 2
	//ambience_index = AMBIENCE_HLINSIDE
	sound_environment = SOUND_ENVIRONMENT_ROOM
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

	ambientrain = RAIN_IN
	dissipation_rate = 0.75

/area/halflife/indoors/outlands
	name = "\improper Outlands Indoors"

/area/halflife/indoors/outlands/shop
	first_time_text = "Refugee Shop - The Lost Haven"

	mood_bonus = 2
	mood_message = "I finally feel a moment of peace here, no matter how small that moment is."

	ambient_music = 'hl13/sound/ambience/bgm/losthaven.ogg'
	ambient_music_vol = 40

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
	ambient_buzz = 'hl13/sound/ambience/citadel_hub_ambience1.ogg'

/area/halflife/indoors/townhall/civilprotection
	name = "\improper Nexus"

	first_time_text = "The Nexus"
	ambient_buzz = 'hl13/sound/ambience/citadel_hub_ambience1.ogg'

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

/area/halflife/indoors/south_checkpoint
	name = "\improper South Checkpoint"

	first_time_text = "South Checkpoint"

/area/halflife/indoors/slums_checkpoint
	name = "\improper Slums Checkpoint"

	first_time_text = "Slums Checkpoint"

/area/halflife/indoors/conscript_bunker
	name = "\improper Conscript Bunker"

	first_time_text = "Conscript Bunker"

	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 70

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

/area/halflife/indoors/old/factory
	name = "\improper Abandoned Manufacturing Area"


///////// 'old' areas end

/area/halflife/indoors/bunker
	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 70

/area/halflife/indoors/bunker/combat_deployment
	dissipation_rate = 1.5

/area/halflife/indoors/bunker/unpowered
	requires_power = TRUE


/area/halflife/indoors/sewer
	name = "\improper Sewers"
	base_lighting_alpha = 5
	icon_state = "away"
	ambience_index = AMBIENCE_HLSEWERS
	sound_environment = SOUND_ENVIRONMENT_STONE_CORRIDOR
	max_ambience_cooldown = 40 SECONDS
	min_ambience_cooldown = 20 SECONDS
	ambient_buzz = 'hl13/sound/ambience/sewer1.ogg'
	ambient_buzz_vol = 60
	ambient_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_03.ogg'
	ambient_music_vol = 35
	mood_bonus = -2
	mood_message = "<span class='warning'>This place smells terrible.</span>\n"

	first_time_text = "City Sewers"

	ambientrain = RAIN_SEWER

	first_time_sound = 'hl13/sound/ambience/hl1_song5.ogg'
	first_time_sound_vol = 50

/area/halflife/indoors/sewer/hidden
	ambient_music_vol = 1
	ambient_buzz_vol = 80
	ambientrain = RAIN_IN

	first_time_sound = null

	mood_message = "<span class='warning'>Something is not right here...</span>\n"

/area/halflife/indoors/sewer/hidden/indoors_generic
	first_time_text = "Indoors"

	//ambient_music = 'hl13/sound/ambience/bgm/silentheaven.ogg'
	//ambient_music_vol = 10
	//ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'
	//ambient_buzz_vol = 25

	ambient_buzz_vol = 100
	ambient_buzz = 'hl13/sound/ambience/scaryforest.ogg'
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/halflife/indoors/sewer/hidden/outside_forest
	first_time_text = "Outside"

	ambient_buzz_vol = 100
	ambient_buzz = 'hl13/sound/ambience/scaryforest.ogg'
	sound_environment = SOUND_ENVIRONMENT_FOREST

/area/halflife/indoors/sewer/hidden/bunker
	first_time_text = "The Bunker"

	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 80
	sound_environment = SOUND_ENVIRONMENT_CAVE

/area/halflife/indoors/sewer/hidden/spawn_room
	first_time_text = null

	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 20

	ambient_music = 'hl13/sound/ambience/bgm/spawnroom.ogg'
	ambient_music_vol = 20

	sound_environment = SOUND_ENVIRONMENT_CAVE

/area/halflife/indoors/sewer/tunnel
	name = "\improper Tunnels"
	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 70
	ambient_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_01.ogg'
	ambient_music_vol = 8

	mood_message = "<span class='warning'>This place is unnerving...</span>\n"

	first_time_text = null
	first_time_sound = null

/area/halflife/indoors/sewer/tunnel/outlands
	name = "\improper Outlands Tunnels"

/area/halflife/indoors/sewer/cave
	name = "\improper Mining Caves"

	ambient_buzz = 'hl13/sound/ambience/cave_ambience.ogg'
	ambient_buzz_vol = 55

	first_time_text = "The Mines"
	first_time_sound = 'hl13/sound/ambience/suppressionfield.ogg'
	first_time_sound_vol = 35

	mood_message = "<span class='warning'>This place is unnerving...</span>\n"

/area/halflife/indoors/sewer/outlandscave
	name = "\improper Outlands Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

	ambient_buzz_vol = 7

	mood_message = "<span class='warning'>I can hear the bugs all around me...</span>\n"

	first_time_text = "The Antlion Caves"
	first_time_sound = null

/area/halflife/indoors/sewer/antlioncave
	name = "\improper Infested Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

	ambient_buzz_vol = 7

	mood_message = "<span class='warning'>I can hear the bugs all around me...</span>\n"

	first_time_sound = null


// coastal district areas

/area/halflife/indoors/old_harbor
	name = "Abandoned Harbor Buildings"

/area/halflife/outdoors/harbor
	name = "Abandoned Harbor"
	first_time_text = "Abandoned Harbor"

/area/halflife/outdoors/ocean
	name = "Ocean"
	first_time_text = "The Baltic Sea"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'

/area/halflife/outdoors/coast
	name = "The Coast"
	first_time_text = "The Coast"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'

/area/halflife/indoors/abandoned_ship
	name = "Abandoned Ship"
	area_limited_icon_smoothing = /area/halflife/indoors/abandoned_ship //shouldnt smooth with the docks because that looks ugly and makes no sense
	mood_bonus = -1 //not too bad but being on a pre-war ship that is either going to be beached (none of these are) or drift out to sea and sink should be spooky
	mood_message = "<span class='warning'>I can hear the hull groaning constantly...</span>\n"
	ambient_buzz = 'hl13/sound/ambience/lake_water.wav'

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

///prison stuff

/area/halflife/indoors/prison
	name = "\improper Prison Indoors"

	first_time_text = "Nowy Jutro Prison"
	ambient_buzz = 'hl13/sound/ambience/bunker3.ogg'
	ambient_buzz_vol = 40

/area/halflife/indoors/prison/cargo
	name = "\improper Prison Cargo Bay"

	first_time_text = "Cargo Bay"

/area/halflife/indoors/prison/cells
	name = "\improper Prison Cells"

/area/halflife/indoors/prison/engineering
	name = "\improper Prison Engineering"

	first_time_text = "Engineering Area"

	ambient_buzz = 'hl13/sound/ambience/industrial4.ogg'
	ambient_buzz_vol = 70

/area/halflife/indoors/prison/infirmary
	name = "\improper Prison Infirmary"

	first_time_text = "Infirmary"

/area/halflife/indoors/prison/cafeteria
	name = "\improper Prison Cafeteria"

	first_time_text = "Cafeteria"

	ambient_buzz = 'hl13/sound/ambience/trainstation_ambient_loop1.ogg'
	ambient_buzz_vol = 20

/area/halflife/indoors/prison/factory
	name = "\improper Prison Factory"

	first_time_text = "Factory"

	ambient_buzz = 'hl13/sound/ambience/industrial4.ogg'
	ambient_buzz_vol = 70

/area/halflife/indoors/prison/gym
	name = "\improper Prison Gym"

	first_time_text = "Gym"

/area/halflife/indoors/prison/rec_room
	name = "\improper Prison Recreation Room"

	first_time_text = "Recreation Room"

/area/halflife/indoors/prison/mining
	name = "\improper Prison Mining Entrance"

	first_time_text = "Mining Area"

/area/halflife/indoors/prison/commissary
	name = "\improper Prison Commissary"

	first_time_text = "Commissary"

	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'
	ambient_buzz_vol = 20

/area/halflife/indoors/prison/intake
	name = "\improper Prison Intake"

	first_time_text = "Nowy Jutro Prison Intake"

/area/halflife/indoors/prison/security
	name = "\improper Prison Security Area"

	first_time_text = "Security Area"
	ambient_buzz = 'hl13/sound/ambience/citadel_ambience.ogg'
	ambient_buzz_vol = 12

	ambient_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_13.ogg'
	ambient_music_vol = 17

/area/halflife/indoors/prison/security/rehabilitation
	name = "\improper Prison Rehabilitation Room"

	first_time_text = "Rehabilitation Room"

/area/halflife/indoors/prison/security/solitary
	name = "\improper Solitary Confinement"

	first_time_text = "Solitary Confinement"

/area/halflife/indoors/prison/security/armory
	name = "\improper Prison Armory"

	first_time_text = "Armory"

/area/halflife/indoors/prison/security/warden
	name = "\improper Warden's Office"

	first_time_text = "Warden's Office"

/area/halflife/indoors/prison/security/divisional
	name = "\improper Divisional Lead's Office"

	first_time_text = "Divisional Lead's Office"

/area/halflife/indoors/prison/entrance
	name = "\improper Prison Entrance"

	first_time_text = "Nowy Jutro Prison Entrance"

/area/halflife/outdoors/forest/prison_yard
	name = "\improper Prison Yard"

	first_time_text = "Prison Yard"
	first_time_sound = null
