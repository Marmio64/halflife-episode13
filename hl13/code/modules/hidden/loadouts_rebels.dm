/obj/item/hl2/loadout_picker/hidden/rebel/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/rebel/crossbow_rebel,
			/datum/outfit/deployment_loadout/hidden/rebel/molotov_partisan,
			/datum/outfit/deployment_loadout/hidden/rebel/slugger,
			/datum/outfit/deployment_loadout/hidden/rebel/ar2_rebel,
			/datum/outfit/deployment_loadout/hidden/rebel/scout,
			/datum/outfit/deployment_loadout/hidden/rebel/medic_rebel,
			/datum/outfit/deployment_loadout/hidden/rebel/doctor,
			/datum/outfit/deployment_loadout/hidden/rebel/engineer,
			/datum/outfit/deployment_loadout/hidden/rebel/vortigaunt,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/hidden/rebel/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NO_FOV_EFFECT, OUTFIT_TRAIT)
	H.deployment_faction = REBEL_DEPLOYMENT_FACTION

/datum/outfit/deployment_loadout/hidden/rebel
	faction = REBEL_DEPLOYMENT_FACTION
	id = /obj/item/card/id/rebel_tdm

//The defender, crossbow rebels have a powerful crossbow that can take the hidden down in just a few hits.
//They're not particularly tanky, and their gun has one shot and is painful to reload.
/datum/outfit/deployment_loadout/hidden/rebel/crossbow_rebel
	name = "Hidden: Crossbow Rebel"
	display_name = "DEFENSE: Crossbow Rebel"
	desc = "Use a well placed shot from your crossbow to do some serious damage to the hidden."
	id_name = "Sniper"

	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/hand_crank

	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/hidden
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/armor/rebel/light

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_casing/rebar = 5,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

//Use molotovs to keep the hidden at bay
/datum/outfit/deployment_loadout/hidden/rebel/molotov_partisan
	name = "Hidden: Refugee Molotov Partisan"
	display_name = "DEFENSE: Refugee Molotov Partisan"
	desc = "Keep the Hidden at bay both with molotovs, and your SMG. Take care not to ignite your team mates."
	id_name = "Partisan"

	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/refugee
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	ears = /obj/item/radio/headset/rebel_deployment

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/hand_crank

	back = /obj/item/storage/backpack/halflife/satchel/larger

	backpack_contents = list(
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/grenade/halflife/molotov = 4,
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/lighter,
	)

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

/datum/outfit/deployment_loadout/hidden/rebel/slugger
	name = "Hidden: Rebel Slugger"
	display_name = "DEFENSE: Rebel Slugger"
	desc = "Utilize high strength and a sledgehammer to keep the Hidden away from team mates."
	id_name = "Slugger"

	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran

	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/hand_crank

	belt = /obj/item/storage/belt/civilprotection/riotcop_hidden

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	back = /obj/item/melee/sledgehammer

	extra_str = 8

//The attacker, conscripts move a bit faster than their comrades and have the best medium to long range weapon.
//They excel at giving chase to the hidden, just don't get cocky.
/datum/outfit/deployment_loadout/hidden/rebel/ar2_rebel
	name = "Hidden: Assault Rebel"
	display_name = "ASSAULT: Assault Rebel"
	desc = "Utilize your high power M4A1 to keep pressure on the Hidden from close and long range."
	id_name = "Rebel"

	suit = /obj/item/clothing/suit/armor/rebel/light/speedy
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/hand_crank
	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted
	uniform = /obj/item/clothing/under/citizen/rebel
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/m4a1 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 3

