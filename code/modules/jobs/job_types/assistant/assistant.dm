GLOBAL_DATUM(colored_assistant, /datum/colored_assistant)

/*
Assistant
*/
/datum/job/assistant
	title = JOB_ASSISTANT
	description = "Try to survive in this prison. Who knows, maybe you'll get out one day."
	faction = FACTION_STATION
	total_positions = 25
	spawn_positions = 25
	supervisors = "absolutely everyone"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/assistant/consistent
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_CITIZEN // Get a job. Job reassignment changes your paycheck now. Get over it.

	skills = list(/datum/skill/factorywork = SKILL_EXP_JOURNEYMAN) //HL13 edit, so long as they're prisoners who will do factory work a lot

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_ASSISTANT

	liver_traits = list(TRAIT_MAINTENANCE_METABOLISM)

	department_for_prefs = /datum/job_department/assistant

	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/clothing/gloves/cut/heirloom)

	mail_goodies = list(
		/obj/effect/spawner/random/food_or_drink/donkpockets = 10,
		/obj/item/clothing/mask/gas = 10,
		/obj/item/clothing/gloves/color/fyellow = 7,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = STATION_JOB_FLAGS
	rpg_title = "Lout"
	config_tag = "ASSISTANT"

	gameplay_help = "As a Prisoner, you have no reason to suck up to the combine, unless you're looking to brown nose your way to loyalty status and get some better food. You are free to stir trouble, stage riots, work as you are told, or even snitch on comrades for a reward."

/datum/job/assistant/get_outfit(consistent)
	if(consistent)
		return /datum/outfit/job/assistant/preview
	if(!HAS_TRAIT(SSstation, STATION_TRAIT_ASSISTANT_GIMMICKS))
		return ..()

	var/static/list/gimmicks = list()
	if(!length(gimmicks))
		for(var/datum/outfit/job/assistant/gimmick/gimmick_outfit as anything in subtypesof(/datum/outfit/job/assistant/gimmick))
			gimmicks[gimmick_outfit] = gimmick_outfit::outfit_weight

	return pick_weight(gimmicks)

/datum/outfit/job/assistant
	name = JOB_ASSISTANT

	id = /obj/item/card/id/advanced/halflife/grey
	jobtype = /datum/job/assistant
	id_trim = /datum/id_trim/job/assistant
	uniform = /obj/item/clothing/under/citizen

/datum/outfit/job/assistant/pre_equip(mob/living/carbon/human/target)
	..()
	give_holiday_hat(target)

/datum/outfit/job/assistant/proc/give_holiday_hat(mob/living/carbon/human/target)
	for(var/holidayname in GLOB.holidays)
		var/datum/holiday/holiday_today = GLOB.holidays[holidayname]
		var/obj/item/special_hat = holiday_today.holiday_hat
		if(prob(HOLIDAY_HAT_CHANCE) && !isnull(special_hat) && isnull(head))
			head = special_hat

/datum/outfit/job/assistant/proc/give_jumpsuit(mob/living/carbon/human/target)
	var/static/jumpsuit_number = 0
	jumpsuit_number += 1

	if (isnull(GLOB.colored_assistant))
		var/configured_type = get_configured_colored_assistant_type()
		GLOB.colored_assistant = new configured_type

	var/index = (jumpsuit_number % GLOB.colored_assistant.jumpsuits.len) + 1

	//We don't cache these, because they can delete on init
	//Too fragile, better to just eat the cost
	if (target.jumpsuit_style == PREF_SUIT)
		uniform = GLOB.colored_assistant.jumpsuits[index]
	else
		uniform = GLOB.colored_assistant.jumpskirts[index]

/datum/outfit/job/assistant/consistent
	name = "Citizen - Consistent"

/datum/outfit/job/assistant/consistent/give_holiday_hat(mob/living/carbon/human/target)
	return

/datum/outfit/job/assistant/consistent/give_jumpsuit(mob/living/carbon/human/target)
	uniform = /obj/item/clothing/under/citizen

/datum/outfit/job/assistant/consistent/post_equip(mob/living/carbon/human/H, visuals_only)
	..()

	// This outfit is used by the assets SS, which is ran before the atoms SS
	if (SSatoms.initialized == INITIALIZATION_INSSATOMS)
		H.w_uniform?.update_greyscale()
		H.update_worn_undersuit()

/datum/outfit/job/assistant/preview
	name = "Assistant - Preview"

/datum/outfit/job/assistant/preview/give_jumpsuit(mob/living/carbon/human/target)
	uniform = /obj/item/clothing/under/citizen
