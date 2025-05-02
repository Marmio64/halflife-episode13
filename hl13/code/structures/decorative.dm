/obj/structure/halflife/cone
	name = "Traffic Cone"
	desc = "An old world traffic cone. Though there isn't really any traffic anymore, so it's really just a cone."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "cone"

// TRASH.... //
/obj/structure/halflife/trash
	name = "Base type halflife TRASH"
	desc = "Who the hell littered this here? Call a mapper!"
	icon = 'hl13/icons/obj/miscellaneous.dmi'

/obj/structure/halflife/trash/papers
	name = "scattered pages"
	desc = "Some scattered paper pages. They look mostly ruined."
	icon_state = "scattered_papers"

/obj/structure/halflife/trash/papers/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to sift through the [src] for usable pieces."), \
		span_notice("You begin to dig through the [src] for some paper."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(60))
			user.visible_message(span_notice("[user] gathers up the [src]."), \
				span_notice("You gather up all the [src]."))
			new /obj/item/paper(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] messes up gathering the [src]. It melts before their very eyes into nothingness."), \
				span_notice("You don't find any usable paper..."))
			qdel(src)

/obj/structure/halflife/trash/papers/one
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_1"

/obj/structure/halflife/trash/papers/two
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_2"

/obj/structure/halflife/trash/papers/three
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_3"

/obj/structure/halflife/trash/books
	name = "ruined stack of books"
	desc = "A small stack of ruined books. A librarian's worst nightmare."
	icon_state = "bookstack_1"

/obj/structure/halflife/trash/books/Initialize(mapload)
	. = ..()
	icon_state = pick("bookstack_1","bookstack_2","bookstack_3")

/obj/structure/halflife/trash/books/pile
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_1"

/obj/structure/halflife/trash/books/pile/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_1","bookpile_2","bookpile_3")

/obj/structure/halflife/trash/books/pile_alt
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_5"

/obj/structure/halflife/trash/books/pile_alt/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_4","bookpile_5","bookpile_6")

/obj/structure/halflife/trash/cardboard
	name = "scattered cardboard"
	desc = "Old cardboard boxes... Thrown all over the place. What a mess."
	icon_state = "cardboard"

/obj/structure/halflife/trash/bricks
	name = "brick rubble"
	desc = "A bunch of old bricks."
	icon_state = "brickrubble"

/obj/structure/halflife/trash/bricks/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to sift through the [src] for usable pieces."), \
		span_notice("You begin to dig through the [src] for some bricks."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(90)) // It's... bricks already already.
			user.visible_message(span_notice("[user] gathers up the [src]."), \
				span_notice("You gather up all the [src]."))
			new /obj/item/stack/sheet/halflife/brick(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] somehow messes up gathering the [src]. It melts before their very eyes into nothingness."), \
				span_notice("You somehow manage to mess up gathering the perfectly fine bricks. It melts away before your very eyes..."))
			qdel(src)

/obj/structure/halflife/trash/wood
	name = "scrap wood"
	desc = "A bunch of scrap wood. You could probably get a few loose pieces."
	icon_state = "woodscrap"

/obj/structure/halflife/trash/wood/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to sift through the [src] for usable pieces."), \
		span_notice("You begin to dig through the [src] for some wood."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(90)) // It's... scrap wood already.
			user.visible_message(span_notice("[user] gathers up the [src]."), \
				span_notice("You gather up all the [src]."))
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] somehow messes up gathering the [src]. It melts before their very eyes into nothingness."), \
				span_notice("You somehow manage to mess up gathering the perfectly fine scrap wood. It melts away before your very eyes..."))
			qdel(src)

/obj/structure/halflife/trash/garbage
	name = "trash bags"
	desc = "A collection of trash. Incomplete without you."
	icon_state = "trashbags_1"
	var/searched = FALSE
	var/random_appearence = TRUE
	var/loot_chance = 40
	var/loot_amount = 1

/obj/structure/halflife/trash/garbage/Initialize(mapload)
	. = ..()
	if(random_appearence)
		icon_state = pick("trashbags_1","trashbags_2","trashbags_3","trashbags_4","trashbags_5","trashbags_6")

