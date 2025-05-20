/obj/item/clothing/neck/anti_magic_collar
	name = "vortessence restrictor"
	desc = "A contraption which prevents vortigaunts from using the vortessence. Alt clicking with a high level identification card may unlock it, or you can use a high power saw to try to cut it off."
	icon_state = "antimagiccollar"
	icon = 'hl13/icons/obj/clothing/neck.dmi'
	resistance_flags = FIRE_PROOF
	req_access = list(ACCESS_SECURITY) //what access can unlock a restrictor
	//species_restricted = VORTS_ONLY
	var/lockactive = FALSE
	var/previously_unlocked = FALSE

/obj/item/clothing/neck/anti_magic_collar/equipped(mob/user, slot, initial = FALSE)
	. = ..()
	if((slot & slot_flags))
		to_chat(user, span_danger("You hear the collar click as it locks around your neck!"))
		lockactive = TRUE
		ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT(type))
		RegisterSignal(user, COMSIG_MOB_RESTRICT_MAGIC, PROC_REF(restrict_casting_magic))
		return

/obj/item/clothing/neck/anti_magic_collar/dropped(mob/user)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_RESTRICT_MAGIC)

///Prevents any magic from being used by the user.
/obj/item/clothing/neck/anti_magic_collar/proc/restrict_casting_magic(mob/user, magic_flags)
	SIGNAL_HANDLER
	return COMPONENT_MAGIC_BLOCKED

/obj/item/clothing/neck/anti_magic_collar/click_alt(mob/user)
	if (allowed(user))
		unlock()

/obj/item/clothing/neck/anti_magic_collar/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(!lockactive)
		to_chat(user, span_notice("The collar isn't locked. No point in zapping it."))
		return

	var/mob/living/carbon/human/H = user

	if (!H)
		return

	var/obj/item/bodypart/head/head = H.get_bodypart("head")
	H.apply_damage(40, BURN, head)
	to_chat(H, span_userdanger("You feel a sharp sensation as electricity jumps from the collar into your skin, frying your flesh. At the least, it seems the collar has unlocked."))
	H.emote("scream")
	unlock()
	return TRUE

/obj/item/clothing/neck/anti_magic_collar/proc/unlock()
	if(!previously_unlocked)
		SSsociostability.modifystability(-50) //free vorts are generally not good for stability
	audible_message(span_danger("You hear a click, the restrictor unlocks, and is now removable!"))
	lockactive = FALSE
	previously_unlocked = TRUE
	REMOVE_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT(type))

/obj/item/clothing/neck/anti_magic_collar/attackby(obj/item/W, mob/user, params)
	if(!lockactive)
		to_chat(user, span_notice("The collar isn't locked. No point in cutting it."))
		return

	if(istype(W, /obj/item/circular_saw))
		var/mob/living/carbon/human/H = user

		if (!H)
			return

		if(tgui_alert(H, "Are you sure you want to try cutting this collar? It may be very dangerous, even deadly, and the collar will be destroyed if succesful.", "Cut Collar", list("Yes", "No")) == "Yes")
			to_chat(H, span_userdanger("You start sawing into the collar..."))
			if(do_after(H, 12 SECONDS, src))
				playsound(src, 'sound/items/handling/surgery/saw.ogg', 50, TRUE)
				var/obj/item/bodypart/head/head = H.get_bodypart("head")
				if(prob(50))
					to_chat(H, span_userdanger("The saw slips from the collar, and plunges directly into your neck."))
					sleep(0.5 SECONDS)
					H.emote("scream")
					head.force_wound_upwards(/datum/wound/slash/flesh/critical)
					H.apply_damage(75, BRUTE, head)
				else if(prob(50))
					to_chat(H, span_userdanger("The saw digs deep into the collar, but slips and nicks your neck. You quickly pull away for now, but you can retry."))
					H.apply_damage(25, BRUTE, head)
				else
					head.force_wound_upwards(/datum/wound/slash/flesh/moderate)
					H.apply_damage(50, BRUTE, head)
					to_chat(H, span_userdanger("The saw digs deep into the collar, eventually even reaching the flesh. The pain is unbearable, but you power through and cut the collar in two, unlocking it."))
					H.emote("scream")
					unlock()
					qdel(src)
			else
				to_chat(H, span_notice("You stop midway, and fail to cut anything."))
		else
			to_chat(H, span_notice("You decide to not risk cutting off your head."))
