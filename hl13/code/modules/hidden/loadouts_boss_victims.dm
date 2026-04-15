/obj/item/hl2/loadout_picker/hidden/boss_victim
	help_text_type = "hidden_victim"

/datum/outfit/deployment_loadout/hidden/boss_victim/combine
	faction = COMBINE_DEPLOYMENT_FACTION
	id = /obj/item/card/id/combine_tdm
	accessory = /obj/item/clothing/accessory/combine_dogtags

/obj/item/hl2/loadout_picker/hidden/boss_victim/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/shotgunner,
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/engineer,
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/soldier,
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/riot_cop,
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/grunt,
			/datum/outfit/deployment_loadout/hidden/boss_victim/combine/medic,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NO_FOV_EFFECT, OUTFIT_TRAIT)
	H.deployment_faction = COMBINE_DEPLOYMENT_FACTION

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/shotgunner
	name = "Victim: Shotgunner"
	display_name = "DEFENSE: Shotgunner"
	desc = "Use your high power shotgun to inflict heavy damage on the enemy bosses."
	id_name = "Shotgunner"

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch

	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12_victim
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red/deathmatch

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_end = 5

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/engineer
	name = "Victim: Engineer"
	display_name = "DEFENSE: Engineer"
	desc = "Use turrets, viscerators, and sandbags to provide protection for allies and yourself."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	belt = /obj/item/crowbar/large

	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen
	r_pocket = /obj/item/flashlight/seclite

	back = /obj/item/storage/backpack/halflife
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 3,
		/obj/item/stack/sheet/mineral/sandbags = 5,
		/obj/item/flashlight/flare/the_hidden = 2,
		/obj/item/sbeacondrop/combine_turret = 2,
		/obj/item/grenade/spawnergrenade/manhacks = 2,
		/obj/item/gun/ballistic/automatic/pistol/usp = 1,
	)

//not in at the moment
/datum/outfit/deployment_loadout/hidden/boss_victim/combine/wallhammer
	name = "Victim: Wallhammer"
	display_name = "DEFENSE: Wallhammer"
	desc = "You move very slowly, but have a lot of armor, and a redeployable shield that lets you act as a great tank for your teammates. While you don't deal a lot of damage, the enemy can't just ignore your repeated baton strikes either."
	id_name = "Wallhammer"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/wallhammer
	uniform = /obj/item/clothing/under/combine/overwatch/wallhammer
	suit = /obj/item/clothing/suit/armor/overwatch/wallhammer/victim
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch/wallhammer
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/melee/baton/security/loaded/weak
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/hidden
	r_pocket = /obj/item/flashlight/seclite

	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	extra_end = 10

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/riot_cop
	name = "Victim: Riot Cop"
	display_name = "ASSAULT: Riot Cop"
	desc = "Utilize your powerful sledgehammer and high strength to beat the crap out of enemies in close range. Your will to fight means you have resistance to being put in critical condition, have a high pain tolerance, and stuns have lower durations against you."
	id_name = "Riotcop"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/riot/fast
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	head = /obj/item/clothing/head/helmet/toggleable/riot

	mask = /obj/item/clothing/mask/gas/civilprotection

	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite

	belt = /obj/item/storage/belt/civilprotection/riotcop_victim

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	back = /obj/item/melee/sledgehammer

	extra_str = 10
	extra_end = 10

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/riot_cop/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_TERRIBLE_AIM), OUTFIT_TRAIT)
	H.dna.species.stunmod = 0.5

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/soldier
	name = "Victim: Soldier"
	display_name = "ALL-ROUNDER: Soldier"
	desc = "You have moderate firepower, decent armor, decent speed, some medicine, and a grenade. You're a great all-rounder, but others excel at specific situations."
	id_name = "OTA"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/hidden
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/grunt
	name = "Victim: Grunt"
	display_name = "ASSAULT: Grunt"
	desc = "You are a high speed, good firepower class that can keep pressure on targets and evade them as well."
	id_name = "Grunt"

	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg_victim

	suit = /obj/item/clothing/suit/halflife/invis_grunt_harness
	suit_store = /obj/item/gun/ballistic/automatic/pulsesmg/standardpin

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/fused/victim
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt

	l_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen
	r_pocket = /obj/item/flashlight/hand_crank

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 6

/datum/outfit/deployment_loadout/hidden/boss_victim/combine/medic
	name = "Victim: Medical Cop"
	display_name = "HEALER: Medical Cop"
	desc = "Keep your allies healed whenever they get hurt by the Boss but not killed."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical

	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 3,
		/obj/item/reagent_containers/hypospray/medipen/blood = 2,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/mp7 = 2,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden/faster)
	extra_int = 4
