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
			priority_announce("Attention citizens, the previous ration cycle has ended and vending units have now closed.", "Ration Cycle Notice.")
	else if (SSdaylight.day_cycle_active == DAY_CYCLE_NIGHT)
		day_is_distributed = FALSE


/datum/controller/subsystem/ration/proc/distribute()
	if(!cycle_active)
		priority_announce("Attention citizens, a new ration cycle will begin shortly. Proceed to an applicable vending unit.", "Ration Cycle Notice.")
		sleep(25 SECONDS)
		priority_announce("Attention citizens, a new ration cycle has begun. Applicable vending units will be able to accept your ration voucher until the cycle ends.", "Ration Cycle Notice.")
		cycle_active = TRUE
		var/accounts_to_give = flatten_list(SSeconomy.bank_accounts_by_id)
		for(var/i in accounts_to_give)
			var/datum/bank_account/B = i
			B.rationvoucher()
