/datum/outfit/bunkeroperator
	name = "Bunker Operator"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	head = /obj/item/clothing/head/beret
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	ears = /obj/item/radio/headset/syndicate/alt //tacticool military headset

	suit_store = /obj/item/gun/ballistic/automatic/servicerifle

	l_pocket = /obj/item/flashlight/seclite

/datum/outfit/bunkeroperator/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

/obj/item/clothing/mask/gas/hl2/military/gps/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Bunker Signal")

/obj/effect/mob_spawn/ghost_role/human/bunkeroperator
	name = "sleeping pod"
	desc = "Some strange, old machine."
	prompt_name = "bunker operator"
	icon = 'icons/obj/mining_zones/spawners.dmi'
	icon_state = "terrarium"
	you_are_text = "You are a bunker comms operator from the old world."
	flavour_text = "You went into this bunker years ago when you managed to escape the combine during the early occupation years. You've been living here for years now, but just recently picked up a signal on your radio..."
	spawner_job_path = /datum/job/bunkeroperator
	outfit = /datum/outfit/bunkeroperator

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
