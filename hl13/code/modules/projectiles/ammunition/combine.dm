/obj/item/ammo_casing/caseless/pulse/ar2
	name = "OSIPR pulse round"
	desc = "A OSIPR grade pulse round."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/ar2
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

/obj/item/ammo_casing/pulse/energyball
	name = "dark energy ball"
	desc = "A strange container built to house a small ball of dark energy. Can be loaded into an AR2 and fired as it's alternate function."
	icon_state = "darkenergy"
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/energyball
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_casing/caseless/pulse/lmg
	name = "LMG pulse round"
	desc = "A LMG grade pulse round."
	caliber = CALIBER_PULSROUND
	projectile_type = /obj/projectile/bullet/pulse/lmg
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
	projectile_type = /obj/projectile/bullet/pulse/smg
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

/obj/item/ammo_casing/shotgun/buckshot/pulse
	name = "pulse shell"
	desc = "A 12 gauge pulse buckshot shell. Designed to inflict the maximum amount of damage."
	icon_state = "xshell"
	worn_icon_state = "shell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/pulse
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

	icon = 'hl13/icons/obj/guns/ammo.dmi'

/obj/item/ammo_casing/shotgun/mining
	name = "mining slug"
	desc = "A 16 gauge mining slug, which can tear through rocks and armor, although designed purposefully to fare poorly against flesh."
	icon_state = "mshell"
	worn_icon_state = "shell"
	projectile_type = /obj/projectile/bullet/mining_slug
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse

	icon = 'hl13/icons/obj/guns/ammo.dmi'

	caliber = CALIBER_ANTIXEN

/obj/item/ammo_casing/energy/immolator
	projectile_type = /obj/projectile/bullet/immolator_plasma
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/pulse
	e_cost = LASER_SHOTS(30, STANDARD_CELL_CHARGE)
	select_name = "plasma"
	fire_sound = "hl13/sound/weapons/immolator_fire.ogg"

/obj/item/ammo_casing/energy/immolator_flame
	projectile_type = /obj/projectile/bullet/incendiary/fire
	firing_effect_type = null
	e_cost = LASER_SHOTS(5, STANDARD_CELL_CHARGE)
	select_name = "flame"
	fire_sound = "hl13/sound/weapons/flamethrower1.ogg"
	delay = 1.25 SECONDS
