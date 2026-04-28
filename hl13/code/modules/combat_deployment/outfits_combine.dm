/datum/outfit/deployment_loadout/combine
	faction = COMBINE_DEPLOYMENT_FACTION
	id = /obj/item/card/id/combine_tdm
	accessory = /obj/item/clothing/accessory/combine_dogtags

/datum/outfit/deployment_loadout/combine/tier1
	loadout_tier = 1

/datum/outfit/deployment_loadout/combine/tier1/baton_cop
	name = "Deployment: Baton Cop"
	display_name = "Baton Cop (Offense)"
	desc = "Armed with a full belt which contains a baton and meds, you can met out some damage if you can get up close and personal."
	id_name = "Metrocop"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/combine/tier1/infestation_control
	name = "Deployment: Infestation Control"
	display_name = "Infestation Control (Offense)"
	desc = "Your spraygun is amazing at taking out zombies, but your slow speed and lack of bullet resistance can leave you helpless against rebels."
	id_name = "ICU"

	uniform = /obj/item/clothing/under/citizen
	back = /obj/item/watertank/cleanup_weak

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/flashlight

	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup
	suit = /obj/item/clothing/suit/utility/radiation/cleanup/slow
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/utility/radiation/weak

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/datum/outfit/deployment_loadout/combine/tier1/engineer
	name = "Deployment: Union Engineer"
	display_name = "Union Engineer (Support)"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	l_pocket = /obj/item/wirecutters/halflife
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/hl2/engineer_radio/combine = 1,
	)


	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

	extra_str = 3
	extra_end = 3

	skillchips = list(/obj/item/skillchip/engineer)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/construction_voucher/slow)

/// TIER 2 ////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/combine/tier2
	loadout_tier = 2

/datum/outfit/deployment_loadout/combine/tier2/viscerator_cop
	name = "Deployment: Viscerator Cop"
	display_name = "Viscerator Cop (Offense)"
	desc = "A baton cop equipped with manhacks, for bringing support to the field."
	id_name = "Metrocop"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	l_pocket = /obj/item/grenade/spawnergrenade/manhacks
	r_pocket = /obj/item/grenade/spawnergrenade/manhacks

	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/combine/tier2/infestation_control
	name = "Deployment: Upgraded Infestation Control"
	display_name = "Upgraded Infestation Control (Offense)"
	desc = "Your spraygun is amazing at taking out zombies, but your slow speed and lack of bullet resistance can leave you helpless against rebels."
	id_name = "ICU"

	uniform = /obj/item/clothing/under/citizen
	back = /obj/item/watertank/cleanup

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/flashlight

	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup
	suit = /obj/item/clothing/suit/utility/radiation/cleanup
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/utility/radiation

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

/datum/outfit/deployment_loadout/combine/tier2/pistol_cop
	name = "Deployment: Pistol Cop"
	display_name = "Pistol Cop (Offense)"
	desc = "A pistol equipped cop, who can dish out a moderate amount of damage from range."
	id_name = "Metrocop"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/full

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	ears = /obj/item/radio/headset/civilprotection/deployment

/datum/outfit/deployment_loadout/combine/tier2/medic_cop
	name = "Deployment: Medical Cop"
	display_name = "Medical Cop (Support)"
	desc = "A baton cop equipped with extra medical supplies for tending to the wounds of allies."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/stack/medical/suture
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/slow)

	extra_int = 4

/datum/outfit/deployment_loadout/combine/tier2/engineer
	name = "Deployment: Upgraded Union Engineer"
	display_name = "Upgraded Union Engineer (Support)"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	l_pocket = /obj/item/wirecutters/halflife
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/hl2/engineer_radio/combine = 1,
	)


	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

	extra_str = 4 // all combine engis get extra strength over rebel engis since rebel engis get some armor
	extra_end = 4

	skillchips = list(/obj/item/skillchip/engineer)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/construction_voucher/slow)

/// TIER 3 ////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/combine/tier3
	loadout_tier = 3

/datum/outfit/deployment_loadout/combine/tier3/grunt
	name = "Deployment: OTA Grunt"
	display_name = "OTA Grunt (Offense)"
	desc = "While you have little bullet resistance, grunts have good firepower and speed."
	id_name = "Grunt"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg

	suit = /obj/item/clothing/suit/halflife/invis_grunt_harness
	suit_store = /obj/item/gun/ballistic/automatic/pulsesmg

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/fused
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/lgorbifold.ogg'

	extra_dex = 2

