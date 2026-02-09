//to do: modularize colt python, m4a1, ak47, and service rifle bullets/ammo casings.

//OSIPR altfire
/obj/item/gun/ballistic/revolver/grenadelauncher/ballslauncher
	desc = "An dark energy ball launcher."
	name = "energy ball launcher"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/grenadelauncher/ballslauncher
	fire_sound = "hl13/sound/weapons/ar2_altfire.ogg"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/revolver/grenadelauncher/ballslauncher/standardpin
	pin = /obj/item/firing_pin

//about 1.61 seconds TTK, also has good AP
/obj/item/gun/ballistic/automatic/ar2
	name = "\improper OSIPR"
	desc = "A pulse rifle often dubbed the 'AR2'. Boasts superior armor piercing capabilities, accuracy, and firepower. Usually biolocked to only be usable by authorised individuals."
	desc_controls = "Right-click to activate the alternative fire."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "ar2"
	inhand_icon_state = "arg"
	fire_sound = "hl13/sound/weapons/ar2fire.ogg"
	vary_fire_sound = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/ar2
	force = 12
	recoil = 0.3
	fire_delay = 2
	burst_size = 1
	spread = 3
	mag_display = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	pin = /obj/item/firing_pin/implant/mindshield
	var/obj/item/gun/ballistic/revolver/grenadelauncher/ballslauncher/underbarrel

	load_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'
	load_empty_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'

	eject_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'
	eject_empty_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'

	rack_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'
	lock_back_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'
	bolt_drop_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'

	inhand_icon_state = "ar2"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/ar2/nopin
	pin = null

/obj/item/gun/ballistic/automatic/ar2/emag_act(mob/user, obj/item/card/emag/emag_card)
	if (obj_flags & EMAGGED)
		return FALSE
	balloon_alert(user, "firing pin modified")
	obj_flags |= EMAGGED
	unlock()
	return TRUE

/obj/item/gun/ballistic/automatic/ar2/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.23 SECONDS)
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/ballslauncher(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/ar2/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/automatic/ar2/standardpin
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/ar2/standardpin/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.23 SECONDS)
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/ballslauncher/standardpin(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/ar2/try_fire_gun(atom/target, mob/living/user, params)
	if(LAZYACCESS(params2list(params), RIGHT_CLICK))
		return underbarrel.try_fire_gun(target, user, params)
	return ..()

/obj/item/gun/ballistic/automatic/ar2/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(isammocasing(tool))
		if(istype(tool, underbarrel.magazine.ammo_type))
			underbarrel.attack_self(user)
			underbarrel.attackby(tool, user, list2params(modifiers))
		return ITEM_INTERACT_BLOCKING
	return ..()

//old rifles that are exclusively loot. Similar to the AR2, but slightly less accurate, slightly less AP and slightly slower to fire.
//about 1.96 seconds TTK
/obj/item/gun/ballistic/automatic/m4a1
	name = "\improper M4A1 Rifle"
	desc = "A old M4A1 pattern rifle. Not as good as the combine's rifles, but still powerful."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "m4a1"
	fire_sound = "sound/items/weapons/gun/rifle/shot.ogg"
	vary_fire_sound = FALSE
	load_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	load_empty_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	rack_sound = "sound/items/weapons/gun/rifle/bolt_in.ogg"
	eject_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	eject_empty_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/m4a1
	force = 12
	fire_delay = 2
	burst_size = 1
	spread = 4
	recoil = 0.5
	can_suppress = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY

	inhand_icon_state = "service"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/m4a1/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/m4a1/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.28 SECONDS)

