/obj/machinery/cash_deposit
	name = "Cash Deposit"
	desc = "A vessel for dropping off cash at. Gathering enough cash permanently increases the tier of loadout equipper that your faction will spawn with."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "destabilizer"
	anchored = TRUE
	max_integrity = 9999
	var/deployment_faction = NO_FACTION

/obj/machinery/cash_deposit/combine
	deployment_faction = COMBINE_DEPLOYMENT_FACTION

/obj/machinery/cash_deposit/rebel
	deployment_faction = REBEL_DEPLOYMENT_FACTION

/obj/machinery/cash_deposit/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/cash = I
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)

		if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			GLOB.deployment_combine_cash += (cash.value * cash.amount)
		if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
			GLOB.deployment_rebels_cash += (cash.value * cash.amount)

		qdel(I)

	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