/datum/outfit/deployment_loadout/combine/tier3/ota
	name = "Deployment: SMG OTA"
	display_name = "SMG OTA (Defense)"
	desc = "You have a large amount of armor and are equipped with a standard MP7, letting you dish out a moderate amount of damage, but lack speed."
	id_name = "OTA"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7_victim
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier3/riotcop
	name = "Deployment: Riot Viscerator Cop"
	display_name = "Riot Viscerator Cop (Offense)"
	desc = "You are equipped with a dangerous heavy stun baton and a riot shield, alongside a viscerator for support and a riot pistol as a ranged option."
	id_name = "Riotcop"

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

	ears = /obj/item/radio/headset/civilprotection/deployment

	extra_str = 6
	extra_end = 6

/datum/outfit/deployment_loadout/combine/tier3/divisional
	name = "Deployment: Divisional Lead"
	display_name = "Divisional Lead (Offense)"
	desc = "You are a sharpshooter cop equipped with a colt python, who has upgraded armor that does not impair mobility."
	id_name = "Divisional"

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

	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/ammo_box/colta357 = 1,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	extra_per = 2

/datum/outfit/deployment_loadout/combine/tier3/medic_cop
	name = "Deployment: Upgraded Medical Cop"
	display_name = "Upgraded Medical Cop (Support)"
	desc = "You are a pistol wielding cop with extra medical supplies."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit = 1,
		/obj/item/storage/medkit/halflife_combine = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit, /datum/action/cooldown/spell/conjure_item/bloodloss/slow)

	extra_int = 4
	extra_dex = 2

/datum/outfit/deployment_loadout/combine/tier3/engineer
	name = "Deployment: Upgraded Union Engineer+"
	display_name = "Upgraded Union Engineer+ (Support)"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/wirecutters/halflife = 1,
		/obj/item/ammo_box/magazine/usp9mm = 1,
		/obj/item/wrench/halflife = 1,
		/obj/item/hl2/engineer_radio/combine/filled = 1,
	)


	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/construction_voucher)

	extra_str = 5
	extra_end = 5

	skillchips = list(/obj/item/skillchip/engineer)

/datum/outfit/deployment_loadout/combine/tier3/sniper
	name = "Deployment: Sniper OTA"
	display_name = "Sniper OTA (Pick)"
	desc = "You are well armored and have a high power sniper rifle that can wreck havoc on enemies from incredibly far distances."
	id_name = "Sniper"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/slow
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/sniper_deployment
	suit_store = /obj/item/gun/ballistic/combine_sniper/slow
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

	extra_per = 5

/// TIER 4 ////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/combine/tier4
	loadout_tier = 4

/datum/outfit/deployment_loadout/combine/tier4/elite
	name = "Deployment: Elite OTA"
	display_name = "Elite OTA (Defense)"
	desc = "You are the pinnacle of combine technology. Elites have powerful AR2s and heavy armor, but their sluggish movement and lack of grenades makes them best suited for defending positions than attacking them."
	id_name = "Elite"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/elite
	suit = /obj/item/clothing/suit/armor/overwatch/elite/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2_deployment_elite
	suit_store = /obj/item/gun/ballistic/automatic/ar2
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/cremator
	name = "Deployment: Cremator"
	display_name = "Cremator (Defense)"
	desc = "You're a pyromaniac monster clad in black, that excels at area denial and close quarters combat. However, your immolator is very short range, and you have little armor to speak of. You can toggle your immolator between a high damage plasma mode or a flamethrower mode."
	id_name = "Cremator"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/cremator
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/cremator
	suit_store = /obj/item/gun/energy/immolator

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch/cremator
	gloves = /obj/item/clothing/gloves/color/civilprotection
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	combat_music = 'hl13/sound/music/combat/notyouraveragecop.ogg'

/datum/outfit/deployment_loadout/combine/tier4/cremator/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/human/synth/cremator)

/datum/outfit/deployment_loadout/combine/tier4/shotgunner
	name = "Deployment: OTA Shotgunner"
	display_name = "OTA Shotgunner (Offense)"
	desc = "You are suprisingly fast for your armor level, shotgunners use their extra grenades to clear house before rushing in with their shotgun."
	id_name = "Shotgunner"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit
	l_pocket = /obj/item/grenade/syndieminibomb/bouncer

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12_extrapen
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

	extra_dex = 3
	extra_end = 2

