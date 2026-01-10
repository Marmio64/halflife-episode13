/obj/item/radio/headset/rebel_deployment
	keyslot = /obj/item/encryptionkey/syndicate/uprising

/obj/item/radio/headset/rebel_deployment/loud
	command = TRUE
	use_command = TRUE

/datum/outfit/deployment_loadout/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	id = /obj/item/card/id/rebel_tdm

/datum/outfit/deployment_loadout/rebel/tier1
	loadout_tier = 1

/datum/outfit/deployment_loadout/rebel/tier1/mosin_partisan
	name = "Deployment: Refugee Mosin Partisan"
	display_name = "Refugee Mosin Partisan (Offense)"
	desc = "Armed with a mosin nagant partisans have decent damage capabilities but have very poor armor."
	id_name = "Partisan"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/armored
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 4,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier1/molotov_partisan
	name = "Deployment: Refugee Molotov Partisan"
	display_name = "Refugee Molotov Partisan (Offense)"
	desc = "Armed with molotovs and tinbombs, they provide useful support to allies."
	id_name = "Partisan"

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
	display_name = "Refugee Engineer (Support)"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/wirecutters/halflife
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 9,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	extra_str = 3

/datum/outfit/deployment_loadout/rebel/tier1/smuggler
	name = "Deployment: Refugee Smuggler"
	display_name = "Refugee Smuggler (Offense)"
	desc = "You move faster, but actually take increased damage from all sources, and only have a measly makeshift pistol to defend yourself with."
	id_name = "Smuggler"

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	suit = /obj/item/clothing/suit/armor/browncoat/deployment

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/beanie/black

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/makeshift = 1,
		/obj/item/ammo_box/magazine/makeshift9mm = 2,
		/obj/item/stack/medical/bandage/makeshift = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/// TIER 2 ////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/rebel/tier2
	loadout_tier = 2

/datum/outfit/deployment_loadout/rebel/tier2/pistol_rebel
	name = "Deployment: Pistol Rebel"
	display_name = "Pistol Rebel (Offense)"
	desc = "Lightly armored and equipped with a USP match alongside two healthpens, these rebels have decent combat capabilities overall."
	id_name = "Rebel"

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
	display_name = "Medic Rebel (Support)"
	desc = "Has less ammo and slightly less armor than the standard pistol rebels, but more medical supplies."
	id_name = "Medic"

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

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/slow)

	extra_int = 4

/datum/outfit/deployment_loadout/rebel/tier2/engineer
	name = "Deployment: Upgraded Refugee Engineer"
	display_name = "Upgraded Refugee Engineer (Support)"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/wirecutters/halflife
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

	extra_str = 3

/datum/outfit/deployment_loadout/rebel/tier2/smuggler
	name = "Deployment: Upgraded Smuggler"
	display_name = "Upgraded Smuggler (Offense)"
	desc = "You move faster, but actually take increased damage from all sources, and only have a measly makeshift pistol to defend yourself with."
	id_name = "Smuggler"

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight

	suit = /obj/item/clothing/suit/armor/browncoat/deployment

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/beanie/black

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/makeshift = 1,
		/obj/item/ammo_box/magazine/makeshift9mm = 4,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/// TIER 3 //////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/rebel/tier3
	loadout_tier = 3

/datum/outfit/deployment_loadout/rebel/tier3/mp7_rebel
	name = "Deployment: MP7 Rebel"
	display_name = "MP7 Rebel (Offense)"
	desc = "Moderately armored and equipped with a MP7 alongside two healthpens and a grenade, these rebels have decent combat capabilities overall."
	id_name = "Rebel"

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
	display_name = "Rebel Bomber (Offense)"
	desc = "Well armored and equipped with lots of explosives, but only has a pistol as a gun."
	id_name = "Bomber"

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	back = /obj/item/storage/backpack/halflife/satchel/military

	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/tinbomb)

/datum/outfit/deployment_loadout/rebel/tier3/mosin_soldier
	name = "Deployment: Mosin Soldier"
	display_name = "Mosin Soldier (Defense)"
	desc = "You are armed with a Mosin-nagant for long range attacks while defending bunkers, and a knife bayonet to attach to your rifle when things get close quarters."
	id_name = "Private"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	head = /obj/item/clothing/head/helmet/halflife/milhelm/poland
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/well_maintained

	l_pocket = /obj/item/knife/combat/weak
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 5,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	extra_str = 2

