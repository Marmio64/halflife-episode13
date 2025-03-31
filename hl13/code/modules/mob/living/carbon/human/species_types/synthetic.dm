/datum/species/human/synth
	name = "\improper Synth Human"
	id = SPECIES_SYNTHHUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC
	death_sound = 'hl13/sound/voice/human/deathgurgle.ogg' //hl13 edit

/datum/species/human/synth/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_hairstyle("Bald", update = TRUE)

/datum/species/human/synth/on_species_gain(mob/living/carbon/human/new_vampire, datum/species/old_species)
	. = ..()
	new_vampire.skin_tone = "albino"
	new_vampire.update_body(0)
