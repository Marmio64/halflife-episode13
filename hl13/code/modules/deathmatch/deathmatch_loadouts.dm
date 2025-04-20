/datum/outfit/deathmatch_loadout/rebel/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'


//High damage, extra sidearm, medium armor.
/datum/outfit/deathmatch_loadout/rebel/marine
	name = "Deathmatch: Rebel Marine"
	display_name = "Rebel Marine"
	desc = "Armed with an M4A1 and a grenade, alongside a USP match as a sidearm, you have a lot of damage output available to you, but have middling armor."

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	l_pocket = /obj/item/grenade/syndieminibomb/bouncer
	r_pocket = /obj/item/ammo_box/magazine/m4a1
	belt = /obj/item/gun/ballistic/automatic/pistol/usp

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 1,
	)

//Slow and vulnerable to rush downs, but can blow people out of cover with grenades. Compared to the marine, worse primary and less ammo in exchange for 4 grenades. Extreme version of the conscript.
/datum/outfit/deathmatch_loadout/rebel/bomber
	name = "Deathmatch: Rebel Bomber"
	display_name = "Rebel Bomber"
	desc = "Equipped with an excessive amount of grenades, the bomber is great against entrenched positions, but is vulnerable to being rushed down and don't have much ammo."

	head = /obj/item/clothing/head/helmet/halflife/military
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/rebel
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	belt = /obj/item/gun/ballistic/automatic/pistol/usp

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 4,
	)

//high damage, but low armor and slow firing weapons makes very vulnerable to rush downs
/datum/outfit/deathmatch_loadout/rebel/ranger
	name = "Deathmatch: Rebel Ranger"
	display_name = "Rebel Ranger"
	desc = "Keep your enemies at bay with your scoped rebar crossbow and smoke grenade, as your armor is rather poor. If worst comes to worst, pull out your revolver."

	head = /obj/item/clothing/head/beanie/black
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/rifle/rebarxbow/upgraded
	belt = /obj/item/gun/ballistic/revolver/coltpython/deathmatch_ranger
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
	)

/datum/outfit/deathmatch_loadout/combine/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/guarddown.ogg'

// Similar to the marine, but trades damage and speed for high defense and heals
/datum/outfit/deathmatch_loadout/combine/overwatch
	name = "Deathmatch: OTA Soldier"
	display_name = "OTA Soldier"
	desc = "Slow but heavily armored, overwatch soldiers serve as the vanguard for attacks. In addition, they carry a medkit to make them extra durable."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

//sturdy close range powerhouse, though not very quick
/datum/outfit/deathmatch_loadout/combine/overwatch/shotgunner
	name = "Deathmatch: OTA Shotgunner"
	display_name = "OTA Shotgunner"
	desc = "Slow but heavily armored, overwatch shotgunners are premier assault vanguards."
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red/deathmatch
	r_pocket = null

// Like the standard soldier, but even more durable and has the most high power gun in exchange for no grenades and being the slowest class
/datum/outfit/deathmatch_loadout/combine/elite
	name = "Deathmatch: OTA Elite"
	display_name = "OTA Elite"
	desc = "Highly durable, and very dangerous with their AR2 in open combat, but their slow speed and lack of grenades can give them trouble both against entrenched and speedy opponents."

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/elite
	suit = /obj/item/clothing/suit/armor/overwatch/elite/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2_nogrenade
	suit_store = /obj/item/gun/ballistic/automatic/ar2/standardpin
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

// Speedy firepower makes this class good against melee classes, but the lack of bullet resistance means a quick end against guns.
/datum/outfit/deathmatch_loadout/combine/grunt
	name = "Deathmatch: OTA Grunt"
	display_name = "OTA Grunt"
	desc = "You're similarly equipped compared to an Overwatch Soldier, but forgo much of your armor in exchange for speed and melee resistance!"

	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg
	l_hand = /obj/item/gun/ballistic/automatic/pulsesmg/standardpin

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/deathmatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit/vial

/datum/outfit/deathmatch_loadout/civilprotection/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.cmode_music = 'hl13/sound/music/combat/branescan.ogg'

//vulnerable to being rushed down, but has very deadly manhacks to protect them
/datum/outfit/deathmatch_loadout/civilprotection
	name = "Deathmatch: Metrocop"
	display_name = "Metrocop"
	desc = "Moderately armored and armed only with a pistol, civil protection rely on the two manhacks they bring with, which are extra powerful and loyal only to civilprotection."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/full

	l_pocket = /obj/item/grenade/spawnergrenade/manhacks/deathmatch
	r_pocket = /obj/item/grenade/spawnergrenade/manhacks/deathmatch

/datum/outfit/deathmatch_loadout/crowbar/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

