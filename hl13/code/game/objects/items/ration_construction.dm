///// A ration creation system. These items can be ordered at cargo, and a container will randomly pick 3 of these ingredient items to be required to be put inside.
///// Once all three of the ingredients are put in, you can then take the container and hit a ration vendor with it to refill it with more rations.

/obj/item/ration_construction
	name = "base ration construction item"
	desc = "Do not use this."
	icon = 'hl13/icons/obj/ration_construction.dmi'

/obj/item/ration_construction/packs
	name = "unfiltered nutrient packs"
	desc = "A handful of unfiltered, raw nutrient bars. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "packs"

/obj/item/ration_construction/boxes
	name = "unfiltered nutrient boxes"
	desc = "A handful of unfiltered, raw nutrient boxes. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "boxes"

/obj/item/ration_construction/bars
	name = "unfiltered flavor bars"
	desc = "A handful of unfiltered, raw flavor bars. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "bars"

/obj/item/ration_construction/bags
	name = "empty ration bags"
	desc = "A handful of empty, uncolored bags for putting rations inside of."
	icon_state = "bags"

/obj/item/ration_construction/blue_cans
	name = "unfiltered breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "cans"

/obj/item/ration_construction/yellow_cans
	name = "unfiltered yellow breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "yellowcans"

/obj/item/ration_construction/red_cans
	name = "unfiltered red breen water"
	desc = "A handful of unfiltered, sealed water cans. Drinking them right now is out of the question, a machine will have to make them potable."
	icon_state = "redcans"

/obj/item/ration_construction/purple_cans
	name = "unfiltered purple nutriment cans"
	desc = "A handful of unfiltered, sealed nutriment cans. Drinking (Eating?) them right now is out of the question, a machine will have to make them potable."
	icon_state = "purplecans"

/obj/item/ration_construction/nutripastes
	name = "unfiltered nutripastes"
	desc = "A handful of raw, unfiltered nutripaste tubes. Eating them right now is out of the question, a machine will have to make them edible."
	icon_state = "nutripastes"

/obj/item/ration_construction/container
	name = "ration refill container"
	desc = "A container which has a designated list of items it should contain. Once it has gotten these items, it can be put inside a ration vendor machine to refill it."
	icon_state = "container_empty"

	var/obj/required_item_1 = null
	var/obj/required_item_2 = null
	var/obj/required_item_3 = null

	var/item_1_fulfilled = FALSE
	var/item_2_fulfilled = FALSE
	var/item_3_fulfilled = FALSE

	///Are all ingredients inside?
	var/filled = FALSE
	///Is the box fully packed and sealed?
	var/completed = FALSE

	///How many rations are filled when this is completed?
	var/refill_rate = 3

	///How many credits to give when completed
	var/credit_reward = 2

	var/possiblenutrient = list(
		/obj/item/ration_construction/ingredientblock/sweetcarb,
		/obj/item/ration_construction/ingredientblock/sweetfat,
		/obj/item/ration_construction/ingredientblock/sweetfiber,
		/obj/item/ration_construction/ingredientblock/bittercarb,
		/obj/item/ration_construction/ingredientblock/bitterfat,
		/obj/item/ration_construction/ingredientblock/bitterfiber,
		/obj/item/ration_construction/ingredientblock/sourcarb,
		/obj/item/ration_construction/ingredientblock/sourfat,
		/obj/item/ration_construction/ingredientblock/sourfiber
	)
	var/list/possible_picks = list(/obj/item/ration_construction/packs, /obj/item/ration_construction/boxes, /obj/item/ration_construction/bars, /obj/item/ration_construction/bags, /obj/item/ration_construction/blue_cans, /obj/item/ration_construction/yellow_cans, /obj/item/ration_construction/red_cans)

/obj/item/ration_construction/container/examine(mob/user)
	. = ..()


	if(completed)
		. += span_notice("The container is filled and sealed correctly, and can now be deposited into a ration vendor.")

	if(filled && !completed)
		. += span_notice("The container is filled correctly. You can now seal it by hand slowly, or use a sealing machine in the factory to seal it quickly.")

	if(required_item_1 && !item_1_fulfilled)
		. += span_notice("The container requires [required_item_1.name] to be put inside it.")
	if(required_item_2 && !item_2_fulfilled)
		. += span_notice("The container requires [required_item_2.name] to be put inside it.")
	if(required_item_3 && !item_3_fulfilled)
		. += span_notice("The container requires [required_item_3.name] to be put inside it.")

/obj/item/ration_construction/container/Initialize(mapload)
	. = ..()

	var/list/possible_items = possible_picks

	required_item_1 = pick(possiblenutrient)
	required_item_2 = pick_n_take(possible_items)
	required_item_3 = pick_n_take(possible_items)

/obj/item/ration_construction/container/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ration_construction) || istype(I, /obj/item/food))
		if(istype(I, required_item_1) && !item_1_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_1_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold1.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return

		if(istype(I, required_item_2) && !item_2_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_2_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold2.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return

		if(istype(I, required_item_3) && !item_3_fulfilled)
			if(do_after(user, 1.5 SECONDS, src))
				qdel(I)
				item_3_fulfilled = TRUE
				to_chat(usr, span_notice("Ingredient inserted."))
				playsound(src, 'hl13/sound/halflifeeffects/crafting/paperfold3.ogg', 50, TRUE, extrarange = -3)
			else
				to_chat(usr, span_notice("Packing Failed."))
				return
	else
		to_chat(usr, span_notice("This is not the correct ingredient."))
		return

	if(item_1_fulfilled && item_2_fulfilled && item_3_fulfilled)
		to_chat(usr, span_notice("Container has been filled correctly. Seal with hands while holding to complete, or use a sealing machine."))
		filled = TRUE

/obj/item/ration_construction/container/attack_self(mob/user)
	if(filled && !completed)
		to_chat(usr, span_notice("Sealing box..."))
		if(do_after(user, 5 SECONDS, src))
			to_chat(usr, span_notice("Container succesfully sealed. Reward dispensed."))
			seal(user)
	else if(completed)
		to_chat(usr, span_notice("The box is already completed and sealed."))
		return
	else
		to_chat(usr, span_notice("The box isn't yet fully filled, and can not be sealed."))
		return

/obj/item/ration_construction/container/proc/seal(mob/user, reward = 0)
	reward += credit_reward
	playsound(src, 'hl13/sound/halflifeeffects/crafting/ducttape1.ogg', 50, TRUE, extrarange = -3)
	completed = TRUE
	new /obj/item/stack/spacecash/c1(user.loc, reward)
	icon_state = "container"
	SSsociostability.modifystability(1) //Working increases stability

/obj/item/ration_construction/used_container
	name = "deposited ration refill container"
	desc = "An empty ration refill container that has been marked as received by a ration vendor unit. You can send it back on the cargo shuttle for recycling to gain a small amount of credits for the district's cargo budget."
	icon_state = "container_used"

/obj/item/ration_construction/container/exotic
	name = "exotic ration refill container"
	desc = "A container which has a designated list of items it should contain. Once it has gotten these items, it can be put inside a ration vendor machine to refill it. This refill container has some exotic requirements."

	refill_rate = 5
	credit_reward = 5

	possible_picks = list(/obj/item/food/meat/slab/xen, /obj/item/food/grown/mushroom_stem, /obj/item/ration_construction/bags, /obj/item/ration_construction/nutripastes, /obj/item/ration_construction/purple_cans, /obj/item/food/grown/wheat)

// Going to put all of the ration making devices/ingredients here for now. But they can be moved out for conciseness later ~Death
// Flavorings
/obj/item/ration_construction/flavoring
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"
	var/rtype

/obj/item/ration_construction/flavoring/sweet
	name = "Sweet Flavoring"
	desc = ""
	rtype = "Sweet"

/obj/item/ration_construction/flavoring/bitter
	name = "Bitter Flavoring"
	desc = ""
	rtype = "Bitter"

/obj/item/ration_construction/flavoring/sour
	name = "Sour Flavoring"
	desc = ""
	rtype = "Sour"

// Bar Bases
/obj/item/ration_construction/base
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"
	var/rtype

/obj/item/ration_construction/base/carbohydrate
	name = "Carbohydrate Base"
	desc = ""
	rtype = "Carbohydrate"

/obj/item/ration_construction/base/fat
	name = "Fat Base"
	desc = ""
	rtype = "Fat"

/obj/item/ration_construction/base/fiber
	name = "Fiber Base"
	desc = ""
	rtype = "Fiber"

// Crafted Ration Blocks
/obj/item/ration_construction/ingredientblock
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"

/obj/item/ration_construction/ingredientblock/sweetcarb
	name = "Sweet+Carbohydrate Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/sweetfat
	name = "Sweet+Fat Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/sweetfiber
	name = "Sweet+Fiber Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/bittercarb
	name = "Bitter+Carbohydrate Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/bitterfat
	name = "Bitter+Fat Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/bitterfiber
	name = "Bitter+Fiber Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/sourcarb
	name = "Sour+Carbohydrate Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/sourfat
	name = "Sour+Fat Block"
	desc = ""

/obj/item/ration_construction/ingredientblock/sourfiber
	name = "Sour+Fiber Block"
	desc = ""

// Bar Maker
/obj/machinery/nutrientmixer
	name = "nutrient mixer"
	desc = "An industrial machine utilized to mix flavour and nutrient bases together into the semi-edible filling of ration packets."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "reactor"
	var/sour = 0
	var/bitter = 0
	var/sweet = 0
	var/carbohydrate = 0
	var/fat = 0
	var/fiber = 0
	var/list/selection1 = list("Carbohydrate", "Fat", "Fiber")
	var/list/selection2 = list("Sour", "Bitter", "Sweet")

/obj/machinery/nutrientmixer/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with Flavourings or Nutrient Bases to fill the device.")
	. += span_notice("You can use the machine to mix a nutrient block together.")
	. += span_notice("Supplies")
	. += span_notice("Sour: [sour], Bitter: [bitter], Sweet: [sweet], Carbohydrate: [carbohydrate], Fat: [fat], Fiber: [fiber]")

/obj/machinery/nutrientmixer/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/ration_construction/flavoring) || istype(I, /obj/item/ration_construction/base))
		if(do_after(user, 1.5 SECONDS, src))
			switch(I.rtype)
				if("Sour")
					sour += 1
				if("Bitter")
					bitter += 1
				if("Sweet")
					sweet += 1
				if("Carbohydrate")
					carbohydrate += 1
				if("Fat")
					fat += 1
				if("Fiber")
					fiber += 1
			qdel(I)

