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

	/// How many rations have been dispensed so far?
	var/rations_dispensed = 0
	/// When does the vendor start to malfunction from excessive use?
	var/ration_breaklimit = 26
	/// Is the vendor malfunctioning?
	var/malfunctioning = FALSE

/obj/machinery/ration_vendor/examine(mob/user)
	. = ..()
	. += span_notice("The vendor has [rations_stored] rations left to dispense.")
	if(malfunctioning)
		. += span_notice("The vendor appears to require maintenance. You can use a wrench on it to repair it.")
	else if(rations_dispensed > (ration_breaklimit/2))
		. += span_notice("The vendor looks like it will be due for maintenance soon. You can use a wrench on it to repair it.")

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
		if(R.wanted_status == WANTED_PAROLE) //Loyalists are given loyalist grade rations. Any job that already has this grade is of course already a loyalist.
			if(ration_quality < 5)
				ration_quality = 5
		if(R.wanted_status == WANTED_SUSPECT) //Suspected people are given a worse grade of rations
			ration_quality--
	if(account?.account_job.title == "Vortigaunt Slave") //Shitty ration bonus handled in job datum, this just lets the ration vendor knows they're a vort
		vortigaunt = TRUE
	if(account?.account_job.title == "Refugee") //Refugees don't get rations, of course
		say("Warning, your civil status is in question by local protection teams. Please apply.")
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		flick(icon_state_deny,src)
		return
	ration_quality += account?.account_job.ration_bonus //applies job specific ration bonuses

	account.ration_voucher = FALSE

	playsound(src, 'hl13/sound/machines/combine_button5.ogg', 50, TRUE, extrarange = -3)

	flick(icon_state_vend,src)

	if(malfunctioning && prob(30)) //if vendor is malfunctioning, it may cancel the ration request and waste your time
		say("Vendor malfunction detected. Resubmit coupon to try again, and request a repair team.")
		account.ration_voucher = TRUE
		return

	say("Ration reward determined. Please wait for ration to be dispensed.")

	addtimer(CALLBACK(src, PROC_REF(dispense), ration_quality, vortigaunt), 4 SECONDS)

	return

/obj/machinery/ration_vendor/proc/dispense(quality, vortigaunt)
	playsound(src, 'hl13/sound/machines/combine_dispense.ogg', 50, TRUE, extrarange = -3)

	SSsociostability.modifystability(1) //Compliance brings stability.

	rations_stored--
	rations_dispensed++
	if(rations_dispensed >= ration_breaklimit)
		malfunctioning = TRUE

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
			rations_stored += C.refill_rate
			qdel(I)
			new /obj/item/ration_construction/used_container(user.loc)
		else
			to_chat(usr, span_notice("This ration container is not fully refilled."))

/obj/machinery/ration_vendor/wrench_act(mob/living/user, obj/item/O)
	. = ..()
	if(!O.tool_behaviour == TOOL_WRENCH)
		return FALSE

	if(!malfunctioning && !(rations_dispensed > (ration_breaklimit/2)))
		balloon_alert(user, "Doesn't need fixing")
		return FALSE

	playsound(loc, 'sound/items/tools/ratchet.ogg', 25, 1)
	balloon_alert_to_viewers("Starts repairing [src]'s internals")

	if(!do_after(user, 15 SECONDS, src))
		return FALSE

	if(!HAS_TRAIT(user, TRAIT_ENGINEER))
		if(prob(70))
			to_chat(user, span_notice("That might have fixed it... Wait, no. Hm, it might be better to get a trained technician to handle this..."))
			return FALSE
		else
			to_chat(user, span_notice("Wow, that actually worked?"))

	playsound(loc, 'sound/items/tools/ratchet.ogg', 25, 1)
	malfunctioning = FALSE
	rations_dispensed = 0
	to_chat(user, span_notice("Repair reward dispensed."))
	new /obj/item/stack/spacecash/c1(user.loc, 5)
	return TRUE
