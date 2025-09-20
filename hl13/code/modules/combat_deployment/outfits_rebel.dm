/obj/item/radio/headset/rebel_deployment
	keyslot = /obj/item/encryptionkey/syndicate/uprising

/datum/outfit/deployment_loadout/rebel/tier1/mosin_partisan
	name = "Deployment: Refugee Mosin Partisan"
	display_name = "Refugee Mosin Partisan"
	desc = "Armed with a mosin nagant partisans have decent damage capabilities but have very poor armor."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 3,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
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
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
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
		/obj/item/stack/sheet/mineral/sandbags = 9,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier1/smuggler
	name = "Deployment: Refugee Smuggler"
	display_name = "Refugee Smuggler"
	desc = "You move faster, but actually take increased damage from all sources, and only have a measly makeshift pistol to defend yourself with."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	suit = /obj/item/clothing/suit/armor/browncoat/deployment

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/beanie/black

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/makeshift = 1,
		/obj/item/ammo_box/magazine/makeshift9mm = 1,
		/obj/item/stack/medical/bandage/makeshift = 1,
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
	glasses = /obj/item/clothing/glasses/hud/health

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
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

	suit = /obj/item/clothing/suit/armor/civilprotection

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier2/smuggler
	name = "Deployment: Upgraded Smuggler"
	display_name = "Upgraded Smuggler"
	desc = "You move faster, but actually take increased damage from all sources, and only have a measly makeshift pistol to defend yourself with."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	suit = /obj/item/clothing/suit/armor/browncoat/deployment

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/beanie/black

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/makeshift = 1,
		/obj/item/ammo_box/magazine/makeshift9mm = 3,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

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
		/obj/item/grenade/syndieminibomb/bouncer = 3,
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
	H.cmode_music = combat_music

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
	l_pocket = /obj/item/ammo_box/magazine/usp9mm
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
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/sbeacondrop/rebel_turret = 1,
	)

	suit = /obj/item/clothing/suit/armor/civilprotection

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/sandbag)

/datum/outfit/deployment_loadout/rebel/tier3/scout
	name = "Deployment: Rebel Scout"
	display_name = "Rebel Scout"
	desc = "You are a speedy glass cannon that uses a shotgun for high upclose damage, but lack much of any armor. You specialize best in taking out more vulnerable backliners who can't effectively fight back."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/browncoat/scout
	suit_store = /obj/item/gun/ballistic/shotgun/spas12

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier3/medic_rebel
	name = "Deployment: Upgraded Medic Rebel"
	display_name = "Upgraded Medic Rebel"
	desc = "Compared to your unupgraded version, you have a slight increase in ammo and speed."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/civilprotection/medical/speedy
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/medic_plus
	accessory = /obj/item/clothing/accessory/armband/medblue
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/boots

	back = /obj/item/storage/backpack/satchel
	glasses = /obj/item/clothing/glasses/hud/health

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 1,
		/obj/item/stack/medical/suture = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit)

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
	desc = "Compared to an AR2 rebel, you have more ammunition, armor, and medical supplies, but move slower, lack a grenade, and have a less powerful gun. You're best suited on defense where you can use suppressing fire and protect allies by taking shots for them."
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle_nonade
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/helmet/halflife/milhelm/poland
	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
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
		/obj/item/grenade/syndieminibomb/bouncer = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/mp7 = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt
	name = "Deployment: Elder Vortigaunt"
	display_name = "Elder Vortigaunt"
	desc = "Keep enemies at bay with your vortal repulse, forcewall, and beams while using mend to heal yourself and allies."
	uniform = null
	shoes = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/elder)
	H.cmode_music = combat_music

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
	l_pocket = /obj/item/ammo_box/colta357
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
	desc = "Equipped with a crowbar, satchel, a pistol, two sentry beacons, and sandbags, you can do melee combat and a bit of building."

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/sbeacondrop/rebel_turret = 2,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

	suit = /obj/item/clothing/suit/armor/rebel/light

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/sandbag)

/obj/item/sbeacondrop/rebel_turret
	desc = "A label on it reads: <i>Warning: Activating this device will send a rebel turret to your location</i>."
	droptype = /obj/machinery/porta_turret/combine/rebel
	call_period = 1 SECONDS

