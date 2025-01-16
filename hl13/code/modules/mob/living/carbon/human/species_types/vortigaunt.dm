/datum/species/vortigaunt //vorts are hardier, stronger, but a bit slower than humans. However, they cant wear most things and have incredibly shit aim when using guns.
	name = "Vortigaunt"
	id = SPECIES_VORTIGAUNT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | ERT_SPAWN
	siemens_coeff = 0
	damage_modifier = 35
	stunmod = 0.8
	no_equip_flags = ITEM_SLOT_MASK | ITEM_SLOT_OCLOTHING | ITEM_SLOT_GLOVES | ITEM_SLOT_FEET | ITEM_SLOT_ICLOTHING | ITEM_SLOT_SUITSTORE | ITEM_SLOT_HEAD
	inherent_traits = list(TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,
							TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE, TRAIT_NODISMEMBER, TRAIT_GENELESS, TRAIT_NO_UNDERWEAR, TRAIT_BAD_AIM)
	mutanteyes = /obj/item/organ/eyes/night_vision/vort
	var/datum/action/cooldown/spell/conjure_item/infinite_guns/vort_blast/galunga
	var/datum/action/cooldown/spell/touch/vort_heal/vortheal
	var/datum/action/cooldown/spell/list_target/telepathy/vort/vorttelepathy

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/vortigaunt,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/vortigaunt,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/vortigaunt,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/vortigaunt,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/vortigaunt,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/vortigaunt,
	)

/datum/species/vortigaunt/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.real_name = "vortigaunt [rand(111,999)]"
	C.name = C.real_name
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name

	galunga = new(C)
	galunga.Grant(C)

	vortheal = new(C)
	vortheal.Grant(C)

	vorttelepathy = new(C)
	vorttelepathy.Grant(C)

/datum/species/vortigaunt/on_species_loss(mob/living/carbon/C)
	..()
	galunga.Remove(C)
	vortheal.Remove(C)
	vorttelepathy.Remove(C)

/datum/species/vortigaunt/get_scream_sound(mob/living/carbon/human/vortigaunt)
	return pick(
		'hl13/sound/voice/vortigaunt/vort_scream.ogg',
	)

/datum/species/vortigaunt/get_laugh_sound(mob/living/carbon/human/vortigaunt)
	return 'hl13/sound/voice/vortigaunt/galunga.ogg'
