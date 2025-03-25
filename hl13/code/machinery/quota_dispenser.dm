/obj/machinery/quota_terminal
	name = "Quota Terminal"
	desc = "A console, intake, and dispenser hookup which assigns quotas to the district's civil protection force, which must be completed or a loss in sociostability will occur."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "quotaterminal"
	density = TRUE

	///The machine's internal radio, used to broadcast alerts.
	var/obj/item/radio/radio
	///The channel we announce a siphon over.
	var/radio_channel = RADIO_CHANNEL_SECURITY

	var/radio_key = /obj/item/encryptionkey/headset_sec

	///Amount of time before the next quota starts
	var/next_quota = 0
	///The amount of time we have between quotas
	var/time_between_quotas = 20 MINUTES

	var/quota_complete = TRUE

	var/obj/item/required_item = null

	var/list/possible_picks = list(/obj/item/gun/ballistic/automatic/pistol/makeshift, /obj/item/clothing/under/citizen/refugee)

	var/item_quantity_required = 1

	var/item_quanity_received = 0

/obj/machinery/quota_terminal/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.subspace_transmission = TRUE
	radio.canhear_range = 0
	radio.set_listening(FALSE)
	if(radio_key)
		radio.keyslot = new radio_key
	radio.recalculateChannels()

/obj/machinery/quota_terminal/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/machinery/quota_terminal/proc/give_quota()
	if(SSsecurity_level.get_current_level_as_number() > SEC_LEVEL_BLUE)
		radio.talk_into(src, "Warning, low socio-level detected, quota postponed.", radio_channel)
		return

	radio.talk_into(src, "Attention, new quota received. Compliance is mandatory.", radio_channel)
	item_quanity_received = 0
	item_quantity_required = rand(1,3)
	required_item = pick_n_take(possible_picks)

	if(!quota_complete)
		radio.talk_into(src, "The previous quota was not completed in time. Sociostability score has been deducted.", radio_channel)
		SSsociostability.modifystability(-50) //boowomp

	quota_complete = FALSE

/obj/machinery/quota_terminal/examine(mob/user)
	. = ..()


	if(quota_complete)
		. += span_notice("No quota is currently active.")
		return

	. += span_notice("The current quota is: [item_quantity_required] [required_item.name].")

	. += span_notice("So far [item_quanity_received] quota items have been deposited.")

/obj/machinery/quota_terminal/process(seconds_per_tick)
	. = ..()
	if(next_quota < world.time)
		give_quota()
		next_quota = world.time + time_between_quotas

/obj/machinery/quota_terminal/attackby(obj/item/I, mob/user, params)
	if(istype(I, required_item))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
		item_quanity_received++
		if(item_quanity_received >= item_quantity_required)
			quota_complete = TRUE
			radio.talk_into(src, "Quota has been completed.", radio_channel)
			SSsociostability.modifystability(5)
		qdel(I)
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
