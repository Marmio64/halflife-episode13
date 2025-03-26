//Unique Rebel faction gear
//Everything from the lowest mobilised refugee to the highest Polish commander

/datum/outfit/resistance_faction
	name = "Generic Resistance"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	ears = /obj/item/radio/headset/syndicate

	r_pocket = /obj/item/flashlight/seclite


// POLISH RESISTANCE - Polish Revolutionary Front
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
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/belt/civilprotection/polish_resistance/servicerifle/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/service, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/m4a1/service, src)
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/revolver/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/colta357, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/colta357, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/cup/glass/bottle/vodka, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/polish_resistance/ak/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ak47, src)
	SSwardrobe.provide_type(/obj/item/melee/baton, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit, src)
	update_appearance(UPDATE_ICON) //you may have noticed this doesnt come with vodka. that is because the operator drank it on the way to city 13 and threw it at a passing hunter, killing it instantly

/obj/item/clothing/head/beret/sec/poland
	name = "polish revolutionary front beret"
	desc = "A red beret defiantly bearing the insignia of the Polish military against Combine rule."

/datum/outfit/resistance_faction/polish
	name = "Polish Revolutionary Front Private"

	uniform = /obj/item/clothing/under/citizen/refugee/green
	suit = /obj/item/clothing/suit/armor/civilprotection //stolen gear pretty much. if you arent competent we dont give you the good shit.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak //you get one (1) bargain bin helmet
	mask = /obj/item/clothing/mask/gas/hl2/swat

/datum/outfit/resistance_faction/polish/medic
	name = "Polish Revolutionary Front Medic"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/civilprotection/medical //stolen gear pretty much. if you arent competent we dont give you the good shit.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/medic
	accessory = /obj/item/clothing/accessory/armband/medblue //DON'T SHOOT I'M A MEDIC

/datum/outfit/resistance_faction/polish/competent
	name = "Polish Revolutionary Front Private First Class"
	suit = /obj/item/clothing/suit/armor/halflife/kevlar //now we're talking. actual pre-war armour.
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle //now you're an actual, trusted soldier, so we can give you good weapons
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	l_pocket = /obj/item/knife/combat/survival
	head = /obj/item/clothing/head/helmet/halflife/military //REAL helmet for REAL men.

/datum/outfit/resistance_faction/polish/strong
	name = "Polish Revolutionary Front Corporal"
	suit = /obj/item/clothing/suit/armor/halflife/milvest //NOW we're talking.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle //now you're an actual, trusted soldier, so we can give you good weapons
	l_pocket = /obj/item/knife/combat/survival
	head = /obj/item/clothing/head/helmet/halflife/military //again: actual military shit. the PRF only send these guys when they WANT to fuck some shit up.
	r_pocket = /obj/item/grenade/c4

/datum/outfit/resistance_faction/polish/commander
	name = "Polish Revolutionary Front Platoon Leader"
	suit = /obj/item/clothing/suit/armor/vest/russian_coat //big man gets big coat. big man DOES NOT go on the frontlines. you STAY IN THE BACK AND TALK TO YOUR SOLDIERS GOD FUCKING DAMNIT.
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/revolver
	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	ears = /obj/item/radio/headset/syndicate/alt/leader //LEADER. BIG MAN. IMPORTANT.
	head = /obj/item/clothing/head/beret/sec/poland
	l_pocket = /obj/item/binoculars

/datum/outfit/resistance_faction/polish/commander/flagbearer
	name = "Polish Revolutionary Front Platoon Leader (Flagbearer)"
	r_hand = /obj/item/hl13_small_flag/poland //FOR POLAND!!!!!!

/datum/outfit/resistance_faction/polish/fuck_your_shit
	name = "Polish Revolutionary Front Veteran" //these guys are the most most experienced of the polish revolutionary front. if they are in city 13, you duck and cover. they are walking fucking dreadnoughts. do not call on them in vain.
	head = /obj/item/clothing/head/helmet/halflife/milhelm
	suit = /obj/item/clothing/suit/armor/halflife/milvest //again: walking fucking tank. dont fuck with him.
	uniform = /obj/item/clothing/under/syndicate/camo
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/ak
	suit_store = /obj/item/gun/ballistic/automatic/ak47
	back = /obj/item/storage/backpack/halflife/satchel/military //you are going to fucking die against thesse guys. trust me.
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

//POST-SOVIET FACTIONS: PEOPLE'S LIBERATION FRONT + EASTERN REVOLUTIONARY FRONT

/datum/outfit/resistance_faction/post_soviet
	name = "Post-Soviet Rebel"
	uniform = /obj/item/clothing/under/syndicate/rus_army //ay blyat.
	suit = /obj/item/clothing/suit/armor/rebel/light //cheapskate communist fuck. first armor vest they could find.
	head = /obj/item/clothing/head/helmet/halflife/military/weak
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp //you are expendable. no spare ammo.

/datum/outfit/resistance_faction/post_soviet/competent
	name = "Post-Soviet Rebel Agent"
	suit = /obj/item/clothing/suit/armor/armored
	head = /obj/item/clothing/head/helmet/halflife/military
	belt = /obj/item/storage/belt/civilprotection/polish_resistance //shamelessly-recycled assets
	mask = /obj/item/clothing/mask/balaclava

/datum/outfit/resistance_faction/post_soviet/rifle
	name = "Post-Soviet Rebel Rifleman"
	suit = /obj/item/clothing/suit/armor/armored/upgraded
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	belt = /obj/item/storage/belt/civilprotection/polish_resistance/servicerifle
	head = /obj/item/clothing/head/helmet/halflife/military
	mask = /obj/item/clothing/mask/gas/hl2/russia

/datum/outfit/resistance_faction/post_soviet/ak
	name = "Post-Soviet Rebel Kalashnikov Rifleman"
	suit = /obj/item/clothing/suit/armor/armored/upgraded
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
	suit = /obj/item/clothing/suit/armor/armored/upgraded
	head = /obj/item/clothing/head/helmet/halflife/milhelm
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	back = /obj/item/storage/backpack/halflife/satchel/military
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