//sidegrade to the m4a1. Heavier duty: More spread, damage and recoil and less firing speed.
//about 1.85 seconds TTK, and good AP
/obj/item/gun/ballistic/automatic/ak47
	name = "\improper AK-47 Rifle"
	desc = "An old AK-47 without the stock. This thing is going to kick like a mule without that stock... but it should still hit just as hard."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "ak47"
	fire_sound = "hl13/sound/weapons/ak47fire.ogg"
	vary_fire_sound = FALSE
	load_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	load_empty_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	rack_sound = "sound/items/weapons/gun/rifle/bolt_in.ogg"
	eject_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	eject_empty_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/ak47
	force = 12
	fire_delay = 2
	burst_size = 1
	spread = 7
	recoil = 0.7
	can_suppress = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY

	inhand_icon_state = "ak47"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/ak47/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/ak47/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.37 SECONDS)

//cargo pack service rifle intended for 'conscripts'. Pretty much the m4a1, but uses smaller magazines with a 20 round capacity rather than 30.
//about 1.96 seconds TTK, also has good AP
/obj/item/gun/ballistic/automatic/servicerifle
	name = "\improper Service Rifle"
	desc = "An old surplus rifle from decades ago. Uses 5.56mm rounds, and remains an effective weapon even though it has a low magazine capacity."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "service"
	fire_sound = "sound/items/weapons/gun/rifle/shot.ogg"
	vary_fire_sound = FALSE
	load_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	load_empty_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	rack_sound = "sound/items/weapons/gun/rifle/bolt_in.ogg"
	eject_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	eject_empty_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/m4a1/service
	force = 12
	fire_delay = 2
	burst_size = 1
	spread = 5
	recoil = 0.5
	can_suppress = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY

	inhand_icon_state = "service"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/servicerifle/no_mag
	spawnwithmagazine = FALSE

//wooden variation cause it looks cool
/obj/item/gun/ballistic/automatic/servicerifle/wood
	desc = "An old wood-furnished surplus rifle from decades ago. Uses 5.56mm rounds, and remains an effective weapon even though it has a low magazine capacity."
	icon_state = "service_wood"
	inhand_icon_state = "service_wood"

/obj/item/gun/ballistic/automatic/servicerifle/wood/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/servicerifle/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.28 SECONDS)

//the crossbow
/*
/obj/item/gun/ballistic/bow/crossbow/rebar
	name = "Heated Rebar Crossbow"
	desc = "A handcrafted crossbow that fires heated rods of rebar."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	fire_sound = "hl13/sound/weapons/crossbowfire.ogg"
	draw_sound = 'hl13/sound/weapons/crossbowbolt_load.ogg'
	icon_state = "rebarxbow"
	inhand_icon_state = "rebarxbow"
	vary_fire_sound = FALSE
	force = 12
	spread = 0
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/rebar
*/


/obj/item/gun/ballistic/combine_sniper
	name = "combine sniper rifle"
	desc = "A pulse based marksmen rifle which fires high velocity, devestating rounds. It's unique pulse rounds gain velocity and stopping power the further they travel, use at long distance for maximum effect."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "combine_sniper"
	inhand_icon_state = "combine_sniper"
	fire_sound = 'hl13/sound/weapons/sniper.ogg'

	var/charge_sound = 'hl13/sound/weapons/sniper_charge.ogg'

	fire_sound_volume = 60
	vary_fire_sound = FALSE
	spread = 0 //very accurate
	force = 15
	recoil = 4
	weapon_weight = WEAPON_HEAVY
	fire_delay = 18
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 0.25

	var/after_shot_delay = 1 SECONDS

	accepted_magazine_type = /obj/item/ammo_box/magazine/combine_sniper
	pin = /obj/item/firing_pin/implant/mindshield
	//var/obj/item/attachment/laser_sight/combine/laser

	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/combine_sniper/slow
	after_shot_delay = 1.25 SECONDS
	fire_delay = 24

/obj/item/gun/ballistic/combine_sniper/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

/*
/obj/item/gun/ballistic/combine_sniper/Initialize(mapload)
	. = ..()
	laser = new(src)
	laser.on_attach(src)

/obj/item/gun/ballistic/combine_sniper/afterattack(atom/target, mob/living/user, flag, params)
	if(laser.is_on == FALSE)
		to_chat(user, span_userdanger("The laser pointer needs to be on to fire \the [src]!"))
		return
	. = ..()
*/

