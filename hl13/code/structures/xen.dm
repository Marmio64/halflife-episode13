/obj/item/seeds/lavaland/ember
	name = "pack of embershroom mycelium"
	desc = "This mycelium grows into embershrooms, a species of bioluminescent mushrooms native to Xen."
	icon_state = "mycelium-ember"
	species = "ember"
	plantname = "Embershroom Mushrooms"
	product = /obj/item/food/grown/mushroom_stem
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism, /datum/plant_gene/trait/glow, /datum/plant_gene/trait/fire_resistance)
	growing_icon = 'hl13/icons/obj/hydroponics/xen.dmi'
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.02, /datum/reagent/drug/space_drugs = 0.04, /datum/reagent/consumable/entpoly = 0.04)

/obj/item/food/grown/mushroom_stem
	name = "mushroom stem"
	desc = "A long mushroom stem. It's slightly glowing. This may have useful properties."
	icon = 'hl13/icons/obj/xenflora.dmi'
	icon_state = "mushroom_stem"
	seed = /obj/item/seeds/lavaland/ember
	can_distill = FALSE
	//distill_reagent = /datum/reagent/consumable/ethanol/embershroomcream
	grind_results = list(/datum/reagent/toxin/mushroom_powder = 0)

/obj/structure/flora/ash/stem_shroom
	icon_state = "t_mushroom"
	name = "numerous xenian mushrooms"
	desc = "A large number of xenian mushrooms, some of which have long, fleshy stems, which look harvestable if you have something sharp on hand. They're radiating light!"
	icon = 'hl13/icons/obj/xenflora.dmi'
	light_range = 1.5
	light_power = 1.5
	light_color = "#af7575"
	harvested_name = "xenian mushrooms"
	harvested_desc = "A few tiny xenian mushrooms around larger stumps. You can already see them growing back."
	product_types = list(/obj/item/food/grown/mushroom_stem = 1)
	harvest_time = 40
	harvest_message_low = "You pick and slice the cap off a mushroom, leaving the stem."
	harvest_message_med = "You pick and decapitate several mushrooms for their stems."
	harvest_message_high = "You acquire a number of stems from these mushrooms."
	regrowth_time_low = 4000
	regrowth_time_high = 6000
	max_integrity = 200

/obj/structure/flora/xen
	name = "xen flora base type"
	icon = 'hl13/icons/obj/xenflora.dmi'
	max_integrity = 200
	var/breakmats = null
	var/hasaltstates = FALSE
	var/altstates = 0

/obj/structure/flora/xen/Initialize()
	. = ..()
	if(!hasaltstates)
		return
	if(prob(60))
		icon_state = "[initial(icon_state)]_[rand(1,(altstates))]"

/obj/structure/flora/xen/atom_deconstruct(disassembled = TRUE)
	if(breakmats)
		new breakmats(loc)
		for(var/obj/item/I in src)
			I.forceMove(loc)
	SSsociostability.modifystability(1) //Clearing infestations is good for city health.

/obj/structure/flora/xen/leafy
	name = "leafy xen plant"
	desc = "A green, leafy looking Xen plant. You may be able to break it for something."
	icon_state = "leafy"
	light_range = 1.5
	light_power = 1.5
	light_color = "#28533a"
	breakmats = /obj/item/food/xenbranch
	hasaltstates = TRUE
	altstates = 2

/obj/item/food/xenbranch
	name = "xenian branch"
	desc = "A branch from some xenian plant. It's green, so that might mean it could be possibly used for medicinal purposes."
	tastes = list("bitterness" = 1)
	bite_consumption = 5
	food_reagents = list(/datum/reagent/medicine/biogel = 20)
	foodtypes = GROSS
	icon = 'hl13/icons/obj/xenflora.dmi'
	icon_state = "branch"

/obj/structure/flora/xen/tinyshrooms
	name = "tiny xen plant"
	desc = "A small collection of purple mushroom like plants. Maybe you could break it down for some spores."
	icon_state = "tinyshrooms"
	light_range = 1.5
	light_power = 1.5
	light_color = "#703d68"
	breakmats = /obj/item/food/xenspore
	hasaltstates = TRUE
	altstates = 2

/obj/item/food/xenspore
	name = "xenian spore"
	desc = "A spore from some xenian plant. It smells kind of funky..."
	tastes = list("dusty mushrooms" = 1)
	bite_consumption = 4
	food_reagents = list(/datum/reagent/drug/happiness = 4, /datum/reagent/drug/aranesp = 4, /datum/reagent/toxin/spore = 4)
	foodtypes = GROSS
	icon = 'hl13/icons/obj/xenflora.dmi'
	icon_state = "spore"

/obj/structure/flora/xen/mound
	name = "xen mound"
	desc = "A disgusting, slimey, solid mound of goop. You may be able to break it for something."
	icon_state = "mound"
	light_range = 1.5
	light_power = 1.5
	light_color = "#1a994f"
	breakmats = /obj/item/food/xenslime
	density = 1
	max_integrity = 100

/obj/item/food/xenslime
	name = "xenian slime"
	desc = "A gross mass of slime. The inner contents look liquid and slosh about, while the outer shell is constantly coagulating. Interesting..."
	tastes = list("slime" = 1)
	bite_consumption = 4
	food_reagents = list(/datum/reagent/medicine/coagulant = 4, /datum/reagent/toxin/staminatoxin = 4, /datum/reagent/consumable/ethanol = 4)
	foodtypes = GROSS
	icon = 'hl13/icons/obj/xenflora.dmi'
	icon_state = "slime"

/obj/structure/flora/xen/cougher
	name = "xen cougher"
	desc = "A disgusting growth which is coughing up clouds of spores."
	icon_state = "cougher"
	density = 1
	max_integrity = 100

/obj/structure/flora/xen/cougher/Initialize()
	. = ..()
	AddElement(/datum/element/vapour_emitter, /datum/vapours/fungalspores, 140)
