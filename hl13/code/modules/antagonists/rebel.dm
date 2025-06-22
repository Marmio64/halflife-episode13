/datum/outfit/bunkeroperator
	name = "Bunker Operator"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	head = /obj/item/clothing/head/beret
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	ears = /obj/item/radio/headset/syndicate/alt //tacticool military headset

	suit_store = /obj/item/gun/ballistic/automatic/servicerifle/wood //drip

	l_pocket = /obj/item/flashlight/seclite

/datum/outfit/bunkeroperator/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

	H.change_stat(STATKEY_DEX, 1)

/obj/item/clothing/mask/gas/hl2/military/gps/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Bunker Signal")

/obj/item/radio/intercom/bunker
	name = "military intercom"
	desc = "An old, pre-war military intercom used by various resistance groups and outposts. This one seems to be acting as a doorbell to a bunker."
	freqlock = RADIO_FREQENCY_LOCKED
	freerange = TRUE
	broadcasting = TRUE

/obj/item/radio/intercom/bunker/comms
	frequency = FREQ_BUNKER_COMMS

/obj/item/radio/intercom/bunker/rebel
	frequency = FREQ_BUNKER_REBEL

/datum/job/bunkeroperator
	title = ROLE_HERMIT
	policy_index = ROLE_HERMIT

/datum/outfit/rebel_preview
	name = "Rebel (Preview only)"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	head = /obj/item/clothing/head/beanie/black
	gloves = /obj/item/clothing/gloves/fingerless

/datum/objective/reduce_sociostability
	explanation_text = "Reduce district sociostability below 20% through sabotaging combine machinery, freeing vortigaunts, killing, and vandalism."

/datum/objective/reduce_sociostability/check_completion()
	return ..() || SSsociostability.sociostability <= 200
