/obj/machinery/combine_datapodterminal
	name = "combine datapod terminal"
	desc = "A server terminal which houses a combine datapod, storing essential information about combine operations, district layouts, security information, and more."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "datapodterminal"

	var/hacked = FALSE

	density = TRUE

/obj/machinery/combine_datapodterminal/proc/hacked()
	if(hacked)
		return

	do_sparks(1, FALSE, src)
	hacked = TRUE
	icon_state = "datapodterminal_hacked"
	SSsociostability.modifystability(-40)

	// Dispatch gets alerted about hacks
	var/alertstr = span_userdanger("Network Alert: Data pod hack detected[get_area(src)?" in [get_area_name(src, TRUE)]":". Unable to pinpoint location"].")
	for(var/mob/living/silicon/ai/AI in GLOB.player_list)
		to_chat(AI, alertstr)

	dispense_datapod()

/obj/machinery/combine_datapodterminal/examine(mob/user)
	. = ..()
	if(hacked)
		. += span_notice("It looks like its data pod has been stolen due to a succesful hack.")
	else
		. += span_notice("A hacking multitool may be able to eject the datapod inside while disrupting district sociostability.")

/obj/machinery/combine_datapodterminal/proc/dispense_datapod()
	playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
	say("Ejecting Datapod...")
	sleep(4 SECONDS)
	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)
	new /obj/item/combine_datapod(loc)

/obj/machinery/combine_datapodterminal/emag_act(mob/user, obj/item/card/emag/emag_card)
	hacked()
	return TRUE

/obj/machinery/combine_datapodterminal/deconstruct(disassembled = TRUE)
	. = ..()
	if(!hacked) //cant break a hacked machine for extra socio loss, its useless now
		SSsociostability.modifystability(-40) //can't cheese rebels by just breaking it

/obj/item/combine_datapod
	name = "Combine Datapod"
	desc = "A data storage device used by the Combine to store sensitive information."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "datapod"
	w_class = WEIGHT_CLASS_SMALL
