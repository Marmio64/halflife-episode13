//// MERCS BOSS

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	name = "SNE: Black Market Bullsquid"
	display_name = "Revolver Bullsquid"
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/rebel_deployment


/datum/outfit/deployment_loadout/intruder/boss/solidus/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	name = "SNE: Black Market Solidus"
	display_name = "Solidus Crab"
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/intruder/boss/liquid/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	name = "SNE: Black Market Liquid"
	display_name = "Liquid Bullsquid"
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/intruder/boss/end/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	name = "SNE: Black Market Bine"
	display_name = "The Bine"
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/rebel_deployment


//// CONSCRIPTS BOSS

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/combine
	name = "SNE: Black Market Bullsquid"
	display_name = "Revolver Bullsquid"
	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/intruder/boss/solidus/combine
	name = "SNE: Black Market Solidus"
	display_name = "Solidus Crab"
	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/intruder/boss/liquid/combine
	name = "SNE: Black Market Liquid"
	display_name = "Liquid Bullsquid"
	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/intruder/boss/end/combine
	name = "SNE: Black Market Bine"
	display_name = "The Bine"
	ears = /obj/item/radio/headset/civilprotection/deployment


//// MERCS

/obj/item/hl2/loadout_picker/rebel/sne

/obj/item/hl2/loadout_picker/rebel/sne/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/rebel/sne/assault,
			/datum/outfit/deployment_loadout/rebel/sne/shotgun,
			/datum/outfit/deployment_loadout/rebel/sne/engineer,
			/datum/outfit/deployment_loadout/rebel/sne/medic,
			/datum/outfit/deployment_loadout/rebel/sne/melee,
			/datum/outfit/deployment_loadout/rebel/sne/sniper,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/rebel/sne/boss

/obj/item/hl2/loadout_picker/rebel/sne/boss/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/intruder/boss/bullsquid/rebel,
			/datum/outfit/deployment_loadout/intruder/boss/solidus/rebel,
			/datum/outfit/deployment_loadout/intruder/boss/liquid/rebel,
			/datum/outfit/deployment_loadout/intruder/boss/end/rebel,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/rebel/sne
	loadout_tier = 67
	implants = list(/obj/item/implant/mindshield) //both black market and conscripts are subject to the SOC System.
	ears = /obj/item/radio/headset/rebel_deployment

	combat_music = 'hl13/sound/music/combat/middleeastalert.ogg'

/datum/outfit/deployment_loadout/rebel/sne/post_equip(mob/living/carbon/human/H)
	. = ..()
	GLOB.dogtag_holders += H

	for(var/obj/item/gun/G in H.get_all_gear())
		var/obj/item/firing_pin/implant/mindshield/M = new
		G.pin = M

/datum/outfit/deployment_loadout/rebel/sne/assault
	name = "SNE: Black Market Rifleman"
	display_name = "Black Market Rifleman (Offense)"
	desc = "Armed with an M4, details here."
	id_name = "Trooper"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	mask = /obj/item/clothing/mask/balaclava/protective

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 4,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

/datum/outfit/deployment_loadout/rebel/sne/shotgun
	name = "SNE: Black Market Shotgunner"
	display_name = "Black Market Shotgunner (Offense)"
	desc = "Armed with an SPAS12, details here."
	id_name = "Doorkicker"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	mask = /obj/item/clothing/mask/gas/hl2/russia/hardened

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_end = 3

/datum/outfit/deployment_loadout/rebel/sne/engineer
	name = "SNE: Black Market Engineer"
	display_name = "Black Market Engineer (Support)"
	desc = "Armed with a Colt Python, details here."
	id_name = "Sapper"

	head = /obj/item/clothing/head/utility/hardhat/halflife/mining
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/revolver/coltpython/poorly_maintained

	back = /obj/item/storage/backpack/halflife/satchel/military/large

	backpack_contents = list(
		/obj/item/ammo_box/colta357 = 2,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/sheet/mineral/sandbags = 6,
		/obj/item/stack/razorwire = 10,
		/obj/item/sbeacondrop/rebel_turret,
		/obj/item/stack/medical/gauze = 1,
		/obj/item/crowbar/large = 1,
	)