/obj/item/gun/ballistic/combine_sniper/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	. = ..()
	sleep(after_shot_delay)
	playsound(user, charge_sound, fire_sound_volume, vary_fire_sound)


// about 2.8 seconds TTK (time to knock/crit)
/obj/item/gun/ballistic/automatic/pistol/usp
	name = "USP Match"
	desc = "A small and light 9mm pistol which is often used as a metropolice standard carry."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "uspmatch"
	accepted_magazine_type = /obj/item/ammo_box/magazine/usp9mm
	can_suppress = TRUE
	fire_sound = "hl13/sound/weapons/uspfire.ogg"
	recoil = 0.2
	spread = 5
	vary_fire_sound = FALSE

	inhand_icon_state = "usp"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/pistol/usp/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.35 SECONDS, overtime_penalty_increase = 0.8)

/obj/item/gun/ballistic/automatic/pistol/usp/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/usp/extended
	spawn_magazine_type = /obj/item/ammo_box/magazine/usp9mm/extended

/obj/item/gun/ballistic/automatic/pistol/usp/riot
	spawn_magazine_type = /obj/item/ammo_box/magazine/usp9mm/rubber

/obj/item/gun/ballistic/automatic/pistol/usp/riot/civ_pro_vendor
	custom_price = 4
	custom_premium_price = 4

/obj/item/gun/ballistic/automatic/pistol/usp/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)

// about 3.33 seconds TTK
/obj/item/gun/ballistic/automatic/pistol/makeshift
	name = "makeshift pistol"
	desc = "A scrappy looking pistol that was put together shoddily with scrap metal and basic tools. The 9mm pistol looks terrible to fire, though it should be small enough to fit in your pockets."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "makeshift"
	accepted_magazine_type = /obj/item/ammo_box/magazine/makeshift9mm
	can_suppress = TRUE
	fire_sound = "hl13/sound/weapons/uspfire.ogg"
	spread = 8
	recoil = 0.3
	fire_delay = 3
	vary_fire_sound = FALSE

	inhand_icon_state = "zipgun"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/pistol/makeshift/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.37 SECONDS)

/obj/item/gun/ballistic/automatic/pistol/makeshift/no_mag
	spawnwithmagazine = FALSE

// about 2.4 seconds TTK assuming you hit your first shot (so no cooldown)
/obj/item/gun/ballistic/revolver/coltpython
	name = "\improper colt python"
	desc = "An old colt python revolver, accurate but has the kick of a mule. Uses .357 magnum ammo. Its shiny sheen reveals a giddy glint in your eyes as you imagine the havoc it can cause."
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/coltpython
	fire_sound = "hl13/sound/weapons/revolverfire.ogg"
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "colt_python"
	inhand_icon_state = "colt_python"
	spread = 2 //very little spread
	recoil = 2 //lots of recoil though
	fire_delay = 8
	vary_fire_sound = FALSE

/obj/item/gun/ballistic/revolver/coltpython/deathmatch_ranger
	fire_delay = 12 //geared towards sniping, not mag dumping

// about 2.5 seconds TTK
/obj/item/gun/ballistic/revolver/snubnose
	name = "\improper snubnose revolver"
	desc = "A well maintained old world .38 snub nosed revolver, good for fitting in your pocket. Often carried as a weapon of last resort by high ranking combine represenatives entering dangerous areas."
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/snubnose
	fire_sound = "hl13/sound/weapons/revolverfire.ogg"
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "snubnose"
	spread = 11 //snubnosed
	recoil = 0.5
	fire_delay = 5
	vary_fire_sound = FALSE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/gun/ballistic/revolver/snubnose/warden
	name = "\improper warden's snubnose revolver"
	desc = "A well maintained, smooth looking revolver. It is small, compact, and only fires .38 rounds. It seems intimidating, but barely fired. Ammunition for this gun is likely very sparse."

