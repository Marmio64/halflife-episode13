/datum/weather/rain_snow
	name = "snow"
	desc = "There is a possibility of snow."
	probability = 0

	telegraph_message = span_warning("Drifting particles of snow begin to dust the surrounding area.")
	telegraph_duration = 30 SECONDS
	telegraph_overlay = "light_snow"

	weather_message = span_warning("Snow falls down all around you.")
	weather_overlay = "snow_storm"
	weather_duration_lower = 90 SECONDS
	weather_duration_upper = 180 SECONDS
	use_glow = FALSE

	end_duration = 20 SECONDS
	end_message = span_boldannounce("The snowfall dies down.")
	end_overlay = "light_snow"

	area_type = /area/halflife
	protect_indoors = TRUE
	target_trait = ZTRAIT_RAINSTORM

	barometer_predictable = TRUE

	///Lowest we can cool someone randomly per weather act. Positive values only
	var/cooling_lower = 5
	///Highest we can cool someone randomly per weather act. Positive values only
	var/cooling_upper = 15

/datum/weather/rain_snow/weather_act(mob/living/living)
	living.adjust_bodytemperature(-rand(cooling_lower, cooling_upper))