//speedy rush down class
/datum/outfit/deathmatch_loadout/crowbar
	name = "Deathmatch: A Free Man"
	display_name = "A Free Man"
	desc = "Crowbar in hand, seek freedom."
	l_hand = /obj/item/crowbar/large/freeman/extreme
	uniform = /obj/item/clothing/under/citizen/rebel
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch
	glasses = /obj/item/clothing/glasses/regular/thin

//the alpha: All the weapons, best equipment.
/datum/outfit/deathmatch_loadout/crowbar/freeman
	name = "Deathmatch: The Free Man"
	display_name = "The Free Man"
	desc = "Time to fuck up someone's face."

	back = /obj/item/storage/backpack/halflife/satchel/huge
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/freeman //extra fast

	l_hand = /obj/item/crowbar/large/freeman //little bit weaker than the standard classes's crowbar, to make using the guns better

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/gun/ballistic/automatic/pistol/usp,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/gun/ballistic/revolver/coltpython,
		/obj/item/ammo_box/colta357,
		/obj/item/gun/ballistic/shotgun/spas12,
		/obj/item/storage/box/lethalshot/halflife,
		/obj/item/gun/ballistic/automatic/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/gun/ballistic/automatic/ar2/standardpin,
		/obj/item/gun/ballistic/rifle/rebarxbow,
		/obj/item/ammo_casing/rebar,
		/obj/item/ammo_casing/rebar,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
	)

/datum/outfit/deathmatch_loadout/citizen
	name = "Deathmatch: Citizen"
	display_name = "Citizen"
	desc = "You're unarmed and angry. Find a weapon."
	uniform = /obj/item/clothing/under/citizen

//actually slightly worse armor and gun compared to a marine, but you get another nade
/datum/outfit/deathmatch_loadout/conscript
	name = "Deathmatch: Conscript Soldier"

	display_name = "Conscript Soldier"
	desc = "Similarly armed to a rebel marine, you have slightly weaker armor and a slightly weaker weapon, but have an additional grenade."

	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	head = /obj/item/clothing/head/helmet/halflife/military/weak

	mask = /obj/item/clothing/mask/gas/hl2/military/hardened

	back = /obj/item/storage/backpack/halflife/satchel/military

	belt = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1/service = 3,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
	)

/datum/outfit/deathmatch_loadout/conscript/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/forgetaboutfreeman.ogg'

// Fastest class, and has molotovs to wear people down. Great against melee classes since they can burn and run, but can be vulnerable to ranged classes shooting them down while rushing
/datum/outfit/deathmatch_loadout/rioter
	name = "Deathmatch: Rioter"
	display_name = "Rioter"
	desc = "A hit and run class which uses molotovs to burn their enemies alive. They also move faster than any other class due to their light armor."

	head = /obj/item/clothing/head/beanie/black
	uniform = /obj/item/clothing/under/citizen/rebel
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/browncoat/deathmatch
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened
	r_pocket = /obj/item/lighter
	l_pocket = /obj/item/switchblade

	back = /obj/item/storage/backpack/halflife
	backpack_contents = list(
		/obj/item/grenade/halflife/molotov,
		/obj/item/grenade/halflife/molotov,
		/obj/item/grenade/halflife/molotov,
		/obj/item/grenade/halflife/molotov,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/magazine/usp9mm,
	)

/datum/outfit/deathmatch_loadout/rioter/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/cpviolation.ogg'

//similar to freeman class, but trades speed, vision, and on the fly suit provided healing for beartraps, armor, and bandages. Very vulnerable to the rioter.
/datum/outfit/deathmatch_loadout/feral_refugee
	name = "Deathmatch: Feral Refugee"
	display_name = "Feral Refugee"
	desc = "A feral looking and well protected refugee who is capable of ambushing and killing people in close range, but struggles to close the distance."

	head = /obj/item/clothing/head/helmet/halflife/headcrab/deathmatch
	uniform = /obj/item/clothing/under/citizen/refugee
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/platearmor/deathmatch
	mask = /obj/item/clothing/mask/bandana/sinew
	l_pocket = /obj/item/knife/combat/bone

	r_hand = /obj/item/spear/halflife

	back = /obj/item/storage/backpack/halflife/satchel
	backpack_contents = list(
		/obj/item/restraints/legcuffs/beartrap,
		/obj/item/restraints/legcuffs/beartrap,
		/obj/item/restraints/legcuffs/beartrap,
		/obj/item/stack/medical/bandage,
		/obj/item/stack/medical/bandage,
		/obj/item/stack/medical/bandage,
	)

/datum/outfit/deathmatch_loadout/feral_refugee/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/disrupted.ogg'

/datum/outfit/deathmatch_loadout/eldervortigaunt
	name = "Deathmatch: Elder Vortigaunt"
	display_name = "Elder Vortigaunt"
	desc = "Unleash vortal energy upon foes. You're a wizard, vorty!"
	uniform = null
	shoes = null

/datum/outfit/deathmatch_loadout/eldervortigaunt/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'
	H.set_species(/datum/species/vortigaunt/elder)
