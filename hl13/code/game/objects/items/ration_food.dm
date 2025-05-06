//Package Wrapping//

/obj/item/halflife/nutrient_bar_wrapping
	name = "nutrient bar base"
	gender = NEUTER
	desc = "you forgot to download CS:source. Make sure to tell a dev that you're seeing this."
	icon = 'hl13/icons/obj/food.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/bar_type = /obj/item/food/halflife/nutrient_bar //used to put the bar objects in hand genarated when unwrapped
	var/bar_waste = /obj/item/trash/halflife/nutrient_bar_waste //used to put the trash objects in hand genarated when unwrapped

	custom_price = 10

/obj/item/halflife/nutrient_bar_wrapping/attack_self(mob/user)
	to_chat(user, span_notice("You start to unwrap the nutrient bar wraping..."))
	if(!do_after(user, 1.5 SECONDS, target = user))
		return
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	usr.put_in_hands(new bar_type)
	new bar_waste(usr.loc)
	playsound(loc, 'sound/items/poster/poster_ripped.ogg', 50, TRUE)
	qdel(src)

/obj/item/halflife/nutrient_bar_wrapping/water
	name = "Water flavored nutrient bar"
	desc = "A Water flavored nutrient bar with it's wrapping on."
	icon_state = "bar_package"
	bar_type = /obj/item/food/halflife/nutrient_bar/water
	bar_waste = /obj/item/trash/halflife/nutrient_bar_waste/water

/obj/item/halflife/nutrient_bar_wrapping/pork
	name = "Pork flavored nutrient bar"
	desc = "A Pork flavored nutrient bar with it's wrapping on."
	icon_state = "bar_package_2"
	bar_type = /obj/item/food/halflife/nutrient_bar/pork
	bar_waste = /obj/item/trash/halflife/nutrient_bar_waste/pork

/obj/item/halflife/nutrient_bar_wrapping/beef
	name = "beef patty"
	desc = "A beef patty with it's wrapping on."
	icon_state = "bar_package_3"
	bar_type = /obj/item/food/halflife/nutrient_bar/beef
	bar_waste = /obj/item/trash/halflife/nutrient_bar_waste/beef

////////////
/obj/item/food/halflife
	bite_consumption = 1
	icon = 'hl13/icons/obj/food.dmi'
	var/mood_penalty

///Override for checkliked callback
/obj/item/food/halflife/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/halflife/proc/check_liked(mob/living/carbon/human/consumer) //Nobody likes rationpacks. Nobody. Unless you can't taste anything. If so, good on you.
	if(HAS_TRAIT(consumer, TRAIT_AGEUSIA)) //if you can't taste it, it doesn't taste good
		return 0
	else
		if(mood_penalty)
			return mood_penalty
		else
			return 0

/obj/item/food/halflife/nutrient_bar
	mood_penalty = FOOD_DISLIKED

//Goes in standard rations
/obj/item/food/halflife/nutrient_bar/water
	name = "Water flavored nutrient bar"
	desc = "A combine nutrient bar found in rations, consisting of solidified vitamins and nutriments in a waxy bar. This one tastes like moldy water that has been in a plastic bottle for too long."
	icon_state = "water_bar"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
	)
	tastes = list("Water" = 2, "Cardboard" = 2, "Plastic" = 1)

//Goes in production and loyalty grade rations
/obj/item/food/halflife/nutrient_bar/pork
	name = "Pork flavored nutrient bar"
	desc = "A combine nutrient bar found in rations, consisting of solidified vitamins and nutriments in a waxy bar. This one tastes like pig lard."
	icon_state = "pork_bar"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("Pork" = 1, "Lard" = 1)
	mood_penalty = FOOD_UNPLEASANT

//Goes in priority rations.
/obj/item/food/halflife/nutrient_bar/beef
	name = "Beef patty"
	desc = "A solidifed circular formation of nutriments that is painted brown and given drawn on char marks. Regardless of it's fakeness, the slightly beefy taste is not so bad."
	icon_state = "beef_patty"
	foodtypes = MEAT
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("Beef"=1)
	mood_penalty = null

/obj/item/storage/halflife/hand_box
	name = "Small cardboard box"
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "cardboardbox"
	w_class = WEIGHT_CLASS_SMALL
	var/closed_icon_state = "cardboardbox"
	var/open_icon_state = "cardboardbox_open"
	var/box_content = null

	custom_price = 10

/obj/item/storage/halflife/hand_box/PopulateContents()
	new box_content(src)

/obj/item/storage/halflife/hand_box/Initialize(mapload)
	. = ..()
	icon_state = closed_icon_state
	atom_storage.max_slots = 1

/obj/item/storage/halflife/hand_box/Exited(atom/movable/gone, direction)
	. = ..()
	icon_state = open_icon_state

/obj/item/storage/halflife/hand_box/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	icon_state = closed_icon_state

//Paste Boxs
//Goes inside standard and production grade rations
/obj/item/storage/halflife/hand_box/egg
	name = "Egg paste ration box"
	desc = "A box used for a egg paste cube."
	open_icon_state = "food_package_open"
	closed_icon_state = "food_package"
	box_content = /obj/item/food/halflife/egg_paste

