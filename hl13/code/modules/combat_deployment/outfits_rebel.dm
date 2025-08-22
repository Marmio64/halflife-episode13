/obj/item/radio/headset/rebel_deployment
	keyslot = /obj/item/encryptionkey/syndicate/uprising

/datum/outfit/deployment_loadout/rebel/tier1/mosin_partisan
	name = "Deployment: Refugee Mosin Partisan"
	display_name = "Refugee Mosin Partisan"
	desc = "Armed with a mosin nagant partisans have decent damage capabilities but have very poor armor."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	l_pocket = /obj/item/stack/sheet/halflife/brick
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 3,
		/obj/item/stack/medical/bandage = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier1/molotov_partisan
	name = "Deployment: Refugee Molotov Partisan"
	display_name = "Refugee Molotov Partisan"
	desc = "Armed with molotovs and tinbombs, they provide useful support to allies."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	l_pocket = /obj/item/stack/sheet/halflife/brick
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	mask = /obj/item/clothing/mask/gas/hl2/military

	backpack_contents = list(
		/obj/item/grenade/halflife/molotov,
		/obj/item/grenade/halflife/molotov,
		/obj/item/lighter,
		/obj/item/grenade/halflife/tinbomb,
		/obj/item/grenade/halflife/tinbomb,
		/obj/item/stack/medical/bandage = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier1/engineer
	name = "Deployment: Refugee Engineer"
	display_name = "Refugee Engineer"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 7,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/// TIER 2 ////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/rebel/tier2/pistol_rebel
	name = "Deployment: Pistol Rebel"
	display_name = "Pistol Rebel"
	desc = "Lightly armored and equipped with a USP match alongside two healthpens, these rebels have decent combat capabilities overall."

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/satchel

	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 4,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier2/medic_rebel
	name = "Deployment: Medic Rebel"
	display_name = "Medic Rebel"
	desc = "Has less ammo and slightly less armor than the standard pistol rebels, but more medical supplies."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/medic
	accessory = /obj/item/clothing/accessory/armband/medblue
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/boots

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 1,
		/obj/item/stack/medical/suture = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier2/engineer
	name = "Deployment: Upgraded Refugee Engineer"
	display_name = "Upgraded Refugee Engineer"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 9,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

	suit = /obj/item/clothing/suit/armor/civilprotection

	ears = /obj/item/radio/headset/rebel_deployment

/// TIER 3 //////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/rebel/tier3/mp7_rebel
	name = "Deployment: MP7 Rebel"
	display_name = "MP7 Rebel"
	desc = "Moderately armored and equipped with a MP7 alongside two healthpens and a grenade, these rebels have decent combat capabilities overall."

	uniform = /obj/item/clothing/under/citizen/rebel
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/satchel

	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	backpack_contents = list(
		/obj/item/ammo_box/magazine/mp7 = 4,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/grenade/syndieminibomb/bouncer = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier3/bomber_rebel
	name = "Deployment: Rebel Bomber"
	display_name = "Rebel Bomber"
	desc = "Well armored and equipped with lots of explosives, but only has a pistol as a gun."

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	back = /obj/item/storage/backpack/halflife/satchel/military

	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 4,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier3/vortigaunt
	name = "Deployment: Vortigaunt"
	display_name = "Vortigaunt"
	desc = "Equipped with powerful long range blasts and infinite healing, vortigaunts are a great support option."
	uniform = null
	shoes = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier3/vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt)

/datum/outfit/deployment_loadout/rebel/tier3/crossbow
	name = "Deployment: Crossbow Rebel"
	display_name = "Crossbow Rebel"
	desc = "A long ranged scoped crossbow lets you keep enemies far away from you as you pepper them with red hot bolts of rebar."

	head = /obj/item/clothing/head/beanie/black
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/upgraded
	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/grenade/smokebomb

	glasses = /obj/item/clothing/glasses/night

	back = /obj/item/storage/bag/rebar_quiver
	backpack_contents = list(
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier3/engineer
	name = "Deployment: Upgraded Refugee Engineer+"
	display_name = "Upgraded Refugee Engineer+"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 10,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/sbeacondrop/rebel_turret = 1,
	)

	suit = /obj/item/clothing/suit/armor/civilprotection

	ears = /obj/item/radio/headset/rebel_deployment


/// TIER 4 ///////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/rebel/tier4/ar2_rebel
	name = "Deployment: AR2 Rebel"
	display_name = "AR2 Rebel"
	desc = "While less armored than a corporal, you have a better gun and more mobility."

	uniform = /obj/item/clothing/under/citizen/rebel
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/satchel

	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/automatic/ar2/standardpin

	backpack_contents = list(
		/obj/item/ammo_box/magazine/ar2 = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/grenade/syndieminibomb/bouncer = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/corporal
	name = "Deployment: PLF Corporal"
	display_name = "PLF Corporal"
	desc = "Well armored and equipped with a service rifle to pose a sizeable threat."
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/helmet/halflife/military/poland
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/magazine/m4a1/service = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/bomber_rebel
	name = "Deployment: Heavy Rebel Bomber"
	display_name = "Heavy Rebel Bomber"
	desc = "Well armored and equipped with lots of explosives, and armed with an mp7."

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	back = /obj/item/storage/backpack/halflife/satchel/military

	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 4,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/magazine/mp7 = 3,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt
	name = "Deployment: Elder Vortigaunt"
	display_name = "Elder Vortigaunt"
	desc = "Unleash vortal energy upon foes. You're a wizard, vorty!"
	uniform = null
	shoes = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/elder)

/datum/outfit/deployment_loadout/rebel/tier4/crossbow
	name = "Deployment: Heavy Crossbow Rebel"
	display_name = "Heavy Crossbow Rebel"
	desc = "A long ranged scoped crossbow lets you keep enemies far away from you as you pepper them with red hot bolts of rebar."

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/upgraded
	belt = /obj/item/gun/ballistic/revolver/coltpython
	r_pocket = /obj/item/grenade/smokebomb

	glasses = /obj/item/clothing/glasses/night

	back = /obj/item/storage/bag/rebar_quiver
	backpack_contents = list(
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/engineer
	name = "Deployment: Heavy Refugee Engineer"
	display_name = "Heavy Refugee Engineer"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 12,
		/obj/item/sbeacondrop/rebel_turret = 2,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

	suit = /obj/item/clothing/suit/armor/rebel/light

	ears = /obj/item/radio/headset/rebel_deployment

/obj/item/sbeacondrop/rebel_turret
	desc = "A label on it reads: <i>Warning: Activating this device will send a rebel turret to your location</i>."
	droptype = /obj/machinery/porta_turret/combine/rebel

///////////// TIER 5 //////////////////////////////////////////

/datum/outfit/deployment_loadout/rebel/tier5/freeman
	name = "Deployment: A Free Man"
	display_name = "A Free Man"
	desc = "Well armored and speedy, with a powerful crowbar to boot alongside a non biolocked AR2."

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/freeman
	glasses = /obj/item/clothing/glasses/regular/thin
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen
	r_pocket = /obj/item/flashlight/seclite

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/ar2 = 4,
		/obj/item/gun/ballistic/automatic/ar2/standardpin = 1,
		/obj/item/crowbar/large/freeman = 1,
	)

/datum/outfit/deployment_loadout/rebel/tier5/veteran
	name = "Deployment: PLF Veteran"
	display_name = "PLF Veteran"
	desc = "Ultra heavily armored with an AK-47 to destroy enemies."

	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran
	uniform = /obj/item/clothing/under/syndicate/camo
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	gloves = /obj/item/clothing/gloves/combat
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	back = /obj/item/storage/backpack/duffelbag/halflife
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/boots
	backpack_contents = list(
		/obj/item/grenade/c4 = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/hl13_small_flag/poland/telescopic = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/secretsteersus.ogg'
