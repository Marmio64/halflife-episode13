/obj/item/implant/biosig_ert
	name = "biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio

	var/role = "Unit"

	var/card_to_disable = null

/obj/item/implant/biosig_ert/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new/obj/item/encryptionkey/headset_sec
	radio.listening = FALSE
	radio.recalculateChannels()

/obj/item/implant/biosig_ert/implant(mapload)
	. = ..()
	card_to_disable = imp_in.get_idcard()

/obj/item/implant/biosig_ert/activate(cause)
	if(!imp_in)
		return FALSE

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = "TEAM ALERT: Lost biosignal for [role] [mobname] in//N&#@$¤#§>..." // Default message for unexpected causes.
	if(turf)
		message = "TEAM ALERT: Lost biosignal for [role] [mobname] in [turf.name]."


	name = "[mobname]'s Biosignaller"
	radio.talk_into(src, message, RADIO_CHANNEL_SECURITY)

	for(var/atom/movable/mask in GLOB.cpmasks)
		if(mask.loc &&ismob(mask.loc))
			playsound(mask.loc, "hl13/sound/voice/dispatchradio/lostsignalunitscontain.ogg", 50, FALSE)

	if(card_to_disable)
		var/obj/item/card/id/advanced/idcard = card_to_disable
		idcard.access = null

/obj/item/implant/biosig_ert/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Combine Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to other squad members over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a blue, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosig_ert // Testing/admin purposes; shouldn't be obtainable.
	imp_type = /obj/item/implant/biosig_ert

/obj/item/implant/biosig_ert/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(on_death))

/obj/item/implant/biosig_ert/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_LIVING_DEATH)

/obj/item/implant/biosig_ert/proc/on_death(mob/living/source)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, TYPE_PROC_REF(/obj/item/implant/biosig_ert, activate))

/obj/item/implant/biosig_ert/cp
	role = "Protection Team Unit"

/obj/item/implant/biosig_ert/ota
	role = "OTA Unit"

/obj/item/implant/biosig_ert/administrator
	role = "District Administrator"

/obj/item/implant/biosig_ert/laborlead
	role = "Labor Lead"
