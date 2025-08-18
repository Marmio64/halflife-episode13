/datum/reagent/toxin/cleanupsolution
	name = "Clean Up Solution"
	description = "A bright orange, toxic solution which kills xenian growths."
	color = "#b9830e"
	toxpwr = 0.75
	liver_damage_multiplier = 0.25
	taste_mult = 1
	var/damage_mult = 1

/datum/reagent/toxin/cleanupsolution/weak
	damage_mult = 0.75

/datum/reagent/toxin/cleanupsolution/expose_obj(obj/O, reac_volume)
	..()
	if(istype(O, /obj/structure/alien/weeds))
		var/obj/structure/alien/weeds/alien_weeds = O
		alien_weeds.take_damage(rand(20*damage_mult,40*damage_mult), BRUTE, 0) // Kills alien weeds pretty fast
	else if(istype(O, /obj/structure/flora/xen))
		var/obj/structure/flora/xen/xenflora = O
		xenflora.take_damage(rand(40*damage_mult,50*damage_mult), BRUTE, 0)
	else if(istype(O, /obj/structure/flora/ash/stem_shroom))
		var/obj/structure/flora/ash/stem_shroom/xenshroom = O
		xenshroom.take_damage(rand(40*damage_mult,50*damage_mult), BRUTE, 0)
	else if(istype(O, /obj/structure/spacevine))
		var/obj/structure/spacevine/SV = O
		SV.on_chem_effect(src)

/datum/reagent/toxin/cleanupsolution/expose_mob(mob/living/exposed_mob, methods = TOUCH, reac_volume)
	. = ..()
	var/damage = min(round(0.4 * reac_volume, 0.1), 10)
	if(exposed_mob.mob_biotypes & MOB_XENIAN)
		// spray bottle emits 5u so it's dealing ~15 dmg per spray
		if(exposed_mob.adjustToxLoss((damage * 20) * damage_mult, required_biotype = affected_biotype))
			return

	if(!(methods & VAPOR) || !iscarbon(exposed_mob))
		return

	var/mob/living/carbon/exposed_carbon = exposed_mob
	if(!exposed_carbon.wear_mask)
		exposed_carbon.adjustToxLoss(damage, required_biotype = affected_biotype)

/datum/reagent/toxin/headcrab_venom
	name = "Headcrab Venom"
	description = "A toxic venom produced by poison headcrabs."
	color = "#e9490f" // rgb: 207, 54, 0
	toxpwr = 0.25
	metabolization_rate = REAGENTS_METABOLISM * 0.5
	liver_damage_multiplier = 0.25
