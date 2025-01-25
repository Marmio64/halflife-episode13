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
	new /obj/item/food/rationpack(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater(src)
	new /obj/item/stack/spacecash/c1(src, 5)

/obj/item/storage/box/halflife/betterration
	name = "production-grade ration pack"
	desc = "A slightly enhanced ration pack for productive citizens."
	foldable_result = null
	icon_state = "ration-bettergrade"

/obj/item/storage/box/halflife/betterration/PopulateContents()
	new /obj/item/food/rationpack/box(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/stack/spacecash/c10(src)

/obj/item/storage/box/halflife/loyaltyration
	name = "loyalty-grade ration pack"
	desc = "An improved ration pack, intended for loyalists and civil protection. The food inside is slightly more filling and flavorful."
	foldable_result = null
	icon_state = "ration-highgrade"

/obj/item/storage/box/halflife/loyaltyration/PopulateContents()
	new /obj/item/food/rationpack/loyalty(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/red(src)
	new /obj/item/food/flavorbar(src)
	new /obj/item/stack/credit_voucher(src, 2)

/obj/item/storage/box/halflife/bestration
	name = "priority-grade ration pack"
	desc = "An extra high grade ration pack. It's pretty good in comparison, though still not incredible."
	foldable_result = null
	icon_state = "ration-bestgrade"

/obj/item/storage/box/halflife/bestration/PopulateContents()
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
	new /obj/item/food/rationpack/worstgrade(src)
	new /obj/item/reagent_containers/cup/soda_cans/breenwater/yellow(src)

/obj/item/food/rationpack
	name = "nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry"
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "rationpack"
	bite_consumption = 2
	tastes = list("gross water" = 3, "sadness" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/nutriment = 8)
	custom_price = 15

	preserved_food = TRUE

	var/mood_penalty = /datum/mood_event/gross_food

///Override for checkliked callback
/obj/item/food/rationpack/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/rationpack/proc/check_liked(mob/mob) //Nobody likes rationpacks. Nobody.
	return FOOD_DISLIKED

/obj/item/food/rationpack/loyalty
	name = "loyalty-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. It has 'artificial flavor enhancers' and additionals nutriments packed inside."
	icon_state = "loyaltyrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 3)
	mood_penalty = /datum/mood_event/displeasing_food

/obj/item/food/rationpack/box
	name = "nutriment box"
	desc = "A 'egg' flavored ration nutriment box. It's more filling than the standard bars, but just as gross."
	icon_state = "rationbox"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 3)

/obj/item/food/rationpack/lowgrade
	name = "low-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry. This one is less filling than most, and even worse tasting."
	icon_state = "lowrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6)
	mood_penalty = /datum/mood_event/disgusting_food

/obj/item/food/rationpack/worstgrade
	name = "bottom-grade nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry. This one is very unfilling and terrible tasting."
	icon_state = "lowrationpack"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	mood_penalty = /datum/mood_event/disgusting_food

/obj/item/food/rationpack/manufactured
	name = "manufactured nutriment bar"
	desc = "A 'water' flavored ration nutriment bar. Tastes gross, but at least you won't be hungry. This one looks freshly made."

/obj/item/food/flavorbar
	name = "flavor bar"
	desc = "A slightly sweet, and very small bar of... something. It's not nearly as flavorful as the name may suggest, but it is far better than the nutriment dense bars."
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


/obj/item/food/nutripaste
	name = "nutripaste"
	desc = "A tube full of nutripaste. This looks absolutely abhorrent, and makes the standard ration bars taste like a delicacy in comparison. At the least, it is rather nutritious."
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "nutripaste"
	bite_consumption = 2
	tastes = list("rancid water" = 3, "depression" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(/datum/reagent/consumable/nutriment = 10) //Very nutritious at least...

	preserved_food = TRUE

///Override for checkliked callback
/obj/item/food/nutripaste/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/nutripaste/proc/check_liked(mob/mob) //Nutripaste is espescially abhorrent...
	return FOOD_TOXIC


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
	custom_price = 15

/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow/Initialize(mapload)
	if(prob(10))
		list_reagents = list(/datum/reagent/water/unpurified = 10, /datum/reagent/toxin/mindbreaker = 10) //This smells funny...
	. = ..()

/obj/item/reagent_containers/cup/soda_cans/breenwater/red
	name = "red water can"
	desc = "A can of Breen's private reserve water. Supposedly, it helps improve your memory! This one is painted red, and seems more filled."
	icon_state = "breenwaterred"
	list_reagents = list(/datum/reagent/water = 35)

/obj/item/reagent_containers/cup/soda_cans/breenwater/green
	name = "green water can"
	desc = "A special can of Breen's private reserve water, for the best of the best. Flavored, and topped off to full."
	icon_state = "breenwatergreen"
	list_reagents = list(/datum/reagent/water = 35, /datum/reagent/consumable/tonic = 5, /datum/reagent/consumable/sugar = 10)

/obj/item/reagent_containers/cup/glass/mouthwash
	name = "Mouthwash Bottle"
	desc = "A bottle of old mouthwash. There's enough sugar in the thing you wonder how it would ever clean your mouth, let alone with how old it is."
	isGlass = FALSE
	icon_state = "mouthwash"
	list_reagents = list(/datum/reagent/consumable/sugar = 15, /datum/reagent/consumable/ethanol = 7, /datum/reagent/water = 28)
