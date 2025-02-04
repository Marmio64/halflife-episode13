/datum/reagent/consumable/nutriment/raw
	name = "Raw Nutriment"
	description = "Raw, unsafe nutriments that may possibly harbor dangerous pathogens."
	reagent_state = SOLID
	color = "#915037"

/datum/reagent/consumable/nutriment/raw/on_mob_life(mob/living/L, methods=TOUCH, reac_volume, show_message = TRUE, permeability = 1)
	..()
	if((methods & (PATCH|INGEST|INJECT)) || ((methods & VAPOR) && prob(min(reac_volume,100)*permeability)))
		if(prob(20))
			L.ForceContractDisease(new /datum/disease/gutworms(), FALSE, TRUE) //Don't eat raw food!

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