/datum/outfit/deployment_loadout/rebel/sne/medic
	name = "SNE: Black Market Medic"
	display_name = "Black Market Medic (Support)"
	desc = "Armed with a MP7, details here."
	id_name = "Sawbones"

	head = /obj/item/clothing/head/beret/sec/poland
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 2,
		/obj/item/stack/medical/gauze = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/intruder, /datum/action/cooldown/spell/conjure_item/bloodloss)

	extra_per = -1

/datum/outfit/deployment_loadout/rebel/sne/melee
	name = "SNE: Black Market Slugger"
	display_name = "Black Market Slugger (Defense)"
	desc = "Armed with a stunbaton, details here."
	id_name = "Slugger"

	head = /obj/item/clothing/head/beret/sec/poland
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/riot
	suit_store = /obj/item/melee/baton/security/loaded
	mask = /obj/item/clothing/mask/gas/hl2/russia/hardened
	belt = /obj/item/halflife/combine_battery

	back = /obj/item/shield/riot/ballistic

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/ration
	r_pocket = /obj/item/stack/medical/gauze

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/battery/intruder)

	extra_end = 3
	extra_str = 4
	extra_per = -5


/datum/outfit/deployment_loadout/rebel/sne/sniper
	name = "SNE: Black Market Sniper"
	display_name = "Black Market Sniper (Pick)"
	desc = "Armed with a Mosin, details here."
	id_name = "Marksman"

	head = /obj/item/clothing/head/halflife/scout_hat
	uniform = /obj/item/clothing/under/syndicate/combat
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/sne
	mask = /obj/item/clothing/mask/balaclava/protective

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 4,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_per = 6

//// CONSCRIPTS

/obj/item/hl2/loadout_picker/combine/sne

/obj/item/hl2/loadout_picker/combine/sne/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/sne/assault,
			/datum/outfit/deployment_loadout/combine/sne/shotgun,
			/datum/outfit/deployment_loadout/combine/sne/engineer,
			/datum/outfit/deployment_loadout/combine/sne/medic,
			/datum/outfit/deployment_loadout/combine/sne/melee,
			/datum/outfit/deployment_loadout/combine/sne/sniper,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/combine/sne/boss

/obj/item/hl2/loadout_picker/combine/sne/boss/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/intruder/boss/bullsquid/combine,
			/datum/outfit/deployment_loadout/intruder/boss/solidus/combine,
			/datum/outfit/deployment_loadout/intruder/boss/liquid/combine,
			/datum/outfit/deployment_loadout/intruder/boss/end/combine,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/combine/sne
	loadout_tier = 67
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = 'hl13/sound/music/combat/middleeastalert.ogg'

/datum/outfit/deployment_loadout/combine/sne/post_equip(mob/living/carbon/human/H)
	. = ..()
	GLOB.dogtag_holders += H

	for(var/obj/item/gun/G in H.get_all_gear())
		var/obj/item/firing_pin/implant/mindshield/M = new
		G.pin = M

/datum/outfit/deployment_loadout/combine/sne/assault
	name = "SNE: Conscript Rifleman"
	display_name = "Conscript Rifleman (Offense)"
	desc = "Armed with an M4, details here."
	id_name = "Rifleman"

	head = /obj/item/clothing/head/helmet/halflife/military/weak
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/balaclava/protective

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 4,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

/datum/outfit/deployment_loadout/combine/sne/shotgun
	name = "SNE: Conscript Shotgunner"
	display_name = "Conscript Shotgunner (Offense)"
	desc = "Armed with an SPAS12, details here."
	id_name = "Breacher"

	head = /obj/item/clothing/head/helmet/halflife/military/weak
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_end = 3