//Goes inside loyalty grade rations
/obj/item/storage/halflife/hand_box/chicken
	name = "Chicken paste ration box"
	desc = "A box used for a chicken paste cube."
	open_icon_state = "food_package_2_open"
	closed_icon_state = "food_package_2"
	box_content = /obj/item/food/halflife/chicken_paste

//Goes inside priority grade rations
/obj/item/storage/halflife/hand_box/cookie
	name = "Cookie ration box"
	desc = "A box used for a cookie."
	open_icon_state = "food_package_3_open"
	closed_icon_state = "food_package_3"
	box_content = /obj/item/food/halflife/cookie

//food paste items
/obj/item/food/halflife/egg_paste
	name = "egg paste"
	desc = "A solid mass of paste which jiggles like jello. It is flavored to taste like boiled eggs, but the consistency has it feeling like raw egg whites."
	icon_state = "egg_paste"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
	)
	tastes = list("Soggy eggs" = 1)
	mood_penalty = FOOD_DISLIKED

/obj/item/food/halflife/chicken_paste
	name = "chicken paste"
	desc = "A solid mass of paste which jiggles like jello. It is flavored to taste like chicken, but the consistency leaves an unpleasant mouth feel."
	icon_state = "chicken_paste"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
	)
	tastes = list("Chicken" = 1)
	mood_penalty = FOOD_UNPLEASANT

/obj/item/food/halflife/cookie
	name = "cookie"
	icon_state = "cookie"
	icon = 'hl13/icons/obj/food.dmi'
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("cookie" = 1)
	foodtypes = GRAIN | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	desc = "A small disk resembling an old world cookie...? The combine did a good job faking this one, you can hardly tell if it is real or not, though the barely sweet taste does leave you disappointed."

/obj/item/storage/halflife/pill_bottle
	name = "AntiSleep Pill bottle"
	icon = 'hl13/icons/obj/food.dmi'
	desc = "Good for late nights"
	icon_state = "pill_bottle"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/halflife/pill_bottle/PopulateContents()
	for(var/i=0,i<10, i++)
		new /obj/item/reagent_containers/pill/antisleep(src)

/obj/item/reagent_containers/pill/antisleep
	name = "antisleep pill"
	desc = "Used to reduce the need for sleep."
	icon_state = "pill8"
	list_reagents = list(/datum/reagent/iron = 30) //place holder
	rename_with_volume = TRUE

//Soup dust
/obj/item/reagent_containers/cup/halflife/sustenance_dust
	name = "Desiccated Sustenance Dust"
	desc = "This packet is found in biotic rations, Can be mixed with water to make a soup"
	var/icon_open = "bar_package_4_open"
	icon_state = "bar_package_4"
	icon = 'hl13/icons/obj/food.dmi'
	volume = 1
	list_reagents = list(/datum/reagent/consumable/halflife/sustenance_dust = 1)

/obj/item/reagent_containers/cup/halflife/sustenance_dust/attack_self(mob/user)
	to_chat(user, "You tear the top of the package off.")
	reagents.flags |= OPENCONTAINER
	playsound(loc, 'sound/items/poster/poster_ripped.ogg', 50, TRUE)
	icon_state = icon_open

/datum/reagent/consumable/halflife/sustenance_dust
	name = "Desiccated Sustenance Dust"
	color = "#928a86ff"
	taste_description = "Saw dust"

/datum/chemical_reaction/sustenance_dust_to_soup
	results = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/water = 16)
	required_reagents = list(/datum/reagent/water = 20, /datum/reagent/consumable/halflife/sustenance_dust = 1)

/datum/chemical_reaction/sustenance_dust_to_soup/impure
	results = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/water/unpurified = 16)
	required_reagents = list(/datum/reagent/water/unpurified = 20, /datum/reagent/consumable/halflife/sustenance_dust = 1)

//trash
/obj/item/trash/halflife/nutrient_bar_waste
	name = "Debug Trash"
	icon = 'hl13/icons/obj/food.dmi'
	icon_state = "Debug_bar"
	desc = "you forgot to download CS:sorce. Make sure to tell a dev that your seeing this."

/obj/item/trash/halflife/nutrient_bar_waste/water
	name = "Water flavored nutrient bar wrapper"
	icon_state = "bar_package_crumpled"
	desc = "The discarded wrapping of a Water flavored nutrient bar."

/obj/item/trash/halflife/nutrient_bar_waste/pork
	name = "Pork flavored nutrient bar wrapper"
	icon_state = "bar_package_2_crumpled"
	desc = "The discarded wrapping of a Pork flavored nutrient bar."
/obj/item/trash/halflife/nutrient_bar_waste/beef
	name = "Beef wrapper"
	icon_state = "bar_package_3_crumpled"









/obj/item/food/pierogi_ration
	name = "nutriment pierogi"
	desc = "Nowadays, the only thing that makes you want to get up in the morning to grab a ration and live another day is the mere chance to get one of these in your rations."
	icon_state = "pierogiration"
	icon = 'hl13/icons/obj/food.dmi'
	bite_consumption = 2
	tastes = list("processed meat" = 3, "old grains" = 3)
	foodtypes = MEAT | GRAIN
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 3)
	custom_price = 20

	preserved_food = TRUE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

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