// This can be condensed eventually the switch tree is ugly, but I'm lazy atm. Will revisit later.
/obj/machinery/nutrientmixer/interact(mob/living/carbon/human/user)
	. = ..()
	var/s1 = input(user, "What base to use?", "Choices") as null|anything in selection1
	var/s2 = input(user, "What flavour to use?", "Choices") as anything in selection2
	switch(s1)
		if("Carbohydrate")
			if(carbohydrate > 0)
				carbohydrate -= 1
				switch(s2)
					if("Sour")
						if(sour > 0)
							sour -= 1
							new /obj/item/ration_construction/ingredientblock/sourcarb(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							new /obj/item/ration_construction/ingredientblock/bittercarb(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							new /obj/item/ration_construction/ingredientblock/sweetcarb(user.loc, 1)
						else
							. += span_notice("You don't have any sweet flavour.")
							return
			else
				. += span_notice("You don't have any carbohydrate bases.")
				return
		if("Fat")
			if(fat > 0)
				fat -= 1
				switch(s2)
					if("Sour")
						if(sour > 0)
							sour -= 1
							new /obj/item/ration_construction/ingredientblock/sourfat(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							new /obj/item/ration_construction/ingredientblock/bitterfat(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							new /obj/item/ration_construction/ingredientblock/sweetfat(user.loc, 1)
						else
							. += span_notice("You don't have any sweet flavour.")
							return

			else
				. += span_notice("You don't have any fat bases.")
				return
		if("Fiber")
			if(fiber > 0)
				fiber -= 1
				switch(s2)
					if("Sour")
						if(sour > 0)
							sour -= 1
							new /obj/item/ration_construction/ingredientblock/sourfiber(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							new /obj/item/ration_construction/ingredientblock/bitterfiber(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							new /obj/item/ration_construction/ingredientblock/sweetfiber(user.loc, 1)
						else
							. += span_notice("You don't have any sweet flavour.")
							return

			else
				. += span_notice("You don't have any fiber bases.")
				return

// Water Refinement

/obj/item/ration_construction/waterbase
	name = "Unfiltered Water Jug"
	desc = "A jug of water filled with toxins and pollutants. This would be suicide to try and drink."
	icon_state = "waterjug"

/obj/item/ration_construction/watermix
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"
	var/wtype

/obj/item/ration_construction/watermix/blueadditive
	name = "Blue Water Additive"
	desc = ""
	wtype = "Blue"

/obj/item/ration_construction/watermix/yellowadditive
	name = "Yellow Water Additive"
	desc = ""
	wtype = "Yellow"

/obj/item/ration_construction/watermix/redadditive
	name = "Red Water Additive"
	desc = ""
	wtype = "Red"

/obj/item/ration_construction/watermix/purpleadditive
	name = "Purple Water Additive"
	desc = ""
	wtype = "Purple"

/obj/machinery/watermixer
	name = "Water Mixer"
	var/wateramt = 0
	var/cans = 0
	var/blue = 0
	var/yellow = 0
	var/red = 0
	var/purple = 0
	var/list/pouroptions = list("Mix Blue Water", "Mix Yellow Water", "Mix Red Water", "Mix Purple Water")

/obj/machinery/watermixer/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/ration_construction/watermix))
		if(do_after(user, 1.5 SECONDS, src))
			switch(I.rtype)
				if("Red")
					red += 1
				if("Blue")
					blue += 1
				if("Yellow")
					yellow += 1
				if("Purple")
					purple += 1
			qdel(I)
	if(istype(I, /obj/item/ration_construction/waterbase))
		if(do_after(user, 1.5 SECONDS, src))
			wateramt += 5
			qdel(I)
	if(istype(I, /obj/item/ration_construction/emptycans))
		if(do_after(user, 1.5 SECONDS, src))
			cans += 4
			qdel(I)

// Package Maker \\ The most simplistic of them all

/obj/machinery/packagemaker
	name = "Package Extruder"
	desc = "A machine which takes raw plastic and makes them into the outer package."
	var/plastic = 0

