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

/datum/outfit/deployment_loadout/combine/tier2/pistol_cop
	name = "Deployment: Riot Pistol Cop"
	display_name = "Riot Pistol Cop"
	desc = "A riot pistol equipped cop, who can dish out a moderate amount of damage from range."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp/riot

/// TIER 3 ////////////////////////////////////////////////////////
/datum/outfit/deployment_loadout/combine/tier3/grunt
	name = "Deployment: OTA Grunt"
	display_name = "OTA Grunt"
	desc = "While not equipped with too heavy of armor, grunts have good firepower and speed."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg

	r_hand = /obj/item/gun/ballistic/automatic/pulsesmg/standardpin

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/fused/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

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
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

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

/datum/outfit/deployment_loadout/combine/tier4/sniper
	name = "Deployment: Sniper OTA"
	display_name = "Sniper OTA"
	desc = "Well armored and with a high power sniper rifle that can wreck havoc on enemies from incredibly far distances."
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/sniper
	suit_store = /obj/item/gun/ballistic/combine_sniper
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit
