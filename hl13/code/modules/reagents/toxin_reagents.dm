/datum/reagent/toxin/cleanupsolution
	name = "Clean Up Solution"
	description = "A bright orange, toxic solution which kills xenian growths."
	color = "#b9830e"
	toxpwr = 2
	taste_mult = 1

/datum/reagent/toxin/cleanupsolution/expose_obj(obj/O, reac_volume)
	..()
	if(istype(O, /obj/structure/alien/weeds))
		var/obj/structure/alien/weeds/alien_weeds = O
		alien_weeds.take_damage(rand(20,40), BRUTE, 0) // Kills alien weeds pretty fast
	else if(istype(O, /obj/structure/flora/xen))
		var/obj/structure/flora/xen/xenflora = O
		xenflora.take_damage(rand(40,75), BRUTE, 0)
	else if(istype(O, /obj/structure/flora/ash/stem_shroom))
		var/obj/structure/flora/ash/stem_shroom/xenshroom = O
		xenshroom.take_damage(rand(40,75), BRUTE, 0)
	else if(istype(O, /obj/structure/spacevine))
		var/obj/structure/spacevine/SV = O
		SV.on_chem_effect(src)

/*
/datum/reagent/toxin/cleanupsolution/expose_mob(mob/living/M, methods=TOUCH, reac_volume, show_message = TRUE, permeability = 1)
	if(istype(M, /mob/living/basic/venus_human_trap))
		var/mob/living/basic/venus_human_trap/planty = M
		planty.weedkiller(reac_volume * 2)
	if(methods & VAPOR)
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			if(!C.wear_mask) // If not wearing a mask
				var/damage = min(round(0.4*reac_volume, 0.1),10)
				C.adjustToxLoss(damage)
*/

/datum/reagent/toxin/headcrab_venom
	name = "Headcrab Venom"
	description = "A toxic venom produced by poison headcrabs."
	color = "#e9490f" // rgb: 207, 54, 0
	toxpwr = 1.2
	liver_damage_multiplier = 0.25
