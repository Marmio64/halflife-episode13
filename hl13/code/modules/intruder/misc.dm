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


	if(user.tiredness < 250)
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
