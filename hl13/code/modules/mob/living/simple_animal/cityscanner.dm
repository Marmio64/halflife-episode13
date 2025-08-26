/mob/living/silicon/robot/cityscanner
	name = "City Scanner"
	desc = "A flying machine built to scan the city for malcompliants."
	maxHealth = 60
	health = 60
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "cityscanner"
	faction = list("neutral","silicon","combine")
	death_sound = 'hl13/sound/creatures/cityscanner/cbot_energyexplosion1.ogg'

	movement_type = FLYING

	var/idle_sound_chance = 50
	var/idle_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan_loop1.ogg')
	var/scan_sounds = list('hl13/sound/creatures/cityscanner/scanner_scan1.ogg', 'hl13/sound/creatures/cityscanner/scanner_scan2.ogg')
	//var/talk_sounds = list('hl13/sound/creatures/cityscanner/scanner_talk1.ogg', 'hl13/sound/creatures/cityscanner/scanner_talk2.ogg')

	var/model_type = /obj/item/robot_model/scanner

/mob/living/silicon/robot/cityscanner/dispatch_shell
	shell = TRUE

/mob/living/silicon/robot/cityscanner/Initialize(mapload)
	. = ..()
	INVOKE_ASYNC(model, TYPE_PROC_REF(/obj/item/robot_model, transform_to), model_type, TRUE)

/mob/living/silicon/robot/cityscanner/cannister_targeter
	model_type = /obj/item/robot_model/scanner/cannister_targeter

/obj/item/robot_model/scanner
	name = "City Scanner"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
	)
	radio_channels = list(RADIO_CHANNEL_SECURITY)
	cyborg_base_icon = "cityscanner"
	model_select_icon = "security"

/obj/item/robot_model/scanner/cannister_targeter
	name = "City Scanner"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/weldingtool/halflife/scanner,
		/obj/item/halflife/cannister_targeter,
	)
	radio_channels = list(RADIO_CHANNEL_SECURITY)
	cyborg_base_icon = "cityscanner"
	model_select_icon = "security"

/mob/living/silicon/robot/cityscanner/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 20, FALSE)
		if(prob(15))
			chosen_sound = pick(scan_sounds)
			playsound(src, chosen_sound, 50, FALSE)

/mob/living/silicon/robot/death(gibbed)
	..()
	new /obj/item/halflife/combine_battery(src.loc)
	gib()

/obj/item/weldingtool/halflife/scanner
	name = "integrated welding tool"
	desc = "A tiny laser cutting tool which powers itself with fuel. Used for repairing and cutting."
	icon = 'icons/obj/tools.dmi'
	icon_state = "miniwelder"
	toolspeed = 0.5

/obj/item/weldingtool/halflife/scanner/cyborg_unequip(mob/user)
	if(!isOn())
		return
	switched_on(user)
