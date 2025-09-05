//Unique Rebel faction gear
//Everything from the lowest mobilised refugee to the highest Polish commander
//addust here: for some fucking reason, build.cmd is pretending this file doesnt exist right now.. by the time this comment hits master, this behaviour SHOULD stop. if it recurs;
//hours wasted wrestling build.cmd: 1
//CURRENT FIX is delete the dmb (not dme)

/datum/outfit/resistance_faction
	name = "Generic Resistance"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	ears = /obj/item/radio/headset/syndicate

	r_pocket = /obj/item/flashlight

/datum/outfit/resistance_faction/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'

	H.change_stat(STATKEY_DEX, 1)
	H.change_stat(STATKEY_STR, 1)

// POLISH RESISTANCE - Polish Liberation Front
// Lower ranks get stolen metrocop gear pretty much, higher up the chain means access to actual military surplus
// the veteran is quite literally fucking polish doomguy

/obj/item/hl13_small_flag/poland/telescopic
	name = "telescopic polish flag"
	desc = "A pole defiantly brandishing the colors of the once proud nation of Poland. This one has been modified to fold-up so it can be carried in a bag. 'Poland Protects' is inscribed on the handle."
	w_class = 3
	force = 10

/obj/item/storage/belt/civilprotection/polish_resistance
	desc = "Heavy duty belt for containing metrocop standard gear. It's had some sort of bottle-holder rigged to it."

/obj/item/storage/belt/civilprotection/polish_resistance/Initialize(mapload)
	. = ..()
	atom_storage.set_holdable(list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing/shotgun,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/flashlight/seclite,
		/obj/item/food/donut,
		/obj/item/grenade,
		/obj/item/holosign_creator/security,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/colta357,
		/obj/item/ammo_box/magazine/ar2,
		/obj/item/stack/medical/gauze,
		/obj/item/storage/box/lethalshot,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/reagent_containers/cup/glass/bottle, //VODKA HOLDER VODKA HOLDER VODKA HOLDER
	))

/obj/item/storage/belt/civilprotection/polish_resistance/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/medic/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/belt/civilprotection/polish_resistance/svd/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/svd, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/svd, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/svd, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/servicerifle/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/service, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/service, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/service, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/mosin/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/belt/civilprotection/polish_resistance/revolver/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/colta357, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/colta357, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/ak/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	update_appearance(UPDATE_ICON) //you may have noticed this doesnt come with vodka. that is because the operator drank it on the way to city 13 and threw it at a passing hunter, killing it instantly

/obj/item/clothing/head/beret/sec/poland
	name = "polish liberation front beret"
	desc = "A red beret defiantly bearing the insignia of the Polish military against Combine rule."

/datum/outfit/resistance_faction/polish
	name = "Polish Liberation Front Private"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/rebel/light //stolen and improv gear pretty much. if you arent competent we dont give you the good shit.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak/poland //you get one (1) bargain bin helmet
	mask = /obj/item/clothing/mask/gas/hl2/swat
	ears = /obj/item/radio/headset/syndicate/alt //you get a LITTLE military surplus. as a treat.

/datum/outfit/resistance_faction/polish/partisan //hastily-armed civilians
	name = "Polish Liberation Front Partisan"
	suit = /obj/item/clothing/suit/armor/armored/upgraded
	ears = /obj/item/radio/headset/syndicate
	head = /obj/item/clothing/head/helmet/halflife/military/weak/crafted/poland
	belt = null
	l_pocket = /obj/item/lighter
	r_pocket = /obj/item/flashlight
	back = /obj/item/storage/backpack/halflife/satchel
	backpack_contents = list(
		/obj/item/grenade/halflife/molotov = 2,
		/obj/item/lockpick = 1, //stolen lmao
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2, //stay in the fight
		/obj/item/stack/sheet/halflife/brick = 3,
	)

/datum/outfit/resistance_faction/polish/partisan/gunner
	name = "Polish Liberation Front Partisan Gunner"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy //they're the only armed people at the start of any partisan incursion, so they need to be able to take cop bullets
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	head = /obj/item/clothing/head/helmet/halflife/milhelm/poland
	backpack_contents = list(
		/obj/item/grenade/halflife/molotov = 2,
		/obj/item/lockpick = 1, //stolen lmao
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2, //stay in the fight
		/obj/item/ammo_box/strilka310/a762 = 3,
		/obj/item/knife/combat/survival = 1, //FIX BAYONET
	)

/datum/outfit/resistance_faction/polish/medic
	name = "Polish Liberation Front Medic"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/civilprotection/medical //stolen gear pretty much. if you arent competent we dont give you the good shit.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/medic
	accessory = /obj/item/clothing/accessory/armband/medblue //DON'T SHOOT I'M A MEDIC
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

