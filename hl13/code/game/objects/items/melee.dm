/obj/item/melee/sledgehammer
	name = "sledgehammer"
	desc = "An archaic tool used to drive nails and break down hollow walls."
	icon = 'icons/obj/weapons/hammer.dmi'
	icon_state = "sledgehammer"
	inhand_icon_state = "sledgehammer"
	lefthand_file = 'icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/hammers_righthand.dmi'
	force = 10 /// The weapon requires two hands
	wound_bonus = 5
	throwforce = 18
	throw_range = 3 /// Doesn't throw very far
	demolition_mod = 3 // BREAK THINGS
	drag_slowdown = 0.5
	slowdown = 0.5
	hitsound = 'sound/items/weapons/smash.ogg' /// Hitsound when thrown at someone
	attack_verb_continuous = list("attacks", "bashes", "strikes", "smashes")
	attack_verb_simple = list("attack", "bash", "strik", "smash")
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK

/obj/item/melee/sledgehammer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_wielded = 29, \
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
		require_twohands = TRUE, \
	)

/obj/item/melee/sledgehammer/proc/on_wield(atom/source, mob/living/user)
	hitsound = "swing_hit"

/obj/item/melee/sledgehammer/proc/on_unwield(atom/source, mob/living/user)
	hitsound = initial(hitsound)

/obj/item/melee/sledgehammer/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!HAS_TRAIT(src, TRAIT_WIELDED) && user)
		/// This will already do low damage, so it doesn't need to be intercepted earlier
		to_chat(user, span_danger("\The [src] is too heavy to attack effectively without being wielded!"))
		return

	if(!proximity_flag)
		return

	if(target.uses_integrity)
		if(!QDELETED(target))
			if(istype(target, /obj/structure/window)) // Sledgehammer really good at smashing windows. 2-7 hits to kill a window
				target.take_damage(target.max_integrity/2, BRUTE, MELEE, FALSE, null, armour_penetration)
			if(iswallturf(target))
				target.take_damage(force * demolition_mod, BRUTE, MELEE, FALSE, null, armour_penetration) // Sledgehammers are quite good at smashing walls
		playsound(src, 'sound/effects/bang.ogg', 50, 1)

/obj/item/melee/tireiron
	name = "tire iron"
	desc = "Once used for car tires, you can now use it to bash people's heads in."
	icon = 'hl13/icons/obj/melee.dmi'
	icon_state = "tireiron"
	inhand_icon_state = "tire_iron"
	lefthand_file = 'hl13/icons/mob/inhands/melee_inhand_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/melee_inhand_right.dmi'
	force = 22
	throwforce = 10
	attack_verb_continuous = list("attacks", "bashes", "strikes", "smashes")
	attack_verb_simple = list("attack", "bash", "strik", "smash")

//spears
/obj/item/spear/halflife
	icon = 'hl13/icons/obj/melee.dmi'
	icon_state = "spear0"
	lefthand_file = 'hl13/icons/mob/inhands/melee_inhand_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/melee_inhand_right.dmi'
	name = "improvised spear"
	desc = "A haphazardly-constructed yet still deadly weapon of ancient design."
	force = 13
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = 0
	throwforce = 20
	throw_speed = 4
	demolition_mod = 0.75
	embed_type = /datum/embed_data/spear
	armour_penetration = 10
	sharpness = SHARP_POINTY
	wound_bonus = -15
	bare_wound_bonus = 15
	icon_prefix = "spear"
	force_unwielded = 13
	force_wielded = 25
