///Saves everyone who is alive their money to their account
/datum/controller/subsystem/persistence/proc/save_money()
	for(var/i in GLOB.joined_player_list)
		var/mob/living/carbon/human/ending_human = get_mob_by_ckey(i)
		if(!istype(ending_human))
			continue

		var/mob/living/carbon/human/original_human = ending_human.mind.original_character.resolve()

		if(!original_human)
			continue

		if(original_human.stat == DEAD || original_human != ending_human)
			continue

		if(!original_human.account_id)
			continue
		var/datum/bank_account/account = SSeconomy.bank_accounts_by_id["[original_human.account_id]"]

		var/longtermbalance = original_human.client.prefs.read_preference(/datum/preference/numeric/longtermaccount)

		var/money_to_gain = account.account_balance

		if(250 < (longtermbalance + money_to_gain))
			money_to_gain = (250 - longtermbalance)

		original_human.client.prefs.write_preference(GLOB.preference_entries[/datum/preference/numeric/longtermaccount], longtermbalance += money_to_gain)
		original_human.client.prefs.save_preferences()

