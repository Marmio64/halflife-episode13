/obj/item/ammo_box/magazine/usp9mm
	name = "pistol magazine (9mm)"
	desc = "A 15-round 9mm magazine designed for the USP Match pistol."
	ammo_type = /obj/item/ammo_casing/c9mm/usp
	caliber = CALIBER_9MM
	max_ammo = 15
	icon_state = "usp"
	base_icon_state = "usp"
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/usp9mm/extended
	name = "extended pistol magazine (9mm)"
	desc = "A 25-round 9mm magazine designed for the USP Match pistol."
	max_ammo = 25

/obj/item/ammo_box/magazine/usp9mm/rubber
	name = "pistol magazine (9mm rubber)"
	desc = "A 15-round 9mm magazine designed for the USP Match pistol. This one is designed to fill with rubber rounds."
	ammo_type = /obj/item/ammo_casing/c9mm/usp/rubber
	icon_state = "uspru"
	base_icon_state = "uspru"

/obj/item/ammo_box/magazine/makeshift9mm
	name = "makeshift pistol magazine (9mm)"
	desc = "A 8-round 9mm magazine made for some sort of makeshift pistol."
	ammo_type = /obj/item/ammo_casing/c9mm/usp/makeshift
	caliber = CALIBER_9MM
	max_ammo = 8
	icon_state = "45"
	base_icon_state = "45"
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/ar2
	name = "OSIPR magazine (pulse)"
	desc = "A 30-round magazine for the OSIPR that contains pulse rounds."
	icon_state = "ar2"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/ar2
	caliber = CALIBER_PULSROUND
	max_ammo = 30
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_box/magazine/pulselmg
	name = "LMG magazine (pulse)"
	desc = "A 120-round magazine for the pulse LMG that contains pulse rounds."
	icon_state = "ar2"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/lmg
	caliber = CALIBER_PULSROUND
	max_ammo = 120
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_box/magazine/pulsesmg
	name = "pulse smg magazine"
	desc = "A 30-round magazine for the pulse smg that contains pulse rounds."
	icon_state = "pulsesmg"
	base_icon_state = "pulsesmg"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/smg
	caliber = CALIBER_PULSROUND
	max_ammo = 30
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/combine_sniper
	name = "Sniper magazine (pulse)"
	desc = "A 10-round magazine for the combine sniper rifle that contains pulse rounds."
	icon_state = "ar2"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/combine_sniper
	caliber = CALIBER_PULSROUND
	max_ammo = 10
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_box/magazine/mp7
	name = "\improper MP7 magazine (4.6x30mm)"
	desc = "A 45-round 4.6x30mm magazine, designed for the MP7."
	icon_state = "smg9mm"
	base_icon_state = "smg9mm"
	ammo_type = /obj/item/ammo_casing/c46x30mm/mp7
	caliber = CALIBER_46X30MM
	max_ammo = 45
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

//m4a1 Rifle

/obj/item/ammo_box/magazine/m4a1
	name = "rifle magazine (5.56mm)"
	desc = "A standard 30-round magazine for the M4A1 Rifle. Filled with 5.56 rounds."
	icon_state = "m308"
	base_icon_state = "m308"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556NATO
	max_ammo = 30
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

//ak47 Rifle

/obj/item/ammo_box/magazine/ak47
	name = "rifle magazine (7.62mm)"
	desc = "A standard 30-round magazine for the AK47 Rifle. Filled with 7.62 rounds."
	icon_state = "ar762"
	base_icon_state = "ar762"
	ammo_type = /obj/item/ammo_casing/n762
	caliber = CALIBER_N762
	max_ammo = 30
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

//service Rifle

/obj/item/ammo_box/magazine/m4a1/service
	name = "rifle magazine (5.56mm)"
	desc = "A standard 20-round magazine for the Service Rifle. Filled with 5.56 rounds."
	icon_state = "m308small"
	base_icon_state = "m308small"
	max_ammo = 20

//svd Rifle

/obj/item/ammo_box/magazine/svd
	name = "rifle magazine (7.62mm)"
	desc = "A standard 10-round magazine for the Dragunov Rifle. Filled with 7.62 rounds."
	icon_state = "m308small"
	base_icon_state = "m308small"
	ammo_type = /obj/item/ammo_casing/n762/high_veloc
	caliber = CALIBER_N762
	max_ammo = 10
	icon = 'hl13/icons/obj/guns/ammo.dmi'
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE
