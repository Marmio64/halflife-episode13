GLOBAL_VAR_INIT(packages_delivered, 0)
GLOBAL_LIST_EMPTY(intruder_osp)

/obj/machinery/intruder_coffeemaker
	name = "coffeemaker"
	desc = "A machine that makes the essence of life: Coffee. Patrolling is hard work and will make you tired, coffee is a god send for fixing you right up."
	icon = 'icons/obj/machines/coffeemaker.dmi'
	icon_state = "coffeemaker_impressa"
	density = TRUE
	pass_flags = PASSTABLE
	resistance_flags = INDESTRUCTIBLE

	var/brew_time = 10 SECONDS
	var/sabotaged = FALSE

	///Did someone put anti-fatigue rations in the coffee maker?
	var/supercharges = 0
	///Did someone put tranqs in the coffee maker?
	var/tranqs = 0

/obj/machinery/intruder_coffeemaker/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		if(human_user.deployment_faction == REBEL_DEPLOYMENT_FACTION) //both spies and crab can examine coffee machines for info
			if(supercharges)
				. += span_warning("There are [supercharges] cups worth of anti-fatigue pills in the pot.")
			if(tranqs)
				. += span_warning("There are [tranqs] cups worth of tranquilizer in the pot.")

/obj/machinery/intruder_coffeemaker/interact(mob/living/carbon/human/user)
	.=..()

	if(HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		if(sabotaged)
			to_chat(user, span_notice("This machine is already sabotaged."))
			return
		else
			to_chat(user, span_notice("Sabotaging the machine... Be wary, this will undo any tranquilizers or anti-fatigue rations that have been put inside."))
			if(do_after(user, 2.5 SECONDS, src))
				to_chat(user, span_notice("Sabotaged!"))
				sabotaged = TRUE
				return
			else
				return

	if(sabotaged)
		var/list/sabotage_texts = list(
		"What the hell!? Someone messed up the color coding on the sugar packets and turned off the warming plate! We're going to need to fix this...",
		"Someone spilled creamer all over the whole pot! This is going to take forever to clean...",
		"This coffee tastes like shit! Damnit, we're going to need to brew a new pot...",
		"Someone drank all the coffee without making a new pot! Damnit, we're going to need to brew a new pot...",
		"Damnit, who turned off the machine? Where the hell is the power switch...",
		"That smell... Fucking hell, this is decaf! I'm going to need to start all over with a fresh batch...",
		"Someone turned the boiler plate to max and left it on! Whole damn pot is ruined and I'll need to make a new one...",
		"Someone wrote on this pot that the coffee is reserved for the captain... Don't wanna get in trouble, guess I'll just make some more in a different pot.",
		"Someone wrote on this pot that the coffee is reserved for the captain... Don't wanna get in trouble, guess I'll just make some more in a different pot.",
		"Someone watered down this coffee to high hell! Damnit, we're going to need to brew a new pot...")

		to_chat(user, span_notice("[pick(sabotage_texts)]"))

		if(do_after(user, 15 SECONDS, src))
			to_chat(user, span_notice("There! All fixed."))
			sabotaged = FALSE
			supercharges = 0
			tranqs = 0
			return
		else
			return


	if(user.tiredness < 250 && user.deployment_faction != REBEL_DEPLOYMENT_FACTION)
		to_chat(user, span_notice("You're full of energy right now, no need for more coffee.")) //mostly so you cant stack a crap ton of the coffee reagent
		return

	to_chat(user, span_notice("You start pouring a cup of joe for yourself..."))

	playsound(user.loc, SFX_LIQUID_POUR, 30, TRUE)
	if(do_after(user, brew_time, src))
		playsound(user.loc,'hl13/sound/items/drink.ogg', rand(20,50), TRUE)

		if(!supercharges && !tranqs)
			to_chat(user, span_notice("You drink the freshly poured cup of coffee, and feel energized!"))
			user.adjust_tiredness(-1000)
			user.reagents.add_reagent(/datum/reagent/consumable/coffee,20)
		else if(0 < supercharges)
			supercharges--
			to_chat(user, span_notice("You drink the freshly poured cup of coffee, and feel very energized!"))
			user.adjust_tiredness(-1000)
			user.reagents.add_reagent(/datum/reagent/consumable/coffee,20)
			user.reagents.add_reagent(/datum/reagent/antifatigue_rations_high_grade,12)
		else if(0 < tranqs)
			tranqs--
			to_chat(user, span_notice("You drink the freshly poured cup of coffee... but instead feel very tired! Did someone put something in here...?"))
			user.adjust_tiredness(300)
			if(prob(50))
				user.SetSleeping(25 SECONDS)

/obj/machinery/intruder_coffeemaker/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/pill/antifatigue))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)

		to_chat(user, span_notice("You drop the pills inside the coffee."))

		tranqs = 0
		supercharges += 2

		qdel(I)

	if(istype(I, /obj/item/ammo_casing/c9mm/usp/tranq))
		playsound(src, 'hl13/sound/machines/combine_button1.ogg', 50, TRUE, extrarange = -3)

		to_chat(user, span_notice("You crack open the bullet and drop in the liquid tranquilizer."))

		tranqs++
		supercharges = 0

		qdel(I)

	else
		playsound(src, 'hl13/sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

/obj/machinery/intruder_deliveryzone
	name = "delivery and loading zone"
	desc = "A designated zone for delivering and loading boxes. Should keep guards equipped for any threats as long as they complete enough deliveries."
	icon = 'icons/turf/floors.dmi'
	icon_state = "light_on-8"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE

	var/lookingfor = "Placeholder"

	var/deliveries_accepted = 0

/obj/machinery/intruder_deliveryzone/misc_supplies
	lookingfor = "Misc. Supplies"

/obj/machinery/intruder_deliveryzone/misc_supplies/low_capacity
	deliveries_accepted = 5

/obj/machinery/intruder_deliveryzone/weapons_and_ammo
	lookingfor = "Weapons and Ammunition"

/obj/machinery/intruder_deliveryzone/coffee_and_rations
	lookingfor = "Coffee and Rations"

/obj/machinery/intruder_deliveryzone/coffee_and_rations/low_capacity
	deliveries_accepted = 5

/obj/machinery/intruder_deliveryzone/medicine
	lookingfor = "Medicine"

/obj/machinery/intruder_deliveryzone/research_equipment
	lookingfor = "Research Equipment"

/obj/machinery/intruder_deliveryzone/examine(mob/user)
	. = ..()
	. += span_notice("There's a request for a delivery of [lookingfor] to this area.")
	if(GLOB.packages_delivered < 0)
		GLOB.packages_delivered = 0
	. += span_notice("[6 - GLOB.packages_delivered] boxes to next bonus preparedness.")

/obj/machinery/intruder_deliveryzone/interact(mob/living/carbon/human/user)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		to_chat(user, span_notice("You aren't particularly interested in helping the enemy.")) //have a spy fill it with something if necessary
		return

	if(do_after(user, 1 SECONDS, src))
		var/has_box = FALSE
		for(var/obj/thing as anything in get_turf(src))
			if(istype(thing, /obj/structure/closet/cardboard/solid))
				var/obj/structure/closet/cardboard/solid/box = thing
				has_box = TRUE
				var/intruder_inside = (locate(/mob/living) in box.contents) //technically its possible for a guard to be inside a filled box if the intruder opens one and then leaves it for them to hide in but thats very rare so i dont give a damn
				if(box.boxcontains == lookingfor)
					if(GLOB.packages_delivered < 0)
						GLOB.packages_delivered = 0
					if(!intruder_inside)
						GLOB.packages_delivered++
						qdel(box)
						to_chat(user, span_notice("The contents of the box are delivered to the area and a shipment of [box.boxcontains] is loaded into the box."))
						deliveries_accepted++
						if(10 < deliveries_accepted)
							to_chat(user, span_notice("The delivery point is now full, and can no longer be delivered to."))
							qdel(src) //deletes itself once it reaches 10 deliveries
					else
						box.boxcontains = "nothing"
						to_chat(user, span_warning("Huh...? That's strange, the contents of this box failed to be delivered properly... what's going on?"))
				else if(box.boxcontains == "nothing")
					box.boxcontains = pick(box.things_boxcontains)
					while(box.boxcontains == lookingfor) //they wouldnt supply a box with stuff they are needing more of
						box.boxcontains = pick(box.things_boxcontains)
					to_chat(user, span_notice("A shipment of [box.boxcontains] is loaded into the box."))
					if(prob(5) && intruder_inside)
						to_chat(user, span_warning("Huh...? Did you see something move inside while the box was being loaded?"))
				else
					to_chat(user, span_warning("This is the wrong type of box!"))
		if(!has_box)
			to_chat(user, span_warning("You didn't put anything deliverable in the zone!"))
	else
		to_chat(user, span_warning("You didn't finish using the zone!"))

/obj/structure/closet/cardboard/solid
	drag_slowdown = 0.5 // so its bearable to drag around

	var/boxcontains = "nothing"

	var/startempty = FALSE

	var/list/things_boxcontains = list(
		"Misc. Supplies",
		"Weapons and Ammunition",
		"Coffee and Rations",
		"Medicine",
		"Research Equipment",
	)

/obj/structure/closet/cardboard/solid/Initialize(mapload)
	. = ..()
	if(!startempty)
		boxcontains = pick(things_boxcontains)

/obj/structure/closet/cardboard/solid/examine(mob/user)
	. = ..()
	. += span_notice("There's a label on the side of the box informing you that this is a box full of [boxcontains].")
	if(boxcontains != "nothing")
		if(!HAS_TRAIT(user, TRAIT_THE_INTRUDER))
			. += span_warning("You feel if you were to open this box you might accidentally destroy the contents and even incur a penalty for your team if there is nobody inside.")
		else
			. += span_notice("You could hide in this and wait for it to be delivered to one of the delivery zones to travel without being caught.")

/obj/structure/closet/cardboard/solid/before_open(mob/living/user, force)
	if(boxcontains != "nothing" && !HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		to_chat(user, span_warning("If you finish opening this box, you might accidentally damage the contents and incur a penalty!"))
	return ..()

/obj/structure/closet/cardboard/solid/after_open(mob/living/user, force)
	var/intruder_inside = (locate(/mob/living) in contents)
	var/contents_destroyed = FALSE
	if(boxcontains != "nothing" && !HAS_TRAIT(user, TRAIT_THE_INTRUDER) && prob(90))
		boxcontains = "nothing"
		to_chat(user, span_warning("You destroyed the contents of the box!"))
		contents_destroyed = TRUE
	if(contents_destroyed && !intruder_inside)
		if(user.deployment_faction != REBEL_DEPLOYMENT_FACTION)
			to_chat(user, span_warning("There was no intruder inside! You have incurred a penalty for your team!"))
			GLOB.packages_delivered--
		else
			to_chat(user, span_warning("There was no intruder inside!")) //so spies cant just open all the boxes and make it impossible to get anything done
	return ..()

/obj/structure/closet/cardboard/solid/empty
	startempty = TRUE

/obj/structure/halflife/cargotruck/intruder_delivery
	name = "Delivery Truck"
	desc = "A truck that has been parked and filled with boxes of materials meant to be delivered to points around the base."

	var/boxes_left = 6

/obj/structure/halflife/cargotruck/intruder_delivery/examine(mob/user)
	. = ..()
	. += span_notice("It has [boxes_left] boxes left.")

/obj/structure/halflife/cargotruck/intruder_delivery/high_capacity
	boxes_left = 24

/obj/structure/halflife/cargotruck/intruder_delivery/interact(mob/living/carbon/human/user)
	. = ..()

	if(boxes_left <= 0)
		to_chat(user, span_warning("This truck has no more boxes of supplies left."))
		return

	to_chat(user, span_notice("You start pulling out a box of supplies..."))
	if(do_after(user, 5 SECONDS, src))
		if(0 < boxes_left)
			new /obj/structure/closet/cardboard/solid(loc)
			to_chat(user, span_notice("You take out a box of supplies. You can examine it to see what it contains."))
			boxes_left--

/obj/effect/landmark/intruder_guncase
	name = "guncase spawn point"
	icon = 'icons/obj/storage/case.dmi'
	icon_state = "infiltrator_case"

/obj/effect/landmark/intruder_guncase/Initialize(mapload)
	..()
	GLOB.intruder_osp += loc
	return INITIALIZE_HINT_QDEL

/obj/machinery/intruder_guncase
	name = "gun case"
	desc = "A weapon's case. You're not sure what the 'S' stands for... Solid? Shoot? Synd-...? Eh, it's probably best not to think too hard about it."
	icon = 'icons/obj/storage/case.dmi'
	icon_state = "infiltrator_case"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	var/case_contains = /obj/item

/obj/machinery/intruder_guncase/examine(mob/user)
	. = ..()
	if(!HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		. += span_notice("You don't really need a new gun right now. Besides, it isn't yours to take.")
	else
		if(case_contains == /obj/item/suppressor)
			. += span_notice("It contains a suppressor... shouldn't it be a 'suppressor case'?")
		if(case_contains == /obj/item/gun/ballistic/automatic/pistol/solid_tranq/osp)
			. += span_notice("It contains an empty tranquilizer pistol.")
		if(case_contains == /obj/item/gun/ballistic/automatic/pistol/usp/solid)
			. += span_notice("It contains an empty, unsuppressed USP.")
		if(case_contains == /obj/item/gun/ballistic/automatic/m4a1/famas/crab)
			. += span_notice("It contains an empty, unsuppressed FAMAS.")

/obj/machinery/intruder_guncase/Initialize(mapload)
	. = ..()
	var/turf/picked_loc = pick(GLOB.intruder_osp)
	GLOB.intruder_osp -= picked_loc //no two weapons in the same location
	forceMove(picked_loc)

/obj/machinery/intruder_guncase/interact(mob/living/carbon/human/user)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		if(do_after(user, 1 SECONDS, src))
			new case_contains(loc)
			SEND_SOUND(user, sound('hl13/sound/effects/spawnration.ogg'))
			qdel(src)
	else
		to_chat(user, span_notice("You don't really need a new gun right now. Besides, it isn't yours to take."))