/datum/outfit/resistance_faction/polish/sapper
	name = "Polish Liberation Front Sapper"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar //now we're talking. actual pre-war armour.
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/knife/combat/survival
	head = /obj/item/clothing/head/helmet/halflife/military/poland //REAL helmet for REAL men.
	gloves = /obj/item/clothing/gloves/combat //military engineer man
	glasses = /obj/item/clothing/glasses/welding
	back = /obj/item/storage/backpack/halflife/satchel/military
	backpack_contents = list(
		/obj/item/grenade/c4 = 2,
		/obj/item/lockpick/combine = 1, //stolen lmao
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1, //stay in the fight since important
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/card/emag/halflife = 1,
	)


/datum/outfit/resistance_faction/polish/competent
	name = "Polish Liberation Front Private First Class"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar //now we're talking. actual pre-war armour.
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle //now you're an actual, trusted soldier, so we can give you good weapons
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	l_pocket = /obj/item/knife/combat/survival
	head = /obj/item/clothing/head/helmet/halflife/military/poland //REAL helmet for REAL men.
	uniform = /obj/item/clothing/under/syndicate/camo

/datum/outfit/resistance_faction/polish/competent/mosin
	name = "Polish Liberation Front Private Second Class"
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/mosin
	l_pocket = /obj/item/knife/combat //FIX BAYONETS YOU SONS OF BITCHES, ITS TIME TO BECOME A MARTYR

/datum/outfit/resistance_faction/polish/strong
	name = "Polish Liberation Front Corporal"
	suit = /obj/item/clothing/suit/armor/halflife/milvest //NOW we're talking.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle/wood //now you're an actual, trusted soldier, so we can give you good weapons
	l_pocket = /obj/item/knife/combat/survival
	head = /obj/item/clothing/head/helmet/halflife/military/poland //again: actual military shit. the PRF only send these guys when they WANT to fuck some shit up.
	r_pocket = /obj/item/grenade/c4
	uniform = /obj/item/clothing/under/syndicate/camo

/datum/outfit/resistance_faction/polish/commander
	name = "Polish Liberation Front Platoon Leader"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy //big man gets big slow vest. big man DOES NOT go on the frontlines. you STAY IN THE BACK AND TALK TO YOUR SOLDIERS GOD FUCKING DAMNIT.
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened //also important
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/revolver
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	ears = /obj/item/radio/headset/syndicate/alt/leader //LEADER. BIG MAN. IMPORTANT.
	head = /obj/item/clothing/head/beret/sec/poland
	l_pocket = /obj/item/binoculars
	uniform = /obj/item/clothing/under/syndicate/camo

/datum/outfit/resistance_faction/polish/commander/flagbearer
	name = "Polish Liberation Front Platoon Leader (Flagbearer)"
	r_hand = /obj/item/hl13_small_flag/poland //FOR POLAND!!!!!!

/datum/outfit/resistance_faction/polish/fuck_your_shit
	name = "Polish Liberation Front Veteran" //these guys are the most most experienced of the polish liberation front. if they are in city 13, you duck and cover. they are walking fucking dreadnoughts. do not call on them in vain.
	mask = /obj/item/clothing/mask/gas/hl2/military/hardened //important
	head = /obj/item/clothing/head/helmet/halflife/milhelm/poland
	suit = /obj/item/clothing/suit/armor/halflife/milvest //again: walking fucking tank. dont fuck with him.
	uniform = /obj/item/clothing/under/syndicate/camo
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	back = /obj/item/storage/backpack/halflife/satchel/military //you are going to fucking die against these guys. trust me.
	ears = /obj/item/radio/headset/syndicate/alt/leader //I AM JOHN POLAND, AND THIS IS MY MESSAGE; THE COMBINE WILL BURN, AND THE BANNER OF POLAND WILL BE RAISED
	backpack_contents = list(
		/obj/item/grenade/c4 = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 1,
		/obj/item/megaphone = 1,
		/obj/item/food/canned/halflife/beans = 1, //stay behind enemy lines for as long as possible
		/obj/item/reagent_containers/cup/glass/waterbottle = 1,
		/obj/item/crowbar/large = 1, //sometimes C4 is too much
		/obj/item/hl13_small_flag/poland/telescopic = 1, //POLAND POLAND POLAND
	)

