GLOBAL_VAR_INIT(rebel_intel_exists, FALSE)
GLOBAL_VAR_INIT(combine_intel_exists, FALSE)
GLOBAL_VAR_INIT(rebel_captures, 0)
GLOBAL_VAR_INIT(combine_captures, 0)

/// here begins the intel /////////////////////////////

/obj/item/hl2/intelligence
	name = "Neutral Intel"
	desc = "A briefcase containing vital secrets. Turn in the enemy team's intel at your cash deposit to gain points for your team. Decent weapon."
	icon = 'hl13/icons/obj/storage/storage.dmi'
	icon_state = "suitcase"
	inhand_icon_state = "suitcase"
	lefthand_file = 'hl13/icons/mob/inhands/cases_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/cases_righthand.dmi'
	throw_range = 1
	force = 18 //guns besides pistols and smgs are unusable while holding so
	light_range = 2
	light_power = 3 //really needs to be visible
	light_color = "#ffffff"
	max_integrity = 9999
	armor_type = /datum/armor/hl2_intel
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	anchored = TRUE


	w_class = WEIGHT_CLASS_BULKY

	var/faction_belonging = NO_FACTION
	var/return_to_base = 60 SECONDS

/datum/armor/hl2_intel
	bullet = 100
	melee = 100
	bomb = 100
	fire = 100
	acid = 100

/obj/item/hl2/intelligence/ex_act(severity, target)
	return FALSE

/obj/item/hl2/intelligence/rebel
	name = "Rebel Intel"
	icon_state = "intel_red"
	inhand_icon_state = "intel_red"
	faction_belonging = REBEL_DEPLOYMENT_FACTION
	light_color = "#f85205"

/obj/item/hl2/intelligence/combine
	name = "Combine Intel"
	icon_state = "intel_blu"
	inhand_icon_state = "intel_blu"
	faction_belonging = COMBINE_DEPLOYMENT_FACTION
	light_color = "#0051ff"

/obj/item/hl2/intelligence/Initialize(mapload) //dont start processing yet because timer shouldnt go down while its at the intel point. it'll start going down once it gets dropped by an enemy
	. = ..()
	set_light_on(TRUE)

/obj/item/hl2/intelligence/attack_hand(mob/user, list/modifiers)
	if(. || !user)
		return
	if(isliving(user))
		var/mob/living/livie = user
		if(livie.deployment_faction == faction_belonging)
			to_chat(user, span_warning("This is your own intel!"))
			return
	return attempt_pickup(user)

/obj/item/hl2/intelligence/equipped(mob/user, slot)
	..()
	return_to_base = 60 SECONDS
	STOP_PROCESSING(SSprocessing, src)
	if(faction_belonging == COMBINE_DEPLOYMENT_FACTION)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='userdanger'>An enemy is carrying our intel!</span>")
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='greentext big'>A teammate is carrying the combine team's intel!</span>")
	if(faction_belonging == REBEL_DEPLOYMENT_FACTION)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='greentext big'>A teammate is carrying the combine team's intel!</span>")
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='userdanger'>An enemy is carrying our intel!</span>")

/obj/item/hl2/intelligence/click_ctrl(mob/user)
	to_chat(user, span_warning("Intel can't be dragged!")) //fuck hunters
	return CLICK_ACTION_BLOCKING

/obj/item/hl2/intelligence/process()
	if(return_to_base < 1 SECONDS)
		if(faction_belonging == COMBINE_DEPLOYMENT_FACTION)
			GLOB.combine_intel_exists = FALSE
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/player = X
				SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(player, "<span class='greentext big'>Our intel has been returned!</span>")
			for(var/X in GLOB.deployment_rebel_players)
				var/mob/living/carbon/human/player = X
				SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(player, "<span class='userdanger'>The combine team's intel has been returned!</span>")
		if(faction_belonging == REBEL_DEPLOYMENT_FACTION)
			GLOB.rebel_intel_exists = FALSE
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/player = X
				SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(player, "<span class='userdanger'>The rebel team's intel has been returned!</span>")
			for(var/X in GLOB.deployment_rebel_players)
				var/mob/living/carbon/human/player = X
				SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
				to_chat(player, "<span class='greentext big'>Our intel has been returned!</span>")
		qdel(src)
	else
		return_to_base -= 1 SECONDS