// Can technically down someone in about a second if you hit all pellets point blank in two shots, but unlikely.
/obj/item/gun/ballistic/shotgun/spas12
	name = "SPAS 12"
	desc = "A spectacularly lethal pump action shotgun, for close encounters."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "spas12"
	slot_flags = ITEM_SLOT_SUITSTORE
	inhand_icon_state = "shotgun_combat"
	fire_sound = "hl13/sound/weapons/shotgunfire.ogg"
	rack_sound = "hl13/sound/weapons/shotgunpump.ogg"
	load_sound = "hl13/sound/weapons/shotgunreload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/com/spas12
	force = 12
	recoil = 1.5
	fire_delay = 9
	vary_fire_sound = FALSE
	desc_controls = "Right-click to activate the alternative fire."
	var/altfire = FALSE
	///Tracks which shell of the altfire is loaded. TRUE means this is the second shell.
	var/onefreebullet = FALSE

	inhand_icon_state = "spas12"
	lefthand_file = 'hl13/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/64x_guns_right.dmi'

/obj/item/gun/ballistic/shotgun/spas12/try_fire_gun(atom/target, mob/living/user, params)
	if(LAZYACCESS(params2list(params), RIGHT_CLICK))
		altfire = TRUE
		burst_size = 2
		fire_delay = 1
	else if(LAZYACCESS(params2list(params), LEFT_CLICK))
		altfire = FALSE
		burst_size = 1
	onefreebullet = FALSE
	return ..()

/obj/item/gun/ballistic/shotgun/spas12/shoot_live_shot(mob/living/user)
	..()
	if(altfire && !onefreebullet)
		onefreebullet = TRUE
		rack_delay = 8
		recent_rack = world.time + rack_delay
		rack(user)
		projectile_damage_multiplier = 0.5
	else if(onefreebullet)
		onefreebullet = FALSE
		projectile_damage_multiplier = 1

/obj/item/gun/ballistic/shotgun/spas12/rack()
	..()
	if(!onefreebullet)
		rack_delay = 5

/obj/item/ammo_box/magazine/internal/shot/com/spas12
	name = "spas12 internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot/halflife
	max_ammo = 6

/obj/item/gun/ballistic/shotgun/spas12/beanbag
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/com/spas12

/obj/item/ammo_box/magazine/internal/shot/com/spas12/beanbag
	ammo_type = /obj/item/ammo_casing/shotgun/halflife/beanbag

/obj/item/storage/box/lethalshot/halflife
	name = "box of shotgun shells (Lethal)"
	desc = "A box full of lethal shotgun shells, designed for shotguns."
	icon_state = "lethalshot_box"
	illustration = null

/obj/item/storage/box/lethalshot/halflife/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/buckshot/halflife(src)

/obj/item/storage/box/lethalshot/halflife/beanbag
	name = "box of shotgun shells (Beanbag)"
	desc = "A box full of less-lethal beanbag shells, designed for shotguns."

/obj/item/storage/box/lethalshot/halflife/beanbag/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/halflife/beanbag(src)

// really shit TTK if you're using against humans, but antixen rounds can obliterate zombies/antlions
/obj/item/gun/ballistic/shotgun/antixen
	name = "Combine Cleanup Device"
	desc = "A combine manufactured device that is designed to work with both anti-xenian infestation control buckshot rounds, and rock mining slugs. In essence, it is a 16-gauge shotgun that only accepts specialty rounds, but it looks bad to give workers something plainly called a gun."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "antixenshotgun"
	slot_flags = ITEM_SLOT_SUITSTORE
	fire_sound = "hl13/sound/weapons/antixen_fire.ogg"
	rack_sound = "hl13/sound/weapons/antixen_pump.ogg"
	load_sound = "hl13/sound/weapons/antixen_reload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/antixen
	force = 12
	recoil = 1.6
	fire_delay = 15
	vary_fire_sound = FALSE
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	inhand_icon_state = "antixenshotgun"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/storage/box/lethalshot/halflife/antixen
	name = "box of shotgun shells (anti-xen)"
	desc = "A box full of anti-xen rounds, for the CUCD."

