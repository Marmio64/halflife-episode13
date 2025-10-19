/obj/machinery/deployment_points_flag
	name = "Point Flag"
	desc = "An inspiring flag which will passively generate cash flow for whichever side controls it. Click on it to start changing the flag to your side."
	icon = 'hl13/icons/obj/flags32x64.dmi'
	icon_state = "flagpole_blank"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	light_range = 3
	light_power = 1.1
	light_color = "#658cac"
	var/current_faction_holder = NO_FACTION

	var/starting_faction = null

	var/cash_increase = 0.6 //assuming this is bunker mode, rebels have to keep the flag for 420 seconds, and so this flag would generate a total of $252

/obj/machinery/deployment_points_flag/low_cash
	cash_increase = 0.2

/obj/machinery/deployment_points_flag/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)
	if(starting_faction)
		current_faction_holder = starting_faction

/obj/machinery/deployment_points_flag/process()
	for(var/turf/closed/wall/W in RANGE_TURFS(1, get_turf(src))) //no walling off the flag
		W.dismantle_wall()

	if(GLOB.deployment_flag_grace_period > 0) //dont generate cash while a grace period is active
		return

	if(current_faction_holder == COMBINE_DEPLOYMENT_FACTION)
		icon_state = "flagpole_combine"
		GLOB.deployment_combine_cash += cash_increase

	if(current_faction_holder == REBEL_DEPLOYMENT_FACTION)
		icon_state = "flagpole_poland"
		GLOB.deployment_rebels_cash += cash_increase

/obj/machinery/deployment_points_flag/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(.)
		return
	add_fingerprint(H)

	if(H.deployment_faction != current_faction_holder)
		to_chat(H, span_green("Raising your team's flag!"))
		if(do_after(H, 5 SECONDS, src))
			to_chat(H, span_green("Flag raised!"))
			current_faction_holder = H.deployment_faction
		else
			to_chat(H, span_notice("The flag was not succesfully raised."))
	else
		to_chat(H, span_notice("Your team's flag is already raised."))

/obj/machinery/deployment_points_flag/poland
	icon_state = "flagpole_poland"
	starting_faction = REBEL_DEPLOYMENT_FACTION

/obj/machinery/deployment_points_flag/poland/high_cash
	cash_increase = 3

/obj/machinery/deployment_points_flag/poland/low_cash
	cash_increase = 0.2

/obj/machinery/deployment_points_flag/combine
	icon_state = "flagpole_combine"
	starting_faction = COMBINE_DEPLOYMENT_FACTION

/obj/machinery/deployment_points_flag/combine/high_cash
	cash_increase = 3

/obj/machinery/deployment_points_flag/combine/low_cash
	cash_increase = 0.2
