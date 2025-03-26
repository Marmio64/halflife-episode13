/obj/item/ammo_casing/caseless/pulse/ar2
	name = "OSIPR pulse round"
	desc = "A OSIPR grade pulse round."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/ar2
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

/obj/item/ammo_casing/caseless/pulse/combine_sniper
	name = "Sniper pulse round"
	desc = "A sniper pulse round."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/heavy
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

/obj/item/ammo_casing/caseless/pulse/smg
	name = "SMG pulse round"
	desc = "A SMG grade pulse round."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/weak
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

/obj/item/ammo_casing/caseless/flechette
	name = "flechette"
	desc = "A flechette."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/flechette
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

/obj/item/ammo_casing/caseless/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)
