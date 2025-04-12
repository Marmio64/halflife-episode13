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

/obj/item/ration_construction/empty_cans
	name = "empty cans"
	desc = "A stack of empty water cans, ready to be filled."
	icon_state = "blankcans"

/obj/item/ration_construction/blue_cans
	name = "pack of blue breen water"
	desc = "A handful of freshly mixed, sealed water cans. The packing would need to be removed before drinking them."
	icon_state = "cans"

/obj/item/ration_construction/yellow_cans
	name = "pack of yellow breen water"
	desc = "A handful of freshly mixed, sealed water cans. The packing would need to be removed before drinking them."
	icon_state = "yellowcans"

/obj/item/ration_construction/red_cans
	name = "pack of red breen water"
	desc = "A handful of freshly mixed, sealed water cans. The packing would need to be removed before drinking them."
	icon_state = "redcans"

/obj/item/ration_construction/purple_cans
	name = "pack of purple nutriment cans"
	desc = "A handful of freshly mixed, sealed water cans. The packing would need to be removed before drinking them."
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
		/obj/item/ration_construction/ingredientblock/sweetprotein,
		/obj/item/ration_construction/ingredientblock/sweetfat,
		/obj/item/ration_construction/ingredientblock/sweetfiber,
		/obj/item/ration_construction/ingredientblock/bitterprotein,
		/obj/item/ration_construction/ingredientblock/bitterfat,
		/obj/item/ration_construction/ingredientblock/bitterfiber,
		/obj/item/ration_construction/ingredientblock/sourprotein,
		/obj/item/ration_construction/ingredientblock/sourfat,
		/obj/item/ration_construction/ingredientblock/sourfiber
	)
	var/possiblewater = list(
		/obj/item/ration_construction/purple_cans,
		/obj/item/ration_construction/yellow_cans,
		/obj/item/ration_construction/blue_cans,
		/obj/item/ration_construction/red_cans)


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

	required_item_1 = pick(possiblenutrient)
	required_item_2 = pick(possiblewater)
	required_item_3 = /obj/item/ration_construction/bags

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

//	possible_picks = list(/obj/item/food/meat/slab/xen, /obj/item/food/grown/mushroom_stem, /obj/item/ration_construction/bags, /obj/item/ration_construction/nutripastes, /obj/item/ration_construction/purple_cans, /obj/item/food/grown/wheat)

/obj/item/ration_construction/container/exotic/Initialize(mapload)
	required_item_1 = /obj/item/food/meat/slab/xen
	required_item_2 = /obj/item/ration_construction/purple_cans
	required_item_3 = /obj/item/ration_construction/bags

// Going to put all of the ration making devices/ingredients here for now. But they can be moved out for conciseness later ~Death
// Flavorings
/obj/item/ration_construction/flavoring
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"
	var/rtype

/obj/item/ration_construction/flavoring/sweet
	name = "Sweet Flavoring"
	desc = "A jug of flavoring syrup."
	rtype = "sweet"
	icon_state = "sweet"

/obj/item/ration_construction/flavoring/bitter
	name = "Bitter Flavoring"
	desc = "A jug of flavoring syrup."
	rtype = "bitter"
	icon_state = "bitter"

/obj/item/ration_construction/flavoring/sour
	name = "Sour Flavoring"
	desc = "A jug of flavoring syrup."
	rtype = "sour"
	icon_state = "sour"

// Bar Bases
/obj/item/ration_construction/base
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"
	var/rtype

/obj/item/ration_construction/base/protein
	name = "Protein Base"
	desc = "A flavorless block of protein."
	rtype = "Protein"
	icon_state = "proteinblock"

/obj/item/ration_construction/base/fat
	name = "Fat Base"
	desc = "A flavorless block of fat."
	rtype = "Fat"
	icon_state = "fatblock"

/obj/item/ration_construction/base/fiber
	name = "Fiber Base"
	desc = "A flavorless block of fiber."
	rtype = "Fiber"
	icon_state = "fiberblock"

// Crafted Ration Blocks
/obj/item/ration_construction/ingredientblock
	name = "YOU SHOULD NOT SEE THIS"
	desc = ""
	icon_state = "nutripastes"

/obj/item/ration_construction/ingredientblock/sweetprotein
	name = "Sweet+Protein Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/sweetfat
	name = "Sweet+Fat Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/sweetfiber
	name = "Sweet+Fiber Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/bitterprotein
	name = "Bitter+Protein Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/bitterfat
	name = "Bitter+Fat Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/bitterfiber
	name = "Bitter+Fiber Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/sourprotein
	name = "Sour+Protein Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/sourfat
	name = "Sour+Fat Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

/obj/item/ration_construction/ingredientblock/sourfiber
	name = "Sour+Fiber Block"
	desc = "A completed ration ingrediant, ready to be added to a container."

// Bar Maker
/obj/machinery/nutrientmixer
	name = "nutrient mixer"
	desc = "An industrial machine utilized to mix flavour and nutrient bases together into the semi-edible filling of ration packets."
	icon = 'icons/obj/machines/manufactorio.dmi'
	icon_state = "smelter_on"
	var/sour = 0
	var/bitter = 0
	var/sweet = 0
	var/protein = 0
	var/fat = 0
	var/fiber = 0
	var/list/selection1 = list("Protein", "Fat", "Fiber")
	var/list/selection2 = list("Sour", "Bitter", "Sweet")

/obj/machinery/nutrientmixer/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with Flavourings or Nutrient Bases to fill the device.")
	. += span_notice("You can use the machine to mix a nutrient block together.")
	. += span_notice("Supplies")
	. += span_notice("Sour: [sour], Bitter: [bitter], Sweet: [sweet], Protein: [protein], Fat: [fat], Fiber: [fiber]")

/obj/machinery/nutrientmixer/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/ration_construction/flavoring))
		if(do_after(user, 1.5 SECONDS, src))
			var/obj/item/ration_construction/flavoring/F = I
			switch(F.rtype)
				if("sour")
					sour += 1
				if("bitter")
					bitter += 1
				if("sweet")
					sweet += 1
			to_chat(usr, span_notice("Added [F]..."))
			qdel(F)
	if(istype(I, /obj/item/ration_construction/base))
		var/obj/item/ration_construction/base/B = I
		if(do_after(user, 1.5 SECONDS, src))
			switch(B.rtype)
				if("Protein")
					protein += 1
				if("Fat")
					fat += 1
				if("Fiber")
					fiber += 1
			to_chat(usr, span_notice("Added [B]..."))
			qdel(B)

