/datum/species/stalker
	name = "Stalker"
	id = SPECIES_STALKER
	changesource_flags = MIRROR_BADMIN | WABBAJACK | ERT_SPAWN
	damage_modifier = -50
	death_sound = 'hl13/sound/voice/stalker/stalker_die.ogg'
	no_equip_flags = ITEM_SLOT_MASK | ITEM_SLOT_OCLOTHING | ITEM_SLOT_GLOVES | ITEM_SLOT_FEET | ITEM_SLOT_ICLOTHING | ITEM_SLOT_SUITSTORE | ITEM_SLOT_HEAD
	inherent_traits = list(TRAIT_NOGUNS, TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,
							TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE,
							TRAIT_NOCRITDAMAGE, TRAIT_GENELESS, TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_ANALGESIA, TRAIT_NO_UNDERWEAR, TRAIT_GRABWEAKNESS, TRAIT_AGEUSIA)
	mutanteyes = /obj/item/organ/eyes/robotic/glow
	mutantappendix = null
	mutantbrain = /obj/item/organ/brain/cybernetic/ai
	mutantheart = /obj/item/organ/heart/cybernetic
	mutantliver = /obj/item/organ/liver/cybernetic
	mutantlungs = /obj/item/organ/lungs/cybernetic
	mutantstomach = /obj/item/organ/stomach/cybernetic/tier2
	mutantears = /obj/item/organ/ears/cybernetic
	species_language_holder = /datum/language_holder/stalker
	var/info_text = "You are a <span class='danger'>Stalker</span>, a subservient mutant engineered by the combine. \
			you have an unquestioning loyalty to your masters, and have lost many normal human functions."
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/stalker,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/stalker,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/stalker,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/stalker,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/stalker,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/stalker,
	)

/datum/species/stalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.real_name = "stalker [rand(111,999)]"
	C.name = C.real_name
	C.faction += "combine"
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name

	C.get_selected_language()

	C.cmode_music = 'hl13/sound/music/combat/crawlyard.ogg'
	to_chat(C, "[info_text]")

	C.mob_mood?.mood_modifier -= 1 //don't care, never did

	C.physiology.hunger_mod *= 0.5 //low body mass, less to feed

	C.AddComponent( \
			/datum/component/simple_bodycam, \
			camera_name = "implanted bodycam", \
			c_tag = "[C.real_name]", \
		)

/datum/species/stalker/on_species_loss(mob/living/carbon/human/C)
	..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.mob_mood?.mood_modifier += 1
	C.physiology.hunger_mod /= 0.5

/datum/species/stalker/proc/handle_speech(datum/source, list/speech_args)
	playsound(source, 'hl13/sound/voice/stalker/stalker_talk.ogg', 50, 1, 1)

/datum/species/stalker/get_scream_sound(mob/living/carbon/human/stalker)
	return pick(
		'hl13/sound/voice/stalker/stalker_scream.ogg',
		'hl13/sound/voice/stalker/stalker_scream2.ogg',
		'hl13/sound/voice/stalker/stalker_scream3.ogg',
	)

/datum/species/stalker/get_cry_sound(mob/living/carbon/human/stalker)
	return pick(
		'hl13/sound/voice/stalker/stalker_pain1.ogg',
		'hl13/sound/voice/stalker/stalker_pain2.ogg',
		'hl13/sound/voice/stalker/stalker_pain3.ogg',
	)
