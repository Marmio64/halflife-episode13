//TO DO: city scanner camera mode does not work because the camera item requires user to be silicon. Either change the camera, or convert scanners into silicons.

/mob/living/simple_animal/hostile/hl2bot
	var/radio_key = null //which channels can the bot listen to
	var/radio_channel = RADIO_CHANNEL_COMMON //The bot's default radio channel
	var/obj/item/radio/Radio //The bot's radio, for speaking to people.
	var/obj/machinery/camera/builtInCamera = null
	var/nocamera = FALSE //Should the bot have a built in camera or not?
	var/data_hud_type
	hud_possible = list(DIAG_STAT_HUD, DIAG_BOT_HUD, DIAG_HUD, DIAG_PATH_HUD = HUD_LIST_LIST) //Diagnostic HUD views

/mob/living/simple_animal/hostile/hl2bot/Initialize(mapload)
	. = ..()
	access_card = new /obj/item/card/id(src)
	access_card.access += ACCESS_SECURITY
	Radio = new/obj/item/radio(src)
	if(radio_key)
		Radio.keyslot = new radio_key
	Radio.subspace_transmission = TRUE
	Radio.canhear_range = 0 // anything greater will have the bot broadcast the channel as if it were saying it out loud.
	Radio.recalculateChannels()
	if(!nocamera && !builtInCamera)
		builtInCamera = new (src)
		builtInCamera.c_tag = real_name
		builtInCamera.network = list("ss13")
		builtInCamera.internal_light = FALSE

	//If a bot has its own HUD (for player bots), provide it.
	if(data_hud_type)
		var/datum/atom_hud/datahud = GLOB.huds[data_hud_type]
		datahud.show_to(src)

/mob/living/simple_animal/hostile/hl2bot/Destroy()
	qdel(Radio)
	qdel(access_card)
	return ..()

/mob/living/simple_animal/hostile/hl2bot/radio(message, list/message_mods = list(), list/spans, language)
	. = ..()
	if(. != 0)
		return

	if(message_mods[MODE_HEADSET])
		Radio.talk_into(src, message, , spans, language, message_mods)
		return REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] == MODE_DEPARTMENT)
		Radio.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
		return REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] in GLOB.radiochannels)
		Radio.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
		return REDUCE_RANGE

/mob/living/simple_animal/hostile/hl2bot/cityscanner
	name = "City Scanner"
	desc = "A flying machine built to scan the city for malcompliants."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "cityscanner"
	icon_living = "cityscanner"
	friendly_verb_continuous = "scans"
	friendly_verb_simple = "scan"
	loot = list(/obj/item/circuitmaterial)
	del_on_death = 1
	health = 60
	maxHealth = 60
	wander = 0
	speed = -0.33
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC
	speak_emote = list("beeps")
	speech_span = SPAN_ROBOT
	bubble_icon = "machine"
	movement_type = FLYING
	radio_key = /obj/item/encryptionkey/secbot //AI Priv + Security
	radio_channel = RADIO_CHANNEL_SECURITY //Security channel
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	data_hud_type = DATA_HUD_SECURITY_ADVANCED
	faction = list("neutral","silicon","combine")
	death_sound = 'hl13/sound/creatures/cityscanner/cbot_energyexplosion1.ogg'
	ranged = 1 //for flashing
	ranged_cooldown_time = 50
	light_power = 0.75
	light_range = 3
	initial_language_holder = /datum/language_holder/synthetic //All-knowing scanner...
	var/idle_sound_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan_loop1.ogg')
	var/scan_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan1.ogg', 'hl13/sound/creatures/cityscanner/scanner_scan2.ogg')
	var/talk_sounds = list('hl13/sound/creatures/cityscanner/scanner_talk1.ogg', 'hl13/sound/creatures/cityscanner/scanner_talk2.ogg')

	var/obj/item/camera/siliconcam/aicamera = null //photography

	hud_type = /datum/hud/living/cityscanner

/atom/movable/screen/cityscanner
	icon = 'icons/hud/screen_ai.dmi'

/atom/movable/screen/cityscanner/Click()
	if(isobserver(usr) || usr.incapacitated)
		return TRUE

/atom/movable/screen/cityscanner/image_take
	name = "Take Image"
	icon_state = "take_picture"

/atom/movable/screen/cityscanner/image_view
	name = "View Images"
	icon_state = "view_images"

/atom/movable/screen/cityscanner/image_take/Click()
	. = ..()
	if(!.)
		return
	var/mob/living/simple_animal/hostile/hl2bot/cityscanner/scanner = usr
	scanner.aicamera.toggle_camera_mode(usr)

/atom/movable/screen/cityscanner/image_view/cityscanner/Click()
	. = ..()
	if(!.)
		return
	var/mob/living/simple_animal/hostile/hl2bot/cityscanner/scanner = usr
	scanner.aicamera.toggle_camera_mode(usr)

/datum/hud/living/cityscanner/New(mob/living/owner)
	..()
	var/atom/movable/screen/using

	using = new /atom/movable/screen/cityscanner/image_take(null, src)
	using.screen_loc = ui_borg_camera
	static_inventory += using

	using = new /atom/movable/screen/cityscanner/image_view(null, src)
	using.screen_loc = ui_borg_alerts
	static_inventory += using

/mob/living/simple_animal/hostile/hl2bot/cityscanner/binarycheck()
	return TRUE

/mob/living/simple_animal/hostile/hl2bot/cityscanner/Destroy()
	QDEL_NULL(aicamera)

/mob/living/simple_animal/hostile/hl2bot/cityscanner/proc/GetPhoto(mob/user)
	if (aicamera)
		return aicamera.selectpicture(user)

/mob/living/simple_animal/hostile/hl2bot/cityscanner/Initialize(mapload)
	. = ..()
	aicamera = new/obj/item/camera/siliconcam/robot_camera(src)

/mob/living/simple_animal/hostile/hl2bot/cityscanner/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 20, FALSE)
		if(prob(15))
			chosen_sound = pick(scan_sounds)
			playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/hl2bot/cityscanner/OpenFire()
	playsound(src, 'hl13/sound/creatures/cityscanner/scanner_photo1.ogg', 40, FALSE)
	ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/hl2bot/cityscanner/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null, message_range = 7, datum/saymode/saymode, list/message_mods = list())
	..()
	if(stat)
		return
	var/chosen_sound = pick(talk_sounds)
	playsound(src, chosen_sound, 50, FALSE)
