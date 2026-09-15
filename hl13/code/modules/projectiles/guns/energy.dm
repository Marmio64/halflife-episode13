
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

	weapon_category = WEAPON_CAT_SPECIALTY

/obj/item/gun/energy/immolator/emag_act(mob/user, obj/item/card/emag/emag_card)
	if (obj_flags & EMAGGED)
		return FALSE
	balloon_alert(user, "firing pin modified")
	obj_flags |= EMAGGED
	unlock()
	return TRUE

/obj/item/gun/energy/immolator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, autofire_shot_delay = 0.25 SECONDS, overtime_penalty_cap = 8)

/obj/item/gun/energy/immolator/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	. = ..()
	if(!HAS_TRAIT(user, TRAIT_NOFIRE))
		if(prob(50))
			to_chat(user, "<span class='warning'>The Immolator burns your hand from its heat!</span>")
			user.adjustFireLoss(15)

/obj/item/gun/energy/immolator/hidden
	desc = "An alien looking plasma thrower which burns it's victims alive. It has short range, but can output a lot of damage. It can be toggled between flamer and plasma settings. This instance's internal generator has broken down over time, and it must be recharged with Combine batteries."
	cell_type = /obj/item/stock_parts/power_store/cell/hidden_immolator
	selfcharge = 0

/obj/item/stock_parts/power_store/cell/hidden_immolator
	name = "immolator power cell"
	maxcharge = STANDARD_CELL_CHARGE * 1.6

//TDM exclusive strider back-cannon
//i stole the code for this from monkestation's machining pr thank you for making my job so much easier
/obj/item/striderpack
	name = "cobbled-together power supply backpack"
	desc = "A crudely thrown-together, high-capacity dark energy power supply. Though deeply inefficient, it can still sustain enough power for a strider's pulse cannon."
	icon = 'icons/obj/service/hydroponics/equipment.dmi'
	icon_state = "pepperbackpacksec"
	inhand_icon_state = "pepperbackpacksec"
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	///The actual gun that you draw when you use it
	var/obj/item/gun/energy/striderpulse/gun
	///batteries of the striderpack
	var/obj/item/stock_parts/power_store/cell/battery
	///whether the gun is attached, FALSE is attached, TRUE is the gun is wielded.
	var/armed = FALSE


/obj/item/striderpack/Initialize(mapload)
	. = ..()
	gun = new(src)
	battery = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/striderpack/Destroy()
	//we do this check as a precaution (read: pass checks) since the backpack itself should have already deleted this
	if(!QDELETED(gun))
		qdel(gun)
	gun = null
	QDEL_NULL(battery)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/striderpack/attack_hand(mob/living/carbon/user, list/modifiers)
	if(armed)
		to_chat(user, span_warning("You are already holding the gun!"))
		return

	if(user.get_item_by_slot(ITEM_SLOT_BACK) == src)
		armed = TRUE
		if(!user.put_in_hands(gun))
			armed = FALSE
			to_chat(user, span_warning("You need a free hand to hold the gun!"))
			return
		update_appearance()
		user.update_worn_back()
		return

	return . = ..()

/obj/item/striderpack/item_interaction(mob/living/user, obj/item/weapon, list/modifiers)
	. = ..()
	if(weapon == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		return ..()


/obj/item/striderpack/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/striderpack/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = FALSE
	if(user)
		to_chat(user, span_notice("You attach the [gun.name] to the [name]."))
	else
		visible_message(span_warning("The [gun.name] snaps back onto the [name]!"))
	update_appearance()
	user.update_worn_back()


/obj/item/gun/energy/striderpulse
	name = "ripped-out strider cannon"
	desc = "The torn-out cannon of a Strider, with a trigger crudely mounted to its underside. Definitely a bad idea, but you'll take a wall or two down with you!"
	icon = 'hl13/icons/obj/guns/projectile.dmi'
	icon_state = "immolator"
	inhand_icon_state = "immolator"
	slowdown = 1
	slot_flags = null
	lefthand_file = 'hl13/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/guns_righthand.dmi'
	weapon_category = WEAPON_CAT_SPECIALTY
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	weapon_weight = WEAPON_HEAVY
	ammo_type = list(/obj/item/ammo_casing/energy/strider)
	item_flags = SLOWS_WHILE_IN_HAND
	self_charge_amount = (STANDARD_ENERGY_GUN_SELF_CHARGE_RATE * 8)
	selfcharge = TRUE
	can_charge = FALSE
	///the backpack we are linked to
	var/obj/item/striderpack/ammo_pack

/obj/item/gun/energy/striderpulse/Initialize(mapload)
	. = ..()
	if(!istype(loc, /obj/item/striderpack)) //We should spawn inside an ammo pack so let's use that one.
		return INITIALIZE_HINT_QDEL //No pack, no gun
	ammo_pack = loc
	AddElement(/datum/element/update_icon_blocker)

/obj/item/gun/energy/striderpulse/Destroy()
	//we do this check as a precaution (read: pass checks) since the backpack itself should have already deleted this
	if(!QDELETED(ammo_pack))
		qdel(ammo_pack)
	ammo_pack = null
	return ..()

/obj/item/gun/energy/striderpulse/attack_self(mob/living/user)
	return

/obj/item/gun/energy/striderpulse/dropped(mob/user)
	if(!ammo_pack)
		qdel(src)
		return
	ammo_pack.attach_gun(user)
	return ..()

/obj/item/gun/energy/striderpulse/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(!do_after(user, 2 SECONDS))
		return
	playsound(src, 'hl13/sound/weapons/stridercharge.ogg', 75, TRUE) //GET DOWN MR SECTORAL LEAD
	if(!do_after(user, 1 SECONDS))
		return
	..()


/obj/item/gun/energy/striderpulse/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, span_warning("You need the backpack power source to fire the gun!"))
	. = ..()
