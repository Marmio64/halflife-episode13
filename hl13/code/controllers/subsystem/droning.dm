//Used to manage sending droning sounds to various clients
SUBSYSTEM_DEF(droning)
	name = "Droning"
	flags = SS_NO_INIT|SS_NO_FIRE

/datum/controller/subsystem/droning/proc/kill_rain(client/victim)
	if(!victim?.rain_sound)
		return
	victim?.mob.stop_sound_channel(CHANNEL_RAIN)
	victim?.rain_sound = FALSE

/datum/controller/subsystem/droning/proc/play_rain(area/area_entered, client/dreamer)
	if(!area_entered || !dreamer)
		return
	kill_rain(dreamer)

	var/amb_sound_list = null
	if(area_entered.ambientrain)
		amb_sound_list = area_entered.ambientrain

	if(!amb_sound_list)
		return
	var/sound/loop_sound = sound(pick(amb_sound_list), repeat = TRUE, wait = 0, channel = CHANNEL_RAIN, volume = (dreamer.prefs.read_preference(/datum/preference/numeric/sound_ambience_volume)/2))
	SEND_SOUND(dreamer, loop_sound)
	dreamer.rain_sound = TRUE
