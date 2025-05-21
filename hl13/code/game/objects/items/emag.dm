/obj/item/card/emag/halflife
	desc = "A handheld tool which can short out combine forcefields and machinery. Can be recharged with uranium."
	name = "multifunction electrical tool"
	icon_state = "alyxtool"
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	inhand_icon_state = null
	var/emagging //are we currently emagging something
	/// How many charges can the emag hold?
	var/max_charges = 4
	/// How many charges does the emag start with?
	var/charges = 4

/obj/item/card/emag/halflife/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(SHOULD_SKIP_INTERACTION(interacting_with, src, user))
		return NONE // lets us put things in bags without trying to emag them
	if(!can_emag(interacting_with, user))
		return ITEM_INTERACT_BLOCKING
	if(charges < 1)
		to_chat(user, span_notice("It's out of charge, try recharging it with uranium."))
		return
	var/hack_time = (rand(10, 15) SECONDS) - ((user.get_stat_level(STATKEY_INT) - 10) SECONDS) //smart people hack faster, -1 second per INT point. Stupid people will hack slower.
	if(!do_after(user, hack_time, interacting_with))
		return
	playsound(src, 'hl13/sound/effects/zap1.ogg', 20, 1)
	log_combat(user, interacting_with, "attempted to emag")
	if(interacting_with.emag_act(user, src))
		SSblackbox.record_feedback("tally", "atom_emagged", 1, interacting_with.type)
		if(prob((user.get_stat_level(STATKEY_INT) - 10) * 3)) //Every point above 10 int is a 3% chance to not use a charge
			to_chat(user, span_notice("You manage to use the device without it draining much power, so it doesn't lose a charge!"))
			return ITEM_INTERACT_SUCCESS
		charges--
		return ITEM_INTERACT_SUCCESS
	return NONE // In a perfect world this would be blocking, but this is not a perfect world

/obj/item/card/emag/halflife/empty
	charges = 0

/obj/item/card/emag/halflife/attackby(obj/item/W, mob/user, params)
	. = ..()
	if (max_charges > charges)
		if (istype(W, /obj/item/stack/sheet/mineral/uranium))
			var/obj/item/stack/sheet/mineral/uranium/T = W
			T.use(1)
			charges = min(charges + 1, max_charges)
			to_chat(user, span_notice("You add another charge to the [src]. It now has [charges] use[charges == 1 ? "" : "s"] remaining."))

/obj/item/card/emag/halflife/examine(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/livvy = user
		if(12 < livvy.get_stat_level(STATKEY_INT))
			. += span_notice("It has [charges] charges remaining.")

		else
			. += span_notice("You're not quite sure how to read how much power this thing has left.")
