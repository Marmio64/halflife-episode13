/datum/reagent/medicine/biogel
	name = "Biogel"
	description = "Has a 100% chance of instantly healing brute and burn damage. The chemical will heal up to 120 points of damage at 60 units applied. Touch application only."
	reagent_state = LIQUID
	color = "#14c40e"

/datum/reagent/medicine/biogel/expose_mob(mob/living/exposed_mob, methods=TOUCH, reac_volume, show_message = TRUE)
	. = ..()
	if(!iscarbon(exposed_mob))
		return
	var/mob/living/carbon/carbies = exposed_mob
	if(carbies.stat == DEAD)
		show_message = 0
	if(!(methods & (PATCH|TOUCH|VAPOR)))
		return
	var/current_bruteloss = carbies.getBruteLoss() // because this will be changed after calling adjustBruteLoss()
	var/current_fireloss = carbies.getFireLoss() // because this will be changed after calling adjustFireLoss()
	var/harmies = clamp(carbies.adjustBruteLoss(-1.25 * reac_volume, updating_health = FALSE, required_bodytype = affected_bodytype), 0, current_bruteloss)
	var/burnies = clamp(carbies.adjustFireLoss(-1.25 * reac_volume, updating_health = FALSE, required_bodytype = affected_bodytype), 0, current_fireloss)
	for(var/i in carbies.all_wounds)
		var/datum/wound/iter_wound = i
		iter_wound.on_synthflesh(reac_volume)
	var/need_mob_update = harmies + burnies

	if(need_mob_update)
		carbies.updatehealth()
	if(show_message)
		to_chat(carbies, span_danger("You feel your burns and bruises healing! It stings like hell!"))

	carbies.add_mood_event("painful_medicine", /datum/mood_event/painful_medicine)
	if(HAS_TRAIT_FROM(exposed_mob, TRAIT_HUSK, BURN) && carbies.getFireLoss() < UNHUSK_DAMAGE_THRESHOLD && (carbies.reagents.get_reagent_amount(/datum/reagent/medicine/c2/synthflesh) + reac_volume >= SYNTHFLESH_UNHUSK_AMOUNT))
		carbies.cure_husk(BURN)
		carbies.visible_message(span_nicegreen("A rubbery liquid coats [carbies]'s burns. [carbies] looks a lot healthier!")) //we're avoiding using the phrases "burnt flesh" and "burnt skin" here because carbies could be a skeleton or a golem or something

/datum/reagent/medicine/concentrated_biogel
	name = "Concentrated Biogel"
	description = "A concentrated amount of biogel with a few other compounds inside. Doesn't heal instantly like normal biogel, but doesn't need to be applied by touch, and will heal all damage types."
	reagent_state = LIQUID
	color = "#0ca507"
	metabolization_rate = 5 * REAGENTS_METABOLISM
	var/healing = 5
	ph = 2
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/medicine/concentrated_biogel/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjustToxLoss(-healing * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(-healing * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	need_mob_update += affected_mob.adjustBruteLoss(-healing * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(-healing * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH

/datum/reagent/medicine/concentrated_biogel/overdose_process(mob/living/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	var/need_mob_update
	need_mob_update = affected_mob.adjustToxLoss(1.5 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjustOxyLoss(1.5 * REM * seconds_per_tick, updating_health = FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	need_mob_update += affected_mob.adjustBruteLoss(1.5 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	need_mob_update += affected_mob.adjustFireLoss(1.5 * REM * seconds_per_tick, updating_health = FALSE, required_bodytype = affected_bodytype)
	if(need_mob_update)
		return UPDATE_MOB_HEALTH