/datum/outfit/resistance_faction/polish/fuck_your_shit/dreadnought
	name = "Polish Liberation Front Veteran Heavy" //JESUS FUCKING CHRIST THESE GUYS HOLY SHIT BAHAHAHAHHAHAHAHAHAHHAHAA. YOU'RE FUCKED LMAO.
	head = /obj/item/clothing/head/helmet/halflife/military/plf_veteran
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran //again: walking fucking tank. dont fuck with him.
	uniform = /obj/item/clothing/under/syndicate/camo
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	gloves = /obj/item/clothing/gloves/combat //DISPATCH, SHOCKING THAT HATCH ISNT GONNA FUCKING STOP THE POOTIS YOU DINGUS
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	back = /obj/item/storage/backpack/duffelbag/halflife //you are going to fucking die against these guys. trust me.
	ears = /obj/item/radio/headset/syndicate/alt/leader //I AM JOHN POLAND, AND THIS IS MY MESSAGE; THE COMBINE WILL BURN, AND THE BANNER OF POLAND WILL BE RAISED
	backpack_contents = list(
		/obj/item/grenade/c4 = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/megaphone = 1,
		/obj/item/food/canned/halflife/beans = 2, //stay behind enemy lines for as long as possible
		/obj/item/reagent_containers/cup/glass/waterbottle = 1,
		/obj/item/crowbar/large = 1, //sometimes C4 is too much
		/obj/item/hl13_small_flag/poland/telescopic = 1, //POLAND POLAND POLAND
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2, //I refuse death by the power of DRUGS!!!
		/obj/item/reagent_containers/pill/patch/medkit = 1,
	)

//POST-SOVIET FACTIONS: PEOPLE'S LIBERATION FRONT + EASTERN REVOLUTIONARY FRONT

/datum/outfit/resistance_faction/post_soviet
	name = "Post-Soviet Rebel"
	uniform = /obj/item/clothing/under/syndicate/rus_army //ay blyat.
	suit = /obj/item/clothing/suit/armor/rebel/light //cheapskate communist fuck. first armor vest they could find.
	head = /obj/item/clothing/head/helmet/halflife/military/weak
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp //you are expendable. no spare ammo.

/datum/outfit/resistance_faction/post_soviet/competent
	name = "Post-Soviet Rebel Agent"
	suit = /obj/item/clothing/suit/armor/rebel/light
	head = /obj/item/clothing/head/helmet/halflife/military
	belt = /obj/item/storage/belt/civilprotection/polish_resistance //shamelessly-recycled assets
	mask = /obj/item/clothing/mask/balaclava

/datum/outfit/resistance_faction/post_soviet/rifle
	name = "Post-Soviet Rebel Rifleman"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	head = /obj/item/clothing/head/helmet/halflife/military
	mask = /obj/item/clothing/mask/gas/hl2/russia

/datum/outfit/resistance_faction/post_soviet/ak
	name = "Post-Soviet Rebel Kalashnikov Rifleman"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/heavy
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	head = /obj/item/clothing/head/helmet/halflife/military
	mask = /obj/item/clothing/mask/gas/hl2/russia
	l_pocket = /obj/item/grenade/c4

//MISC FACTIONS: RADIOHIM, REBEL COPS

/datum/outfit/resistance_faction/radiohim //low-level scout mercenary
	name = "Radiohim Mercenary Scout"
	uniform = /obj/item/clothing/under/syndicate/combat
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	head = /obj/item/clothing/head/helmet/halflife/milhelm
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	back = /obj/item/storage/backpack/halflife/satchel/military
	ears = /obj/item/radio/headset/syndicate/alt
	backpack_contents = list(
		/obj/item/grenade/c4 = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/food/canned/halflife/beans = 1, //long-range footsoldier, meant to go out and scout things for radiohim
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/reagent_containers/cup/glass/waterbottle = 1,
	)

/datum/outfit/resistance_faction/radiohim/commando
	name = "Radiohim Mercenary Operative"
	backpack_contents = list(
		/obj/item/grenade/c4 = 1,
		/obj/item/ammo_box/magazine/m4a1 = 2,
		/obj/item/food/canned/halflife/beans = 1,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
		/obj/item/reagent_containers/cup/glass/waterbottle = 1,
	)
	suit = /obj/item/clothing/suit/armor/halflife/milvest
	suit_store = /obj/item/gun/ballistic/automatic/m4a1

/datum/outfit/job/security/traitor_cop
	name = "Civil Protection Traitor"
	implants = list(/obj/item/implant/mindshield) //biosig removed
	back = /obj/item/storage/backpack/halflife/satchel/military
	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/food/canned/halflife/beans = 1, //indie gaming
		/obj/item/reagent_containers/pill/patch/medkit/vial = 1,
		/obj/item/reagent_containers/cup/glass/waterbottle = 1,
	)
