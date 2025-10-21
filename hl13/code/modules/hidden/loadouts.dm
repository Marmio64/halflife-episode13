/obj/item/hl2/loadout_picker/hidden/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/combine/shotgunner,
			/datum/outfit/deployment_loadout/hidden/combine/conscript,
			/datum/outfit/deployment_loadout/hidden/combine/medic_cop,
			/datum/outfit/deployment_loadout/hidden/combine/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/hidden/combine/shotgunner
	name = "Hidden: Shotgunner"
	display_name = "ASSAULT: Shotgunner"
	desc = "Utilize high armor and a shotgun to take down the Hidden swiftly in close quarters and to protect your team."

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	l_pocket = /obj/item/flashlight/flare
	r_pocket = /obj/item/flashlight/seclite

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12_hidden
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/infiltrate.ogg'

/datum/outfit/deployment_loadout/hidden/combine/conscript
	name = "Hidden: Conscript"
	display_name = "ASSAULT: Conscript"
	desc = "Utilize your high power M4A1 to keep pressure on the Hidden from far distances."

	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/helmet/halflife/military/weak
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
		/obj/item/ammo_box/magazine/m4a1 = 1,
		/obj/item/flashlight/flare = 1,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/infiltrate.ogg'

/datum/outfit/deployment_loadout/hidden/combine/medic_cop
	name = "Hidden: Medical Cop"
	display_name = "SUPPORT: Medical Cop"
	desc = "Keep your allies healed whenever they get hurt by the Hidden."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical

	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/music/combat/infiltrate.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/medkit = 4,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 2,
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/flashlight/flare = 1,
	)

	extra_int = 4

/datum/outfit/deployment_loadout/hidden/combine/engineer
	name = "Hidden: Engineer"
	display_name = "SUPPORT: Engineer"
	desc = "Supply allies with extra ammo, drop extra flares, and use suppressing fire from your MP7 to protect allies."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife
	ears = /obj/item/radio/headset/civilprotection/deployment

	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/mp7 = 1,
		/obj/item/flashlight/flare = 2,
		/obj/item/ammo_box/magazine/mp7 = 2,
		/obj/item/ammo_box/magazine/m4a1 = 2,
		/obj/item/storage/box/lethalshot/halflife = 2,
	)










/// THE MONSTER /// --------------------------------------

/datum/outfit/deployment_loadout/hidden/the_hidden
	name = "Hidden: The Hidden"
	display_name = "The Hidden"
	desc = "The monster itself. Utilize stealth and mobility to slaughter your opponents when they don't expect it."

	glasses = /obj/item/clothing/glasses/hidden_blindfold
	shoes = /obj/item/clothing/shoes/boots

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	uniform = /obj/item/clothing/under/pants/the_hidden

	combat_music = 'hl13/sound/music/combat/infiltrate.ogg'

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade, /datum/action/cooldown/spell/conjure_item/hidden_knife)

/datum/outfit/deployment_loadout/hidden/the_hidden/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.alpha = 25
	H.set_hairstyle("Bald", update = TRUE)
	H.skin_tone = "albino"
	H.update_body(0)
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOGUNS, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FILTHBORN, OUTFIT_TRAIT)
	H.setdeploymentfaction(HIDDEN_DEPLOYMENT_FACTION)

/obj/item/clothing/under/pants/the_hidden
	name = "pants"
	desc = "A pair of plain pants"
	icon_state = "trackpants"
	slowdown = -1.35

/obj/item/clothing/glasses/hidden_blindfold
	name = "blindfold"
	desc = "A simple white blindfold."
	icon_state = "blindfoldwhite"
	inhand_icon_state = null
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)

//Will two shot everyone but the shotgunner, and tends to insta-down with a backstab
/obj/item/knife/combat/backstab/the_hidden
	desc = "An obscenely sharp and dangerous knife. A single backstab is enough to instantly down an enemy."

	force = 75
	armour_penetration = 10
	wdefense = 0
	backstab_bonus = 100

	attack_speed = CLICK_CD_SLOW

/obj/item/knife/combat/backstab/the_hidden/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/lifesteal, 15) //Heal a bit for dealing damage to a living enemy

/datum/action/cooldown/spell/conjure_item/hidden_knife
	name = "Summon Knife"
	desc = "Summons your favorite and deadliest little buddy. Gets rid of the previous one if it exists."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "knife"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 3 SECONDS
	item_type = /obj/item/knife/combat/backstab/the_hidden
	requires_hands = TRUE
	delete_old = TRUE
