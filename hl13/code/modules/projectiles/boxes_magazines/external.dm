/obj/item/ammo_box/magazine/usp9mm
	name = "pistol magazine (9mm)"
	desc = "A 18-round 9mm magazine designed for the USP Match pistol."
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 15
	icon_state = "9mmaps-15"
	base_icon_state = "9mmaps"

/obj/item/ammo_box/magazine/usp9mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 5)]"

/obj/item/ammo_box/magazine/makeshift9mm
	name = "makeshift pistol magazine (9mm)"
	desc = "A 8-round 9mm magazine made for some sort of makeshift pistol."
	ammo_type = /obj/item/ammo_casing/c9mm/makeshift
	caliber = CALIBER_9MM
	max_ammo = 8
	icon_state = "45-8"
	base_icon_state = "45"

/obj/item/ammo_box/magazine/makeshift9mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[ammo_count()]"

/obj/item/ammo_box/magazine/ar2
	name = "OSIPR magazine (pulse)"
	desc = "A 30-round magazine for the OSIPR that contains pulse rounds."
	icon_state = "ar2"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/ar2
	caliber = CALIBER_PULSROUND
	max_ammo = 30

/obj/item/ammo_box/magazine/combine_sniper
	name = "Sniper magazine (pulse)"
	desc = "A 10-round magazine for the combine sniper rifle that contains pulse rounds."
	icon_state = "ar2"
	ammo_type = /obj/item/ammo_casing/caseless/pulse/combine_sniper
	caliber = CALIBER_PULSROUND
	max_ammo = 10

/obj/item/ammo_box/magazine/mp7
	name = "\improper MP7 magazine (4.6x30mm)"
	desc = "A 45-round 4.6x30mm magazine, designed for the MP7."
	icon_state = "smg9mm"
	ammo_type = /obj/item/ammo_casing/c46x30mm
	caliber = CALIBER_46X30MM
	max_ammo = 40

//m4a1 Rifle

/obj/item/ammo_box/magazine/m4a1
	name = "rifle magazine (5.56mm)"
	desc = "A standard 30-round magazine for the M4A1 Rifle. Filled with 5.56 rounds."
	icon_state = "m308"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556NATO
	max_ammo = 30

//ak47 Rifle

/obj/item/ammo_box/magazine/ak47
	name = "rifle magazine (7.62mm)"
	desc = "A standard 30-round magazine for the AK47 Rifle. Filled with 7.62 rounds."
	icon_state = "m308"
	ammo_type = /obj/item/ammo_casing/n762
	caliber = CALIBER_N762
	max_ammo = 30

//service Rifle

/obj/item/ammo_box/magazine/service
	name = "rifle magazine (5.56mm)"
	desc = "A standard 20-round magazine for the Service Rifle. Filled with 5.56 rounds."
	icon_state = "m308"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556NATO
	max_ammo = 20
