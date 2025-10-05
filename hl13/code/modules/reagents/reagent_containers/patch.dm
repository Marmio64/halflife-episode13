/obj/item/reagent_containers/pill/patch/medkit
	name = "medkit"
	desc = "A metal frame encasing a large vial of biogel. Includes useful automatic injection probes and tools for managing the application of the gel."
	list_reagents = list(/datum/reagent/medicine/biogel = 50) //biogel is 1hp per unit, so 50
	self_delay = 3.5 SECONDS
	icon = 'hl13/icons/obj/medkits.dmi'
	icon_state = "medkit"
	apply_sound = 'hl13/sound/effects/largemedkit1.ogg'

/obj/item/reagent_containers/pill/patch/medkit/manufactured
	name = "new medkit"
	desc = "A metal frame encasing a large vial of biogel. Includes useful automatic injection probes and tools for managing the application of the gel. This one looks very new, and recently made. Could be sold."

/obj/item/reagent_containers/pill/patch/medkit/vial
	name = "medvial"
	desc = "The standalone vials found inside biogel medkits. Quicker to apply since it lacks the advanced features of medkits, but does not heal as much due to inefficient application of the gel."
	list_reagents = list(/datum/reagent/medicine/biogel = 30)
	self_delay = 2 SECONDS
	icon_state = "medvial"
	apply_sound = 'hl13/sound/effects/smallmedkit1.ogg'

/obj/item/reagent_containers/pill/patch/grubnugget
	name = "grub nugget"
	desc = "A small nugget obtained from an antlion grub. You're not exactly sure what to do with this."
	list_reagents = list(/datum/reagent/medicine/biogel = 20)
	self_delay = 1.5 SECONDS
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "grub_nugget"
	apply_sound = 'hl13/sound/effects/smallmedkit1.ogg'

/obj/item/reagent_containers/pill/patch/grubnugget/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_GOOD_QUALITY_BAIT, INNATE_TRAIT)

/obj/item/reagent_containers/hypospray/medipen/healthpen
	name = "healthpen"
	desc = "A combine manufactured biogel autoinjector. Heals a small amount over time, and is instant to apply. In addition, it heals oxygen and toxin damage, making it useful for people in critical condition."
	icon = 'hl13/icons/obj/medkits.dmi'
	icon_state = "healthpen"
	base_icon_state = "healthpen"
	list_reagents = list(/datum/reagent/medicine/concentrated_biogel/slurry = 15) //heals 30 hp over like 25 seconds. Thats a long time to heal compared to a vial, but you can pre-inject, and also this heals toxin+oxy damage
	sound_played = 'hl13/sound/effects/healthpen_inject.ogg'
	custom_price = null

/obj/item/reagent_containers/hypospray/medipen/healthpen/high_capacity
	list_reagents = list(/datum/reagent/medicine/concentrated_biogel/slurry = 25) //heals 50 hp total instead of 30

/obj/item/storage/halflife/pill_bottle/antitox
	name = "Anti-Sickness Pill bottle"
	desc = "A pill bottle with antibiotics and activated charcoal pills, which cleanse diseases, venoms, and poisons from the body."
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "pill_canister"
	icon = 'icons/obj/medical/chemical.dmi'

/obj/item/storage/halflife/pill_bottle/antitox/PopulateContents()
	for(var/i=0,i<3, i++)
		new /obj/item/reagent_containers/pill/antitox(src)

/obj/item/reagent_containers/pill/antitox
	name = "anti-sickness tablets"
	desc = "A couple of anti-sickness tablets, that help to purge the body of toxins and disease."
	icon_state = "antitoxtab"
	icon = 'hl13/icons/obj/misc_items.dmi'
	list_reagents = list(/datum/reagent/medicine/c2/musiver = 10, /datum/reagent/medicine/spaceacillin = 10)

/obj/item/storage/halflife/pill_bottle/paracetamol
	name = "Paracetamol Pill bottle"
	desc = "A pill bottle with paracetamol tablets, for relieving minor pains."
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "pill_canister"
	icon = 'icons/obj/medical/chemical.dmi'

/obj/item/storage/halflife/pill_bottle/paracetamol/PopulateContents()
	for(var/i=0,i<3, i++)
		new /obj/item/reagent_containers/pill/paracetamol(src)

/obj/item/reagent_containers/pill/paracetamol
	name = "paracetamol tablets"
	desc = "A couple of paracetamol tablets, which can help with reducing pain by a slight amount."
	icon_state = "paracetamol"
	icon = 'hl13/icons/obj/misc_items.dmi'
	list_reagents = list(/datum/reagent/medicine/paracetamol = 15)