/datum/outfit/deployment_loadout/rebel/tier3/vortigaunt
	name = "Deployment: Vortigaunt"
	display_name = "Vortigaunt (Support)"
	desc = "Equipped with powerful long range blasts and infinite healing, vortigaunts are a great support option."

	uniform = null
	shoes = null
	id = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier3/vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt)
	H.cmode_music = combat_music

/datum/outfit/deployment_loadout/rebel/tier3/crossbow
	name = "Deployment: Crossbow Rebel"
	display_name = "Crossbow Rebel (Pick)"
	desc = "A long ranged scoped crossbow lets you keep enemies far away from you as you pepper them with red hot bolts of rebar."
	id_name = "Marksmen"

	head = /obj/item/clothing/head/beanie/black
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/upgraded
	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	l_pocket = /obj/item/ammo_box/magazine/usp9mm
	r_pocket = /obj/item/storage/belt/pouch/smoke_meds

	glasses = /obj/item/clothing/glasses/night

	neck = /obj/item/storage/bag/rebar_quiver/syndicate

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier3/engineer
	name = "Deployment: Upgraded Refugee Engineer+"
	display_name = "Upgraded Refugee Engineer+ (Support)"
	desc = "Equipped with a crowbar, satchel, and sandbags, you can do melee combat and a bit of building."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/sbeacondrop/rebel_turret = 1,
		/obj/item/wirecutters/halflife = 1,
		/obj/item/ammo_box/magazine/usp9mm = 1,
	)

	suit = /obj/item/clothing/suit/armor/civilprotection

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/sandbag, /datum/action/cooldown/spell/conjure_item/razor_wire/slow)

	extra_str = 4

/datum/outfit/deployment_loadout/rebel/tier3/scout
	name = "Deployment: Rebel Scout"
	display_name = "Rebel Scout (Offense)"
	desc = "You are a speedy glass cannon that uses a shotgun for high upclose damage, but lack armor completely. You specialize best in taking out more vulnerable backliners who can't effectively fight back."
	id_name = "Scout"

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/browncoat/scout
	suit_store = /obj/item/gun/ballistic/shotgun/spas12

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/halflife/scout_hat

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	extra_dex = 4

/datum/outfit/deployment_loadout/rebel/tier3/scout/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(20))
		H.cmode_music = 'hl13/sound/music/combat/fasterthanaspeedingbullet.ogg'

/datum/outfit/deployment_loadout/rebel/tier3/medic_rebel
	name = "Deployment: Upgraded Medic Rebel"
	display_name = "Upgraded Medic Rebel (Support)"
	desc = "Compared to your unupgraded version, you have a slight increase in ammo and speed."
	id_name = "Medic"

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
		/obj/item/storage/medkit/halflife = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/healthanalyzer = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit)

	extra_int = 4

/// TIER 4 ///////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/rebel/tier4
	loadout_tier = 4

/datum/outfit/deployment_loadout/rebel/tier4/ar2_rebel
	name = "Deployment: AR2 Rebel"
	display_name = "AR2 Rebel (Offense)"
	desc = "While less armored than a corporal, you have a better gun and more mobility."
	id_name = "Rebel"

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
	display_name = "PLF Corporal (Defense)"
	desc = "Compared to an AR2 rebel, you have more ammunition, armor, and medical supplies, but move slower, lack a grenade, and have a less powerful gun. You're best suited on defense where you can use suppressing fire and protect allies by taking shots for them."
	id_name = "Corporal"

	suit = /obj/item/clothing/suit/armor/halflife/milvest/slow
	mask = /obj/item/clothing/mask/gas/hl2/military
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/m4a1_nonade
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
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
		/obj/item/ammo_box/magazine/m4a1 = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/mosin_soldier
	name = "Deployment: Upgraded Mosin Soldier"
	display_name = "Upgraded Mosin Soldier (Defense)"
	desc = "You are armed with a Mosin-nagant for long range attacks while defending bunkers, and a knife bayonet to attach to your rifle when things get close quarters."
	id_name = "Private"

	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	head = /obj/item/clothing/head/helmet/halflife/milhelm/poland
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/well_maintained

	l_pocket = /obj/item/knife/combat/weak
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/strilka310/a762 = 5,
		/obj/item/reagent_containers/pill/patch/medkit = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	extra_str = 4