/datum/outfit/deployment_loadout/combine/tier4/sniper
	name = "Deployment: Sniper OTA"
	display_name = "Sniper OTA (Pick)"
	desc = "You are well armored and have a high power sniper rifle that can wreck havoc on enemies from incredibly far distances. You move faster and have a faster firing rifle compared to your tier 3 variant."
	id_name = "Sniper"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/sniper_deployment
	suit_store = /obj/item/gun/ballistic/combine_sniper
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

	extra_per = 5

/datum/outfit/deployment_loadout/combine/tier4/ordinal
	name = "Deployment: Combine Ordinal"
	display_name = "Combine Ordinal (Offense)"
	desc = "You are an OTA soldier upgraded to have a pulse SMG and a powerful, improved manhack deployer."
	id_name = "Ordinal"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg
	suit_store = /obj/item/gun/ballistic/automatic/pulsesmg
	l_pocket = /obj/item/grenade/spawnergrenade/manhacks/upgraded
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/guarddown.ogg'

/datum/outfit/deployment_loadout/combine/tier4/medic_cop
	name = "Deployment: Heavy Medical Cop"
	display_name = "Heavy Medical Cop (Support)"
	desc = "You are a MP7 wielding cop with plenty of extra medical supplies."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/civilprotection/medicfull

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit = 2,
		/obj/item/storage/medkit/halflife_combine = 1,
		/obj/item/ammo_box/magazine/mp7 = 2,
		/obj/item/extinguisher/mini = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit, /datum/action/cooldown/spell/conjure_item/bloodloss)

	extra_int = 4
	extra_dex = 2

/datum/outfit/deployment_loadout/combine/tier4/medic_cop/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(prob(20))
		H.cmode_music = 'hl13/sound/music/combat/medic.ogg'

/datum/outfit/deployment_loadout/combine/tier4/engineer
	name = "Deployment: Senior Union Engineer"
	display_name = "Senior Union Engineer (Support)"
	desc = "You come equipped with a satchel, which by itself is useful when looting, but you also have a hefty crowbar and sandbags for building. Be aware about your lack of armor, however."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer/foreman
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/foreman

	r_pocket = /obj/item/flashlight

	belt = /obj/item/gun/ballistic/revolver/coltpython

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/crowbar/large = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/ammo_box/colta357 = 2,
		/obj/item/wirecutters/halflife = 1,
		/obj/item/wrench/halflife = 1,
		/obj/item/hl2/engineer_radio/combine/filled = 1,
	)


	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/crawlyard.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/construction_voucher)

	extra_str = 5
	extra_end = 5

	skillchips = list(/obj/item/skillchip/engineer)

/obj/item/sbeacondrop/combine_turret
	desc = "A label on it reads: <i>Warning: Activating this device will send a combine turret to your location</i>."
	droptype = /obj/machinery/porta_turret/combine
	call_period = 5 SECONDS

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

/datum/outfit/deployment_loadout/combine/tier4/overseer
	name = "Deployment: Overseer"
	display_name = "Viscerator Overseer Cop (Offense)"
	desc = "You are a MP7 equipped cop that specializes in hunting down vulnerable, alone targets with your increased speed. Your viscerators have special shields that absorb a number of shots irregardless of damage, making them best against slow firing targets like enemy snipers and vortigaunts."
	id_name = "Overseer"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/overseer/fast
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection

	mask = /obj/item/clothing/mask/gas/civilprotection/overseer
	belt = /obj/item/storage/belt/civilprotection/full

	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/lgorbifold.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/grenade/spawnergrenade/manhacks/shielded = 2,
		/obj/item/ammo_box/magazine/mp7 = 4,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/overseer_viscerator)

////////////////////// TIER 5 /////////////////////////////////////
/datum/outfit/deployment_loadout/combine/tier5
	loadout_tier = 5

/datum/outfit/deployment_loadout/combine/tier5/hunter
	name = "Deployment: Hunter"
	display_name = "Hunter (Offense)"
	desc = "You are an expert on killing, as hunters are a force to be reckoned with due to their speed and high firepower."
	uniform = null
	shoes = null
	id = null