/datum/outfit/deployment_loadout/combine/sne/engineer
	name = "SNE: Conscript Engineer"
	display_name = "Conscript Engineer (Support)"
	desc = "Armed with a Colt Python, details here."
	id_name = "Technician"

	head = /obj/item/clothing/head/halflife/blue_hardhat
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/revolver/coltpython/poorly_maintained
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection

	back = /obj/item/storage/backpack/halflife/satchel/military/large

	backpack_contents = list(
		/obj/item/ammo_box/colta357 = 2,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/sheet/mineral/sandbags = 6,
		/obj/item/stack/razorwire = 10,
		/obj/item/sbeacondrop/combine_turret,
		/obj/item/stack/medical/gauze = 1,
		/obj/item/crowbar/large = 1,
	)

/datum/outfit/deployment_loadout/combine/sne/medic
	name = "SNE: Conscript Medic"
	display_name = "Conscript Medic (Support)"
	desc = "Armed with a MP7, details here."
	id_name = "Responder"

	head = /obj/item/clothing/head/beret/durathread/unitednations
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 2,
		/obj/item/stack/medical/gauze = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/intruder, /datum/action/cooldown/spell/conjure_item/bloodloss)

	extra_per = -1

/datum/outfit/deployment_loadout/combine/sne/melee
	name = "SNE: Conscript Slugger"
	display_name = "Conscript Slugger (Defense)"
	desc = "Armed with a stunbaton, details here."
	id_name = "Breacher"

	head = /obj/item/clothing/head/beret/durathread/unitednations
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/riot
	suit_store = /obj/item/melee/baton/security/loaded
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened
	belt = /obj/item/halflife/combine_battery

	back = /obj/item/shield/riot/ballistic

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/ration
	r_pocket = /obj/item/stack/medical/gauze

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/battery/intruder)

	extra_end = 3
	extra_str = 4
	extra_per = -5

/datum/outfit/deployment_loadout/combine/sne/sniper
	name = "SNE: Conscript Sniper"
	display_name = "Conscript Sniper (Pick)"
	desc = "Armed with a Mosin, details here."
	id_name = "Sniper"

	head = /obj/item/clothing/head/halflife/scout_hat
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/sne
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/balaclava/protective

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 4,
		/obj/item/reagent_containers/pill/patch/medkit/ration = 1,
		/obj/item/stack/medical/gauze = 1,
	)

	extra_per = 6

//// SNAKE

/datum/outfit/deployment_loadout/intruder/solid/old/sne
	faction = XEN_DEPLOYMENT_FACTION //sort of the team three i guess
	name = "SNE: Old Crab"
	sus_venter = TRUE

	back = /obj/item/storage/backpack/halflife/satchel/huge/solid
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/solid

	r_hand = null //no loadout beacon, already has a loadout

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/solid,
		/obj/item/gun/ballistic/automatic/m4a1/famas/crab/suppressed,
		/obj/item/ammo_box/magazine/m4a1/famas,
		/obj/item/ammo_box/magazine/m4a1/famas,
		/obj/item/ammo_box/magazine/m4a1/famas,
		/obj/item/gun/ballistic/automatic/pistol/solid_tranq,
		/obj/item/ammo_box/magazine/solid_tranq,
		/obj/item/ammo_box/magazine/solid_tranq,
		/obj/item/ammo_box/magazine/solid_tranq,
		/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/the_end,
		/obj/item/ammo_box/strilka310/a762/tranq,
		/obj/item/ammo_box/strilka310/a762/tranq,
		/obj/item/ammo_box/strilka310/a762/tranq,
		/obj/item/reagent_containers/pill/patch/medkit/ration,
	)

/datum/outfit/deployment_loadout/intruder/solid/old/sne/post_equip(mob/living/carbon/human/H)
	. = ..()

	for(var/datum/action/cooldown/spell/touch/holdup/loot in H.actions)
		loot.sne = TRUE

/obj/item/storage/backpack/halflife/satchel/huge/solid
	name = "Weapons Bag"
	desc = "A bag of physically impossible proportions designed to carry anything an Old Crab might need sneaking through a warzone. Dogtags must be stored in here for them to count towards your victory."
	icon_state = "civilprotection"
	inhand_icon_state = "military"
