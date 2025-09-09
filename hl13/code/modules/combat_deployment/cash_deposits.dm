/obj/machinery/cash_deposit
	name = "Cash Deposit"
	desc = "A vessel for dropping off cash at. Gathering enough cash permanently increases the tier of loadout equipper that your faction will spawn with. In addition, it can sell nearby corpses of enemies to gain credits for your team."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "pad_active"
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE
	var/deployment_faction = NO_FACTION
	var/starting_cash = 0

/obj/machinery/cash_deposit/combine
	deployment_faction = COMBINE_DEPLOYMENT_FACTION

/obj/machinery/cash_deposit/rebel
	deployment_faction = REBEL_DEPLOYMENT_FACTION

/obj/machinery/cash_deposit/combine/tier3
	starting_cash = DEPLOYMENT_TIER3_COMBINE

/obj/machinery/cash_deposit/rebel/tier3
	starting_cash = DEPLOYMENT_TIER3_REBELS

/obj/machinery/cash_deposit/combine/tier4
	starting_cash = DEPLOYMENT_TIER4_COMBINE

/obj/machinery/cash_deposit/rebel/tier4
	starting_cash = DEPLOYMENT_TIER4_REBELS

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

/obj/machinery/cash_deposit/examine(mob/user)
	. = ..()
	if(deployment_faction == COMBINE_DEPLOYMENT_FACTION && user.client.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
		. += span_notice("Your faction has [FLOOR(GLOB.deployment_combine_cash, 1)] dollars.")
		. += span_notice("Unlock Tier 2 loadouts at $[DEPLOYMENT_TIER2_COMBINE], Tier 3 at $[DEPLOYMENT_TIER3_COMBINE], and Tier 4 at $[DEPLOYMENT_TIER4_COMBINE].")
		. += span_notice("At $[DEPLOYMENT_TIER5_COMBINE], players will have a [DEPLOYMENT_TIER5_CHANCE]% chance to spawn with a Tier 5 loadout.")
		. += span_notice("At $[DEPLOYMENT_TIER5_EXTRA_CHANCE_COMBINE], players will instead have a [DEPLOYMENT_TIER5_EXTRA_CHANCE]% chance to spawn with a Tier 5 loadout.")

	if(deployment_faction == REBEL_DEPLOYMENT_FACTION && user.client.deployment_faction == REBEL_DEPLOYMENT_FACTION)
		. += span_notice("Your faction has [FLOOR(GLOB.deployment_rebels_cash, 1)] dollars.")
		. += span_notice("Unlock Tier 2 loadouts at $[DEPLOYMENT_TIER2_REBELS], Tier 3 at $[DEPLOYMENT_TIER3_REBELS], and Tier 4 at $[DEPLOYMENT_TIER4_REBELS].")
		. += span_notice("At $[DEPLOYMENT_TIER5_REBELS], players will have a [DEPLOYMENT_TIER5_CHANCE]% chance to spawn with a Tier 5 loadout.")
		. += span_notice("At $[DEPLOYMENT_TIER5_EXTRA_CHANCE_REBELS], players will instead have a [DEPLOYMENT_TIER5_EXTRA_CHANCE]% chance to spawn with a Tier 5 loadout.")

/obj/machinery/cash_deposit/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)
	if(starting_cash)
		if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			GLOB.deployment_combine_cash += starting_cash
		if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
			GLOB.deployment_rebels_cash += starting_cash

/obj/machinery/cash_deposit/process()
	consume()

/obj/machinery/cash_deposit/proc/consume()
	for(var/mob/living/carbon/human/offeredmob in view(src, 1)) //Only for corpse right next to/on same tile
		if(offeredmob.stat)

			if(offeredmob.deployment_faction != deployment_faction) //can only sell bodies of people not in your faction
				offeredmob.investigate_log("has been sold to a cash deposit.", INVESTIGATE_DEATHS)
				visible_message(span_notice("The cash deposit takes in the body and its gear, selling it for cash."))
				offeredmob.dust(just_ash = TRUE, force = TRUE)
				playsound(get_turf(src),'sound/effects/cashregister.ogg', 75, TRUE)

				if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
					GLOB.deployment_combine_cash += (10)
				if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
					GLOB.deployment_rebels_cash += (10)

				return