/datum/outfit/deployment_loadout/rebel/tier4/bomber_rebel
	name = "Deployment: Heavy Rebel Bomber"
	display_name = "Heavy Rebel Bomber (Offense)"
	desc = "Well armored and equipped with lots of explosives, and armed with an mp7."
	id_name = "Bomber"

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	back = /obj/item/storage/backpack/halflife/satchel/military

	r_pocket = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/mp7 = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/tinbomb)

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt
	name = "Deployment: Elder Vortigaunt"
	display_name = "Elder Vortigaunt (Support)"
	desc = "Keep enemies at bay with your vortal repulse, forcewall, and beams while using mend to heal yourself and allies."

	uniform = null
	shoes = null
	id = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/eldervortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/elder)
	H.cmode_music = combat_music

/datum/outfit/deployment_loadout/rebel/tier4/crossbow
	name = "Deployment: Heavy Crossbow Rebel"
	display_name = "Heavy Crossbow Rebel (Pick)"
	desc = "A long ranged scoped crossbow lets you keep enemies far away from you as you pepper them with red hot bolts of rebar."
	id_name = "Sniper"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/upgraded
	belt = /obj/item/gun/ballistic/revolver/coltpython
	l_pocket = /obj/item/ammo_box/colta357
	r_pocket = /obj/item/storage/belt/pouch/smoke_meds

	neck = /obj/item/storage/bag/rebar_quiver/syndicate

	glasses = /obj/item/clothing/glasses/night

	back = /obj/item/storage/bag/rebar_quiver
	backpack_contents = list(
		/obj/item/ammo_casing/rebar = 10,
	)

	ears = /obj/item/radio/headset/rebel_deployment

/datum/outfit/deployment_loadout/rebel/tier4/engineer
	name = "Deployment: Heavy Refugee Engineer"
	display_name = "Heavy Refugee Engineer (Support)"
	desc = "Equipped with a crowbar, satchel, a pistol, a sentry beacon, and sandbags, you can do melee combat and a bit of building."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen/refugee
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/utility/hardhat/halflife/mining

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/sbeacondrop/rebel_turret = 1,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/wirecutters/halflife = 1,
	)

	suit = /obj/item/clothing/suit/armor/rebel/light

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/sandbag, /datum/action/cooldown/spell/conjure_item/razor_wire)

	extra_str = 4

/obj/item/sbeacondrop/rebel_turret
	desc = "A label on it reads: <i>Warning: Activating this device will send a rebel turret to your location</i>."
	droptype = /obj/machinery/porta_turret/combine/rebel
	call_period = 4 SECONDS

/datum/outfit/deployment_loadout/rebel/tier4/spy
	name = "Deployment: Rebel Spy"
	display_name = "Rebel Spy (Pick Class)"
	desc = "While not very effective in direct combat, you have a powerful knife that is espescially effective when backstabbing opponents, smoke bombs, disguises, a revolver, and C4 for sabotage."
	id_name = "Spy"

	uniform = /obj/item/clothing/under/citizen/rebel
	head = /obj/item/clothing/head/beret/sec/poland
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/satchel

	l_pocket = /obj/item/knife/combat/backstab
	r_pocket = /obj/item/grenade/smokebomb

	suit = /obj/item/clothing/suit/armor/civilprotection/spy
	suit_store = /obj/item/gun/ballistic/revolver/coltpython

	mask = /obj/item/clothing/mask/gas/hl2/swat

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/grenade/c4 = 2,
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/grenade/smokebomb = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	glasses = /obj/item/clothing/glasses/night

	combat_music = 'hl13/sound/music/combat/whatkindofhospital.ogg'

	extra_str = 5

/datum/outfit/deployment_loadout/rebel/tier4/spy/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(20))
		H.cmode_music = 'hl13/sound/music/combat/rightbehindyou.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/scout
	name = "Deployment: Upgraded Rebel Scout"
	display_name = "Upgraded Rebel Scout (Offense)"
	desc = "You are a speedy glass cannon that uses a shotgun for high upclose damage, but lack armor completely. You specialize best in taking out more vulnerable backliners who can't effectively fight back. As an upgraded variant, you move faster and get an extra healthpen."
	id_name = "Scout"

	uniform = /obj/item/clothing/under/citizen/refugee
	r_pocket = /obj/item/flashlight/seclite

	suit = /obj/item/clothing/suit/armor/browncoat/scout/upgraded
	suit_store = /obj/item/gun/ballistic/shotgun/spas12

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/halflife/scout_hat

	backpack_contents = list(
		/obj/item/storage/box/lethalshot/halflife = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	extra_dex = 4

/datum/outfit/deployment_loadout/rebel/tier4/scout/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(20))
		H.cmode_music = 'hl13/sound/music/combat/fasterthanaspeedingbullet.ogg'

