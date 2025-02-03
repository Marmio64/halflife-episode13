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

/obj/item/clothing/head/helmet/halflife/military
	name = "military helmet"
	desc = "An old world military helmet for protecting your noggin."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "military"
	base_icon_state = "military"
	armor_type = /datum/armor/military_helmet
	flags_cover = EARS_COVERED

/datum/armor/military_helmet
	melee = 25
	bullet = 20
	laser = 20
	energy = 20
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/head/helmet/halflife/military/weak
	name = "cracked military helmet"
	desc = "An old world military helmet. Age and use has left the helmet in a less than ideal condition."
	armor_type = /datum/armor/military_helmet/weak

/datum/armor/military_helmet/weak
	melee = 15
	bullet = 10
	laser = 10
	energy = 10
	bomb = 15
	fire = 50
	acid = 50
	wound = 5
