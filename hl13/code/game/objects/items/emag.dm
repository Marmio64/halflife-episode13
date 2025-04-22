/obj/item/card/emag/halflife
	desc = "A handheld tool which can short out combine forcefields and machinery. Can be recharged with uranium."
	name = "multifunction electrical tool"
	icon_state = "alyxtool"
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	inhand_icon_state = null
	var/emagging //are we currently emagging something
	/// How many charges can the emag hold?
	var/max_charges = 5
	/// How many charges does the emag start with?
	var/charges = 5

/obj/item/card/emag/halflife/afterattack(atom/target, mob/user, proximity)
	if(charges >= 1)
		if(emagging)
			return
		if(!proximity && prox_check) //left in for badmins
			return
		emagging = TRUE
		if(do_after(user, rand(5, 10) SECONDS, target))
			charges--
			if(prob(10))
				to_chat(user, span_notice("[src] emits a zap, though appears to have failed in it's circumvention attempt."))
				playsound(src, 'hl13/sound/effects/zap1.ogg', 20, 1)
				emagging = FALSE
				return
			log_combat(user, target, "attempted to emag")
			if(!target.emag_act(user, src) && !((charges + 1) > max_charges))
				charges++
			playsound(src, 'hl13/sound/effects/zap1.ogg', 20, 1)
		emagging = FALSE

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
