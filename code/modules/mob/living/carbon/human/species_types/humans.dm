/datum/species/human
	name = "\improper Human"
	id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	skinned_type = /obj/item/stack/sheet/animalhide/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1.1
	death_sound = 'hl13/sound/voice/human/deathgurgle.ogg' //hl13 edit

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#bb9966", update = FALSE) // brown
	human.set_hairstyle("Business Hair", update = TRUE)

/datum/species/human/get_scream_sound(mob/living/carbon/human/human)
	if(human.physique == MALE)
		return pick(
			'hl13/sound/voice/human/scream/Screams_Male_1.ogg',
			'hl13/sound/voice/human/scream/Screams_Male_2.ogg',
			'hl13/sound/voice/human/scream/Screams_Male_3.ogg',
			'hl13/sound/voice/human/scream/malescream_7.ogg',
			'hl13/sound/voice/human/scream/malescream_8.ogg',
			'hl13/sound/voice/human/scream/malescream_9.ogg',
		)

	return pick(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'hl13/sound/voice/human/scream/Screams_Woman_1.ogg',
		'hl13/sound/voice/human/scream/Screams_Woman_2.ogg',
	)

/datum/species/human/get_cough_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)

/datum/species/human/get_cry_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/human/get_sneeze_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/human/get_laugh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return pick(
			'hl13/sound/voice/human/laugh/female_laugh1.ogg',
			'hl13/sound/voice/human/laugh/female_laugh2.ogg',
			'hl13/sound/voice/human/laugh/female_laugh3.ogg',
		)
	return pick(
		'hl13/sound/voice/human/laugh/male_laugh1.ogg',
		'hl13/sound/voice/human/laugh/male_laugh2.ogg',
		'hl13/sound/voice/human/laugh/male_laugh3.ogg',
	)

/datum/species/human/get_sigh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/human/get_sniff_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/human/get_snore_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/human/get_species_description()
	return "Humans are the dominant species on earth."

/datum/species/human/get_species_lore()
	return list(
		"Sixteen years after the seven hour war, the Vault has been broken into only months ago and the Combine are in a scramble to regain control following their massive failure. \
		However, they do not yet have the level of control and pressure on the populace as seen in Half Life 2.",

		"Now, the setting takes place within the poorly maintained eastern-european streets of City 13, within one district of a greater whole \
		Lack of attention has lead to the proliferation of xenian wildlife such as head crabs and antlions, and tensions rise between the citizenry and the combine as they catch wind of what had happened in City 17.",

		"Will the District Administrator keep a handle of things for the Universal Union, or will the citizenry throw off their shackles as they try to find a better life?",
	)

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	if(CONFIG_GET(number/default_laws) == 0 || CONFIG_GET(flag/silicon_asimov_superiority_override)) // Default lawset is set to Asimov
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "robot",
			SPECIES_PERK_NAME = "Asimov Superiority",
			SPECIES_PERK_DESC = "The AI and their cyborgs are, by default, subservient only \
				to humans. As a human, silicons are required to both protect and obey you.",
		))

	var/human_authority_setting = CONFIG_GET(string/human_authority)

	if(human_authority_setting == HUMAN_AUTHORITY_NON_HUMAN_WHITELIST || human_authority_setting == HUMAN_AUTHORITY_ENFORCED)
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bullhorn",
			SPECIES_PERK_NAME = "Chain of Command",
			SPECIES_PERK_DESC = "Nanotrasen only recognizes humans for command roles, such as Captain.",
		))

	return to_add
