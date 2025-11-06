/datum/species/human/synth
	name = "\improper Synth Human"
	id = SPECIES_SYNTHHUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC
	death_sound = 'hl13/sound/voice/human/deathgurgle.ogg' //hl13 edit

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/cremator,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/cremator,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/cremator,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/cremator,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/cremator,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/cremator,
	)

/datum/species/human/synth/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_hairstyle("Bald", update = TRUE)

/datum/species/human/synth/on_species_gain(mob/living/carbon/human/new_vampire, datum/species/old_species)
	. = ..()
	new_vampire.skin_tone = "albino"
	new_vampire.update_body(0)

/datum/species/human/synth/cremator
	name = "\improper Cremator"
	id = SPECIES_CREMATOR
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
		TRAIT_NOFIRE,
		TRAIT_NOFIRE_SPREAD,
		TRAIT_LESSPAIN_MINOR,
		TRAIT_NO_JUMPSUIT,
	)