/datum/outfit/deployment_loadout/rebel/tier4/medic_rebel
	name = "Deployment: Upgraded Medic Rebel+"
	display_name = "Upgraded Medic Rebel+ (Support)"
	desc = "Just like the previous tiers of rebel medics, you are mostly a non combatant who has a large amount of medical supplies, but gain an additional amount of said supplies."
	id_name = "Medic"

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
		/obj/item/storage/medkit/halflife = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/extinguisher/mini = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit)

	extra_int = 4

/datum/outfit/deployment_loadout/rebel/tier4/medic_rebel/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(20))
		H.cmode_music = 'hl13/sound/music/combat/medic.ogg'

///////////// TIER 5 //////////////////////////////////////////
/datum/outfit/deployment_loadout/rebel/tier5
	loadout_tier = 5

/datum/outfit/deployment_loadout/rebel/tier5/freeman
	name = "Deployment: A Free Man"
	display_name = "A Free Man (Offense)"
	desc = "Well armored and speedy, with a powerful crowbar to boot alongside a shotgun. You excel at hit and run attacks thanks to your suit's automated healing and speed, but your armor isn't good enough to sustain too much firepower yet."
	id_name = "Freeman"

	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/deployment
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	glasses = /obj/item/clothing/glasses/regular/thin
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen
	r_pocket = /obj/item/flashlight/seclite

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	belt = /obj/item/crowbar/large/freeman/extreme
	back = /obj/item/storage/backpack/halflife/satchel/larger

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/storage/box/lethalshot/halflife = 3,
	)

	extra_dex = 2
	extra_str = 2

/datum/outfit/deployment_loadout/rebel/tier5/veteran
	name = "Deployment: PLF Veteran"
	display_name = "PLF Veteran (Defense)"
	desc = "You have the heaviest armor available to the resistance, which is comparable to Combine Wallhammers, and have a dangerous AK-47. Your lack of speed and your weapon's inaccuracy leaves you vulnerable to snipers however."
	id_name = "Veteran"

	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran/deployment
	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	gloves = /obj/item/clothing/gloves/combat
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	back = /obj/item/storage/backpack/duffelbag/halflife
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/boots
	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/hl13_small_flag/poland/telescopic = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
		/obj/item/ammo_box/magazine/ak47 = 2,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/secretsteersus.ogg'

/datum/outfit/deployment_loadout/rebel/tier5/extract_vortigaunt
	name = "Deployment: Extract Empowered Vortigaunt"
	display_name = "Extract Empowered Vortigaunt (Support)"
	desc = "You have all the powers of an elder vortigaunt, but with drastically increased damage resistance and a mending ability which is twice as powerful, making you very good at healing people."

	uniform = null
	shoes = null
	id = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/deployment_loadout/rebel/tier5/extract_vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/extract)
	H.cmode_music = combat_music

/datum/outfit/deployment_loadout/rebel/tier5/sniper
	name = "Deployment: PLF Sniper"
	display_name = "PLF Sniper (Pick)"
	desc = "While not too well armored, you have access to one of the few surviving dragunovs around. Use it well to snipe your opponents with devestating accuracy and power."
	id_name = "Sniper"

	suit = /obj/item/clothing/suit/armor/rebel/light/speedy
	mask = /obj/item/clothing/mask/gas/hl2/swat/hardened
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/svd
	suit_store = /obj/item/gun/ballistic/automatic/svd
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/grenade/smokebomb
	head = /obj/item/clothing/head/helmet/halflife/military/poland
	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	shoes = /obj/item/clothing/shoes/boots
	glasses = /obj/item/clothing/glasses/night

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/coltpython = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/ammo_box/magazine/svd = 1,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/music/combat/whatkindofhospital.ogg'

	extra_dex = 2
