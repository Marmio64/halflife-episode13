/obj/machinery/clothes_vendor
	name = "\improper Filthy Clothes Vendor"
	desc = "A machine which deposits filthy uniforms left behind from transferring citizens and old corpses. Accepts clean clothes in exchange for a labor certificate voucher."
	icon_state = "box_dispenser"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1500 //Because it is pretty important, and there probably will only be one of them.

	/// how many clean clothes deposited currently
	var/clothes_deposited = 0

	///The machine's internal radio, used to broadcast alerts.
	var/obj/item/radio/radio
	///The channel we announce a siphon over.
	var/radio_channel = RADIO_CHANNEL_SECURITY

	var/radio_key = /obj/item/encryptionkey/headset_sec

	///Prevents spamming the security channel with alerts
	var/alert_cooldown = 90 SECONDS

	var/next_alert = 0

/obj/machinery/clothes_vendor/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [clothes_deposited] clean clothes deposited. Once five uniforms are deposited, a labor certificate will be dispensed.")
	. += span_notice("Use a labor certificate on it in order to alert civil protection that you have one. Assuming you have enough certificates, they should let you go.")

/obj/machinery/clothes_vendor/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.subspace_transmission = TRUE
	radio.canhear_range = 0
	radio.set_listening(FALSE)
	if(radio_key)
		radio.keyslot = new radio_key
	radio.recalculateChannels()

/obj/machinery/clothes_vendor/interact(mob/living/carbon/human/user)
	. = ..()

	playsound(src, 'hl13/sound/machines/combine_button3.ogg', 50, TRUE, extrarange = -3)

	if(!do_after(user, 8 SECONDS, src))
		to_chat(usr, span_warning("The machine did not finish depositing dirty clothes."))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	playsound(src, 'hl13/sound/machines/combine_button5.ogg', 50, TRUE, extrarange = -3)

	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)

	new /obj/item/dirty_clothes(loc)

	return

/obj/machinery/clothes_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/clothing/under/citizen))
		to_chat(usr, span_notice("Clean clothes deposited."))
		clothes_deposited++
		qdel(I)
		if(clothes_deposited >= 5)
			to_chat(usr, span_notice("Labor Certificate dispensed."))
			new /obj/item/labor_certificate(user.loc)
	else if(istype(I, /obj/item/labor_certificate))
		if(next_alert < world.time)
			next_alert = world.time + alert_cooldown
			radio.talk_into(src, "Attention, a Nexus prison inmate is declaring their possession of a Labor Certificate.", radio_channel)
		else
			to_chat(usr, span_notice("Civil Protection notifications on cooldown, please wait."))
	else
		to_chat(usr, span_notice("This is not a compatible clean uniform to deposit."))

/obj/item/dirty_clothes
	name = "Filthy Citizen Uniform"
	desc = "A disgustingly filthy citizen uniform. You refuse to wear it within its current state, but putting it in a washing machine should fix it up for the most part."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "dirtyuniform"

/obj/item/dirty_clothes/machine_wash(obj/machinery/washing_machine/washer)
	new /obj/item/clothing/under/citizen(loc)
	qdel(src)
