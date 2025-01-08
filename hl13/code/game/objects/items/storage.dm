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

/obj/item/storage/belt/pouch/large
	name = "large pouch"
	desc = "A larger old world pouch. Holds a small bit more than its smaller counterparts."

/obj/item/storage/belt/pouch/large/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 4
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.silent = TRUE

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
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/magazine/ar2,
		/obj/item/stack/medical/gauze,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
	))
	atom_storage.open_sound = 'sound/items/handling/holster_open.ogg'
	atom_storage.open_sound_vary = TRUE
	atom_storage.rustle_sound = FALSE

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
	SSwardrobe.provide_type(/obj/item/ammo_box/a357, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/melee/baton/security/loaded, src)
	SSwardrobe.provide_type(/obj/item/flashlight/seclite, src)
	SSwardrobe.provide_type(/obj/item/stack/medical/gauze, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/vial, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
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

/obj/item/storage/belt/civilprotection/overwatch/spas12/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/syndieminibomb/bouncer, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot, src)
	SSwardrobe.provide_type(/obj/item/storage/box/lethalshot, src)
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

/datum/storage/backpack/halflife
	max_total_storage = 21
	max_slots = 21

/datum/storage/satchel/halflife
	max_total_storage = 15
	max_slots = 15
