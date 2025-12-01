/datum/reagent/consumable/nutriment/raw
	name = "Raw Nutriment"
	description = "Raw, unsafe nutriments that may possibly harbor dangerous pathogens."
	reagent_state = SOLID
	color = "#915037"

/datum/reagent/consumable/nutriment/raw/on_mob_life(mob/living/L, methods=TOUCH, reac_volume, show_message = TRUE, permeability = 1)
	..()
	if(!HAS_TRAIT(L, TRAIT_STRONG_STOMACH))
		if(prob(15))
			L.ForceContractDisease(new /datum/disease/gutworms)

/datum/reagent/consumable/breenfuel
	name = "Breen Fuel"
	description = "Makes you feel ready to take on the world without RESISTANCE."
	color = "#462b15" // rgb: 70, 43, 21
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "bitter coldness"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	metabolized_traits = list(TRAIT_STIMULATED)
	metabolization_rate = REAGENTS_METABOLISM * 2 //quick acting
	hydration_factor = 2

/datum/reagent/consumable/breenfuel/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)

/datum/reagent/consumable/breenfuel/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.adjust_dizzy(-10 SECONDS * REM * seconds_per_tick)
	affected_mob.adjust_drowsiness(-6 SECONDS * REM * seconds_per_tick)
	affected_mob.AdjustSleeping(-4 SECONDS * REM * seconds_per_tick)
	affected_mob.adjust_bodytemperature(-5 * REM * TEMPERATURE_DAMAGE_COEFFICIENT * seconds_per_tick, affected_mob.get_body_temp_normal())
	affected_mob.adjust_tiredness(-4 * REM * seconds_per_tick) //makes you feel awake
	affected_mob.adjust_disgust(2 * REM * seconds_per_tick) //kind of gross tasting

/datum/reagent/fuel/weak
	tox_damage = 0.1

/datum/reagent/antifatigue_rations
	name = "Anti-Fatigue Rations"
	description = "A powerful, quick acting stimulant for staving off sleep, though it is also a potent diuretic."
	color = "#5c5149"
	overdose_threshold = 25 //cant immediately take all pills.
	taste_description = "bitter chemicals"
	metabolized_traits = list(TRAIT_STIMULATED)
	metabolization_rate = REAGENTS_METABOLISM * 2 //quick acting

/datum/reagent/antifatigue_rations/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.set_jitter_if_lower(10 SECONDS * REM * seconds_per_tick)

/datum/reagent/antifatigue_rations/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	affected_mob.adjust_dizzy(-10 SECONDS * REM * seconds_per_tick)
	affected_mob.adjust_drowsiness(-6 SECONDS * REM * seconds_per_tick)
	affected_mob.AdjustSleeping(-4 SECONDS * REM * seconds_per_tick)
	affected_mob.adjust_tiredness(-15 * REM * seconds_per_tick) //makes you feel awake
	affected_mob.adjust_hydration(-5 * REM * seconds_per_tick) //diuretic

/datum/reagent/consumable/greenflavor
	name = "Green Flavoring"
	description = "A specially formulated flavoring designed to evoke true tastes of green."
	color = "#53c061" // rgb: 70, 43, 21
	nutriment_factor = 0
	overdose_threshold = 80
	taste_description = "pure green taste essence"
	quality = DRINK_NICE

/datum/reagent/consumable/ethanol/fake
	name = "Combine Approved Ethanol Substitute"
	description = "A 100% Combine approved beverage designed to provoke feelings of drinking alcohol while being so low of a proof that citizens will stay focused on their hard work. Also designed to not be usable in molotovs."
	color = "#f8f0c7"
	nutriment_factor = 1
	boozepwr = 5
	taste_description = "ethanol substitute"
	ph = 4
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK

/datum/reagent/slowing_compound
	name = "Slowing Compound"
	description = "Slows the victim down temporarily."
	color = "#78008C"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/slowing_compound/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.add_movespeed_modifier(/datum/movespeed_modifier/reagent/slowing_compound)

/datum/reagent/slowing_compound/on_mob_end_metabolize(mob/living/affected_mob)
	. = ..()
	affected_mob.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/slowing_compound)

/datum/movespeed_modifier/reagent/slowing_compound
	multiplicative_slowdown = 0.35
