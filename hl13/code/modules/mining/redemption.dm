/obj/machinery/mineral/ore_redemption/hl13
	name = "combine ore redemption machine"
	desc = "An automated combine machine which takes in ores and flash-fire melts them into usable sheets with dark energy. Loyal workers can then accept generated mining points onto their card from the machine, and redeem them for credits."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "ore_redemption"

/obj/machinery/mining_terminal
	name = "union mining terminal"
	desc = "A wall mounted terminal. Union Miners can swipe their ID cards here to turn points into credits."
	icon = 'hl13/icons/obj/machines/terminals.dmi'
	icon_state = "mining_terminal"

/obj/machinery/mining_terminal/attackby(obj/item/item, mob/user, params)

	if(isliving(user))
		var/mob/living/living = user

		var/obj/item/card/id/card = living.get_idcard()
		if(card)
			if(card.registered_account.mining_points >= 100)
				to_chat(user, span_notice("100 points has been converted into eight credits on your account."))
				card.registered_account.mining_points -= 100
				card.registered_account.account_balance += 8
				playsound(loc, 'hl13/sound/machines/atm/cardreader_insert.ogg', 30)
			else
				to_chat(user, span_notice("This terminal works in increments of 100 mining points, and you do not have enough yet."))
				return
