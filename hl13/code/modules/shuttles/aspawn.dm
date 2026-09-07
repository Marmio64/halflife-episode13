// FLIGHT CONTROLS

/obj/machinery/computer/shuttle/adminsub
	name = "submarine helm terminal"
	desc = "Sets the course for the submarine."
	shuttleId = "adminsub"
	possible_destinations = "syndicate_se;pirate_away2;pirate_away;adminsub_custom;adminsub_home"

/obj/machinery/computer/camera_advanced/shuttle_docker/adminsub
	name = "submarine navigation terminal"
	desc = "Used to designate a precise transit location for the submarine."
	shuttleId = "adminsub"
	shuttlePortId = "adminsub_custom"
	jump_to_ports = list("syndicate_se" = 1, "pirate_away2" = 1, "pirate_away" = 1)
	view_range = 5.5
	whitelist_turfs = list(/turf/open/halflife/water)
	see_hidden = TRUE

/area/shuttle/admin_submarine
	name = "Submarine"

/obj/machinery/computer/shuttle/admintrain
	name = "train control console"
	desc = "Tells the train's engines where to guide it."
	shuttleId = "admintrain"
	possible_destinations = "admintrain_siding;arrival_stationary;ferry_home;cargo_home"

/area/shuttle/admin_train
	name = "Train"

// SPAWNERS

/datum/outfit/unequipped_rebel
	name = "Generic Unequipped Rebel"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	ears = /obj/item/radio/headset/syndicate/alt
	l_pocket = /obj/item/flashlight/seclite

/datum/outfit/unequipped_rebel/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'

	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_DEX, 1)
	H.change_stat(STATKEY_STR, 2)


/obj/effect/mob_spawn/ghost_role/human/generic_rebel
	name = "\improper sleeping bag"
	desc = "A body bag poked with holes, currently being used as a sleeping bag. Someone seems to be sleeping inside of it."
	density = FALSE
	you_are_text = "You're a member of one of the many resistance groups operating in Poland!"
	flavour_text = "Gear up and await orders from your superior officer, if any."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bodybag"
	outfit = /datum/outfit/unequipped_rebel

/* AWAITING MAPPING
/datum/map_template/shuttle/ert/plf_combat_train
	suffix = "plf_combat"
	name = "PLF infantry transport train"
	description = "A train used by the PLF to deploy large combatant crews into Combine territory. Nothing to scoff at, though they may struggle against the Transhuman Arm."

/datum/map_template/shuttle/ert/plf_med_train
	suffix = "plf_med"
	name = "PLF humanitarian supply train"
	description = "A train used by the Polish Free State to supply large amounts of food, water, and medicine to newly-liberated territories. Its combatant crew, however, is very small."
*/
/datum/map_template/shuttle/ert/plf_submarine
	suffix = "plf_submarine"
	name = "PLF raid submarine"
	description = "A tiny narco-sub used by the Polish Liberation Front's elite commando units. Incredibly cramped, though very effective at inserting troops into hostile regions."

/datum/map_template/shuttle/ert/lambda_submarine
	suffix = "lambda_submarine"
	name = "Lambda Resistance submarine"
	description = "A narco-sub originally captured from the Black Market Ring, now operated by the Lambda Resistance's specialists."

/* AWAITING MAPPING
/datum/map_template/shuttle/ert/lambda_train
	suffix = "lambda_train"
	name = "Lambda Resistance train"
	description = "A repurposed Combine locomotive used by the Lambda Resistance for combined humanitarian and combat duties."
*/