/obj/item/storage/box/lethalshot/halflife/antixen/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/buckshot/antixen(src)

/obj/item/storage/box/lethalshot/halflife/mining
	name = "box of shotgun shells (mining)"
	desc = "A box full of mining slugs, for the CMD."

/obj/item/storage/box/lethalshot/halflife/mining/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/mining(src)

/obj/item/storage/box/lethalshot/halflife/pulse
	name = "box of shotgun shells (pulse)"
	desc = "A box full of puleshot rounds, for the pulse shotgun."

/obj/item/storage/box/lethalshot/halflife/pulse/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/buckshot/pulse(src)

/obj/item/gun/ballistic/shotgun/antixen/mining
	name = "Combine Mining Device"
	pin = /obj/item/firing_pin/mining_gun
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/antixen/mining

/obj/item/ammo_box/magazine/internal/shot/antixen
	name = "antixen internal magazine"
	caliber = CALIBER_ANTIXEN
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot/antixen
	max_ammo = 4

/obj/item/ammo_box/magazine/internal/shot/antixen/mining
	ammo_type = /obj/item/ammo_casing/shotgun/mining

/obj/item/firing_pin/mining_gun
	name = "mining firing pin"
	desc = "This safety firing pin only allows weapons to be fired near the mines."
	fail_message = "mining check failed!"

/obj/item/firing_pin/mining_gun/pin_auth(mob/living/user)
	if(!istype(user))
		return FALSE
	if (istype(get_area(user), /area/halflife/indoors/sewer))
		return TRUE
	return FALSE

//Super freaking powerful shotgun, will pointblank 2 shot most people, even if they're wearing decent armor
/obj/item/gun/ballistic/shotgun/pulse
	name = "Pulse Shotgun"
	desc = "A high power pulse shotgun that fires incredibly devestating rounds."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "antixenshotgun"
	slot_flags = ITEM_SLOT_SUITSTORE
	fire_sound = "hl13/sound/weapons/pulseshotgunfire.ogg"
	rack_sound = "hl13/sound/weapons/antixen_pump.ogg"
	load_sound = "hl13/sound/weapons/antixen_reload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/pulse
	force = 20
	recoil = 1.7
	fire_delay = 20
	vary_fire_sound = FALSE
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	inhand_icon_state = "antixenshotgun"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/ammo_box/magazine/internal/shot/pulse
	name = "pulseshotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot/pulse
	max_ammo = 8

/obj/item/gun/ballistic/revolver/grenadelauncher/mp7launcher
	desc = "A 20mm underbarrel grenade launcher."
	name = "20mm grenade launcher"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/grenadelauncher/mp7launcher
	fire_sound = "hl13/sound/weapons/grenade_launcher.ogg"
	pin = /obj/item/firing_pin

// About 2.1 seconds TTK
/obj/item/gun/ballistic/automatic/mp7
	name = "\improper MP7 SMG"
	desc = "Despite its small size, this submachine gun packs a punch and has an extended mag to keep opponents suppressed."
	desc_controls = "Right-click to activate the alternative fire."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "mp7"
	fire_sound = "hl13/sound/weapons/smgfire.ogg"
	load_sound = "hl13/sound/weapons/smgload.ogg"
	load_empty_sound = "hl13/sound/weapons/smgload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/mp7
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	show_bolt_icon = FALSE
	burst_size = 1
	fire_delay = 1
	spread = 9
	recoil = 0.1
	vary_fire_sound = FALSE
	inhand_icon_state = "mp7"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'
	var/obj/item/gun/ballistic/revolver/grenadelauncher/underbarrel

/obj/item/gun/ballistic/automatic/mp7/rubber
	spawn_magazine_type = /obj/item/ammo_box/magazine/mp7/rubber

