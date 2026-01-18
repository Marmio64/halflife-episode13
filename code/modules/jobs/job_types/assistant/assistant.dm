GLOBAL_DATUM(colored_assistant, /datum/colored_assistant)
GLOBAL_LIST_INIT(availablecells, list(
	"L1",
	"L2",
	"L3",
	"L4",
	"L5",
	"L6",
	"L7",
	"R1",
	"R2",
	"R3",
	"R5", //R4 is for vorts, not R5, whoops
	"R6",
	"R7",
	"L1",
	"L2",
	"L3",
	"L4",
	"L5",
	"L6",
	"L7",
	"R1",
	"R2",
	"R3",
	"R5", //if i dont do it this way it deletes two at once
	"R6",
	"R7",
))

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

/datum/outfit/job/assistant
	name = JOB_ASSISTANT

	id = /obj/item/card/id/advanced/halflife/grey
	jobtype = /datum/job/assistant
	id_trim = /datum/id_trim/job/assistant
	uniform = /obj/item/clothing/under/citizen

/datum/outfit/job/assistant/consistent
	name = "Citizen - Consistent"

/datum/outfit/job/assistant/preview
	name = "Assistant - Preview"

/datum/outfit/job/assistant/post_equip(mob/living/carbon/human/user, visuals_only = FALSE) //hl13 edit, change id to random unused cell + number
	. = ..()

	var/cell = "NULL"

	if(length(GLOB.availablecells) > 0)
		if(user.mind)
			cell = pick(GLOB.availablecells)
			GLOB.availablecells -= cell

	if(istype(user.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = user.wear_id
		ID.registered_name = "CI:[cell]-[rand(111,999)]"
		ID.update_label()
