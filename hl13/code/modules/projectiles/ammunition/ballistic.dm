/obj/item/ammo_casing/a556
	name = "5.56mm bullet casing"
	desc = "A 5.56mm bullet casing."
	icon_state = "556-casing"
	caliber = CALIBER_556NATO
	projectile_type = /obj/projectile/bullet/a556
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/medium
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_casing/c9mm/usp
	name = "9mm bullet casing"
	desc = "A 9mm bullet casing."
	caliber = CALIBER_9MM
	projectile_type = /obj/projectile/bullet/c9mm/usp
	newtonian_force = 0.75
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/light

/obj/item/ammo_casing/c9mm/usp/makeshift
	name = "9mm makeshift bullet casing"
	desc = "A 9mm makeshift bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/usp/makeshift

/obj/item/ammo_casing/c9mm/usp/rubber
	name = "9mm rubber bullet casing"
	desc = "A 9mm rubber bullet casing."
	projectile_type = /obj/projectile/bullet/c9mm/usp/rubber

/obj/item/ammo_casing/shotgun/buckshot/halflife
	name = "buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/halflife
	pellets = 6 //6 pellets, 11 damage each, up to 72 damage
	variance = 25
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_casing/c46x30mm/mp7
	name = "4.6x30mm bullet casing"
	desc = "A 4.6x30mm bullet casing."
	caliber = CALIBER_46X30MM
	projectile_type = /obj/projectile/bullet/c46x30mm/mp7
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/light

/obj/item/ammo_casing/a20mm
	name = "20mm grenade"
	desc = "A 20mm grenade. Can't be activated on it's own, and can only be inserted into an MP7's launcher."
	icon_state = "20mm"
	caliber = CALIBER_20MM
	projectile_type = /obj/projectile/bullet/a20mm
	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_casing/a20mm/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/rocket/hl13
	name = "\improper HE rocket"
	desc = "An 84mm High Explosive rocket. Fire at people and pray."
	projectile_type = /obj/projectile/bullet/rocket/hl13
	icon = 'hl13/icons/obj/guns/ammo.dmi'
