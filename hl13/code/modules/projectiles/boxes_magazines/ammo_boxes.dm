/obj/item/ammo_box/colta357
	name = "speed loader (.357)"
	desc = "Designed to quickly reload revolvers."
	icon_state = "357"
	ammo_type = /obj/item/ammo_casing/a357
	max_ammo = 6
	caliber = CALIBER_357
	multiple_sprites = AMMO_BOX_PER_BULLET
	item_flags = NO_MAT_REDEMPTION
	ammo_band_icon = "+38_ammo_band"
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	ammo_band_icon = "+38_ammo_band"
	ammo_band_color = null

/obj/item/ammo_box/colta357/armor_piercing
	name = "speed loader (.357 Armor Piercing)"
	desc = "Designed to quickly reload revolvers. These rounds are manufactured with armor piercing materials, and additional gunpowder."
	ammo_type = /obj/item/ammo_casing/a357/armor_piercing
	ammo_band_color = "#8a231e"

/obj/item/ammo_box/halflife
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	icon_state = "ammobox"

/obj/item/ammo_box/halflife/c9mm
	name = "ammo box (9mm)"
	ammo_type = /obj/projectile/bullet/c9mm/usp
	max_ammo = 45

/obj/item/ammo_box/halflife/c46x30mm
	name = "ammo box (4.6x30mm)"
	ammo_type = /obj/item/ammo_casing/c46x30mm/mp7
	max_ammo = 120
