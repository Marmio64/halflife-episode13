/datum/job/cook
	title = JOB_COOK
	description = "Operate the prison cafeteria, ensuring inmates and staff alike are fed so neither attempt to kill you. You're still officially an inmate yourself unlike unionized prison staff, but due to a lower crime are afforded more amenities."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	exp_requirements = 30
	exp_required_type = EXP_TYPE_CREW
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "COOK"
	var/cooks = 0 //Counts cooks amount

	outfit = /datum/outfit/job/cook
	plasmaman_outfit = /datum/outfit/plasmaman/chef

	paycheck = PAYCHECK_CITIZEN
	paycheck_department = ACCOUNT_SRV

	liver_traits = list(TRAIT_CULINARY_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_COOK
	bounty_types = CIV_JOB_CHEF
	departments_list = list(
		/datum/job_department/service,
		)

	family_heirlooms = list(
		/obj/item/reagent_containers/condiment/saltshaker,
		/obj/item/kitchen/rollingpin,
		/obj/item/clothing/head/utility/chefhat,
	)

	// Adds up to 100, don't mess it up
	mail_goodies = list(
		/obj/item/storage/box/ingredients/random = 40,
		/obj/item/reagent_containers/cup/bottle/caramel = 7,
		/obj/item/reagent_containers/condiment/flour = 7,
		/obj/item/reagent_containers/condiment/rice = 7,
		/obj/item/reagent_containers/condiment/ketchup = 7,
		/obj/item/reagent_containers/condiment/enzyme = 7,
		/obj/item/reagent_containers/condiment/soymilk = 7,
		/obj/item/kitchen/spoon/soup_ladle = 6,
		/obj/item/kitchen/tongs = 6,
		/obj/item/knife/kitchen = 4,
		/obj/item/knife/butcher = 2,
	)

	rpg_title = "Tavern Chef"
	alternate_titles = list(
		JOB_CHEF,
	)
	job_flags = STATION_JOB_FLAGS

/datum/job/cook/award_service(client/winner, award)
	winner.give_award(award, winner.mob)

	var/datum/venue/restaurant = SSrestaurant.all_venues[/datum/venue/restaurant]
	var/award_score = restaurant.total_income
	var/award_status = winner.get_award_status(/datum/award/score/chef_tourist_score)
	if(award_score > award_status)
		award_score -= award_status
	winner.give_award(/datum/award/score/chef_tourist_score, winner.mob, award_score)


/datum/outfit/job/cook
	name = "Cook"
	jobtype = /datum/job/cook
	id = /obj/item/card/id/advanced/halflife/grey

	id_trim = /datum/id_trim/job/cook/chef
	suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/utility/chefhat
	uniform = /obj/item/clothing/under/citizen
	r_pocket = /obj/item/hl2key/kitchen

/datum/outfit/job/cook/pre_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	..()
	var/datum/job/cook/other_chefs = SSjob.get_job_type(jobtype)
	if(other_chefs) // If there's other Chefs, you're a Cook
		if(other_chefs.cooks > 0)//Cooks
			id_trim = /datum/id_trim/job/cook
			suit = /obj/item/clothing/suit/apron/chef
			head = /obj/item/clothing/head/soft/mime
		if(!visuals_only)
			other_chefs.cooks++

/datum/outfit/job/cook/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	ADD_TRAIT(user, TRAIT_EXPERIENCED_CHEF, JOB_TRAIT)

	user.mind?.teach_crafting_recipe(/datum/crafting_recipe/food/nutrimentpierogi_pork)
	user.mind?.teach_crafting_recipe(/datum/crafting_recipe/food/nutrimentpierogi_beef)
	user.change_stat(STATKEY_STR, 1) //strong from butchering
	user.change_stat(STATKEY_DEX, 1) //fine knife control
	user.change_stat(STATKEY_INT, -1) //kind of a loaf

	// Update PDA to match possible new trim.
	var/obj/item/card/id/worn_id = user.wear_id
	var/obj/item/modular_computer/pda/pda = user.get_item_by_slot(pda_slot)
	if(!istype(worn_id) || !istype(pda))
		return
	var/assignment = worn_id.get_trim_assignment()
	if(!isnull(assignment))
		pda.imprint_id(user.real_name, assignment)

/datum/outfit/job/cook/get_types_to_preload()
	. = ..()
	. += /obj/item/clothing/suit/apron/chef
	. += /obj/item/clothing/head/soft/mime
