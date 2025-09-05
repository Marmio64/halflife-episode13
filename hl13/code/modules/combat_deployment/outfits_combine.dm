/datum/outfit/deployment_loadout/combine/tier1/baton_cop
	name = "Deployment: Baton Cop"
	display_name = "Baton Cop"
	desc = "Armed with a full belt which contains a baton and meds, you can met out some damage if you can get up close and personal."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	ears = /obj/item/radio/headset/headset_sec

/datum/outfit/deployment_loadout/combine/tier1/infestation_control
	name = "Deployment: Infestation Control"
	display_name = "Infestation Control"
	desc = "Your spraygun is amazing at taking out zombies, but your slow speed and lack of bullet resistance can leave you helpless against rebels."

	uniform = /obj/item/clothing/under/citizen
	back = /obj/item/watertank/cleanup/weak

	r_pocket = /obj/item/flashlight

	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup
	suit = /obj/item/clothing/suit/utility/radiation/cleanup
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/utility/radiation

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/datum/outfit/deployment_loadout/combine/tier1/engineer
	name = "Deployment: Union Engineer"
	display_name = "Union Engineer"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 8,
	)


	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/// TIER 2 ////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/combine/tier2/viscerator_cop
	name = "Deployment: Viscerator Cop"
	display_name = "Viscerator Cop"
	desc = "A baton cop equipped with manhacks, for bringing support to the field."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	l_pocket = /obj/item/grenade/spawnergrenade/manhacks
	r_pocket = /obj/item/grenade/spawnergrenade/manhacks

	ears = /obj/item/radio/headset/headset_sec

/datum/outfit/deployment_loadout/combine/tier2/pistol_cop
	name = "Deployment: Pistol Cop"
	display_name = "Riot Pistol Cop"
	desc = "A pistol equipped cop, who can dish out a moderate amount of damage from range."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/full

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	ears = /obj/item/radio/headset/headset_sec

/datum/outfit/deployment_loadout/combine/tier2/medic_cop
	name = "Deployment: Medical Cop"
	display_name = "Medical Cop"
	desc = "A baton cop equipped with extra medical supplies for tending to the wounds of allies."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

/datum/outfit/deployment_loadout/combine/tier2/engineer
	name = "Deployment: Upgraded Union Engineer"
	display_name = "Upgraded Union Engineer"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 10,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)


	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/// TIER 3 ////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/combine/tier3/grunt
	name = "Deployment: OTA Grunt"
	display_name = "OTA Grunt"
	desc = "While not equipped with too heavy of armor, grunts have good firepower and speed."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg

	r_hand = /obj/item/gun/ballistic/automatic/pulsesmg

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/fused/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/lgorbifold.ogg'

/datum/outfit/deployment_loadout/combine/tier3/ota
	name = "Deployment: SMG OTA"
	display_name = "SMG OTA"
	desc = "Equipped with good armor and a decent weapon, these soldiers can put in work, but are not very fast."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier3/riotcop
	name = "Deployment: Riot Viscerator Cop"
	display_name = "Riot Viscerator Cop"
	desc = "A baton cop equipped with a manhack, a riot pistol, and a heavy baton."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	l_pocket = /obj/item/grenade/spawnergrenade/manhacks
	r_pocket = /obj/item/gun/ballistic/automatic/pistol/usp/riot

	suit = /obj/item/clothing/suit/armor/riot
	suit_store = /obj/item/melee/baton/security/heavy/loaded
	head = /obj/item/clothing/head/helmet/toggleable/riot

	back = /obj/item/shield/riot

	ears = /obj/item/radio/headset/headset_sec

/datum/outfit/deployment_loadout/combine/tier3/divisional
	name = "Deployment: Divisional Lead"
	display_name = "Divisional Lead"
	desc = "A sharpshooter cop equipped with a colt python, who has upgraded armor that does not impair mobility."

	uniform = /obj/item/clothing/under/combine/civilprotection/divisionallead
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/divisional
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/divisional
	belt = /obj/item/storage/belt/civilprotection/divisionleadfull

	l_pocket = /obj/item/ammo_box/colta357
	r_pocket = /obj/item/ammo_box/colta357

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

/datum/outfit/deployment_loadout/combine/tier3/medic_cop
	name = "Deployment: Upgraded Medical Cop"
	display_name = "Upgraded Medical Cop"
	desc = "A pistol wielding cop with extra medical supplies."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit = 3,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