/obj/item/gun/ballistic/automatic/mp7/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/mp7/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS, overtime_penalty_increase = 0.8, overtime_penalty_cap = 12)
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/mp7launcher(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/mp7/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/automatic/mp7/try_fire_gun(atom/target, mob/living/user, params)
	if(LAZYACCESS(params2list(params), RIGHT_CLICK))
		return underbarrel.try_fire_gun(target, user, params)
	return ..()

/obj/item/gun/ballistic/automatic/mp7/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(isammocasing(tool))
		if(istype(tool, underbarrel.magazine.ammo_type))
			underbarrel.attack_self(user)
			underbarrel.attackby(tool, user, list2params(modifiers))
		return ITEM_INTERACT_BLOCKING
	return ..()

//about 1.87 seconds TTK with AP. While it has a bit higher DPS than the m4a1/service rifle, it is slightly less accurate at range and has to reload more often
/obj/item/gun/ballistic/automatic/pulsesmg
	name = "\improper pulse SMG"
	desc = "A hybrid between the MP7 and AR2, the pulse smg has biolocking features and higher power rounds than the standard MP7, but is not yet as powerful as the AR2."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "pulsesmg"
	fire_sound = 'hl13/sound/weapons/pulsesmgfire.ogg'
	vary_fire_sound = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/pulsesmg
	spread = 6
	recoil = 0.1
	fire_delay = 2
	burst_size = 1
	mag_display = FALSE
	weapon_weight = WEAPON_MEDIUM
	pin = /obj/item/firing_pin/implant/mindshield

	load_sound = 'hl13/sound/weapons/insert_alyx.ogg'
	load_empty_sound = 'hl13/sound/weapons/insert_alyx.ogg'

	eject_sound = 'hl13/sound/weapons/eject_alyx.ogg'
	eject_empty_sound = 'hl13/sound/weapons/eject_alyx.ogg'

	dry_fire_sound = 'hl13/sound/weapons/empty_alyx.ogg'

	rack_sound = 'hl13/sound/weapons/slidelock_alyx.ogg'
	lock_back_sound = 'hl13/sound/weapons/slidelock_alyx.ogg'
	bolt_drop_sound = 'hl13/sound/weapons/slidelock_alyx.ogg'

/obj/item/gun/ballistic/automatic/pulsesmg/emag_act(mob/user, obj/item/card/emag/emag_card)
	if (obj_flags & EMAGGED)
		return FALSE
	balloon_alert(user, "firing pin modified")
	obj_flags |= EMAGGED
	unlock()
	return TRUE

/obj/item/gun/ballistic/automatic/pulsesmg/nopin
	pin = null

/obj/item/gun/ballistic/automatic/pulsesmg/standardpin
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/pulsesmg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.17 SECONDS, overtime_penalty_increase = 0.9)

/obj/item/ammo_box/strilka310/a762 //yay recycled code. recycles sprites because im too lazy to port a proper stripper clip sprite.
	name = "stripper clip (7.62mm)"
	caliber = CALIBER_N762
	ammo_type = /obj/item/ammo_casing/n762

/obj/item/ammo_box/magazine/internal/boltaction/mosin
	caliber = CALIBER_N762
	ammo_type = /obj/item/ammo_casing/n762

/obj/item/ammo_box/magazine/internal/boltaction/mosin/start_empty
	start_empty = TRUE

/// Aprox 36 damage a shot, 4 shots to crit, can crit in as fast as ~1.8 seconds assuming it doesn't jam (though it is statistically likely to do so)
/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant
	name = "mosin-nagant rifle"
	desc = "A ratty old pre-war rifle that was developed over a century ago. While it kicks like a mule and is rather cheap, it's slow to fire and may jam on occasion. Slightly moist."
	icon = 'hl13/icons/obj/guns/wideguns.dmi'
	icon_state = "mosin_nagant"
	inhand_icon_state = "mosin_nagant"
	worn_icon_state = "mosin_nagant"
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin
	can_jam = TRUE
	jamming_increment = 0
	jamming_chance = 15
	projectile_damage_multiplier = 1.3
	projectile_wound_bonus = -45
	spread = 2 //it has a stock
	recoil = 0.5 //probably the only gun in the game other than M4A1 and service rifle with a real stock
	fire_delay = 6 //its already boltaction but to make sure that someone who's really good at pressing Z doesnt just lay down suppressive fire
	sawn_desc = "A ratty old pre-war rifle that was developed over a century ago. Someone seems to have taken this prized historical artifact and sawed it in half, creating an Obrez. Still moist, though."
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/well_maintained
	jamming_chance = 5

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/start_empty
	magazine = /obj/item/ammo_box/magazine/internal/boltaction/mosin/start_empty

