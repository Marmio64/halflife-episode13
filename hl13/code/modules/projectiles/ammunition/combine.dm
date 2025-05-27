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

/obj/item/ammo_casing/shotgun/buckshot/antixen
	name = "anti-xen shell"
	desc = "A 16 gauge anti-xen buckshot shell. Somehow designed to tear apart xenian creatures with ease, while causing lesser damage against humans and structures."
	icon_state = "xshell"
	worn_icon_state = "shell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/antixen
	pellets = 5
	variance = 25
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

	icon = 'hl13/icons/obj/guns/ammo.dmi'

	caliber = CALIBER_ANTIXEN

/obj/item/ammo_casing/shotgun/mining
	name = "mining slug"
	desc = "A 16 gauge mining slug, which can tear through rocks and armor, although designed purposefully to fare poorly against flesh."
	icon_state = "mshell"
	worn_icon_state = "shell"
	projectile_type = /obj/projectile/bullet/mining_slug
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

	icon = 'hl13/icons/obj/guns/ammo.dmi'

	caliber = CALIBER_ANTIXEN