/datum/outfit/deployment_loadout/combine/tier3/engineer
	name = "Deployment: Upgraded Union Engineer+"
	display_name = "Upgraded Union Engineer+"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 11,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/sbeacondrop/combine_turret = 1,
	)


	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/// TIER 4 ////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/combine/tier4/elite
	name = "Deployment: Elite OTA"
	display_name = "Elite OTA"
	desc = "The pinnacle of combine technology. Elites use AR2s and incredibly heavy armor to bulldoze the competition, though are pretty slow."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/elite
	suit = /obj/item/clothing/suit/armor/overwatch/elite/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2
	suit_store = /obj/item/gun/ballistic/automatic/ar2
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/shotgunner
	name = "Deployment: OTA Shotgunner"
	display_name = "OTA Shotgunner"
	desc = "Suprisingly fast for their armor level, shotgunners use grenades to clear house before rushing in with their shotgun."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit
	l_pocket = /obj/item/grenade/syndieminibomb/bouncer

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/sniper
	name = "Deployment: Sniper OTA"
	display_name = "Sniper OTA"
	desc = "Well armored and with a high power sniper rifle that can wreck havoc on enemies from incredibly far distances."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/sniper
	suit_store = /obj/item/gun/ballistic/combine_sniper
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/ordinal
	name = "Deployment: Combine Ordinal"
	display_name = "Combine Ordinal"
	desc = "An OTA soldier upgraded to have a pulse SMG and an upgraded manhack deployer."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg
	suit_store = /obj/item/gun/ballistic/automatic/pulsesmg
	l_pocket = /obj/item/grenade/spawnergrenade/manhacks/upgraded
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/medic_cop
	name = "Deployment: Heavy Medical Cop"
	display_name = "Heavy Medical Cop"
	desc = "A MP7 wielding cop with plenty of extra medical supplies."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
		/obj/item/ammo_box/magazine/mp7 = 2,
	)

/datum/outfit/deployment_loadout/combine/tier4/engineer
	name = "Deployment: Senior Union Engineer"
	display_name = "Senior Union Engineer"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer/foreman
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/foreman

	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/stack/sheet/mineral/sandbags = 12,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/sbeacondrop/combine_turret = 2,
	)


	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/obj/item/sbeacondrop/combine_turret
	desc = "A label on it reads: <i>Warning: Activating this device will send a combine turret to your location</i>."
	droptype = /obj/machinery/porta_turret/combine

/datum/outfit/deployment_loadout/combine/tier4/scanner
	name = "Deployment: Cannister Targeter City Scanner"
	display_name = "Cannister Targeter City Scanner"
	desc = "A city scanner that is capable of directing head crab cannister strikes past enemy fortifications."
	uniform = null
	shoes = null

/datum/outfit/deployment_loadout/combine/tier4/scanner/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/silicon/robot/cityscanner/cannister_targeter/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)

////////////////////// TIER 5 /////////////////////////////////////

/datum/outfit/deployment_loadout/combine/tier5/hunter
	name = "Deployment: Hunter"
	display_name = "Hunter"
	desc = "An expert on killing, hunters are a force to be reckoned with due to their speed and high firepower."
	uniform = null
	shoes = null

/datum/outfit/deployment_loadout/combine/tier5/hunter/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/simple_animal/hostile/halflife/hunter/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)

/datum/outfit/deployment_loadout/combine/tier5/wallhammer
	name = "Deployment: Combine Wallhammer"
	display_name = "Combine Wallhammer"
	desc = "An extra heavy combine soldier equipped with a deployable shield and pulse shotgun for maximum destruction."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/wallhammer
	uniform = /obj/item/clothing/under/combine/overwatch/wallhammer
	suit = /obj/item/clothing/suit/armor/overwatch/wallhammer
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch/wallhammer
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/wallhammer
	suit_store = /obj/item/gun/ballistic/shotgun/pulse
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
	)

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/penultimatum.ogg'

/datum/outfit/deployment_loadout/combine/tier5/assassin
	name = "Deployment: Combine Assassin"
	display_name = "Combine Assassin"
	desc = "A highly mobile expert on stealth, who can partially conceal themselves and carries a very deadly knife alongside two extended mag USP Matches and a sniper rifle."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/assassin
	suit = /obj/item/clothing/suit/armor/overwatch/assassin
	suit_store = /obj/item/gun/ballistic/combine_sniper
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/assassin
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/assassin

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp/extended
	r_pocket = /obj/item/gun/ballistic/automatic/pistol/usp/extended

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/lgorbifold.ogg'

/datum/outfit/deployment_loadout/combine/tier5/assassin/post_equip(mob/living/carbon/human/H)
	H.alpha = 135 //moderate amount of transparency
	H.change_stat(STATKEY_DEX, 4)

/datum/outfit/deployment_loadout/combine/tier5/suppressor
	name = "Deployment: Combine Suppressor"
	display_name = "Combine Suppressor"
	desc = "An extra heavy combine soldier equipped with a pulse light machine gun which is great for laying down cover fire."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/suppressor
	uniform = /obj/item/clothing/under/combine/overwatch/suppressor
	suit = /obj/item/clothing/suit/armor/overwatch/suppressor
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulselmg
	suit_store = /obj/item/gun/ballistic/automatic/pulselmg
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 1,
		/obj/item/ammo_box/magazine/pulselmg = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
	)

	ears = /obj/item/radio/headset/headset_sec
	combat_music = 'hl13/sound/music/combat/penultimatum.ogg'