/obj/item/storage/toolbox/halflife_ammobox
	name = "ammo canister"
	desc = "A metal canister designed to hold ammunition."
	icon_state = "ammobox"
	inhand_icon_state = "ammobox"
	lefthand_file = 'icons/mob/inhands/equipment/toolbox_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/toolbox_righthand.dmi'
	has_latches = FALSE
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'


/obj/item/storage/toolbox/halflife_ammobox/bunker
	name = "polish surplus ammobox"

/obj/item/storage/toolbox/halflife_ammobox/bunker/PopulateContents()
	new /obj/item/ammo_box/magazine/m4a1/service(src)
	new /obj/item/ammo_box/strilka310/a762(src)
	new /obj/item/ammo_box/strilka310/a762(src)
	new /obj/item/ammo_box/strilka310/a762(src)
	new /obj/item/ammo_box/strilka310/a762(src)

//slow to fire for about the first second, but ramps up to have a rate of fire around that of the MP7, but with deadlier rounds and a huge mag capacity. It's inaccuracy however makes it best at laying down cover fire
/obj/item/gun/ballistic/automatic/pulselmg
	name = "\improper Pulse LMG"
	desc = "A pulse machine gun which fires heavy duty rounds that while inaccurate, are very numerous. Fire rate increases as the trigger is held down. It's large heft makes carrying it quite difficult."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "suppressor"
	inhand_icon_state = "suppressor"
	fire_sound = "hl13/sound/weapons/pulselmg_fire.ogg"
	vary_fire_sound = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/pulselmg
	force = 12
	spread = 20
	recoil = 0.1
	fire_delay = 2
	burst_size = 1
	mag_display = TRUE
	vary_fire_sound = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	item_flags = SLOWS_WHILE_IN_HAND | NEEDS_PERMIT
	pin = /obj/item/firing_pin/implant/mindshield

	slowdown = 0.5
	drag_slowdown = 0.5

	load_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'
	load_empty_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'

	eject_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'
	eject_empty_sound = 'hl13/sound/weapons/ar2_reload_rotate.ogg'

	rack_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'
	lock_back_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'
	bolt_drop_sound = 'hl13/sound/weapons/ar2_reload_push.ogg'

	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/pulselmg/nopin
	pin = null

/obj/item/gun/ballistic/automatic/pulselmg/standardpin
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/pulselmg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.5 SECONDS, TRUE, 0.3, 0.4, 0.7 SECONDS, overtime_penalty_cap = 5)

//(autofire_shot_delay, windup_autofire, windup_autofire_reduction_multiplier, windup_autofire_cap, windup_spindown, allow_akimbo = TRUE)

//Small upgrade to the ak47. Has around the same DPS but has far better recoil and spread control and a scope, but runs through ammo pretty quickly with its 10 round mags.
//about 2.2 seconds TTK, and good AP
/obj/item/gun/ballistic/automatic/svd
	name = "\improper SVD Rifle"
	desc = "A rare beautiful thing, this semi-automatic designated marksman rifle will take the hat off an elite at two thousand yards, and they ain't cheap."
	icon = 'hl13/icons/obj/guns/wideguns.dmi'
	icon_state = "svd"
	inhand_icon_state = "svd"
	fire_sound = "hl13/sound/weapons/svdfire.ogg"
	fire_sound_volume = 75
	vary_fire_sound = FALSE
	load_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	load_empty_sound = "sound/items/weapons/gun/rifle/rifleload.ogg"
	rack_sound = "sound/items/weapons/gun/rifle/bolt_in.ogg"
	eject_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	eject_empty_sound = "sound/items/weapons/gun/rifle/rifleunload.ogg"
	accepted_magazine_type = /obj/item/ammo_box/magazine/svd
	force = 12
	fire_delay = 5
	burst_size = 1
	spread = 2
	recoil = 0.5
	projectile_damage_multiplier = 1.5
	can_suppress = FALSE
	mag_display = TRUE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY

	inhand_x_dimension = 64

	lefthand_file = 'hl13/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/64x_guns_right.dmi'

