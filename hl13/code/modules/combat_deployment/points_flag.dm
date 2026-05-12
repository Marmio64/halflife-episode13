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

	var/bypass_grace = FALSE //should it work even if grace period is on

	///Can this flag only be captured once before it cant have its faction changed again?
	var/onetime_capture_only = FALSE

	///Keeps track of if it has been captured before yet
	var/onetime_captured = FALSE

	///Can this flag not be captured by hand, and only through other methods like the payload cart?
	var/hand_capturable = TRUE

	///Time to capture this flag
	var/capture_time = 5 SECONDS

	///Should respawn points be changed if this flag is captured, and to what?
	var/spawnid = null

	///Minimum progression stage required before this flag is capturable
	var/required_progression_stage = 0

	///What progression stage should be set after this flag is captured?
	var/increase_progression_stage = null


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

	if(GLOB.deployment_flag_grace_period > 0 && !bypass_grace) //dont generate cash while a grace period is active
		return

	if(current_faction_holder == COMBINE_DEPLOYMENT_FACTION)
		icon_state = "flagpole_combine"
		GLOB.deployment_combine_cash += cash_increase

	if(current_faction_holder == REBEL_DEPLOYMENT_FACTION)
		icon_state = "flagpole_poland"
		GLOB.deployment_rebels_cash += cash_increase

	if(current_faction_holder == XEN_DEPLOYMENT_FACTION)
		icon_state = "flagpole_xen"
		GLOB.deployment_xen_cash += cash_increase

/obj/machinery/deployment_points_flag/attack_hand(mob/living/carbon/human/H, modifiers)
	. = ..()
	if(.)
		return

	if(!hand_capturable)
		to_chat(H, span_warning("This flag cannot be captured by hand!"))
		return

	if(onetime_capture_only && onetime_captured)
		to_chat(H, span_warning("This flag cannot be recaptured again!"))
		return

	if(GLOB.deployment_progression_stage < required_progression_stage)
		to_chat(H, span_userdanger("The flag is not capturable yet as other prerequisites are not met. Try capturing other points flags first."))
		return

	add_fingerprint(H)

	if(H.deployment_faction != current_faction_holder)
		to_chat(H, span_green("Raising your team's flag!"))
		if(do_after(H, capture_time, src))
			to_chat(H, span_green("Flag raised!"))
			current_faction_holder = H.deployment_faction
			onetime_captured = TRUE
			if(spawnid)
				check_spawns(spawnid, TRUE, TRUE)
			if(increase_progression_stage)
				GLOB.deployment_progression_stage = increase_progression_stage
		else
			to_chat(H, span_notice("The flag was not succesfully raised."))
	else
		to_chat(H, span_notice("Your team's flag is already raised."))

/obj/machinery/deployment_points_flag/attack_basic_mob(mob/living/user, list/modifiers)
	. = ..()
	if(.)
		return

	if(!hand_capturable)
		to_chat(user, span_warning("This flag cannot be captured by hand!"))
		return

	if(onetime_capture_only && onetime_captured)
		to_chat(user, span_warning("This flag cannot be captured by hand!"))
		return

	if(GLOB.deployment_progression_stage < required_progression_stage)
		to_chat(user, span_userdanger("The flag is not capturable yet as other prerequisites are not met. Try capturing other points flags first."))
		return


	if(user.deployment_faction != current_faction_holder)
		to_chat(user, span_green("Raising your team's flag!"))
		if(do_after(user, capture_time, src))
			to_chat(user, span_green("Flag raised!"))
			current_faction_holder = user.deployment_faction
			onetime_captured = TRUE
			if(spawnid)
				check_spawns(spawnid, TRUE, TRUE)
			if(increase_progression_stage)
				GLOB.deployment_progression_stage = increase_progression_stage
		else
			to_chat(user, span_notice("The flag was not succesfully raised."))
	else
		to_chat(user, span_notice("Your team's flag is already raised."))

/obj/machinery/deployment_points_flag/poland
	icon_state = "flagpole_poland"
	starting_faction = REBEL_DEPLOYMENT_FACTION

/obj/machinery/deployment_points_flag/poland/high_cash
	cash_increase = 1

/obj/machinery/deployment_points_flag/poland/low_cash
	cash_increase = 0.2

/obj/machinery/deployment_points_flag/combine
	icon_state = "flagpole_combine"
	starting_faction = COMBINE_DEPLOYMENT_FACTION

/obj/machinery/deployment_points_flag/combine/high_cash
	cash_increase = 1

/obj/machinery/deployment_points_flag/combine/low_cash
	cash_increase = 0.2

/obj/machinery/deployment_points_flag/xen
	icon_state = "flagpole_xen"
	starting_faction = XEN_DEPLOYMENT_FACTION

/obj/machinery/deployment_points_flag/xen/high_cash
	cash_increase = 1

/obj/machinery/deployment_points_flag/xen/low_cash
	cash_increase = 0.2

/obj/machinery/deployment_points_flag/xen/bypass_grace
	bypass_grace = TRUE

/obj/machinery/deployment_points_flag/xen/bypass_grace/high_cash
	cash_increase = 1

/obj/machinery/deployment_points_flag/xen/bypass_grace/low_cash
	cash_increase = 0.2
