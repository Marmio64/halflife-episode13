/obj/machinery/ration_vendor
	name = "\improper Ration Vendor"
	desc = "A machine that will deliver you a suitable ration depending on your status, and if you have a ration voucher loaded on your account. Reminder that rations stored in this machine are independent from other machines."
	icon_state = "ration_dispenser"
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	var/icon_state_vend = "ration_dispenser-vend"
	var/icon_state_deny = "ration_dispenser-deny"
	resistance_flags = FIRE_PROOF
	max_integrity = 1500 //Because it is pretty important, and there probably will only be one of them.
	var/datum/bank_account/account  //person's account.
	var/obj/item/card/id/C //the account of the person using the vendor unit.

	/// How many rations are in this specific unit? Can be refilled any time, and stops dispensing rations if it runs out.
	var/rations_stored = 15

/obj/machinery/ration_vendor/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [rations_stored] rations left to dispense.")

/obj/machinery/ration_vendor/interact(mob/living/carbon/human/user)
	. = ..()
	var/ration_quality = 3 //1 is terrible, 2 is lowgrade, 3 is standard, 4 is better/production grade, 5 is loyalty grade, 6 is best grade
	var/vortigaunt = FALSE //are they a vortigaunt role?

	if(rations_stored < 1)
		say("Machine out of rations, please refill.") // Refill immediately!
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return

	if(.)
		return
	C = user.get_idcard(TRUE)
	if(!istype(C))
		say("No ID card detected.") // No unidentified crew.
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return
	if(C.registered_account)
		account = C.registered_account
	else
		say("Warning, an account is not detected on your ID card. Contact a local protection team member immediately.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return
	if(!account.ration_voucher)
		say("You do not have a usable ration voucher in your account.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return
	if(SSration.cycle_active == FALSE)
		say("A ration cycle is not currently active.") // You snooze you lose.
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return

	say("Citizen Account Record detected. Determining ration reward.")

	playsound(src, 'hl13/sound/machines/combine_button3.ogg', 50, TRUE, extrarange = -3)

	if(!do_after(user, 6 SECONDS, src))
		to_chat(usr, span_warning("The machine did not finish determining your ration reward!"))
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return

	var/username = user.get_face_name(user.get_id_name())
	var/datum/record/crew/R = find_record(username)
	if(R)
		if(R.wanted_status == WANTED_ARREST)
			say("Warning, your civil status is in question by local protection teams. Please apply.")
			playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
			flick(icon_state_deny,src)
			return
		if(R.wanted_status == WANTED_PAROLE) //Loyalists get a higher grade of rations
			ration_quality++
		if(R.wanted_status == WANTED_SUSPECT) //Suspected people are given a worse grade of rations
			ration_quality--
	if(account?.account_job.title == "Vortigaunt Slave") //Shitty ration bonus handled in job datum, this just lets the ration vendor knows they're a vort
		vortigaunt = TRUE
	ration_quality += account?.account_job.ration_bonus //applies job specific ration bonuses

	account.ration_voucher = FALSE

	//say("Ration reward determined. Please wait for ration to be dispensed.")

	playsound(src, 'hl13/sound/machines/combine_button5.ogg', 50, TRUE, extrarange = -3)

	//sleep(1 SECONDS)

	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)

	flick(icon_state_vend,src)

	//sleep(2 SECONDS)

	dispense(ration_quality, vortigaunt)
	return

/obj/machinery/ration_vendor/proc/dispense(quality, vortigaunt)
	SSsociostability.modifystability(1) //Compliance brings stability.

	rations_stored--

	flick(icon_state_vend,src)

	if(SSsociostability.sociostability > 200) //Failure to maintain sociostability means punishment time.
		if(vortigaunt)
			say("Here is your designated meal, biotic.")
		else
			say("Enjoy your designated meal.")
	else
		say("Low district sociostability detected. Five ration quality units deducted.")
		quality--

	switch(quality)
		if(0)
			new /obj/item/reagent_containers/cup/soda_cans/breenwater/purple(loc) //very sad... Only way to get rn is to be a vort, on suspect status, with low district sociostability
		if(1)
			new /obj/item/storage/box/halflife/worstration(loc)
		if(2)
			new /obj/item/storage/box/halflife/badration(loc)
		if(3)
			new /obj/item/storage/box/halflife/ration(loc)
		if(4)
			new /obj/item/storage/box/halflife/betterration(loc)
		if(5)
			new /obj/item/storage/box/halflife/loyaltyration(loc)
		if(6 to 10)
			new /obj/item/storage/box/halflife/bestration(loc)
			if(rations_stored > 0)
				rations_stored-- ///The excess of the upper class is more draining. However, even if it should go into the negatives, we'll let them have their correct ration grade.

/obj/machinery/ration_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ration_construction/container))
		var/obj/item/ration_construction/container/C = I
		if(C.completed == TRUE)
			to_chat(usr, span_notice("Rations succesfully inserted."))
			rations_stored += 3
			qdel(I)
			new /obj/item/ration_construction/used_container(user.loc)
		else
			to_chat(usr, span_notice("This ration container is not fully refilled."))