/obj/item/gun/ballistic/automatic/svd/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/svd/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.55 SECONDS)

/obj/item/gun/ballistic/automatic/svd/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

//1.5 second down time, but very close range
/obj/item/gun/energy/immolator

	selfcharge = 1
	shaded_charge = FALSE
	charge_delay = 5
	ammo_type = list(/obj/item/ammo_casing/energy/immolator, /obj/item/ammo_casing/energy/immolator_flame)

	self_charge_amount = (STANDARD_ENERGY_GUN_SELF_CHARGE_RATE * 2)

	name = "\improper Immolator"
	desc = "An alien looking plasma thrower which burns it's victims alive. It has short range, but can output a lot of damage. It can be toggled between flamer and plasma settings. After firing for an extended duration, you must wait for it to recharge."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "immolator"
	inhand_icon_state = "immolator"
	fire_sound = "hl13/sound/weapons/immolator_fire.ogg"
	//vary_fire_sound = FALSE
	fire_sound_volume = 25
	force = 16
	recoil = 0
	fire_delay = 2
	burst_size = 1
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	pin = /obj/item/firing_pin/implant/mindshield

	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

	slot_flags = 0

	item_flags = SLOWS_WHILE_IN_HAND | NEEDS_PERMIT

	slowdown = 0.66
	drag_slowdown = 0.66

	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/energy/immolator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.25 SECONDS, overtime_penalty_cap = 3)

/obj/item/gun/energy/immolator/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	. = ..()
	if(!HAS_TRAIT(user, TRAIT_NOFIRE))
		if(prob(50))
			to_chat(user, "<span class='warning'>The Immolator burns your hand from its heat!</span>")
			user.adjustFireLoss(15)

/obj/item/gun/energy/immolator/hidden
	desc = "An alien looking plasma thrower which burns it's victims alive. It has short range, but can output a lot of damage. It can be toggled between flamer and plasma settings. This variant cannot self recharge, and must be recharged with combine batteries."
	cell_type = /obj/item/stock_parts/power_store/cell/hidden_immolator
	selfcharge = 0

/obj/item/stock_parts/power_store/cell/hidden_immolator
	name = "immolator power cell"
	maxcharge = STANDARD_CELL_CHARGE * 1.6

/obj/item/gun/ballistic/rocketlauncher/halflife
	name = "\improper Rocket Launcher"
	desc = "A reusable rocket propelled grenade launcher. An arrow pointing toward the front of the launcher \
		alongside the words \"Front Toward Enemy\" are printed on the tube. A sticker near the back of the launcher warns \
		to \"CHECK BACKBLAST CLEAR BEFORE FIRING\", whatever that means. It's weight and heft prevent you from stowing it, and significantly slows you down. Supposedly, the armor piercing rockets this thing fires excel at taking down Hunter synths."
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	SET_BASE_PIXEL(0, 0)
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/rocketlauncher_halflife
	fire_sound = "hl13/sound/weapons/rocketfire1.ogg"
	vary_fire_sound = FALSE
	pin = /obj/item/firing_pin
	empty_indicator = TRUE

	item_flags = SLOWS_WHILE_IN_HAND | NEEDS_PERMIT

	slowdown = 0.75
	drag_slowdown = 0.75

	spread = 0
	recoil = 0

	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'

/obj/item/ammo_box/magazine/internal/rocketlauncher_halflife
	name = "rocket launcher internal magazine"
	ammo_type = /obj/item/ammo_casing/rocket/hl13
	caliber = CALIBER_84MM
	max_ammo = 1