/obj/item/hl2/intelligence/examine(mob/user)
	. = ..()
	if(faction_belonging == COMBINE_DEPLOYMENT_FACTION && return_to_base != 60 SECONDS)
		. += span_notice("The Combine must defend the intelligence for [(return_to_base)/10] seconds before it is returned.")
	if(faction_belonging == REBEL_DEPLOYMENT_FACTION && return_to_base != 60 SECONDS)
		. += span_notice("The Rebels must defend the intelligence for [(return_to_base)/10] seconds before it is returned.")

/obj/item/hl2/intelligence/dropped(mob/user)
	. = ..()
	START_PROCESSING(SSprocessing, src)
	if(faction_belonging == COMBINE_DEPLOYMENT_FACTION)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='greentext big'>Our intel has been dropped!</span>")
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='userdanger'>A teammate has dropped the combine team's intel!</span>")
	if(faction_belonging == REBEL_DEPLOYMENT_FACTION)
		for(var/X in GLOB.deployment_combine_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='userdanger'>A teammate has dropped the rebel team's intel!</span>")
		for(var/X in GLOB.deployment_rebel_players)
			var/mob/living/carbon/human/player = X
			SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
			to_chat(player, "<span class='greentext big'>Our intel has been dropped!</span>")


/// here begins the cap point /////////////////////////////////

/obj/machinery/intel_deposit
	name = "Intel Deposit and Relay"
	desc = "A data broadcasting and storage unit. Intel can be deposited here by it's respective team for points. Also generates intel that opposing forces can steal."
	icon = 'hl13/icons/obj/port/props/stationobjs.dmi'
	icon_state = "broadcast_receiver_off"
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE
	var/deployment_faction = NO_FACTION
	var/captures = 0

/obj/machinery/intel_deposit/rebel
	deployment_faction = REBEL_DEPLOYMENT_FACTION

/obj/machinery/intel_deposit/combine
	deployment_faction = COMBINE_DEPLOYMENT_FACTION

/obj/machinery/intel_deposit/Initialize(mapload)
	.=..()
	START_PROCESSING(SSprocessing, src)

/obj/machinery/intel_deposit/examine(mob/user)
	. = ..()
	. += span_notice("The Combine must capture [3-(GLOB.combine_captures)] more intel to win.")
	. += span_notice("The Rebels must capture [3-(GLOB.rebel_captures)] more intel to win.")

/obj/machinery/intel_deposit/process()
	if(captures == 3)
		if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			priority_announce("Anticitizen intelligence received and decoded, all delegates prepare for debriding, code: Amputate all dissenters.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All Rebel intel has been captured, the Combine win."))))
			return PROCESS_KILL
		if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
			priority_announce("Combine intelligence received and decoded, clear away the rest of the combine forces and prepare for further instruction!", "Lambda Priority Alert")
			GLOB.deployment_win_team = REBEL_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("All Combine intel has been captured, the Rebels win."))))
			return PROCESS_KILL

	if(deployment_faction == COMBINE_DEPLOYMENT_FACTION && !GLOB.combine_intel_exists)
		new /obj/item/hl2/intelligence/combine(loc)
		GLOB.combine_intel_exists = TRUE
	if(deployment_faction == REBEL_DEPLOYMENT_FACTION && !GLOB.rebel_intel_exists)
		new /obj/item/hl2/intelligence/rebel(loc)
		GLOB.rebel_intel_exists = TRUE

/obj/machinery/intel_deposit/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/hl2/intelligence))
		var/obj/item/hl2/intelligence/intel = I
		if(intel.faction_belonging != deployment_faction)
			qdel(I)
			captures++
			if(deployment_faction == REBEL_DEPLOYMENT_FACTION)
				GLOB.combine_intel_exists = FALSE
				GLOB.rebel_captures++
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='userdanger'>Our intel has been captured!</span>")
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='greentext big'>A teammate has captured the combine team's intel!</span>")
			if(deployment_faction == COMBINE_DEPLOYMENT_FACTION)
				GLOB.rebel_intel_exists = FALSE
				GLOB.combine_captures++
				for(var/X in GLOB.deployment_combine_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='greentext big'>A teammate has captured the rebel team's intel!</span>")
				for(var/X in GLOB.deployment_rebel_players)
					var/mob/living/carbon/human/player = X
					SEND_SOUND(player, 'hl13/sound/effects/griffin_10.ogg')
					to_chat(player, "<span class='userdanger'>Our intel has been captured!</span>")
		else
			to_chat(user, span_warning("Intel must be captured at your own deposit!"))
			playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
			return
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
