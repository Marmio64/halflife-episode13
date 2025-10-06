/datum/outfit/deployment_loadout //remember that fun > balance
	name = ""
	shoes = /obj/item/clothing/shoes/boots // im not doing this on all of them
	/// Name shown in the UI
	var/display_name = ""
	/// Description shown in the UI
	var/desc = ":KILL:"
	/// If defined, using this outfit sets the targets species to it
	var/datum/species/species_override
	/// This outfit will grant these spells if applied
	var/list/spells_to_add = list()
	/// This outfit will grant these mutations if applied
	var/list/mutations_to_add = list()
	/// Slots to apply nodrop to
	var/list/nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES, ITEM_SLOT_MASK)
	/// Is there a unique combat music for this class?
	var/combat_music = null
	var/loadout_tier = 1

/datum/outfit/deployment_loadout/pre_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	if(isdummy(user))
		return

	if(!isnull(species_override))
		user.set_species(species_override)

	else if (!isnull(user.dna.species.outfit_important_for_life)) //plasmamen get lit on fire and die
		user.set_species(/datum/species/human)

	for(var/datum/action/act as anything in spells_to_add)
		var/datum/action/new_ability = new act(user)
		if(istype(new_ability, /datum/action/cooldown/spell))
			var/datum/action/cooldown/spell/new_spell = new_ability
			new_spell.spell_requirements = NONE
		new_ability.Grant(user)

	for(var/mutation in mutations_to_add)
		user.dna.add_mutation(mutation)

	if(combat_music)
		user.cmode_music = combat_music

/datum/outfit/deployment_loadout/post_equip(mob/living/carbon/human/human_to_equip, visuals_only=FALSE)
	var/list/no_drops = list()

	// Make clothing in the specified slots NODROP
	for(var/slot in nodrop_slots)
		no_drops += human_to_equip.get_item_by_slot(slot)
	list_clear_nulls(no_drops) // For any slots we didn't have filled
	// Apply TRAIT_NODROP to everything
	for(var/obj/item/item_to_nodrop as anything in no_drops)
		ADD_TRAIT(item_to_nodrop, TRAIT_NODROP, CAPTURE_THE_FLAG_TRAIT)
