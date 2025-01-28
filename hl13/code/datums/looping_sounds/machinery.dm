/datum/looping_sound/halflife/neonsign
	start_sound = 'sound/machines/click.ogg'
	mid_sounds = list('hl13/sound/halflifemachines/neonloop.ogg'=1)
	end_sound = 'sound/machines/click.ogg'
	mid_length = 8 SECONDS
	extra_range = 1
	volume = 15
	falloff_distance = 1
	falloff_exponent = 5

/datum/looping_sound/halflife/neonsign/busted
	mid_sounds = list('hl13/sound/halflifemachines/neonloop.ogg'=1, 'hl13/sound/halflifemachines/neonloopdysf.ogg'=0.5)