/obj/structure/halflife/trash/garbage/examine(mob/user)
	. = ..()
	if(searched)
		. += span_notice("It's been thoroughly rummaged through, and won't yield anything useful.")
	else
		. += span_notice("You might be able to find something inside by right clicking it, though it will be pretty gross to search inside.")

/obj/structure/halflife/trash/garbage/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	if(searched)
		user.visible_message(span_notice("[user] examines [src], before turning away."), \
			span_notice("The [src] have already been searched."))
		return
	user.visible_message(span_notice("[user] begins to sift through the [src] for anything useful."), \
		span_notice("You begin to dig through the [src] for something interesting."))
	if(do_after(user, 7 SECONDS, src))
		if(prob(loot_chance + (user.mind?.get_skill_modifier(/datum/skill/scavenging, SKILL_VALUE_MODIFIER))))
			user.visible_message(span_notice("[user] finds something inside the [src]."), \
				span_notice("You find something interesting inside the [src]."))
			if(loot_amount == 1)
				if(prob(user.mind?.get_skill_modifier(/datum/skill/scavenging, SKILL_VALUE_MODIFIER)))
					new /obj/effect/spawner/random/halflife/loot/uncommon(loc, 1)
				else
					new /obj/effect/spawner/random/halflife/loot(loc, 1)
			else
				if(prob(user.mind?.get_skill_modifier(/datum/skill/scavenging, SKILL_VALUE_MODIFIER)))
					new /obj/effect/spawner/random/halflife/loot/uncommon/two(loc, 1)
				else
					new /obj/effect/spawner/random/halflife/loot/two(loc, 1)
		else
			user.visible_message(span_notice("[user] finds nothing inside the [src]."), \
				span_notice("Nothing good..."))
		searched = TRUE
		user.mind?.adjust_experience(/datum/skill/scavenging, 20)

		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.adjust_hygiene(-15) //gross, rummaging through garbage

/obj/structure/halflife/trash/garbage/dumpster
	name = "dumpster"
	desc = "A large green dumpster, full of goodies."
	icon_state = "dumpster"
	density = TRUE
	random_appearence = FALSE
	loot_chance = 80
	loot_amount = 2

/obj/structure/halflife/trash/food
	name = "DO NOT USE ME - base type food trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "foodstuff_1"

/obj/structure/halflife/trash/food/dinner
	name = "decrepit dinnerware"
	desc = "A small, moldy, and disgusting collection of old silverware, plates, and similar dining utensils. Perhaps the truly desperate could still find some use out of this."
	icon_state = "foodstuff_1"

/obj/structure/halflife/trash/food/dinner/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_1","foodstuff_5")

