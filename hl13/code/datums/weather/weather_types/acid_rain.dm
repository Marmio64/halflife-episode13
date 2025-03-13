/datum/weather/rain
	name = "rain"
	desc = "There is a possibility of precipitation."

	telegraph_message = span_warning("Thunder rumbles far above, as the air grows cold and damp.")
	telegraph_duration = 30 SECONDS //if you change this i will kill you because the sound file lines up with this
	telegraph_sound = 'hl13/sound/weather/acidrain/acidrain_telegraph.ogg'

	weather_message = span_warning("Rain pours down around you.")
	weather_overlay = "rain"
	weather_color = "#69b6ff"
	overlay_plane = HIGHEST_EVER_PLANE + 1 //why does this work, it shouldn't work, this is stupid and i hate it, why is this the ONLY thing that works, why won't it just show up normally, it shows up normally on lavaland, but not on jungleland, i don't understand it doesn't make any sense, this is all wrong

	weather_duration_lower = 90 SECONDS
	weather_duration_upper = 180 SECONDS

	target_trait = ZTRAIT_RAINSTORM

	end_duration = 20 SECONDS
	end_message = span_boldannounce("The downpour gradually slows to a light shower.")

	area_type = /area
	protect_indoors = TRUE

	probability = 100

	barometer_predictable = TRUE

/datum/weather/rain/start()
	. = ..()
	for(var/M in GLOB.player_list)
		if(isliving(M))
			var/mob/living/L = M
			if(L.client)
				SSdroning.play_rain(get_area(L), L.client)

/datum/weather/rain/end()
	. = ..()
	for(var/M in GLOB.player_list)
		if(isliving(M))
			var/mob/living/L = M
			if(L.client)
				SSdroning.kill_rain(L.client)

/datum/weather/rain/weather_act(mob/living/L)
	if(L.mind || L.client) //could be pretty intensive, so only do this to things with players in them
		L.adjust_wet_stacks(3*log(2, (60) / 10))
		L.extinguish_mob() // permeability affects the negative fire stacks but not the extinguishing
