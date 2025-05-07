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
		/obj/item/stack/spacecash/c50 = 1,
		/obj/item/stack/spacecash/c20 = 2,
		/obj/item/stack/spacecash/c10 = 4,
		/obj/item/stack/spacecash/c1 = 20,
		/obj/item/reagent_containers/pill/patch/medkit, //You're generally operating in dangerous areas
		/obj/item/ammo_box/magazine/usp9mm, //ditto
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

/datum/antagonist/blackmarket/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',45,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Blackmarket Dealer!"))
	to_chat(owner, span_boldnotice("You are from outside the District, and have come here looking to earn some credits."))
	to_chat(owner, span_notice("Survive, and earn as many credits as you can by selling items from your black market uplink."))
	to_chat(owner, span_notice("Note, you are not officially resistance OR combine aligned. You work for yourself, or perhaps the highest bidder..."))
	owner.announce_objectives()

/datum/antagonist/blackmarket/on_gain()
	//Give blackmarket Objective
	var/datum/objective/blackmarket/blackmarket_objective = new
	blackmarket_objective.owner = owner

	if(ishuman(owner.current))
		var/mob/living/carbon/human/H = owner.current
		if(H.wear_id)
			var/obj/item/card/id/id = H.wear_id
			if(id.registered_account)
				blackmarket_objective.bank_account = id.registered_account

	objectives += blackmarket_objective

	//Give survive Objective
	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = owner
	objectives += survive_objective

	owner.current.cmode_music = 'hl13/sound/music/combat/penultimatum.ogg'

	return ..()

/datum/objective/blackmarket
	var/datum/bank_account/bank_account

	explanation_text = "Have 500 credits in your account."

/datum/objective/blackmarket/check_completion()
	return ..() || bank_account.account_balance >= 500
