/obj/machinery/atm
	name = "automated teller machine"
	desc = "A wall mounted teller machine installed by the combine. You can give it your citizen card or a currency to withdraw or deposit into your account."
	icon = 'hl13/icons/obj/machines/terminals.dmi'
	icon_state = "atm"
	base_icon_state = "atm"

	layer = ABOVE_OBJ_LAYER + 0.001
	pixel_y = 25
	base_pixel_y = 25

	light_range = 2
	light_power = 0.75
	light_color = "#658cac"

	resistance_flags = INDESTRUCTIBLE
	idle_power_usage = 10

	var/obj/item/card/id/CID = null
	var/emagaccount = null
	var/totalmoney = null

/obj/machinery/atm/attackby(obj/item/W, mob/user, params)
	var/all_accounts = flatten_list(SSeconomy.bank_accounts_by_id)
	if(istype(W, /obj/item/card/id))
		if(istype(W, /obj/item/card/id/departmental_budget/car))
			playsound(loc, 'hl13/sound/machines/atm/cardreader_read.ogg', 50)
			to_chat(user, "<span class='warning'>Anti-embezzlement measures on this card cause the ATM to reject it. You'll have to figure out another way to get credits out...</span>")
			return
		CID = W
		playsound(loc, 'hl13/sound/machines/atm/cardreader_insert.ogg', 50)
		if(!CID.registered_account.account_pin)
			var/passchoice = input(user, "Please select a password for your bank account:", "Password Selection") as null|text
			if(!passchoice)
				invalid_number()
				return
			CID.registered_account.account_pin = passchoice
			to_chat(user, "<span class='warning'>Your new account password is [passchoice]!</span>")
			return
		var/enteredpass = input(user, "Please enter your password:", "Password Entry") as null|text
		if(!enteredpass)
			invalid_number()
			return
		if(enteredpass != CID.registered_account.account_pin)
			playsound(loc, 'hl13/sound/machines/atm/cardreader_read.ogg', 50)
			visible_message("<span class='warning'>Incorrect Password.</span>", null, null, 5, null, null, null, null, TRUE)
			return
		var/nextquestion = input(user, "Please select a function:", "Function Selection") as null|anything in list("withdraw", "change password", "direct deposit", "transfer into long term account", "withdraw from longterm account")
		switch(nextquestion)
			if("withdraw")
				var/withdrawfund = input(user, "Please select the amount to withdraw:", "Withdraw Money") as null|num
				if(!withdrawfund)
					invalid_number()
					return
				if(withdrawfund <= 0 || withdrawfund > CID.registered_account.account_balance)
					invalid_number()
					return
				CID.registered_account.account_balance -= withdrawfund
				var/obj/item/stack/spacecash/c1/HC = new /obj/item/stack/spacecash/c1(get_turf(src))
				user.put_in_inactive_hand(HC)
				successful_transaction()
				HC.amount = withdrawfund
				HC.update_icon_state()
			if("change password")
				var/passchoicenew = input(user, "Please select a password:", "Password Selection") as null|text
				if(!passchoicenew)
					invalid_number()
					return
				CID.registered_account.account_pin = passchoicenew
				return
			if("direct deposit")
				to_chat(user, "<span class='warning'>Your account number is [CID.registered_account.account_id]. Enter this number after inserting credits into the ATM in order to deposit into the account.</span>")
				var/selectaccount = input(user, "Please enter an account number:", "Account Selection") as null|num
				if(!selectaccount)
					not_selected_account()
					return
				for(var/i in all_accounts)
					var/datum/bank_account/BA = i
					if(selectaccount != BA.account_id)
						continue
					var/ddeposit = input(user, "Please select the amount to withdraw:", "Withdraw Money") as null|num
					if(!ddeposit)
						invalid_number()
						return
					if(ddeposit <= 0 || ddeposit > CID.registered_account.account_balance)
						invalid_number()
						return
					CID.registered_account.account_balance -= ddeposit
					totalmoney = ddeposit
					emagcheck()
					if(!emagaccount)
						BA.account_balance += totalmoney
					successful_transaction()
					break
			if("transfer into long term account")
				if(SSticker.current_state == GAME_STATE_FINISHED)
					to_chat(user, "<span class='warning'>The game has already finished! I will not allow you to cheat and dupe credits into your longterm account or anything like that.</span>")
					return

				to_chat(user, "<span class='warning'>You are transferring credits into your cross-round persistant account.</span>")
				to_chat(user, "<span class='notice'>You can deposit any amount of credits, but your longterm account can only hold up to 250 credits.</span>")
				to_chat(user, "<span class='notice'>Your current long term account balance is: [user.client.prefs.read_preference(/datum/preference/numeric/longtermaccount)].</span>")
				var/ddeposit = input(user, "Please select the amount to transfer:", "Transfer Money") as null|num
				if(!ddeposit)
					invalid_number()
					return
				ddeposit = round(ddeposit, 1)
				if(ddeposit <= 0 || ddeposit > CID.registered_account.account_balance)
					invalid_number()
					return
				var/longtermbalance = user.client.prefs.read_preference(/datum/preference/numeric/longtermaccount)

				if(250 < (longtermbalance + ddeposit))
					ddeposit = (250 - longtermbalance)
					to_chat(user, "<span class='notice'>Your long term account can only hold up to 250 credits. The amount you were trying to transfer was automatically adjusted.</span>")

				CID.registered_account.account_balance -= ddeposit
				totalmoney = ddeposit
				user.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/numeric/longtermaccount], longtermbalance += totalmoney)
				successful_transaction()
				user.client.prefs.save_preferences()
				return
			if("withdraw from longterm account")
				to_chat(user, "<span class='warning'>You are withdrawing from your cross-round persistant account.</span>")
				to_chat(user, "<span class='notice'>Your current long term account balance is: [user.client.prefs.read_preference(/datum/preference/numeric/longtermaccount)].</span>")
				var/withdrawfund = input(user, "Please select the amount to withdraw:", "Withdraw Money") as null|num
				if(!withdrawfund)
					invalid_number()
					return
				withdrawfund = round(withdrawfund, 1)
				if(withdrawfund <= 0)
					invalid_number()
					return
				if(user.client.prefs.read_preference(/datum/preference/numeric/longtermaccount) < withdrawfund)
					to_chat(user, "<span class='notice'>Your long term account doesn't have enough credits to cover this.</span>")
					return
				var/longtermbalance = user.client.prefs.read_preference(/datum/preference/numeric/longtermaccount)
				user.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/numeric/longtermaccount], longtermbalance -= withdrawfund)
				var/obj/item/stack/spacecash/c1/HC = new /obj/item/stack/spacecash/c1(get_turf(src))
				user.put_in_inactive_hand(HC)
				successful_transaction()
				HC.amount = withdrawfund
				HC.update_icon_state()
				user.client.prefs.save_preferences()
				return
	if(istype(W, /obj/item/holochip))
		var/obj/item/holochip/HC = W
		if(HC.credits <= 0 || !HC.credits)
			return
		var/selectaccount = input(user, "Please enter an account number:", "Account Selection") as null|num
		var/chosenitem = user.get_active_held_item()
		if(!chosenitem)
			return
		if(!selectaccount)
			not_selected_account()
			return
		for(var/i in all_accounts)
			var/datum/bank_account/BA = i
			if(selectaccount != BA.account_id)
				continue
			totalmoney = HC.credits
			emagcheck()
			if(!emagaccount)
				BA.account_balance += totalmoney
			successful_transaction()
			QDEL_NULL(HC)
			break
	if(istype(W, /obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/SC = W
		if(SC.get_item_credit_value() <= 0 || !SC.get_item_credit_value())
			return
		var/selectaccount = input(user, "Please enter an account number:", "Account Selection") as null|num
		var/chosenitem = user.get_active_held_item()
		if(!chosenitem)
			return
		if(!selectaccount)
			not_selected_account()
			return
		for(var/i in all_accounts)
			var/datum/bank_account/BA = i
			if(selectaccount != BA.account_id)
				continue
			totalmoney = SC.get_item_credit_value()
			emagcheck()
			if(!emagaccount)
				BA.account_balance += totalmoney
			successful_transaction()
			QDEL_NULL(SC)
			break
	if(istype(W, /obj/item/coin))
		var/obj/item/coin/CM = W
		if(CM.get_item_credit_value() <= 0 || !CM.get_item_credit_value())
			return
		var/selectaccount = input(user, "Please enter an account number:", "Account Selection") as null|num
		var/chosenitem = user.get_active_held_item()
		if(!chosenitem)
			return
		if(!selectaccount)
			not_selected_account()
			return
		for(var/i in all_accounts)
			var/datum/bank_account/BA = i
			if(selectaccount != BA.account_id)
				continue
			totalmoney = CM.get_item_credit_value()
			emagcheck()
			if(!emagaccount)
				BA.account_balance += totalmoney
			successful_transaction()
			QDEL_NULL(CM)
			break
	if(istype(W, /obj/item/storage/bag/money))
		var/selectaccount = input(user, "Please enter an account number:", "Account Selection") as null|num
		if(!selectaccount)
			not_selected_account()
			return
		for(var/i in all_accounts)
			var/datum/bank_account/BA = i
			if(selectaccount != BA.account_id)
				continue
			var/obj/item/storage/bag/money/money_bag = W
			var/list/money_contained = money_bag.contents
			var/total = 0
			for (var/obj/item/physical_money in money_contained)
				var/cash_money = physical_money.get_item_credit_value()
				total += cash_money
				QDEL_NULL(physical_money)
			totalmoney = total
			emagcheck()
			if(!emagaccount)
				BA.account_balance += totalmoney
			successful_transaction()
			break

/obj/machinery/atm/proc/invalid_number()
	playsound(loc, 'hl13/sound/machines/atm/cardreader_read.ogg', 50)
	visible_message("<span class='warning'>Invalid number entered.</span>", null, null, 5, null, null, null, null, TRUE)

/obj/machinery/atm/proc/successful_transaction()
	playsound(loc, 'hl13/sound/machines/atm/cash_insert.ogg', 50)
	visible_message("<span class='warning'>Successful Transaction.</span>", null, null, 5, null, null, null, null, TRUE)

/obj/machinery/atm/proc/not_selected_account()
	playsound(loc, 'hl13/sound/machines/atm/cardreader_read.ogg', 50)
	visible_message("<span class='warning'>You must select an account to deposit.</span>", null, null, 5, null, null, null, null, TRUE)
	return

/obj/machinery/atm/emag_act(mob/user)
	. = ..()
	if(emagaccount)
		to_chat(user, "<span class='warning'>This ATM is already emagged!</span>")
		return FALSE
	emagaccount = input("Choose which account to deposit to:", "Safety Protocols Disengaged") as null|num
	if(!emagaccount)
		to_chat(user, "<span class='warning'>You failed to select an account!</span>")
	flick("atm_emagging", src)
	icon_state = "atm_emag"
	return TRUE

/obj/machinery/atm/proc/emagcheck()
	if(emagaccount)
		var/all_accounts = flatten_list(SSeconomy.bank_accounts_by_id)
		for(var/i in all_accounts)
			var/datum/bank_account/BA = i
			if(emagaccount != BA.account_id)
				continue
			BA.account_balance += totalmoney
			break