/obj/structure/halflife/trash/food/dinner/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through the [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/scrap_metal(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(65)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/trash/food/glass
	name = "empty bottle and can"
	desc = "An empty glass bottle and an aluminum can picked clean, with some utensils nearby."
	icon_state = "foodstuff_4"

/obj/structure/halflife/trash/food/glass/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(40))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/glass(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/trash/food/misc
	name = "old eating utensils"
	desc = "Moldy silverware, empty cans, and similar utensils. The remnants of a feast no doubt."
	icon_state = "foodstuff_6"

/obj/structure/halflife/trash/food/misc/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_2","foodstuff_3", "foodstuff_6")

/obj/structure/halflife/trash/food/misc/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/scrap_metal(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(65)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/trash/glass
	name = "DO NOT USE ME - base type glass trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "glass_1"

/obj/structure/halflife/trash/glass/cans
	name = "empty bottles and cans"
	desc = "Some empty glass bottles and aluminum cans. You just might be able to make something out of this."
	icon_state = "glass_1"

/obj/structure/halflife/trash/glass/cans/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_1","glass_2")

/obj/structure/halflife/trash/glass/cans/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through the [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/glass(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/trash/glass/plate
	name = "glass bottles and dinnerware"
	desc = "Some empty glass bottles and a broken dinner plate. You just might be able to make something out of this."
	icon_state = "glass_6"

/obj/structure/halflife/trash/glass/plate/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/glass(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/trash/glass/basic
	name = "empty glass bottles"
	desc = "A collection of empty glass bottles and broken pieces of some. Someone either had a very good or a very bad time here."
	icon_state = "glass_4"

/obj/structure/halflife/trash/glass/basic/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_3","glass_4", "glass_5")

/obj/structure/halflife/trash/glass/basic/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] finds an intact bottle from [src]."), \
				span_notice("You find an intact bottle from [src]."))
			if(prob(90))
				new /obj/item/reagent_containers/cup/glass/bottle/vodka/empty(loc, 1)
			else
				new /obj/item/reagent_containers/cup/glass/bottle/vodka(loc, 1) //a small chance to get a full bottle!
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(80)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/halflife/barrel
	name = "barrel"
	desc = "A sealed canister of mystery, closed to time."
	icon = 'hl13/icons/obj/barrels.dmi'
	max_integrity = 400
	anchored = TRUE
	density = TRUE
	var/icon_type = null
	var/amount = 3 //used for icon randomisation amount
	var/unique = FALSE //used to set if the icon is randomised or not
	projectile_passchance = 65

/obj/structure/halflife/barrel/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		new /obj/item/stack/sheet/scrap_metal(loc, 4)
	qdel(src)

/obj/structure/halflife/barrel/Initialize()
	. = ..()
	if(!unique)
		icon_state = "[icon_type]_[rand(1, amount)]"

/obj/structure/halflife/barrel/single

/obj/structure/halflife/barrel/single/grey
	icon_state = "grey_1"
	icon_type = "grey"

/obj/structure/halflife/barrel/single/grey/one
	icon_state = "grey_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/grey/two
	icon_state = "grey_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/grey/three
	icon_state = "grey_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/red
	icon_state = "red_1"
	icon_type = "red"

/obj/structure/halflife/barrel/single/red/one
	icon_state = "red_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/red/two
	icon_state = "red_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/red/three
	icon_state = "red_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/yellow
	icon_state = "yellow_1"
	icon_type = "yellow"

/obj/structure/halflife/barrel/single/yellow/one
	icon_state = "yellow_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/yellow/two
	icon_state = "yellow_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/yellow/three
	icon_state = "yellow_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/label
	icon_state = "label_1"
	icon_type = "label"

/obj/structure/halflife/barrel/single/label/one
	icon_state = "label_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/label/two
	icon_state = "label_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/label/three
	icon_state = "label_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/hazard
	icon_state = "hazard_1"
	icon_type = "hazard"

/obj/structure/halflife/barrel/single/hazard/one
	icon_state = "hazard_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/hazard/two
	icon_state = "hazard_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/hazard/three
	icon_state = "hazard_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/redalt
	icon_state = "red_alt_1"
	icon_type = "red_alt"

/obj/structure/halflife/barrel/single/redalt/one
	icon_state = "red_alt_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/redalt/two
	icon_state = "red_alt_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/redalt/three
	icon_state = "red_alt_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/toxic
	icon_state = "toxic_1"
	icon_type = "toxic"
	amount = 4
	light_range = 1.5
	light_color = "#4ba54f"

/obj/structure/halflife/barrel/single/toxic/Initialize()
	. = ..()
	AddComponent(
		/datum/component/radioactive_emitter, \
		cooldown_time = 4 SECONDS, \
		range = 3, \
		threshold = RAD_MEDIUM_INSULATION, \
		examine_text = span_green("<i>It looks like it is emanating radiation.</i>"), \
	)

/obj/structure/halflife/barrel/single/toxic/one
	icon_state = "toxic_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/toxic/two
	icon_state = "toxic_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/toxic/three
	icon_state = "toxic_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/toxic/four
	icon_state = "toxic_4"
	unique = TRUE

/obj/structure/halflife/barrel/single/waste
	icon_state = "waste_1"
	icon_type = "waste"

/obj/structure/halflife/barrel/single/waste/one
	icon_state = "waste_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/waste/two
	icon_state = "waste_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/waste/three
	icon_state = "waste_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/flammable
	icon_state = "flammable_1"
	icon_type = "flammable"

/obj/structure/halflife/barrel/single/flammable/one
	icon_state = "flammable_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/flammable/two
	icon_state = "flammable_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/flammable/three
	icon_state = "flammable_3"
	unique = TRUE

/obj/structure/halflife/barrel/single/warning
	icon_state = "warning_1"
	icon_type = "warning"

/obj/structure/halflife/barrel/single/warning/one
	icon_state = "warning_1"
	unique = TRUE

/obj/structure/halflife/barrel/single/warning/two
	icon_state = "warning_2"
	unique = TRUE

/obj/structure/halflife/barrel/single/warning/three
	icon_state = "warning_3"
	unique = TRUE

/obj/structure/halflife/barrel/double
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 2

/obj/structure/halflife/barrel/double/grey
	icon_state = "double_grey_1"
	icon_type = "double_grey"

/obj/structure/halflife/barrel/double/grey/one
	icon_state = "double_grey_1"
	unique = TRUE

/obj/structure/halflife/barrel/double/grey/two
	icon_state = "double_grey_2"
	unique = TRUE

/obj/structure/halflife/barrel/double/red
	icon_state = "double_red_1"
	icon_type = "double_red"

/obj/structure/halflife/barrel/double/red/one
	icon_state = "double_red_1"
	unique = TRUE

/obj/structure/halflife/barrel/double/red/two
	icon_state = "double_red_2"
	unique = TRUE

/obj/structure/halflife/barrel/double/yellow
	icon_state = "double_yellow_1"
	icon_type = "double_yellow"

/obj/structure/halflife/barrel/double/yellow/one
	icon_state = "double_yellow_1"
	unique = TRUE

/obj/structure/halflife/barrel/double/yellow/two
	icon_state = "double_yellow_2"
	unique = TRUE

/obj/structure/halflife/barrel/double/waste
	icon_state = "double_waste_1"
	icon_type = "double_waste"
	amount = 1

/obj/structure/halflife/barrel/triple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."

/obj/structure/halflife/barrel/triple/grey
	icon_state = "triple_grey_1"
	icon_type = "triple_grey"

/obj/structure/halflife/barrel/triple/grey/one
	icon_state = "triple_grey_1"
	unique = TRUE

/obj/structure/halflife/barrel/triple/grey/two
	icon_state = "triple_grey_2"
	unique = TRUE

/obj/structure/halflife/barrel/triple/grey/three
	icon_state = "triple_grey_3"
	unique = TRUE

/obj/structure/halflife/barrel/triple/red
	icon_state = "triple_red_1"
	icon_type = "triple_red"
	amount = 2

/obj/structure/halflife/barrel/triple/red/one
	icon_state = "triple_red_1"
	unique = TRUE

/obj/structure/halflife/barrel/triple/red/two
	icon_state = "triple_red_2"
	unique = TRUE

/obj/structure/halflife/barrel/triple/yellow
	icon_state = "triple_yellow_1"
	icon_type = "triple_yellow"

/obj/structure/halflife/barrel/triple/yellow/one
	icon_state = "triple_yellow_1"
	unique = TRUE

/obj/structure/halflife/barrel/triple/yellow/two
	icon_state = "triple_yellow_2"
	unique = TRUE

/obj/structure/halflife/barrel/triple/yellow/three
	icon_state = "triple_yellow_3"
	unique = TRUE

/obj/structure/halflife/barrel/triple/waste
	icon_state = "triple_waste_1"
	icon_type = "triple_waste"
	amount = 2

/obj/structure/halflife/barrel/triple/waste/one
	icon_state = "triple_waste_1"
	unique = TRUE

/obj/structure/halflife/barrel/triple/waste/two
	icon_state = "triple_waste_2"
	unique = TRUE

/obj/structure/halflife/barrel/quadruple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 1

/obj/structure/halflife/barrel/quadruple/grey
	icon_state = "quad_grey_1"
	icon_type = "quad_grey"

/obj/structure/halflife/barrel/quadruple/grey/one
	icon_state = "quad_grey_1"
	unique = TRUE

/obj/structure/halflife/barrel/quadruple/red
	icon_state = "quad_red_1"
	icon_type = "quad_red"
	amount = 2

/obj/structure/halflife/barrel/quadruple/red/one
	icon_state = "quad_red_1"
	unique = TRUE

/obj/structure/halflife/barrel/quadruple/red/two
	icon_state = "quad_red_2"
	unique = TRUE

/obj/structure/halflife/barrel/quadruple/yellow
	icon_state = "quad_yellow_1"
	icon_type = "quad_yellow"

/obj/structure/halflife/barrel/quadruple/yellow/one
	icon_state = "quad_yellow_1"
	unique = TRUE

/obj/structure/halflife/barrel/quadruple/waste
	icon_state = "quad_waste_1"
	icon_type = "quad_waste"

/obj/structure/halflife/barrel/quadruple/waste/one
	icon_state = "quad_waste_1"
	unique = TRUE

/obj/structure/halflife/tank
	name = "storage tank"
	desc = "A large empty storage tank. The contents have long since evaporated."
	icon = 'hl13/icons/obj/tank.dmi'
	icon_state = "largetank"
	max_integrity = 300
	density = TRUE
	anchored = TRUE

/obj/structure/halflife/tank/pipe
	name = "piped storage tank"
	desc = "A large chemical storage tank with pipes running from it. They don't seem to be attached."
	icon_state = "largetank_pipe"

/obj/structure/halflife/tank/chemical
	name = "chemical storage tank"
	desc = "A large chemical storage tank. It's covered in forboding symbols."
	icon_state = "largetank_chemical"

/obj/structure/halflife/tank/chemical/huge
	name = "huge chemical storage tank"
	desc = "A huge chemical storage tank with pipes running from it. It's covered in forboding symbols."
	icon_state = "largetank_chemical_huge"
	pixel_x = -9

/obj/structure/halflife/tank/chemical/container
	name = "chemical container tank"
	desc = "A wide chemical container tank. It has one giant forboding symbol in the middle."
	icon_state = "chemical_container"
	bound_width = 64

/obj/structure/halflife/tank/chemical/container/broken
	name = "chemical container tank"
	desc = "A wide chemical container tank. It has one giant forboding symbol in the middle, it also appears it has exploded from the inside."
	icon_state = "chemical_container_broken"

// Wooden Pallets //

/obj/structure/halflife/pallet
	name = "wooden pallet"
	desc = "A wooden pallet. You could get some good wood off that, probably."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "pallet"
	max_integrity = 100
	anchored = TRUE
	density = FALSE

/obj/structure/halflife/pallet/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		playsound(src.loc, 'hl13/sound//halflifeeffects/wood_deconstruction.ogg', 50, TRUE)
		if(disassembled)
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 3)
		else
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 2)
	qdel(src)

/obj/structure/halflife/pallet/stack
	name = "pallet stack"
	desc = "A stack of wooden pallets. Some good planks in there, still."
	icon_state = "pallet_stack"
	max_integrity = 250
	density = TRUE
	projectile_passchance = 65

/obj/structure/halflife/pallet/stack/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		playsound(src.loc, 'hl13/sound//halflifeeffects/wood_deconstruction.ogg', 50, TRUE)
		if(disassembled)
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 5)
		else
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 4)
	qdel(src)

// brix.... //



// railings/fence//

/obj/structure/railing/halflife
	name = "base state halflife guard rail"
	icon = 'hl13/icons/obj/railings.dmi'
	layer = ABOVE_MOB_LAYER
	max_integrity = 150
	//climbable = FALSE //so we can override TG
	projectile_passchance = 80
	pixel_y = 0

/obj/structure/railing/halflife/Initialize()
	. = ..()
	if(dir == SOUTH)
		layer = ABOVE_ALL_MOB_LAYER
	if(dir == NORTH)
		layer = ABOVE_ALL_MOB_LAYER

	//AddElement(/datum/element/climbable, climb_time = 3 SECONDS, climb_stun = 0, no_stun = TRUE, jump_over = TRUE, jump_north = 12, jump_south = 17, jump_sides = 12)

/obj/structure/railing/halflife/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		new /obj/item/stack/sheet/iron(loc)
	qdel(src)

/obj/structure/railing/halflife/solo
	name = "guard rail"
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building"
	icon_state = "civ_solo"

/obj/structure/railing/halflife/full
	name = "guard rail"
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building"
	icon_state = "civ_full"

/obj/structure/railing/halflife/end
	name = "guard rail"
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building"
	icon_state = "civ_end"

/obj/structure/railing/halflife/solo/industrial
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building. It's got a slick orange taint, so you know it's to workplace regulations."
	icon_state = "indus_solo"

/obj/structure/railing/halflife/sewer
	name = "guard rail"
	desc = "A rusty guard rail used to prevent you from falling into the region's sewage. Thank the lord it's there."
	icon_state = "railings_sewer"

// Fences. Huzzah! //
/obj/structure/railing/halflife/wood
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_full"
	projectile_passchance = 70

/obj/structure/railing/halflife/wood/crowbar_act(mob/living/user, obj/item/tool)
	if(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION)
		return TRUE
	..()
	user.visible_message("<span class='notice'>[user] starts to break \the [src].</span>", \
		"<span class='notice'>You start to break \the [src].</span>", \
		"<span class='hear'>You hear splitting wood.</span>")
	tool.play_tool_sound(src)
	if(do_after(user, 10 SECONDS * tool.toolspeed, target = src))
		playsound(src.loc, 'hl13/sound//halflifeeffects/wood_deconstruction.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] pries \the [src] into pieces.</span>", \
			"<span class='notice'>You pry \the [src] into pieces.</span>", \
			"<span class='hear'>You hear splitting wood.</span>")
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/railing/halflife/wood/deconstruct(disassembled = TRUE)
	if(!(obj_flags & NO_DEBRIS_AFTER_DECONSTRUCTION))
		if(disassembled)
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 3)
		else
			new /obj/item/stack/sheet/mineral/scrap_wood(loc, 2)
	qdel(src)

/obj/structure/railing/halflife/wood/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/railing/halflife/wood/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>crowbar</b> or similar prying tool to dismantle [src] for planks and parts.")

/obj/structure/railing/halflife/wood/ending
	icon_state = "wood_end"

/obj/structure/railing/halflife/wood/single
	icon_state = "wood_solo"

/obj/structure/railing/halflife/wood/snow
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_snow_full"

/obj/structure/railing/halflife/wood/snow/ending
	icon_state = "wood_snow_end"

/obj/structure/railing/halflife/wood/snow/single
	icon_state = "wood_snow_solo"

/obj/structure/halflife/pot
	name = "plant pot"
	desc = "An old ceramic plant pot. It has faint cracks lining it in random patterns, but it holds strong."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "pot_1"
	max_integrity = 50
	density = FALSE
	anchored = TRUE
	projectile_passchance = 100

/obj/structure/halflife/pot/plant
	name = "plant pot"
	desc = "An old ceramic plant pot. It has faint cracks lining it in random patterns, but it holds strong. There is a dead plant in it."
	icon_state = "pot_2"

/obj/structure/halflife/pot/plant/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "pot_[rand(3,4)]"

/obj/structure/halflife/pole
	name = "Street Pole"
	desc = "A pole often placed near crosswalks."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "pole"
	density = FALSE
	anchored = TRUE
	projectile_passchance = 100

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/halflife/pole, 16)

/obj/structure/halflife/publicphone
	name = "Public Phone"
	desc = "A public pay phone. Used to work, now it's just a decorative piece, maybe even a statement of humanity as it is now."
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "publicphone"
	density = FALSE
	anchored = TRUE
	projectile_passchance = 100
	pixel_y = 22
