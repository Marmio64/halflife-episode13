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

/obj/machinery/intruder_coffeemaker/interact(mob/living/carbon/human/user)
	.=..()

	if(HAS_TRAIT(user, TRAIT_THE_INTRUDER))
		if(sabotaged)
			to_chat(user, span_notice("This machine is already sabotaged."))
			return
		else
			to_chat(user, span_notice("Sabotaging the machine..."))
			if(do_after(user, 3 SECONDS, src))
				to_chat(user, span_notice("Sabotaged!"))
				sabotaged = TRUE
				return
			else
				return

	if(sabotaged)
		var/list/sabotage_texts = list(
		"What the hell!? Someone messed up the color coding on the sugar packets and turned off the warming plate! We're going to need to fix this...",
		"Someone spilled creamer all over the whole pot! This is going to take forever to clean...",
		"This coffee tastes like shit! Damnit, we're going to need to brew a new mug...",
		"Someone drank all the coffee without making a new mug! Damnit, we're going to need to brew a new mug...",
		"Damnit, who turned off the machine? Where the hell is the power switch...",
		"Someone watered down this coffee to high hell! Damnit, we're going to need to brew a new mug...")

		to_chat(user, span_notice("[pick(sabotage_texts)]"))

		if(do_after(user, 15 SECONDS, src))
			to_chat(user, span_notice("There! All fixed."))
			sabotaged = FALSE
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
		to_chat(user, span_notice("You drink the freshly poured cup of coffee, and feel energized!"))
		user.adjust_tiredness(-1000)
		user.reagents.add_reagent(/datum/reagent/consumable/coffee,20)
