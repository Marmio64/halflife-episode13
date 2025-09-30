/datum/job/botanist
	title = JOB_BOTANIST
	description = "Grow combine approved produce substitutes for citizen consumptions and combine biofuel use."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BOTANIST"

	outfit = /datum/outfit/job/botanist
	plasmaman_outfit = /datum/outfit/plasmaman/botany

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BOTANIST
	bounty_types = CIV_JOB_GROW
	departments_list = list(
		/datum/job_department/service,
		)

	family_heirlooms = list(
		/obj/item/cultivator,
		/obj/item/reagent_containers/cup/watering_can/wood,
		/obj/item/toy/plush/beeplushie,
		)

	mail_goodies = list(
		/obj/item/reagent_containers/cup/bottle/mutagen = 20,
		/obj/item/reagent_containers/cup/bottle/saltpetre = 20,
		/obj/item/reagent_containers/cup/bottle/diethylamine = 20,
		/obj/item/gun/energy/floragun = 10,
		/obj/item/reagent_containers/cup/watering_can/advanced = 10,
		/obj/effect/spawner/random/food_or_drink/seed_rare = 5,// These are strong, rare seeds, so use sparingly.
		/obj/item/food/monkeycube/bee = 2
	)

	rpg_title = "Gardener"

/datum/outfit/job/botanist
	name = "Botanist"
	jobtype = /datum/job/botanist
	id = /obj/item/card/id/advanced/halflife/grey

	id_trim = /datum/id_trim/job/botanist
	uniform = /obj/item/clothing/under/citizen
	gloves  = /obj/item/clothing/gloves/botanic_leather
	suit = /obj/item/clothing/suit/apron/overalls