//The other attacker. Combine's Shotgunner except they run fast and die a virgin.
//Can give chase to the Hidden, but no armor means they probably won't even need a backstab to bring you down.
/datum/outfit/deployment_loadout/hidden/rebel/scout
	name = "Hidden: Rebel Scout"
	display_name = "ASSAULT: Rebel Scout"
	desc = "You are a speedy glass cannon that uses a shotgun for high upclose damage. Papercuts kill you."
	id_name = "Scout"

	suit = /obj/item/clothing/suit/armor/browncoat/deployment
	suit_store = /obj/item/gun/ballistic/shotgun/spas12

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/halflife/scout_hat/weak
	uniform = /obj/item/clothing/under/citizen/refugee

	backpack_contents = list(
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/storage/box/lethalshot/halflife = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/hand_crank

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 2

//The healer, excels at recovering allies from nonfatal injuries.
//The Hidden tends to finish off prey they have started to hunt, but in the case they don't, you are extremely useful at getting them back to tip top shape!
/datum/outfit/deployment_loadout/hidden/rebel/medic_rebel
	name = "Hidden: Medic Rebel"
	display_name = "HEALER: Medic Rebel"
	desc = "Keep your allies healed whenever they get hurt by the Hidden but not killed."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/citizen/refugee
	accessory = /obj/item/clothing/accessory/armband/medblue
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	glasses = /obj/item/clothing/glasses/hud/health
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted

	l_pocket = /obj/item/flashlight/hand_crank
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 3,
		/obj/item/reagent_containers/hypospray/medipen/blood = 2,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden)
	extra_int = 4

//The second healer, excels at recovering allies from nonfatal injuries.
//You have no business fighting, but were brought in to help with healing any survivors. Good luck.
/datum/outfit/deployment_loadout/hidden/rebel/doctor
	name = "Hidden: Refugee Doctor"
	display_name = "HEALER: Unarmed Refugee Doctor"
	desc = "You're a knowledgable doctor liberated from a nearby city to help on what looks like a suicide mission. You're light on your feet and packed with medical supples, but are armed with but a scalpel and have zero firearm experience!"
	id_name = "Doctor"

	uniform = /obj/item/clothing/under/citizen/refugee
	gloves = /obj/item/clothing/gloves/latex/nitrile
	suit = /obj/item/clothing/suit/whitejacket/fast
	glasses = /obj/item/clothing/glasses/hud/health
	head = /obj/item/clothing/head/soft/paramedic
	mask = /obj/item/clothing/mask/gas/hl2/oldmask_hidden

	l_pocket = /obj/item/flashlight/hand_crank
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	belt = /obj/item/defibrillator/compact/loaded

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/storage/medkit/halflife_combine = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood = 2,
		/obj/item/scalpel/hidden_doctor = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden/faster)

	extra_int = 6

/datum/outfit/deployment_loadout/hidden/rebel/doctor/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_TERRIBLE_AIM, OUTFIT_TRAIT)

//The tracker, you specialize in setting up trip beams at room entrances in order to get a heads up on Hidden activity.
//In addition, you get two more flares than everyone else, which is great for increasing the dismal visiblity your team tends to have!
//The downside is that you only have a sidearm and are thus extremely vulnerable, unless you manage to get a real gun off a dead teammate.
/datum/outfit/deployment_loadout/hidden/rebel/engineer
	name = "Hidden: Engineer"
	display_name = "TRACKER: Engineer"
	desc = "Use trip alarm beams and flares to get extra information on where the enemy is. In addition, wisely use your sandbags to help protect the team during terminal activations."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen/refugee

	belt = /obj/item/gun/ballistic/automatic/pistol/usp

	l_pocket = /obj/item/stack/medical/gauze/quik_gauze
	r_pocket = /obj/item/flashlight/hand_crank

	back = /obj/item/storage/backpack/halflife
	head = /obj/item/clothing/head/halflife/blue_hardhat
	ears = /obj/item/radio/headset/rebel_deployment

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 3,
		/obj/item/stack/sheet/mineral/sandbags = 3,
		/obj/item/flashlight/flare/the_hidden = 3,
		/obj/item/assembly/infra/the_hidden = 3,
	)

//Ideas for marm to decide on: remove healing or make night vision weak, something like that because it might be unbalanced the way it is right now
/datum/outfit/deployment_loadout/hidden/rebel/vortigaunt
	name = "Hidden: Vortigaunt"
	display_name = "TRACKER: Vortigaunt"
	desc = "Use your natural ability to see in the dark as well as your bugbait to locate the Hidden. Unfortunately, your attacks are generally too slow to get a hit in on them. You're also completely nude."

	uniform = null
	shoes = null
	id = null

	ears = /obj/item/radio/headset/rebel_deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'
	spells_to_add = list(/datum/action/cooldown/spell/conjure/antlion)

/datum/outfit/deployment_loadout/hidden/rebel/vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.faction += list(FACTION_ANTLION)
	H.set_species(/datum/species/vortigaunt/hidden)
	H.cmode_music = combat_music