// This can be condensed eventually the switch tree is ugly, but I'm lazy atm. Will revisit later.
/obj/machinery/nutrientmixer/interact(mob/living/carbon/human/user)
	. = ..()
	var/s1 = input(user, "What base to use?", "Choices") as null|anything in selection1
	var/s2 = input(user, "What flavour to use?", "Choices") as null|anything in selection2
	if(!s1 || !s2)
		return
	to_chat(usr, span_notice("Mixing ration paste..."))
	switch(s1)
		if("Protein")
			if(protein > 0)
				protein -= 1
				switch(s2)
					if("Sour")
						if(sour > 0)
							sour -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/sourprotein(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/bitterprotein(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/sweetprotein(user.loc, 1)
						else
							. += span_notice("You don't have any sweet flavour.")
							return
			else
				. += span_notice("You don't have any protein bases.")
				return
		if("Fat")
			if(fat > 0)
				fat -= 1
				switch(s2)
					if("Sour")
						if(sour > 0)
							sour -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/sourfat(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/bitterfat(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
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
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/sourfiber(user.loc, 1)
						else
							. += span_notice("You don't have any sour flavour.")
							return
					if("Bitter")
						if(bitter > 0)
							bitter -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
							new /obj/item/ration_construction/ingredientblock/bitterfiber(user.loc, 1)
						else
							. += span_notice("You don't have any bitter flavour.")
							return
					if("Sweet")
						if(sweet > 0)
							sweet -= 1
							playsound(src, 'hl13/sound/machines/meatmixer.ogg', 50, FALSE, extrarange = -1)
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
	desc = "A tablet produced by the Combine to purify the water, amongst other things."
	wtype = "blueadd"
	icon_state = "blueadd"

/obj/item/ration_construction/watermix/yellowadditive
	name = "Yellow Water Additive"
	desc = "A tablet produced by the Combine to purify the water, amongst other things."
	wtype = "yellowadd"
	icon_state = "yellowadd"

/obj/item/ration_construction/watermix/redadditive
	name = "Red Water Additive"
	desc = "A tablet produced by the Combine to purify the water, amongst other things."
	wtype = "redadd"
	icon_state = "redadd"

/obj/item/ration_construction/watermix/purpleadditive
	name = "Purple Water Additive"
	desc = "A tablet produced by the Combine to purify the water, amongst other things."
	wtype = "purpleadd"
	icon_state = "purpleadd"

/obj/machinery/watermixer
	name = "Water Mixer"
	desc = "A device used to properly mix the Combine's additives to create the only source of potable water."
	icon = 'icons/obj/machines/biogenerator.dmi'
	icon_state = "biogenerator" // placeholder for now. I'm a shit spriter ~Death
	var/wateramt = 0
	var/cans = 0
	var/blue = 0
	var/yellow = 0
	var/red = 0
	var/purple = 0
	var/list/pouroptions = list("Mix Blue Water", "Mix Yellow Water", "Mix Red Water", "Mix Purple Water")

/obj/machinery/watermixer/examine(mob/user)
	. = ..()
	. += span_notice("You can hit it with Cans, Additives, or Water Jugs to fill the device.")
	. += span_notice("You can use the machine to mix Breen Waters together.")
	. += span_notice("Supplies")
	. += span_notice("Red: [red], Blue: [blue], Yellow: [yellow], Purple: [purple], Water: [wateramt], Cans: [cans]")

/obj/machinery/watermixer/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/ration_construction/watermix))
		var/obj/item/ration_construction/watermix/W = I
		if(do_after(user, 1.5 SECONDS, src))
			switch(W.wtype)
				if("redadd")
					red += 1
				if("blueadd")
					blue += 1
				if("yellowadd")
					yellow += 1
				if("purpleadd")
					purple += 1
			to_chat(usr, span_notice("Added [I]..."))
			qdel(I)

	if(istype(I, /obj/item/ration_construction/waterbase))
		if(do_after(user, 1.5 SECONDS, src))
			wateramt += 3
			to_chat(usr, span_notice("Added [I]..."))
			qdel(I)

	if(istype(I, /obj/item/ration_construction/empty_cans))
		if(do_after(user, 1.5 SECONDS, src))
			cans += 1
			to_chat(usr, span_notice("Added [I]..."))
			qdel(I)

/obj/machinery/watermixer/interact(mob/living/carbon/human/user)
	. = ..()
	if(wateramt < 1)
		to_chat(usr, span_notice("You don't have any water to mix with."))
		return
	var/mix = input(user, "What to mix?", "Choices") as null|anything in pouroptions
	switch(mix)
		if("Mix Blue Water")
			if(blue < 1)
				to_chat(usr, span_notice("You don't have any blue additive to mix with."))
				return
			playsound(src, 'hl13/sound/machines/canmixer.ogg', 50, FALSE, extrarange = -1)
			if(do_after(user, 4 SECONDS, src))
				blue -= 1
				wateramt -= 1
			new /obj/item/ration_construction/blue_cans(user.loc, 1)
		if("Mix Yellow Water")
			if(yellow < 1)
				to_chat(usr, span_notice("You don't have any yellow additive to mix with."))
				return
			playsound(src, 'hl13/sound/machines/canmixer.ogg', 50, FALSE, extrarange = -1)
			if(do_after(user, 4 SECONDS, src))
				yellow -= 1
				wateramt -= 1
			new /obj/item/ration_construction/yellow_cans(user.loc, 1)
		if("Mix Red Water")
			if(red < 1)
				to_chat(usr, span_notice("You don't have any red additive to mix with."))
				return
			playsound(src, 'hl13/sound/machines/canmixer.ogg', 50, FALSE, extrarange = -1)
			if(do_after(user, 4 SECONDS, src))
				red -= 1
				wateramt -= 1
			new /obj/item/ration_construction/red_cans(user.loc, 1)
		if("Mix Purple Water")
			if(purple < 1)
				to_chat(usr, span_notice("You don't have any purple additive to mix with."))
				return
			playsound(src, 'hl13/sound/machines/canmixer.ogg', 50, FALSE, extrarange = -1)
			if(do_after(user, 4 SECONDS, src))
				purple -= 1
				wateramt -= 1
			new /obj/item/ration_construction/purple_cans(user.loc, 1)
