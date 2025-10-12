/obj/structure/razorwire
	name = "razorwire obstacle"
	desc = "A bundle of barbed wire supported by metal rods. Anyone who tries to cross it will get entangled temporarily, and cut by the mess of sharp wires."
	icon = 'hl13/icons/obj/barbedwire.dmi'
	icon_state = "barbedwire_x"
	base_icon_state = "barbedwire_x"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_OBJ_LAYER
	projectile_passchance = 95
	pass_flags_self = LETPASSTHROW|PASSSTRUCTURE
	max_integrity = 100
	///First drop item type
	var/sheet_type = /obj/item/stack/barbed_wire
	///Second drop item type
	var/sheet_type2 = /obj/item/stack/rods

/obj/structure/razorwire/deconstruct(disassembled = TRUE, mob/living/blame_mob)
	if(disassembled)
		if(atom_integrity > max_integrity * 0.5)
			new sheet_type(loc)
		var/obj/item/stack/rods/salvage = new sheet_type2(loc)
		salvage.amount = max(1, round(4 * (atom_integrity / max_integrity) ) )
	else
		if(prob(50))
			new sheet_type(loc)
		if(prob(50))
			var/obj/item/stack/rods/salvage = new sheet_type2(loc)
			salvage.amount = rand(1,4)
	return ..()

/obj/structure/razorwire/Initialize(mapload)
	. = ..()
	var/static/list/connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_cross),
	)
	AddElement(/datum/element/connect_loc, connections)
	for(var/obj/structure/razorwire/T in loc)
		if(T != src)
			qdel(T)

/obj/structure/razorwire/proc/on_cross(datum/source, atom/movable/O, oldloc, oldlocs)
	SIGNAL_HANDLER
	if(!isliving(O))
		return
	var/mob/living/M = O
	if(M.incorporeal_move || HAS_TRAIT(M, TRAIT_GODMODE))
		return
	if(!M.density)
		return
	if(M.movement_type & MOVETYPES_NOT_TOUCHING_GROUND || !M.has_gravity()) //you're flying over it.
		return
	if(M.throwing) // throw someone or jump to bypass safely
		return
	playsound(src, 'hl13/sound/effects/barbed_wire_movement.ogg', 25, 1)
	var/def_zone = ran_zone()
	M.apply_damage(15, BRUTE, def_zone, sharpness = SHARP_EDGED)
	razorwire_tangle(M)

/obj/structure/razorwire/proc/razorwire_tangle(mob/living/entangled)
	if(QDELETED(src)) //Sanity check so that you can't get entangled if the razorwire is destroyed; this happens apparently.
		CRASH("QDELETED razorwire called razorwire_tangle()")
	entangled.visible_message(span_danger("[entangled] gets entangled in the barbed wire!"),
	span_danger("You got entangled in the barbed wire!"), null, null, 5)
	entangled.Immobilize(rand(30,40))

/obj/structure/razorwire/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/stack/sheet/iron))
		var/obj/item/stack/sheet/iron/metal_sheets = I

		visible_message(span_notice("[user] begins to repair  \the [src]."))

		if(!do_after(user, 2 SECONDS, NONE, src) || atom_integrity >= max_integrity)
			return

		if(!metal_sheets.use(1))
			return

		repair_damage(max_integrity * 0.30, user)
		visible_message(span_notice("[user] repairs \the [src]."))
		update_icon()
		return

/obj/structure/razorwire/wirecutter_act(mob/living/user, obj/item/I)
	user.visible_message(span_notice("[user] starts disassembling [src]."),
	span_notice("You start disassembling [src]."))

	if(!do_after(user, 2 SECONDS, src))
		return TRUE

	user.visible_message(span_notice("[user] disassembles [src]."),
	span_notice("You disassemble [src]."))
	playsound(loc, 'sound/items/tools/wirecutter.ogg', 25, 1)
	deconstruct(TRUE)
	return TRUE

/obj/structure/razorwire/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			visible_message(span_danger("[src] is blown apart!"))
			deconstruct(FALSE)
			return
		if(EXPLODE_HEAVY)
			visible_message(span_danger("[src] is blown apart!"))
			deconstruct(FALSE)
			return
		if(EXPLODE_LIGHT)
			take_damage(rand(10, 50), BRUTE, BOMB)
	update_icon()

/*
/obj/structure/razorwire/CanAllowThrough(atom/movable/mover, turf/target)
	if(mover.throwing && ismob(mover))
		return FALSE

	return ..()
*/

/obj/structure/razorwire/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[CEILING(ROUND_UP(atom_integrity/max_integrity * 100), 25)]"

/obj/item/stack/barbed_wire
	name = "barbed wire"
	desc = "A spiky length of wire."
	icon = 'hl13/icons/obj/stack_objects.dmi'
	icon_state = "barbed_wire"
	item_flags = NOBLUDGEON
	singular_name = "length"
	w_class = WEIGHT_CLASS_SMALL
	force = 0
	throwforce = 5
	throw_speed = 5
	throw_range = 20
	attack_verb_continuous = list("hits", "whacks", "slices")
	attack_verb_simple = list("hit", "whack", "slice")
	max_amount = 20
	merge_type = /obj/item/stack/barbed_wire

//small stack
/obj/item/stack/barbed_wire/small_stack
	amount = 5

//half stack
/obj/item/stack/barbed_wire/half_stack
	amount = 10

//full stack
/obj/item/stack/barbed_wire/full
	amount = 20

/obj/item/stack/barbed_wire/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(!istype(I, /obj/item/stack/rods))
		return

	var/obj/item/stack/rods/R = I
	if(R.amount < 8)
		to_chat(user, span_warning("You need [8 - R.amount] more [R] to make a razor wire obstacle!"))
		return
	if(amount < 2)
		to_chat(user, span_warning("You need at least [2 - amount] more [src] to make razorwire obstacles!"))
		return

	R.use(8)
	use(2)

	var/obj/structure/razorwire/M = new /obj/item/stack/razorwire(user.loc, 2)
	to_chat(user, span_notice("You combine the rods and barbed wire into [M]!"))

/obj/item/stack/razorwire
	name = "razor wire assembly"
	desc = "A bundle of barbed wire supported by metal rods. Used to deny access to areas under pain of entanglement and injury. A classic fortification since the 1900s."
	icon = 'hl13/icons/obj/barbedwire.dmi'
	icon_state = "barbedwire_assembly"
	w_class = WEIGHT_CLASS_BULKY
	force = 15
	throwforce = 10
	throw_range = 5
	attack_verb_continuous = list("hits", "whacks", "slices")
	attack_verb_simple = list("hit", "whack", "slice")
	singular_name = "bundle"
	max_amount = 10
	merge_type = /obj/item/stack/razorwire


//small stack
/obj/item/stack/razorwire/small_stack
	amount = 5

//medium stack
/obj/item/stack/razorwire/half_stack
	amount = 10

//full stack
/obj/item/stack/razorwire/full
	amount = 20

GLOBAL_LIST_INIT(razorwire_recipes, list ( \
	new/datum/stack_recipe("razorwire", /obj/structure/razorwire, 1, time = 2.5 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_STRUCTURE), \
	))

/obj/item/stack/razorwire/get_main_recipes()
	. = ..()
	. += GLOB.razorwire_recipes
