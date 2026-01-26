/datum/quirk/survivalist
	name = "Survivalist"
	desc = "Maybe you were once a refugee living in the outlands, or just had a lot of experience camping outdoors before the combine came to earth. Either way, you know a lot about surviving in the wilderness and can craft better makeshift weapons, create makeshift poultices and meals, forage more efficiently, and get a decent rest even without a bed."
	icon = FA_ICON_FIRE
	mob_trait = TRAIT_SURVIVALIST
	value = 6
	gain_text = "You feel capable of surviving in the wilderness."
	lose_text = "You feel less capable of surviving in the wilderness."

//main benefits are these recipes. The upgraded weapons are pretty good, and healing poultices give you a ton of healing power for little resources.
/datum/quirk/survivalist/add()
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/halflife_spear_fine)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/bonedagger_fine)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/food/survivaliststew)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/healing_poultices)
	quirk_holder.mind.teach_crafting_recipe(/datum/crafting_recipe/beartrap)
