/datum/looping_sound/outside_acid_rain
	start_sound = 'hl13/sound/weather/acidrain/outside/acidrain_outside_start.ogg'
	start_length = 12 SECONDS

	mid_sounds = list(
		'hl13/sound/weather/acidrain/outside/acidrain_outside_mid1.ogg'=1,
		'hl13/sound/weather/acidrain/outside/acidrain_outside_mid2.ogg'=1,
		'hl13/sound/weather/acidrain/outside/acidrain_outside_mid3.ogg'=1,
		'hl13/sound/weather/acidrain/outside/acidrain_outside_mid4.ogg'=1
		)
	mid_length = 12 SECONDS

	end_sound = 'hl13/sound/weather/acidrain/outside/acidrain_outside_end.ogg'
	volume = 55

/datum/looping_sound/inside_acid_rain
	start_sound = 'hl13/sound/weather/acidrain/inside/acidrain_inside_start.ogg'
	start_length = 12 SECONDS

	mid_sounds = list(
		'hl13/sound/weather/acidrain/inside/acidrain_inside_mid1.ogg'=1,
		'hl13/sound/weather/acidrain/inside/acidrain_inside_mid2.ogg'=1,
		'hl13/sound/weather/acidrain/inside/acidrain_inside_mid3.ogg'=1,
		'hl13/sound/weather/acidrain/inside/acidrain_inside_mid4.ogg'=1
		)
	mid_length = 12 SECONDS

	end_sound = 'hl13/sound/weather/acidrain/inside/acidrain_inside_end.ogg'

	volume = 35 //the audio files are already just a bit quieter than the outside ones, but it should still be notably quieter