/datum/outfit/deployment_loadout/rebel/tier4/spy
	name = "Deployment: Rebel Spy"
	display_name = "Rebel Spy"
	desc = "While not very effective in direct combat, you have a powerful knife that is espescially effective when backstabbing opponents, smoke bombs, a revolver, and C4 for sabotage."

	uniform = /obj/item/clothing/under/citizen/rebel
	head = /obj/item/clothing/head/beret/sec/poland
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/satchel

	l_pocket = /obj/item/knife/combat/backstab
	r_pocket = /obj/item/grenade/smokebomb

	suit = /obj/item/clothing/suit/armor/civilprotection/speedy
	suit_store = /obj/item/gun/ballistic/revolver/coltpython

	mask = /obj/item/clothing/mask/gas/hl2/swat

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/grenade/c4 = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/ammo_box/colta357 = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	glasses = /obj/item/clothing/glasses/night

	combat_music = 'hl13/sound/music/combat/whatkindofhospital.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/scout
	name = "Deployment: Upgraded Rebel Scout"
	display_name = "Upgraded Rebel Scout"
	desc = "You are a speedy glass cannon that uses a shotgun for high upclose damage, but lack much of any armor. You specialize best in taking out more vulnerable backliners who can't effectively fight back. As an upgraded variant, you move faster and get an extra healthpen."

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/browncoat/scout/upgraded
	suit_store = /obj/item/gun/ballistic/shotgun/spas12

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/medic_rebel
	name = "Deployment: Upgraded Medic Rebel+"
	display_name = "Upgraded Medic Rebel+"
	desc = "Just like the previous tiers of rebel medics, you are mostly a non combatant who has a large amount of medical supplies, but gain an additional amount of said supplies."

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/civilprotection/medical/speedy
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/medic_plus
	accessory = /obj/item/clothing/accessory/armband/medblue
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/boots
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	back = /obj/item/storage/backpack/halflife
	glasses = /obj/item/clothing/glasses/hud/health

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/stack/medical/suture = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit)

///////////// TIER 5 //////////////////////////////////////////

/datum/outfit/deployment_loadout/rebel/tier5/freeman
	name = "Deployment: A Free Man"
	display_name = "A Free Man"
	desc = "Well armored and speedy, with a powerful crowbar to boot alongside a shotgun. You excel at hit and run attacks thanks to your suit's automated healing and speed, but your armor isn't good enough to sustain too much firepower yet."

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/deployment
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	glasses = /obj/item/clothing/glasses/regular/thin
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen
	r_pocket = /obj/item/flashlight/seclite

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	belt = /obj/item/crowbar/large/freeman/extreme
	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/storage/box/lethalshot/halflife = 3,
	)

/datum/outfit/deployment_loadout/rebel/tier5/veteran
	name = "Deployment: PLF Veteran"
	display_name = "PLF Veteran"
	desc = "You have the heaviest armor available to the resistance, which is comparable to Combine Wallhammers, and have a dangerous AK-47. Your lack of speed and your weapon's inaccuracy leaves you vulnerable to snipers however."

	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran/deployment
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
		/obj/item/ammo_box/magazine/ak47 = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/secretsteersus.ogg'

/datum/outfit/deployment_loadout/rebel/tier5/extract_vortigaunt
	name = "Deployment: Extract Empowered Vortigaunt"
	display_name = "Extract Empowered Vortigaunt"
	desc = "You have all the powers of an elder vortigaunt, but with increased damage resistance and a mending ability which is twice as powerful, making you very good at healing people."
	uniform = null
	shoes = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier5/extract_vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/extract)
	H.cmode_music = combat_music

/datum/outfit/deployment_loadout/rebel/tier5/radio_operator
	name = "Deployment: PLF Radio Operator"
	display_name = "PLF Radio Operator"
	desc = "You are not a particularly well armed or armored soldier, but your greatest strength is the targeter inside your radio pack. You can use it to send up to two missiles which while slow to send, are excellent bunker busters."
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	mask = /obj/item/clothing/mask/gas/hl2/military
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/revolver
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/beret/sec/poland
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots

	back = /obj/item/storage/backpack/halflife/satchel/radio

	backpack_contents = list(
		/obj/item/halflife/missile_targeter = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/whatkindofhospital.ogg'

/datum/outfit/deployment_loadout/rebel/tier5/sniper
	name = "Deployment: PLF Sniper"
	display_name = "PLF Sniper"
	desc = "While not too well armored, you have access to one of the few surviving dragunovs around. Use it well to snipe your opponents with devestating accuracy and power."
	suit = /obj/item/clothing/suit/armor/rebel/light/speedy
	mask = /obj/item/clothing/mask/gas/hl2/swat/hardened
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/svd
	suit_store = /obj/item/gun/ballistic/automatic/svd
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/grenade/smokebomb
	head = /obj/item/clothing/head/helmet/halflife/military/poland
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots
	glasses = /obj/item/clothing/glasses/night

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/coltpython = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/ammo_box/magazine/svd = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/whatkindofhospital.ogg'
