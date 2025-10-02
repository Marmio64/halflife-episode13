SUBSYSTEM_DEF(ration)
	name = "Rations"
	wait = 10 SECONDS
	init_order = INIT_ORDER_RATION
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT
	var/cycle_active = FALSE

	/// Has the day's ration's been distributed?
	var/day_is_distributed = FALSE

/datum/controller/subsystem/ration/fire(resumed = 0)
	if(SSdaylight.day_cycle_active == DAY_CYCLE_MORNING && !day_is_distributed)
		day_is_distributed = TRUE
		distribute()
	if(SSdaylight.day_cycle_active == DAY_CYCLE_AFTERNOON)
		if(cycle_active)
			cycle_active = FALSE
	else if (SSdaylight.day_cycle_active == DAY_CYCLE_NIGHT)
		day_is_distributed = FALSE


/datum/controller/subsystem/ration/proc/distribute()
	if(SSmapping.current_map.minetype == "combat_deployment")
		return
	if(!cycle_active)
		sleep(30 SECONDS)
		priority_announce("Attention citizens, a new ration cycle has begun. Applicable vending units will be able to accept your ration voucher until the cycle ends.", "Ration Cycle Notice.")
		cycle_active = TRUE
		var/accounts_to_give = flatten_list(SSeconomy.bank_accounts_by_id)
		for(var/i in accounts_to_give)
			var/datum/bank_account/B = i
			B.rationvoucher()
