/area/halflife
	name = "\improper Unexplored Location"
	icon_state = "away"
	has_gravity = TRUE
	ambience_index = AMBIENCE_HLOUTSIDE
	flags_1 = CAN_BE_DIRTY_1
	requires_power = FALSE
	max_ambience_cooldown = 240 SECONDS
	min_ambience_cooldown = 180 SECONDS

/area/halflife/outdoors
	name = "\improper Outdoors"
	static_lighting = TRUE
	outdoors = TRUE
	sound_environment = SOUND_ENVIRONMENT_CITY
	ambient_buzz = 'hl13/sound/ambience/plaza_amb.ogg'
	ambient_buzz_vol = 20

	uses_daylight = TRUE
	daylight_multiplier = 0.2

/area/halflife/outdoors/roofs
	name = "\improper Rooftops"
	daylight_multiplier = 0.25

/area/halflife/outdoors/sewage_dump
	name = "\improper Sewage Dump"
	ambient_buzz = 'hl13/sound/ambience/toxic_ambience.ogg'
	daylight_multiplier = 0.3

/area/halflife/outdoors/plaza
	name = "\improper Plaza"
	ambient_buzz_vol = 25

/area/halflife/outdoors/alley
	name = "\improper Alley Ways"
	ambient_buzz = 'hl13/sound/ambience/tone_alley.ogg'

/area/halflife/outdoors/forest
	name = "\improper Forested Outlands"
	ambient_buzz = 'hl13/sound/ambience/forest/wind_light02_loop.ogg'
	ambient_buzz_vol = 10
	ambience_index = AMBIENCE_HLFOREST
	sound_environment = SOUND_ENVIRONMENT_FOREST
	max_ambience_cooldown = 30 SECONDS
	min_ambience_cooldown = 10 SECONDS

	daylight_multiplier = 0.3

/area/halflife/indoors
	name = "\improper Indoors"
	icon_state = "away"
	base_lighting_alpha = 15
	light_power = 0.1
	light_range = 2
	ambience_index = AMBIENCE_HLINSIDE
	sound_environment = SOUND_ENVIRONMENT_ROOM
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

/area/halflife/indoors/townhall
	name = "\improper Town Hall"
	ambient_buzz = 'hl13/sound/ambience/citadel_ambience.ogg'
	ambient_buzz_vol = 25

/area/halflife/indoors/bar
	name = "\improper Bar"

/area/halflife/indoors/dispatch
	name = "\improper Dispatch Core"

/area/halflife/indoors/restaurant
	name = "\improper Restaurant"

/area/halflife/indoors/trainstation
	name = "\improper Trainstation"

/area/halflife/indoors/slums
	name = "\improper Slums"

/area/halflife/indoors/hospital
	name = "\improper Hospital"

/area/halflife/indoors/scienceunion
	name = "\improper Science Union"

/area/halflife/indoors/store
	name = "\improper Store"

/area/halflife/indoors/laborunion
	name = "\improper Labor Union"

/area/halflife/indoors/distributioncenter
	name = "\improper Distribution Center"

/area/halflife/indoors/hydroponics
	name = "\improper Hydroponics"

/area/halflife/indoors/productioncenter
	name = "\improper Production Center"
	ambient_buzz = 'hl13/sound/ambience/industrial3.ogg'
	ambient_buzz_vol = 100

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

/area/halflife/indoors/sewer/tunnel
	name = "\improper Tunnels"
	ambient_buzz = 'hl13/sound/ambience/bunker1.ogg'
	ambient_buzz_vol = 80

/area/halflife/indoors/sewer/cave
	name = "\improper Mining Caves"

/area/halflife/indoors/sewer/outlandscave
	name = "\improper Outlands Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

/area/halflife/indoors/sewer/antlioncave
	name = "\improper Infested Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'hl13/sound/ambience/antcaves/cave_howl_loop1.ogg'

/area/centcom/halflife
	name = "Overwatch Rail Interchange"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

/area/centcom/halflife/ota
	name = "Overwatch Rail Interchange Dispatch"
	ambient_buzz = 'hl13/sound/ambience/citadel_ambience.ogg'

/area/centcom/halflife/relocation_city
	name = "Relocation City"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'

	static_lighting = TRUE
	outdoors = TRUE
	sound_environment = SOUND_ENVIRONMENT_CITY
	ambient_buzz = 'hl13/sound/ambience/plaza_amb.ogg'
	ambient_buzz_vol = 20

	base_lighting_alpha = 10

/area/centcom/halflife/rebel
	name = "Resistance Outpost"
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'
