/datum/action/cooldown/spell/conjure_item/infinite_guns/vort_blast
	name = "Vortal Blast"
	cooldown_time = 3 SECONDS
	desc = "Use the vortessence to ready a vortal bolt in your hand, which after a short channel duration will instantly hit a target."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "blast"
	background_icon_state = "bg_nature"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	item_type = /obj/item/gun/ballistic/rifle/enchanted/vort_blast

/datum/action/cooldown/spell/conjure_item/infinite_guns/vort_blast/super
	name = "Super Vortal Blast"
	desc = "Use the vortessence to ready a vortal bolt in your hand, which after a short channel duration will instantly hit a target. Landing a hit will deal a massive amount of damage, and melt apart flesh and bone alike."
	cooldown_time = 5 SECONDS
	item_type = /obj/item/gun/ballistic/rifle/enchanted/vort_blast/super

/obj/item/gun/ballistic/rifle/enchanted/vort_blast
	name = "vortal blast"
	desc = "Galunga. Do not attempt to dual wield."
	slot_flags = 0
	pin = /obj/item/firing_pin/magic
	guns_left = 0
	icon = 'icons/obj/weapons/hand.dmi'
	fire_sound = "hl13/sound/weapons/attack_charge.ogg"
	icon_state = "mansus"
	inhand_icon_state = "vort"
	lefthand_file = 'icons/mob/inhands/items/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/touchspell_righthand.dmi'
	item_flags = NEEDS_PERMIT | DROPDEL | ABSTRACT | NOBLUDGEON
	flags_1 = NONE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

	spread = 3

	var/cast_delay = 0.65 SECONDS

	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast

/obj/item/gun/ballistic/rifle/enchanted/vort_blast/super
	cast_delay = 0.5 SECONDS
	delete_on_use = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast/super
	guns_left = 50

/obj/item/gun/ballistic/rifle/enchanted/vort_blast/try_fire_gun(atom/target, mob/living/user, params)
	if(do_after(user, cast_delay, src))
		return ..()

/obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast
	max_ammo = 1
	ammo_type = /obj/item/ammo_casing/magic/vort_blast

/obj/item/ammo_casing/magic/vort_blast
	projectile_type = /obj/projectile/magic/vort_blast

/obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast/super
	ammo_type = /obj/item/ammo_casing/magic/vort_blast/super

/obj/item/ammo_casing/magic/vort_blast/super
	projectile_type = /obj/projectile/magic/vort_blast/super

/obj/projectile/magic/vort_blast
	name = "vortal bolt"
	icon_state = "xray"
	damage = 50
	wound_bonus = -100
	damage_type = BURN
	armor_flag = LASER
	armour_penetration = 15
	hitsound = 'hl13/sound/weapons/attack_shoot.ogg'
	hitscan = TRUE
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/xray
	muzzle_type = /obj/effect/projectile/muzzle/xray
	impact_type = /obj/effect/projectile/impact/xray

/obj/projectile/magic/vort_blast/super
	damage = 60
	wound_bonus = -80

/datum/action/cooldown/spell/touch/vort_heal
	name = "Mend"
	desc = "Use the vortessence and ready your hand to be able to heal someone else, or yourself at a lower rate."
	background_icon_state = "bg_nature"
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "mend"

	cooldown_time = 8 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	invocation_type = INVOCATION_NONE

	hand_path = /obj/item/melee/touch_attack/vort_heal

	can_cast_on_self = TRUE
	var/heal_rate = -30

/datum/action/cooldown/spell/touch/vort_heal/empowered
	name = "Empowered Mend"

	cooldown_time = 7 SECONDS
	heal_rate = -60

/obj/item/melee/touch_attack/vort_heal
	name = "Mending Hand"
	desc = "A healing ball of vortal energy."
	icon_state = "mansus"
	inhand_icon_state = "vort"

/datum/action/cooldown/spell/touch/vort_heal/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/caster)
	var/healing_amount = heal_rate
	playsound(caster, 'hl13/sound/weapons/attack_shoot.ogg', 50, TRUE)
	if(victim == caster)
		healing_amount *= 0.5 //you heal yourself half as fast
	victim.adjustBruteLoss(healing_amount)
	victim.adjustFireLoss(healing_amount)
	victim.set_eye_blur_if_lower(-6 SECONDS)
	victim.adjust_confusion(-6 SECONDS)
	victim.AdjustImmobilized(-2 SECONDS)
	victim.AdjustStun(-1 SECONDS)
	victim.visible_message(span_bold("[victim] appears to flash colors of green, before seemingly appearing healthier!"))
	to_chat(victim, span_warning("You feel soothed."))

	if(iscarbon(victim))
		var/mob/living/carbon/carbies = victim

		carbies.adjust_temppain(-50)

		if(carbies.blood_volume < BLOOD_VOLUME_OKAY) //Only good for keeping you from dying, not topping off blood.
			carbies.blood_volume += heal_rate*0.8 //24 units of blood restored when normal mend is used on someone else, 12 when used on yourself

	return TRUE

/datum/action/cooldown/spell/list_target/telepathy/vort
	desc = "Use the vortessence to telepathically transmit a message to the target."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "telepathy"
	background_icon_state = "bg_nature"

/datum/action/cooldown/spell/aoe/repulse/wizard/vort
	name = "Vortal Repulse"
	desc = "Clear your surroundings with the power of the vortessence."
	background_icon_state = "bg_nature"
	invocation = "TO THE VOID"
	cooldown_time = 40 SECONDS
	aoe_radius = 4
	cooldown_reduction_per_rank = 4 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

/datum/action/cooldown/spell/aoe/repulse/wizard/vort/super
	cooldown_time = 20 SECONDS

/datum/action/cooldown/spell/forcewall/vort
	name = "Vortal Wall"
	desc = "Create a magical barrier that only you can pass through. Be warned, this barrier will not last long."
	button_icon_state = "shield"
	background_icon_state = "bg_nature"

	sound = 'hl13/sound/weapons/attack_shoot.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 40 SECONDS
	cooldown_reduction_per_rank = 1.25 SECONDS

	invocation = "GHER AHLA GUNG"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	wall_type = /obj/effect/forcefield/wizard/vortal

/datum/action/cooldown/spell/forcewall/vort/super
	cooldown_time = 12 SECONDS

/obj/effect/forcefield/wizard/vortal
	name = "VORTAL BARRIER"
	desc = "A solid wall of green, vortal energy that looks rather fleeting."
	icon_state = "shield-green"
	initial_duration = 10 SECONDS

/datum/action/cooldown/spell/charge/vortal
	name = "Vortal Charge"
	desc = "This vortal power can be used to recharge a variety of things in your hands, such as charging batteries or even rejuvenating the powers of fellow vortigaunts. However, it will make the user very hungry on use and has a very long cooldown. Charges whoever you are pulling, otherwise it charges what is in your hand."

	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "charge"
	background_icon_state = "bg_nature"

	sound = 'hl13/sound/weapons/attack_shoot.ogg'
	school = SCHOOL_TRANSMUTATION
	cooldown_time = 4 MINUTES
	cooldown_reduction_per_rank = 5 SECONDS

	invocation = "GULING CHER"
	invocation_type = INVOCATION_WHISPER
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

/datum/action/cooldown/spell/charge/cast(mob/living/cast_on)
	cast_on.adjust_nutrition(-75)
	. = ..()
