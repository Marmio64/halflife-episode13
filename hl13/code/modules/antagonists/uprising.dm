/datum/outfit/uprising_preview
	name = "Uprising Ringleader (Preview only)"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/browncoat
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

/datum/antagonist/uprising
	name = "Uprising Ringleader"
	roundend_category = "uprising ring leaders"
	antagpanel_category = "Uprising Ringleader"
	antag_hud_name = "traitor"
	antag_moodlet = /datum/mood_event/rebel
	preview_outfit = /datum/outfit/uprising_preview
	show_in_antagpanel = TRUE

/datum/antagonist/uprising/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',45,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Uprising Ringleader!"))
	to_chat(owner, span_boldnotice("The time has come for this district to be freed from the tyranny of the combine."))
	to_chat(owner, span_notice("You have to lower the sociostability of the district low enough to allow you to set up a Super Destabilizer within the Nexus, and cut off the city from combine reinforcements."))
	to_chat(owner, span_notice("You can craft a Super Destabilizer beacon at an Electronics bench, located in the factory and other places in the city, sewers, and outlands."))
	to_chat(owner, span_boldnotice("Prepare for the final showdown by getting well equipped by looting, scavenging, and more. In addition, you are not alone! Use your internal radio to communicate with other ringleaders, and recruit citizens you find trustworthy."))
	to_chat(owner, span_notice("Hint: If you need destabilizer antennas, buy them from the Refugee Smuggler in the outlands."))
	owner.announce_objectives()

/datum/antagonist/uprising/on_gain()
	//Give uprising Objective
	var/datum/objective/uprising/uprising_objective = new
	uprising_objective.owner = owner

	owner.teach_crafting_recipe(/datum/crafting_recipe/super_destabilizer)

	objectives += uprising_objective

	var/obj/item/implant/radio/syndicate/uprising/imp = new(owner.current)
	imp.implant(owner.current, null, TRUE)

	owner.current.cmode_music = 'hl13/sound/music/combat/penultimatum.ogg'

	owner.give_uplink(silent = FALSE, antag_datum = src)
	var/datum/component/uplink/U = owner.find_syndicate_uplink()
	if(U)
		U.uplink_handler.set_telecrystals(8)
		to_chat(owner, span_danger("You and each of your comrades have been supplied a Lambda teleportation uplink for purchasing a small amount of supplies."))

	return ..()

/datum/objective/uprising
	explanation_text = "Turn on a super destabilizer in the nexus, and defend it until it completes."

/obj/item/encryptionkey/syndicate/uprising
	special_channels = RADIO_SPECIAL_SYNDIE // no hear all flags

/obj/item/implant/radio/syndicate/uprising
	radio_key = /obj/item/encryptionkey/syndicate/uprising

/obj/item/implant/radio/syndicate/uprising/Initialize(mapload)
	. = ..()

	radio.frequency = FREQ_SYNDICATE
	radio.freqlock = RADIO_FREQENCY_LOCKED
