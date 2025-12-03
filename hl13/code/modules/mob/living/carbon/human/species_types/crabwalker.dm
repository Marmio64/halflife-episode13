/datum/species/human/crabwalker
	name = "\improper Crabwalker Human"
	id = SPECIES_CRABWALKERHUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC
	death_sound = 'hl13/sound/voice/human/deathgurgle.ogg'
	species_language_holder = /datum/language_holder/zombie
	mutanteyes = /obj/item/organ/eyes/zombie
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
		TRAIT_LESSPAIN_MINOR,
		TRAIT_STRONG_STOMACH,
		TRAIT_TERRIBLE_AIM,
		TRAIT_HARDLY_WOUNDED,
		TRAIT_SLUDGE_PROTECTION,
	)


/datum/species/human/crabwalker/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_hairstyle("Bald", update = TRUE)

/datum/species/human/crabwalker/on_species_gain(mob/living/carbon/human/new_vampire, datum/species/old_species)
	. = ..()
	new_vampire.skin_tone = "albino"
	new_vampire.update_body(0)
	new_vampire.faction = list(FACTION_HEADCRAB)