/datum/outfit/deployment_loadout/combine/tier5/hunter/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/simple_animal/hostile/halflife/hunter/deployment/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)

/datum/outfit/deployment_loadout/combine/tier5/wallhammer
	name = "Deployment: Combine Wallhammer"
	display_name = "Combine Wallhammer (Defense)"
	desc = "You are an extra heavy combine soldier equipped with a deployable shield and pulse shotgun for maximum destruction."
	id_name = "Wallhammer"

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
		/obj/item/melee/baton/security/loaded = 1,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/penultimatum.ogg'

	extra_end = 3
	extra_str = 4

/datum/outfit/deployment_loadout/combine/tier5/assassin
	name = "Deployment: Combine Assassin"
	display_name = "Combine Assassin (Pick)"
	desc = "You are the premier pick class and stealth expert. You excel at assassinating high value targets whether its from afar with your sniper rifle, or going invisible to sneak up behind targets with your backstab knife."
	id_name = "Assassin"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/assassin
	uniform = /obj/item/clothing/under/combine/overwatch/assassin
	suit = /obj/item/clothing/suit/armor/overwatch/assassin
	suit_store = /obj/item/gun/ballistic/combine_sniper
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/assassin
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/assassin

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp/extended
	r_pocket = /obj/item/gun/ballistic/automatic/pistol/usp/extended

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/infiltrate.ogg'

	extra_dex = 8
	extra_str = 5
	extra_per = 5

/datum/outfit/deployment_loadout/combine/tier5/suppressor
	name = "Deployment: Combine Suppressor"
	display_name = "Combine Suppressor (Defense)"
	desc = "You are an extra heavy combine soldier equipped with a pulse light machine gun which is great for laying down cover fire."
	id_name = "Suppressor"

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

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/penultimatum.ogg'

	extra_end = 3

/datum/outfit/deployment_loadout/combine/tier5/advisor
	name = "Deployment: Advisor"
	display_name = "Advisor (Support)"
	desc = "You are a mysterious Combine Advisor. You have various psionic abilities at your disposal for supporting your team and punishing the enemies, but are not good at killing nor are you particularly durable and quick."
	uniform = null
	shoes = null
	id = null

/datum/outfit/deployment_loadout/combine/tier5/advisor/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/basic/halflife/advisor/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)

/datum/outfit/deployment_loadout/combine/tier5/logistics_lead
	name = "Deployment: Combine Logistics Lead"
	display_name = "Combine Logistics Lead (Support)"
	desc = "While not a very good combatant, you carry with you a supply radio just like your team captain, and can use it to call in a multitude of useful supplies!"
	id_name = "Logistics Lead"

	ears = /obj/item/radio/headset/heads/hop
	uniform = /obj/item/clothing/under/halflife/labor_lead
	head = /obj/item/clothing/head/halflife/blue_hardhat
	mask = /obj/item/clothing/mask/gas/cwuengi //only really because i dont want them to be mistaken for a rebel
	suit = /obj/item/clothing/suit/armor/civilprotection/speedy
	suit_store = /obj/item/gun/ballistic/revolver/coltpython/well_crafted
	l_pocket = /obj/item/hl2/supply_radio/combine/logistics
	r_pocket = /obj/item/flashlight/seclite

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/colta357 = 3,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
		/obj/item/melee/baton/telescopic = 1,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/branescan.ogg'

	extra_int = 10
	extra_per = 3

/datum/outfit/deployment_loadout/combine/tier5/logistics_lead/post_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_SUPPLYRADIO_USER, JOB_TRAIT)

///////// BLU BOSSES ///////////////////

/datum/outfit/deployment_loadout/combine/boss/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.add_traits(list(TRAIT_NEVER_WOUNDED, TRAIT_NODISMEMBER), OUTFIT_TRAIT) //ehhh just take these out of the equation, since these are BOSSES

	H.dna.species.stunmod = 0.1 //all bosses are very resilient to stuns

	H.fire_stack_decay_rate = -2

