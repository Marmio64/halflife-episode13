/datum/outfit/rebel
	name = "Light Rebel"

	uniform = /obj/item/clothing/under/citizen/rebel
	//accessory = /obj/item/clothing/accessory/armband/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/satchel

	l_pocket = /obj/item/flashlight
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

/datum/outfit/rebel/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'hl13/sound/music/combat/vortalcombat.ogg'

/datum/outfit/rebel/medium
	name = "Medium Rebel"

	suit = /obj/item/clothing/suit/armor/rebel/light
	suit_store = /obj/item/gun/ballistic/automatic/mp7

	backpack_contents = list(
		/obj/item/ammo_box/magazine/mp7 = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

/datum/outfit/rebel/heavy
	name = "Heavy Rebel (M4A1)"

	suit = /obj/item/clothing/suit/armor/rebel
	head = /obj/item/clothing/head/helmet/halflife/military
	suit_store = /obj/item/gun/ballistic/automatic/m4a1

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1 = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

/datum/outfit/rebel/heavy/ak47
	name = "Heavy Rebel (AK47)"

	suit_store = /obj/item/gun/ballistic/automatic/ak47

	backpack_contents = list(
		/obj/item/ammo_box/magazine/ak47 = 2,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 1,
	)

/datum/outfit/rebel/uplink
	name = "Rebel Uplinked"
	var/tc = 15
	var/uplink_type = /obj/item/uplink/nuclear

/datum/outfit/rebel/uplink/post_equip(mob/living/carbon/human/H)
	if(ispath(uplink_type, /obj/item/uplink/nuclear) || tc) // /obj/item/uplink/nuclear understands 0 tc
		var/obj/item/U = new uplink_type(H, H.key, tc)
		H.equip_to_slot_or_del(U, ITEM_SLOT_BACKPACK)

/datum/outfit/refugee
	name = "Refugee with random items"

	uniform = /obj/item/clothing/under/citizen/refugee
	shoes = /obj/item/clothing/shoes/boots
	r_pocket = /obj/item/flashlight
	var/list/rhand_items = list(
		/obj/item/lockpick,
		/obj/item/knife,
		/obj/item/storage/halflife/suitcase,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/storage/box/halflife/ration/ration,
		/obj/item/crowbar/large,
		/obj/item/gun/ballistic/automatic/pistol/makeshift,
		/obj/item/gun/ballistic/rifle/rebarxbow
		) //Refugees get a random item from this list

/datum/outfit/refugee/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	var/chosen = pick(rhand_items)
	var/turf/T = get_turf(H)
	var/obj/item/I = new chosen(T)
	H.put_in_hands(I)
