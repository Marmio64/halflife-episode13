/obj/item/clothing/head/utility/radiation
	name = "cleanup hood"
	desc = "A hood with radiation protective properties. The label reads, 'Made with lead. Please do not consume insulation.'"
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "cleanup"

/obj/item/clothing/head/utility/hardhat/halflife
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'

/obj/item/clothing/head/utility/hardhat/halflife/mining
	icon_state = "hardhat0_mining"
	hat_type = "mining"

/obj/item/clothing/head/halflife
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'

/obj/item/clothing/head/halflife/blue_hardhat
	name = "hard hat"
	desc = "A piece of headgear used in dangerous working conditions to protect the head."
	icon_state = "hardhat"
	inhand_icon_state = null
	armor_type = /datum/armor/utility_hardhat
	flags_inv = 0
	hair_mask = HAIR_MASK_HIDE_ABOVE_45_DEG_MEDIUM
	clothing_flags = SNUG_FIT | STACKABLE_HELMET_EXEMPT
	resistance_flags = FIRE_PROOF
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

