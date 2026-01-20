GLOBAL_VAR_INIT(beating_quota, 20)

/obj/machinery/quota_terminal
	name = "Quota Terminal"
	desc = "A console, intake, and dispenser hookup which assigns quotas to the district's civil protection force, which must be completed or a loss in sociostability will occur."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "quotaterminal"
	density = TRUE

	max_integrity = 1500

	///The machine's internal radio, used to broadcast alerts.
	var/obj/item/radio/radio
	///The channel we announce a siphon over.
	var/radio_channel = RADIO_CHANNEL_SECURITY

	var/radio_key = /obj/item/encryptionkey/headset_sec

	///Amount of time before the next quota starts
	var/next_quota = 0
	///The amount of time we have between quotas
	var/time_between_quotas = 30 MINUTES

	var/quota_complete = TRUE

	//var/obj/item/required_item = null

	//var/list/possible_picks = list(/obj/item/gun/ballistic/automatic/pistol/makeshift, /obj/item/clothing/under/citizen/refugee, /obj/item/grenade/halflife/molotov, /obj/item/toy/crayon/spraycan, /obj/item/gun/ballistic/rifle/rebarxbow, /obj/item/switchblade)

	/// Items that are easier to acquire, but require you to get more of them
	//var/list/possible_easy_picks = list(/obj/item/food/meat/slab/xen, /obj/item/food/meat/slab/halflife/zombie)

	//var/item_quantity_required = 1

	//var/item_quanity_received = 0

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

	radio.talk_into(src, "Attention, new civil protection quota received. Compliance is mandatory.", radio_channel)
	GLOB.beating_quota = (get_active_player_count(alive_check = TRUE, afk_check = TRUE, human_check = TRUE)+2) //The goal is equal to all currently playing players, plus two as a baseline.
	GLOB.beating_quota = ROUND_UP(GLOB.beating_quota)
	/*
	item_quanity_received = 0

	if(prob(75))
		item_quantity_required = rand(1,3)
		required_item = pick_n_take(possible_picks)
	else
		item_quantity_required = rand(4,6)
		required_item = pick_n_take(possible_easy_picks)
	*/

	if(!quota_complete)
		radio.talk_into(src, "The previous civil protection quota was not completed in time. Sociostability score has been deducted.", radio_channel)
		SSsociostability.modifystability(-75) //boowomp

	quota_complete = FALSE

	radio.talk_into(src, "The current sociostability is now: [((SSsociostability.sociostability / SOCIOSTABILITY_GREAT)*100)]%", radio_channel)

/obj/machinery/quota_terminal/examine(mob/user)
	. = ..()


	if(quota_complete)
		. += span_notice("No quota is currently active.")
		return

	. += span_notice("The current beating quota is: [GLOB.beating_quota]. Harmful batoning will count as 5x the quota.")

	//. += span_notice("The current quota is: [item_quantity_required] [required_item.name].")

	//. += span_notice("So far [item_quanity_received] quota items have been deposited.")

/obj/machinery/quota_terminal/process(seconds_per_tick)
	if(GLOB.beating_quota <= 0 && quota_complete == FALSE)
		quota_complete = TRUE
		radio.talk_into(src, "Quota has been completed. All officers have been rewarded two requisition points.", radio_channel)
		SSsociostability.modifystability(5) //yipee
		var/accounts_to_give = flatten_list(SSeconomy.bank_accounts_by_id)
		for(var/i in accounts_to_give)
			var/datum/bank_account/B = i
			if(B.account_job.requisition_points)
				B.requisition_points += 2
	if(next_quota < world.time)
		give_quota()
		next_quota = world.time + time_between_quotas

/*
/obj/machinery/quota_terminal/attackby(obj/item/I, mob/user, params)
	if(istype(I, required_item))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)
		item_quanity_received++
		if(item_quanity_received >= item_quantity_required)
			quota_complete = TRUE
			radio.talk_into(src, "Quota has been completed. All officers have been rewarded two requisition points.", radio_channel)
			SSsociostability.modifystability(10) //yipee
			var/accounts_to_give = flatten_list(SSeconomy.bank_accounts_by_id)
			for(var/i in accounts_to_give)
				var/datum/bank_account/B = i
				if(B.account_job.requisition_points)
					B.requisition_points += 2
		qdel(I)
	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
*/