/datum/outfit/deployment_loadout/combine/boss/freeman
	name = "BOTH: The Free Man BLU"
	display_name = "The Free Man (ALL-ROUNDER)"
	desc = "Time to fuck up someone's face."

	uniform = /obj/item/clothing/under/citizen/rebel
	back = /obj/item/storage/backpack/halflife/satchel/huge
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/boss/blu

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	neck = /obj/item/storage/bag/rebar_quiver/syndicate

	glasses = /obj/item/clothing/glasses/regular/thin/thermals

	combat_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	belt = /obj/item/crowbar/large/freeman

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 4,
		/obj/item/gun/ballistic/automatic/pistol/usp,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/gun/ballistic/revolver/coltpython,
		/obj/item/ammo_box/colta357,
		/obj/item/gun/ballistic/shotgun/spas12,
		/obj/item/storage/box/lethalshot/halflife,
		/obj/item/gun/ballistic/automatic/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/gun/ballistic/automatic/ar2/standardpin,
		/obj/item/gun/ballistic/rifle/rebarxbow/upgraded,
		/obj/item/gun/ballistic/rocketlauncher/halflife,
		/obj/item/ammo_casing/rocket/hl13 = 3,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/reagent_containers/pill/patch/medkit,
	)

	extra_dex = 10
	extra_str = 10
	extra_end = 10
	extra_per = 5

/obj/item/clothing/suit/hooded/hev/deathmatch/boss/blu
	hoodtype = /obj/item/clothing/head/hooded/hevhood/blu

/obj/item/clothing/suit/hooded/hev/deathmatch/boss/blu/Initialize()
	.=..()
	add_atom_colour("#0077ff", FIXED_COLOUR_PRIORITY)

/obj/item/clothing/head/hooded/hevhood/blu

/obj/item/clothing/head/hooded/hevhood/blu/Initialize()
	.=..()
	add_atom_colour("#0077ff", FIXED_COLOUR_PRIORITY)

/datum/outfit/deployment_loadout/combine/boss/wesker
	name = "BOTH: The Mastermind BLU"
	display_name = "The Mastermind (RUSHDOWN)"
	desc = "Seven minutes. Seven minutes is all you have to play with your enemies. You have relatively low durability, but can disorient enemies with swift dashes, utilize devestating martial arts combos, self heal, and can activate throw mode to become near invulnerable to anything but explosions."

	combat_music = 'hl13/sound/music/combat/farben.ogg'

	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/jacket/trenchcoat/wesker/blu
	glasses = /obj/item/clothing/glasses/sunglasses/wesker
	gloves = /obj/item/clothing/gloves/color/black/wesker

	spells_to_add = list(/datum/action/cooldown/spell/wesker_taunt, /datum/action/cooldown/mob_cooldown/dash/wesker)

	extra_dex = 8
	extra_str = 2 //dont need that much strength because CQC overrides strength bonuses for punching
	extra_end = 8

/obj/item/clothing/suit/jacket/trenchcoat/wesker/blu

/obj/item/clothing/suit/jacket/trenchcoat/wesker/blu/Initialize()
	.=..()
	add_atom_colour("#0077ff", FIXED_COLOUR_PRIORITY)

/datum/outfit/deployment_loadout/combine/boss/wesker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.set_haircolor("#0077ff", update = FALSE) // blu (doesnt work for some reason)
	H.skin_tone = "#e8c99b"
	H.set_hairstyle("Combover", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.update_body(0)

	//CQC
	var/datum/martial_art/cqc/wesker/elitecqc = new
	elitecqc.teach(H)

	//all of wesker's superhuman powers
	H.stamina_regen_time = 4 SECONDS

	H.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_NOCRITDAMAGE, TRAIT_IGNORESLOWDOWN, TRAIT_ANALGESIA, TRAIT_NOCRITOVERLAY), OUTFIT_TRAIT)

/datum/outfit/deployment_loadout/combine/boss/extract_vortigaunt
	name = "BOTH: Extract Empowered Vortigaunt BLU"
	display_name = "Extract Empowered Vortigaunt (SUPPORT)"
	desc = "You are durable with a wide array of low cooldown, powerful abilities. While you are a pretty good combatant yourself, perhaps your greatest strength is instead simply your ability to infinitely heal fellow bosses?"

	uniform = null
	shoes = null
	id = null

	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

	extra_dex = 10
	extra_str = 8
	extra_end = 10

/datum/outfit/deployment_loadout/combine/boss/extract_vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/extract_boss)
	H.cmode_music = combat_music
	H.add_atom_colour("#0077ff", FIXED_COLOUR_PRIORITY)
