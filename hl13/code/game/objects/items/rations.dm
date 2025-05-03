/obj/item/storage/box/halflife
	icon = 'hl13/icons/obj/storage/rationbags.dmi'

/obj/item/storage/box/halflife/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2

/obj/item/storage/box/halflife/ration
	name = "ration pack"
	desc = "A pack with ration items inside."
	foldable_result = null
	icon_state = "ration"

/obj/item/storage/box/halflife/ration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/food/rationpack(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater(src)
	new /obj/item/stack/spacecash/c1(src, 5)

/obj/item/storage/box/halflife/betterration
	name = "production-grade ration pack"
	desc = "A slightly enhanced ration pack for productive citizens."
	foldable_result = null
	icon_state = "ration-bettergrade"

/obj/item/storage/box/halflife/betterration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/food/rationpack/box(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/stack/spacecash/c10(src)

/obj/item/storage/box/halflife/loyaltyration
	name = "loyalty-grade ration pack"
	desc = "An improved ration pack, intended for loyalists and civil protection. The food inside is slightly more filling and flavorful."
	foldable_result = null
	icon_state = "ration-highgrade"

/obj/item/storage/box/halflife/loyaltyration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/food/rationpack/loyalty(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/food/flavorbar(src)
	new /obj/item/stack/credit_voucher(src, 3)

/obj/item/storage/box/halflife/bestration
	name = "priority-grade ration pack"
	desc = "An extra high grade ration pack. It's pretty good in comparison, though still not incredible."
	foldable_result = null
	icon_state = "ration-bestgrade"

/obj/item/storage/box/halflife/bestration/PopulateContents()
	if(prob(5))
		new /obj/item/food/pierogi_ration(src)
		new /obj/item/reagent_containers/cup/glass/bottle/beer/light(src)
	else
		new /obj/item/food/rationpack/loyalty(src)

	new /obj/item/reagent_containers/cup/soda_cans/breenwater/green(src)
	new /obj/item/food/flavorbar/large(src)
	new /obj/item/stack/credit_voucher(src, 4)

/obj/item/storage/box/halflife/badration
	name = "low-grade ration pack"
	desc = "A downgraded ration pack usually given to misbehaving citizens or your average biotic. This is utter garbage."
	foldable_result = null
	icon_state = "ration-lowgrade"
	custom_price = 25

/obj/item/storage/box/halflife/badration/PopulateContents()
	new /obj/item/food/rationpack/lowgrade(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow(src)

/obj/item/storage/box/halflife/worstration
	name = "bottom-grade ration pack"
	desc = "A downgraded ration pack, usually dumped out onto the floor for despicable citizens and exceptionally bad biotics. You're not sure if you can call the stuff inside edible, even compared to normal rations. This is absolutely terrible garbage."
	foldable_result = null
	icon_state = "ration-worstgrade"
	custom_price = 25

/obj/item/storage/box/halflife/worstration/PopulateContents()
	new /obj/item/food/nutripaste/small(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow(src)

/obj/item/food/rationpack
	name = "nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. It's taste is comparable to viscous, plastic contaminated water with hints of old powdered milk, but at the least you've started to get used to it."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "rationpack"
	bite_consumption = 2
	tastes = list("gross water" = 3, "sadness" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/nutriment = 7)
	custom_price = 15

	preserved_food = TRUE

	var/mood_penalty = FOOD_DISLIKED

///Override for checkliked callback
/obj/item/food/rationpack/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/rationpack/proc/check_liked(mob/living/carbon/human/consumer) //Nobody likes rationpacks. Nobody. Unless you can't taste anything. If so, good on you.
	if(HAS_TRAIT(consumer, TRAIT_AGEUSIA)) //if you can't taste it, it doesn't taste good
		return 0
	else
		return mood_penalty

/obj/item/food/rationpack/loyalty
	name = "loyalty-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. It is more healthy and filling than standard bars, and is packed with flavor enhancers that make it slightly more edible."
	icon_state = "loyaltyrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 3)
	mood_penalty = FOOD_UNPLEASANT

/obj/item/food/rationpack/box
	name = "nutriment box"
	desc = "A 'egg' flavored ration nutriment box. More healthy than the standard bar, but just as filling."
	icon_state = "rationbox"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 3)

/obj/item/food/rationpack/lowgrade
	name = "low-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry. This one is less filling than most."
	icon_state = "lowrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6)

/obj/item/food/rationpack/worstgrade
	name = "bottom-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. This is the lowest of the low kinds of nutriment bars: Unfilling, and absolutely disgusting."
	icon_state = "lowrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	mood_penalty = FOOD_TOXIC

/obj/item/food/rationpack/manufactured
	name = "manufactured nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry. This one looks freshly made."

/obj/item/food/pierogi_ration
	name = "nutriment pierogi"
	desc = "Nowadays, the only thing that makes you want to get up in the morning to grab a ration and live another day is the mere chance to get one of these in your rations."
	icon_state = "pierogiration"
	icon = 'hl13/icons/obj/food.dmi'
	bite_consumption = 2
	tastes = list("processed meat" = 3, "old grains" = 3)
	foodtypes = MEAT | GRAIN
	food_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	custom_price = 20

	preserved_food = TRUE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/flavorbar
	name = "flavor bar"
	desc = "A condensed granolla bar sized nutriment bar. Far less filling than the full sized bars, but added artificial sweeteners turn the mush from gross slop into managable paste, which while not appeitizing is not upsetting."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "flavorbar"
	bite_consumption = 1
	tastes = list("artifical flavor" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/astrotame = 1, /datum/reagent/consumable/nutriment = 1)

	preserved_food = TRUE

/obj/item/food/flavorbar/large
	name = "large flavor bar"
	food_reagents = list(/datum/reagent/consumable/astrotame = 1, /datum/reagent/consumable/nutriment = 2)

/obj/item/food/devilled_flavorbar
	name = "devilled flavor bar"
	desc = "A flavor bar mixed with gelatinated egg paste, mayo, and a bit of water. The taste is somewhat reminescent of a devilled egg, though obviously nowhere near as good."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "devilledbar"
	bite_consumption = 4
	tastes = list("egg" = 3, "artificial flavor" = 2)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/astrotame = 1, /datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/mayonnaise = 10)

	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/reagent_containers/cup/glass/nutrimentmayobox
	name = "Mayo-eggbox"
	desc = "A nutriment egg box mixed with oils to create what resembles mayo."
	isGlass = FALSE
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "mayobox"
	list_reagents = list(/datum/reagent/consumable/mayonnaise = 50)

/obj/item/food/nutripaste
	name = "nutripaste tube"
	desc = "A tube full of nutripaste. This looks absolutely abhorrent, and makes the standard ration bars taste like a delicacy in comparison. At the least, it is rather nutritious."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "nutripaste"
	bite_consumption = 2
	tastes = list("rancid water" = 3, "depression" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/nutriment = 10) //Very nutritious at least...

	preserved_food = TRUE

/obj/item/food/nutripaste/handmade
	name = "handmade nutripaste tube"
	desc = "Stirred by hand, you're not sure why you made this disgusting slop by your own free will, but it is somehow more nutritious than its base ingredients, even if it tastes horrible. Desperate times call for desperate measures."
	food_reagents = list(/datum/reagent/consumable/nutriment = 2) //crafting it will give it extra nutriments, this is just the bonus stuff
	bite_consumption = 8 //often going to be a lot of stuff in it

/obj/item/food/nutripaste/small
	name = "small nutripaste tube"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)

///Override for checkliked callback
/obj/item/food/nutripaste/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/nutripaste/proc/check_liked(mob/living/carbon/human/consumer) //Nutripaste is espescially abhorrent...
	if(HAS_TRAIT(consumer, TRAIT_AGEUSIA)) //if you can't taste it, it doesn't taste good
		return 0
	else
		return FOOD_TOXIC


/obj/item/food/xenstew
	name = "xen stew can"
	desc = "A can filled with bubbling water thickened by crushed up nutriment bar pieces, with chunks of xenian flesh inside."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "xenstew"
	bite_consumption = 5
	tastes = list("alien flesh" = 3, "still water" = 3)
	foodtypes = MEAT
	food_reagents = list(/datum/reagent/consumable/nutriment = 14, /datum/reagent/water = 6)

	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/reagent_containers/cup/soda_cans/breenwater
	name = "water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory!"
	icon_state = "breenwater"
	list_reagents = list(/datum/reagent/water = 25)

/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow
	name = "yellow water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted yellow, and smells funny."
	icon_state = "breenwateryellow"
	list_reagents = list(/datum/reagent/water/unpurified = 20)
	custom_price = PAYCHECK_CREW * 0.65

/obj/item/reagent_containers/cup/soda_cans/breenwater/red
	name = "red water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted red, and seems more filled."
	icon_state = "breenwaterred"
	list_reagents = list(/datum/reagent/water = 35)
	custom_price = PAYCHECK_CREW * 1.3

/obj/item/reagent_containers/cup/soda_cans/breenwater/green
	name = "green water can"
	desc = "A special can of Breen's private reserve water, for the best of the best. Flavored, and topped off to full."
	icon_state = "breenwatergreen"
	list_reagents = list(/datum/reagent/water = 35, /datum/reagent/consumable/tonic = 5, /datum/reagent/consumable/sugar = 10)
	custom_price = PAYCHECK_CREW * 1.5

/obj/item/reagent_containers/cup/soda_cans/breenwater/purple
	name = "purple nutriment can"
	desc = "A special can of Breen's private reserve... Actually, this is a special oil-flavored 'nutriment fulfilling' can. It's not an offensive taste, but it isn't great and costs a lot for the calorie content..."
	icon_state = "breenwaterpurple"
	list_reagents = list(/datum/reagent/water = 7, /datum/reagent/consumable/nutriment/fat/oil = 15, /datum/reagent/consumable/nutriment = 3)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/soda_cans/breenwater/fuel
	name = "breen-fuel can"
	desc = "A special can of Breen's private reserve energy drinks. It has a strange after taste and makes you feel queezy, but you do at least feel more awake."
	icon_state = "fuelcan"
	list_reagents = list(/datum/reagent/consumable/breenfuel = 25)
	custom_price = PAYCHECK_CREW * 2

/obj/item/reagent_containers/cup/glass/mouthwash
	name = "Mouthwash Bottle"
	desc = "A bottle of old mouthwash. There's enough sugar in the thing you wonder how it would ever clean your mouth, let alone with how old it is."
	isGlass = FALSE
	icon_state = "mouthwash"
	list_reagents = list(/datum/reagent/consumable/sugar = 15, /datum/reagent/consumable/ethanol = 7, /datum/reagent/water = 28)

/obj/item/food/canned/halflife
	icon = 'hl13/icons/obj/food.dmi'

/obj/item/food/canned/halflife/beans
	name = "tin of pork beans"
	desc = "Old world beans with bits of pork floating inside. Better than rations at least."
	icon_state = "porknbean"
	trash_type = /obj/item/trash/can/food/halflife/beans
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/ketchup = 4,
	)
	tastes = list("beans" = 2, "pork" = 1)
	foodtypes = VEGETABLES | MEAT

/obj/item/food/canned/halflife/seafood
	name = "tin of fish"
	desc = "Some sort of chopped up fish crammed into a tin. It smells terrible, and looks just as bad, but hopefully is edible."
	icon_state = "seafood"
	trash_type = /obj/item/trash/can/food/halflife/seafood
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("fish" = 1)
	foodtypes = MEAT

/obj/item/food/canned/halflife/seafood/expired
	name = "tin of fish"
	desc = "Some sort of chopped up fish crammed into a tin. It smells terrible, and looks just as bad, but hopefully is edible."
	icon_state = "seafoodexpired"
	trash_type = /obj/item/trash/can/food/halflife/seafood
	food_reagents = list(
		/datum/reagent/consumable/nutriment/raw = 8,
		/datum/reagent/toxin/bad_food = 3,
	)
	tastes = list("expired fish" = 1)
	foodtypes = MEAT | TOXIC


/obj/item/food/canned/halflife/seafood/expired/open_can(mob/user)
	. = ..()
	desc = "The contents of this tin look extremely off, it might not be wise to eat out of it, not to mention the absolutely disgusting stench emanating from it."

/obj/item/food/canned/halflife/crisps
	name = "tin of crisps"
	desc = "A tin tube filled with crisps. They're stale, but the salt is good as ever at least."
	icon_state = "crisps"
	trash_type = /obj/item/trash/can/food/halflife/crisps
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/salt = 2,
	)
	tastes = list("stale chips" = 1)
	foodtypes = JUNKFOOD | FRIED

/obj/item/trash/can/food/halflife
	icon = 'hl13/icons/obj/food.dmi'

/obj/item/trash/can/food/halflife/beans
	name = "tin of pork beans"
	icon_state = "porknbean_empty"

/obj/item/trash/can/food/halflife/crisps
	name = "tin of crisps"
	icon_state = "crisps_empty"

/obj/item/trash/can/food/halflife/seafood
	name = "tin of fish"
	icon_state = "seafood_empty"
