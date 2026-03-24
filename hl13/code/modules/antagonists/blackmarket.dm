/datum/outfit/blackmarket
	name = "Blackmarket dealer"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/halflife/satchel

	l_pocket = /obj/item/flashlight
	r_pocket = /obj/item/market_uplink/halflife/blackmarket

	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/chameleon/blackmarket

	// 150 credits to get you started, incase you want to give some deals, get some stock right away, give change, or just buy stuff for self defense.
	backpack_contents = list(
		/obj/item/stack/spacecash/c1 = 150,
		/obj/item/reagent_containers/pill/patch/medkit, //You're generally operating in dangerous areas
		/obj/item/reagent_containers/hypospray/medipen/healthpen,
		/obj/item/ammo_box/magazine/usp9mm, //ditto
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/clothing/mask/gas/hl2/military, //For covertness, if you wish.
	)

/datum/outfit/blackmarket_preview
	name = "Blackmarket dealer (Preview only)"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

/datum/antagonist/blackmarket
	name = "Black Market Dealer"
	roundend_category = "black market dealers"
	antagpanel_category = "Black Market Dealer"
	antag_hud_name = "traitor"
	antag_moodlet = /datum/mood_event/blackmarket
	preview_outfit = /datum/outfit/blackmarket_preview
	show_in_antagpanel = TRUE
	var/paycheck_department = ACCOUNT_CIV //work you stupid bastard

/datum/antagonist/blackmarket/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',45,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Blackmarket Dealer!"))
	to_chat(owner, span_boldnotice("You are from outside the District, and have come here looking to earn some credits."))
	to_chat(owner, span_notice("Survive, and earn as many credits as you can by selling items from your black market uplink."))
	to_chat(owner, span_notice("Note, you are not officially resistance OR combine aligned. You work for yourself, or perhaps the highest bidder..."))
	to_chat(owner, span_boldnotice("You can check your memories tab for your bank account number, and then link it to your ID."))
	owner.announce_objectives()

/datum/antagonist/blackmarket/on_gain()
	//Give blackmarket Objective
	var/datum/objective/blackmarket/blackmarket_objective = new
	blackmarket_objective.owner = owner

	if(ishuman(owner.current))
		var/mob/living/carbon/human/H = owner.current
		var/datum/bank_account/bank_account = new(H.real_name, src)
		bank_account.payday(STARTING_PAYCHECKS, TRUE)
		H.account_id = bank_account.account_id
		H.account_pin = "[rand(1000,9999)]"
		bank_account.account_pin = H.account_pin
		bank_account.replaceable = FALSE
		H.add_mob_memory(/datum/memory/key/account, remembered_id = bank_account.account_id)
		blackmarket_objective.bank_account = bank_account

	objectives += blackmarket_objective

	//Give survive Objective
	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = owner
	objectives += survive_objective

	owner.current.cmode_music = 'hl13/sound/music/combat/penultimatum.ogg'

	return ..()

/datum/objective/blackmarket
	var/datum/bank_account/bank_account

	explanation_text = "Have 400 credits in your account."

/datum/objective/blackmarket/check_completion()
	return ..() || bank_account.account_balance >= 400
