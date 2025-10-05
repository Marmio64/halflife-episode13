/datum/job/prisoner
	title = JOB_PRISONER
	description = "Inhabit an abandoned, hidden bunker and stealthily work to overthrow the combine regime. Smuggle out citizens from the city and convince them to join your cause while avoiding combine assaults."
	department_head = list("Nobody")
	total_positions = 4
	spawn_positions = 4
	supervisors = "nobody"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	config_tag = "PRISONER"

	outfit = /datum/outfit/job/rebel
	plasmaman_outfit = /datum/outfit/plasmaman/prisoner

	display_order = JOB_DISPLAY_ORDER_PRISONER
	department_for_prefs = /datum/job_department/assistant

	family_heirlooms = list(/obj/item/pen/blue)
	rpg_title = "Defeated Miniboss"

	job_flags = JOB_EQUIP_RANK|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS
	faction = FACTION_STATION

	cmode_music = 'hl13/sound/music/combat/cpviolation.ogg' //cause they're a cp violation

	gameplay_help = "Your task is of a herculean effort, and the road ahead will see you losing many of your comrades and most likely your own life as well. Take things slowly, wittle down the combine, loot to find better gear, and recruit more volunteers in your ranks to have the best chance."

/datum/outfit/job/rebel
	name = "Outlands Rebel"
	jobtype = /datum/job/prisoner

	id = /obj/item/storage/wallet
	uniform = /obj/item/clothing/under/citizen/rebel

	suit = /obj/item/clothing/suit/armor/civilprotection
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/satchel

	l_pocket = /obj/item/flashlight

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/usp9mm = 1,
		/obj/item/hl2key/rebel = 1,
	)

/datum/outfit/job/rebel/pre_equip(mob/living/carbon/human/equip_to)
	if(prob(25))
		suit = /obj/item/clothing/suit/armor/rebel/light
		suit_store = /obj/item/gun/ballistic/automatic/pistol/makeshift
		head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
		backpack_contents = list(
			/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
			/obj/item/ammo_box/magazine/makeshift9mm = 1,
			/obj/item/hl2key/rebel = 1,
		)
	else if(prob(25))
		suit_store = /obj/item/switchblade
		equip_to.change_stat(STATKEY_STR, 2)
		equip_to.change_stat(STATKEY_DEX, -1)
		backpack_contents = list(
			/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
			/obj/item/hl2key/rebel = 1,
		)

/datum/outfit/job/rebel/post_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	user.change_stat(STATKEY_DEX, 2)


/datum/outfit/job/refugee
	name = "Outlands Refugee"
	jobtype = /datum/job/prisoner

	id = /obj/item/storage/wallet
	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

/datum/outfit/job/refugee/fixeditems
	name = "Outlands Refugee with items pouch"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/citizen/refugee
	belt = /obj/item/storage/belt/pouch/refugee

/datum/outfit/job/refugee/randomitems
	name = "Outlands Refugee with a random item"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/citizen/refugee

	var/list/rhand_items = list(
		/obj/item/storage/belt/pouch,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/storage/box/halflife/ration/ration,
		/obj/item/knife/kitchen,
		/obj/item/clothing/suit/armor/armored
		) //Refugees get a random item from this list

/datum/outfit/job/refugee/randomitems/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	var/chosen = pick(rhand_items)
	var/turf/T = get_turf(H)
	var/obj/item/I = new chosen(T)
	H.put_in_hands(I)

/datum/job/prisoner/after_latejoin_spawn(mob/living/spawning)
	. = ..()
	if(ishuman(spawning))
		var/list/spawn_locs = list()
		for(var/X in GLOB.outlands_latejoin)
			spawn_locs += X

		if(!spawn_locs.len)
			message_admins("No valid spawn locations found, aborting...")
			return MAP_ERROR

		spawning.forceMove(pick(spawn_locs))

/datum/outfit/job/refugee/armed
	name = "Armed Outlands Refugee"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial

	belt = /obj/item/storage/belt/pouch/refugee

/datum/outfit/job/refugee/armed/medium
	name = "Armed Outlands Refugee (Medium)"

	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

/datum/outfit/job/refugee/armed/heavy
	name = "Armed Outlands Refugee (Heavy)"

	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant

	head = /obj/item/clothing/head/helmet/halflife/military

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/strilka310/a762 = 2,
	)
