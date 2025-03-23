/obj/item/clothing/head/utility/radiation
	name = "cleanup hood"
	desc = "A hood with radiation protective properties. The label reads, 'Made with lead. Please do not consume insulation.'"
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "cleanup"
	clothing_traits = list(TRAIT_WEARING_GAS_MASK)

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

	repairable_by = /obj/item/stack/kevlar

	limb_integrity = 300

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

/obj/item/clothing/head/helmet/halflife/military/weak/crafted
	name = "hand-made military helmet"
	desc = "A hand made helmet formed from scraps and kevlar. It's not very good at protecting you in a meaningful way, but every bit counts."
	icon_state = "steel_helmet"
	base_icon_state = "steel_helmet"

/datum/armor/military_helmet/weak
	melee = 15
	bullet = 10
	laser = 10
	energy = 10
	bomb = 15
	fire = 50
	acid = 50
	wound = 5

/obj/item/clothing/head/helmet/halflife/milhelm
	name = "military helmet"
	desc = "An old world military helmet for protecting your noggin."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "milhelm"
	base_icon_state = "milhelm"
	armor_type = /datum/armor/milhelm
	flags_cover = EARS_COVERED

	repairable_by = /obj/item/stack/kevlar

	limb_integrity = 300

/datum/armor/milhelm
	melee = 25
	bullet = 20
	laser = 20
	energy = 20
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/head/helmet/halflife/headcrab
	name = "headcrab helmet"
	desc = "A hollowed out armored headcrab. Hard to see out of, but is surpsingly good at protecting your head."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "headcrab"
	base_icon_state = "headcrab"
	armor_type = /datum/armor/headcrab
	flags_cover = EARS_COVERED

/datum/armor/headcrab
	melee = 25
	bullet = 20
	laser = 20
	energy = 20
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/head/helmet/halflife/headcrab/deathmatch
	armor_type = /datum/armor/headcrab/deathmatch

/datum/armor/headcrab/deathmatch
	melee = 70
	bullet = 70
	laser = 70
	energy = 70
	bomb = 70
	fire = 70
	acid = 70
	wound = 15

/obj/item/clothing/head/helmet/halflife/headcrab/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_fov_visor, FOV_270_DEGREES)

/obj/item/clothing/head/bio_hood/boiler
	icon_state = "bio_boiler"
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	clothing_traits = list(TRAIT_WEARING_GAS_MASK)

/obj/item/clothing/head/beret/durathread/unitednations //HL13 ADDITION
	name = "old blue beret"
	desc = "An old blue beret, moderately armored and adorned with a heavily faded united nations symbol."
	greyscale_colors = "#5f7cb7#8a9ab0"
