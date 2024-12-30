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
