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


/obj/effect/mob_spawn/ghost_role/human/plf_rebel
	name = "\improper private's sleeping bag"
	desc = "A body bag poked with holes, currently being used as a sleeping bag. Someone seems to be sleeping inside of it."
	density = FALSE
	you_are_text = "You are a soldier of the Polish Liberation Front, the armed wing of the Polish Free State!"
	flavour_text = "Your commanding officer will likely have instructions for you soon."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bodybag"
	outfit = /datum/outfit/resistance_faction/polish


/obj/effect/mob_spawn/ghost_role/human/plf_rebel/sapper
	name = "\improper sapper's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/sapper

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/medic
	name = "\improper medic's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/medic

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/servicerifle
	name = "\improper private first class' sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/competent

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/mosin
	name = "\improper private second class' sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/competent/mosin

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/m4a1
	name = "\improper corporal's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/strong

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/trench
	name = "\improper pointman's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/competent/shotgunner

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/sniper
	name = "\improper marksman's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/competent/sniper

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/commander
	name = "\improper platoon commander's sleeping bag"
	you_are_text = "You are a platoon commander of the PLF, in charge of a small force operating in or near City 13."
	flavour_text = "Await instructions from Warsaw Command."
	outfit = /datum/outfit/resistance_faction/polish/commander

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/ak47
	name = "\improper commando's sleeping bag"
	outfit = /datum/outfit/resistance_faction/polish/commando

/obj/effect/mob_spawn/ghost_role/human/plf_rebel/veteran
	name = "\improper veteran's sleeping bag"
	desc = "A body bag poked with holes. The hushed casket of a veteran of the Polish Liberation Front. You make a point to stay quiet near it."
	you_are_text = "You are a veteran of the Polish Army, now serving under the PLF. You have seen the horrors of Soviet occupation and the Seven Hour War, and your day has come again."
	flavour_text = "Await guidance from your comrades or superiors."
	outfit = /datum/outfit/resistance_faction/polish/commando/veteran

/obj/effect/mob_spawn/ghost_role/human/lambda_rebel
	name = "\improper recruit's sleeping bag"
	desc = "A body bag poked with holes, currently being used as a sleeping bag. Someone seems to be sleeping inside of it."
	density = FALSE
	you_are_text = "You are a rebel under the Lambda Resistance!"
	flavour_text = "Assuming you have a commanding officer, they'll have instructions for you."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bodybag"
	outfit = /datum/outfit/rebel

/obj/effect/mob_spawn/ghost_role/human/lambda_rebel/medium
	name = "\improper rebel's sleeping bag"
	outfit = /datum/outfit/rebel/medium

/obj/effect/mob_spawn/ghost_role/human/lambda_rebel/heavy
	name = "\improper rifleman's sleeping bag"
	outfit = /datum/outfit/rebel/heavy

/obj/effect/mob_spawn/ghost_role/human/lambda_rebel/heavy/ak
	outfit = /datum/outfit/rebel/heavy/ak47


/datum/map_template/shuttle/ert/plf_combat_train
	suffix = "plf_combat"
	name = "PLF infantry transport train"
	description = "A train used by the PLF to deploy large combatant crews into Combine territory. Nothing to scoff at, though they may struggle against the Transhuman Arm."

/datum/map_template/shuttle/ert/plf_med_train
	suffix = "plf_med"
	name = "PLF humanitarian supply train"
	description = "A train used by the Polish Free State to supply large amounts of food, water, and medicine to newly-liberated territories. Its combatant crew, however, is lightly-armed."

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


