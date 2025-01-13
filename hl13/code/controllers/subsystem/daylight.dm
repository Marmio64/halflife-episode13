#define NIGHT_TURF_BRIGHTNESS 0.1

#define DAY_LENGTH 30 MINUTES //With 30 minutes, days are 18000 deciseconds long

#define MORNING_START (DAY_LENGTH / 4) //With 30 minutes, morning is at 4500 deciseconds

#define AFTERNOON_START (DAY_LENGTH / 2) //With 30 minutes, afternoon is at 9000 deciseconds

#define DUSK_START (DAY_LENGTH * 0.75) //With 30 minutes, dusk is at 13500 deciseconds

#define NIGHT_START (DAY_LENGTH * 0.9) //With 30 minutes, night is at 16200 deciseconds

#define DAY_CYCLE_MORNING "Morning"

#define DAY_CYCLE_AFTERNOON "Afternoon"

#define DAY_CYCLE_DUSK "Dusk"

#define DAY_CYCLE_NIGHT "Night"

SUBSYSTEM_DEF(daylight)
	name = "Daylight"
	wait = 2 SECONDS
	flags = SS_NO_INIT
	/// Time required to complete a full day-night cycle
	var/daylight_time = DAY_LENGTH

	/// What is the current time?
	var/current_day_time = 0

	/// Coefficient for setting area lights
	var/light_coefficient = 0

	/// Which part of the day cycle is currently active?
	var/day_cycle_active = DAY_CYCLE_NIGHT

	/// All areas that should update their lighting based on time of day
	var/list/area/daylight_areas = list()

/datum/controller/subsystem/daylight/proc/add_lit_area(area/new_area)
	daylight_areas.Add(new_area)

/datum/controller/subsystem/daylight/proc/remove_lit_area(area/old_area)
	daylight_areas.Remove(old_area)

/datum/controller/subsystem/daylight/fire(resumed = FALSE)
	current_day_time += 2 SECONDS

	if(current_day_time >= DAY_LENGTH)
		current_day_time = 0

	if(current_day_time >= NIGHT_START || current_day_time <= MORNING_START)
		day_cycle_active = DAY_CYCLE_NIGHT
		if(light_coefficient > 0)
			light_coefficient -= 0.025
	if(current_day_time > MORNING_START && current_day_time <= AFTERNOON_START)
		day_cycle_active = DAY_CYCLE_MORNING
		if(light_coefficient < 0.5)
			light_coefficient += 0.025
	if(current_day_time > AFTERNOON_START && current_day_time <= DUSK_START )
		day_cycle_active = DAY_CYCLE_AFTERNOON
		if(light_coefficient < 1)
			light_coefficient += 0.025
	if(current_day_time > DUSK_START  && current_day_time <= NIGHT_START)
		day_cycle_active = DAY_CYCLE_DUSK
		if(light_coefficient > 0.5)
			light_coefficient -= 0.025

	//							 	Converts into minutes	Converts into minutes
	//var/light_coefficient = ((255 / (DAY_LENGTH / 600)) * (current_day_time/600))
	var/light_alpha = round(255 * light_coefficient)
	var/light_color = rgb(255, 130 + 125 * light_coefficient, 130 + 125 * light_coefficient)
	for(var/area/lit_area as anything in daylight_areas)
		lit_area.set_base_lighting(light_color, light_alpha * lit_area.daylight_multiplier)
