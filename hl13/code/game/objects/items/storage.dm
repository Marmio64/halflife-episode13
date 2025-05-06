/obj/item/storage/belt/pouch
	name = "pouch"
	desc = "A old world pouch. Can hold a little bit of stuff."
	icon_state = "pouch"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 3
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.silent = TRUE

/obj/item/storage/belt/pouch/refugee/PopulateContents()
	SSwardrobe.provide_type(/obj/item/knife/shiv, src) //basic self defense. Almost anything will be better though, including a random brick lying about.
	SSwardrobe.provide_type(/obj/item/reagent_containers/hypospray/medipen/healthpen, src) //refugees will get hurt. A lot.
	SSwardrobe.provide_type(/obj/item/stack/medical/bandage, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/pouch/large
	name = "large pouch"
	desc = "A larger old world pouch. Holds a small bit more than its smaller counterparts."

/obj/item/storage/belt/pouch/large/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 4
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.silent = TRUE

/obj/item/storage/belt/pouch/large/cleanup/PopulateContents()
	SSwardrobe.provide_type(/obj/item/knife/combat/survival, src)
	SSwardrobe.provide_type(/obj/item/lockpick/combine/ic, src)
	SSwardrobe.provide_type(/obj/item/flashlight, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/hypospray/medipen/healthpen, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection
	name = "civil protection belt"
	desc = "Heavy duty belt for containing metrocop standard gear."
	icon_state = "civilprotection"
	inhand_icon_state = "civilprotection"
	worn_icon_state = "civilprotection"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE

/obj/item/storage/belt/civilprotection/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 7
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
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
		/obj/item/halflife/combine_battery,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
	))
	atom_storage.open_sound = 'sound/items/handling/holster_open.ogg'
	atom_storage.open_sound_vary = TRUE
	atom_storage.rustle_sound = FALSE

/obj/item/storage/belt/civilprotection/large
	name = "expanded civil protection belt"
	desc = "Heavy duty belt for containing metrocop standard gear. Contains an extra pocket or two for additional storage."
	custom_price = PAYCHECK_CREW * 4

/obj/item/storage/belt/civilprotection/large/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 8

/obj/item/storage/belt/civilprotection/full/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/security/loaded, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/belt/civilprotection/medicfull/PopulateContents()
	SSwardrobe.provide_type(/obj/item/melee/baton/security/loaded, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/divisionleadfull/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/colta357, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/security/loaded, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/riotfullpistol/PopulateContents()
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/usp9mm/rubber, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/security/loaded, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/riotfull/PopulateContents()
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/grenade/stingbang/halflife, src)
	SSwardrobe.provide_type(/obj/item/grenade/stingbang/halflife, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/belt/civilprotection/overwatch
	name = "overwatch belt"
	desc = "Heavy duty belt for containing overwatch standard gear."

/obj/item/storage/belt/civilprotection/overwatch/ar2/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/overwatch/ar2_nogrenade/PopulateContents()
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/ar2, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/overwatch/sniper/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/combine_sniper, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/combine_sniper, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/combine_sniper, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/overwatch/mp7/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/mp7, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/mp7, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/mp7, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/overwatch/pulsesmg/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/pulsesmg, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/pulsesmg, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/magazine/pulsesmg, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)

/obj/item/storage/belt/civilprotection/overwatch/spas12/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot/halflife, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot/halflife, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot/halflife, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	update_appearance(UPDATE_ICON)


/obj/item/storage/backpack/halflife
	icon = 'hl13/icons/obj/clothing/backpack.dmi'
	worn_icon = 'hl13/icons/mob/clothing/back.dmi'

/obj/item/storage/backpack/halflife
	name = "backpack"
	desc = "A fine looking, though old leather backpack."
	icon_state = "leather_backpack"
	inhand_icon_state = "leather_backpack"
	storage_type = /datum/storage/backpack/halflife

/obj/item/storage/backpack/duffelbag/halflife
	name = "duffel bag"
	desc = "A large, rugged duffel-bag that looks like it may have once belonged to the armed forces."
	icon = 'hl13/icons/obj/clothing/backpack.dmi'
	worn_icon = 'hl13/icons/mob/clothing/back.dmi'
	icon_state = "military_duffel"
	inhand_icon_state = "military_duffel"
	storage_type = /datum/storage/duffel

/obj/item/storage/backpack/halflife/satchel
	name = "satchel"
	desc = "A fine looking, though old leather satchel."
	icon_state = "satchel"
	inhand_icon_state = "satchel"
	storage_type = /datum/storage/satchel/halflife

/obj/item/storage/backpack/halflife/satchel/military
	name = "military satchel"
	desc = "A satchel that looks like it once belonged to the army."
	icon_state = "military"
	inhand_icon_state = "military"

/obj/item/storage/backpack/halflife/satchel/huge
	storage_type = /datum/storage/satchel/halflife/huge

/datum/storage/satchel/halflife/huge
	max_total_storage = 45
	max_slots = 45
	max_specific_storage = WEIGHT_CLASS_GIGANTIC

/datum/storage/backpack/halflife
	max_total_storage = 21
	max_slots = 21

/datum/storage/satchel/halflife
	max_total_storage = 15
	max_slots = 15

