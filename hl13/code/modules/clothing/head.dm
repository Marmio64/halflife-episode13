/obj/item/clothing/head/utility/radiation
	name = "cleanup hood"
	desc = "A hood with radiation protective properties. The label reads, 'Made with lead. Please do not consume insulation.'"
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "cleanup"
	clothing_traits = list(TRAIT_WEARING_GAS_MASK)

/obj/item/clothing/head/utility/radiation/scientist
	name = "scientist hood"
	icon_state = "scientist"

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
	desc = "A green old world military helmet for protecting your noggin."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "military"
	base_icon_state = "military"
	armor_type = /datum/armor/military_helmet
	flags_cover = EARS_COVERED

	repairable_by = /obj/item/stack/kevlar

	limb_integrity = 300

/obj/item/clothing/head/helmet/halflife/military/poland
	name = "polish military helmet"
	desc = "A green old world military helmet for protecting your noggin. A band in the colours of the Polish flag has been wrapped around it."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "military_poland"
	base_icon_state = "military_poland"

/datum/armor/military_helmet
	melee = 25
	bullet = 25
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

/obj/item/clothing/head/helmet/halflife/military/weak/poland
	name = "cracked polish military helmet"
	desc = "An old world military helmet. Age and use has left the helmet in a less than ideal condition. A band in the colours of the Polish flag has been wrapped around it."
	icon_state = "military_poland"
	base_icon_state = "military_poland"

/obj/item/clothing/head/helmet/halflife/military/weak/crafted
	name = "hand-made metal helmet"
	desc = "A hand made helmet formed from scraps and kevlar. It's not very good at protecting you in a meaningful way, but every bit counts."
	icon_state = "steel_helmet"
	base_icon_state = "steel_helmet"

/obj/item/clothing/head/helmet/halflife/military/weak/crafted/poland
	name = "improvised polish military helmet"
	desc = "A hand made helmet formed from scraps and kevlar. It's not very good at protecting you in a meaningful way, but every bit counts. A band in the colours of the Polish flag has been wrapped around it."
	icon_state = "steel_helmet_poland"
	base_icon_state = "steel_helmet_poland"

/datum/armor/military_helmet/weak
	melee = 15
	bullet = 15
	laser = 10
	energy = 10
	bomb = 15
	fire = 50
	acid = 50
	wound = 5

/obj/item/clothing/head/helmet/halflife/milhelm
	name = "military helmet"
	desc = "A black old world military helmet for protecting your noggin."
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
	bullet = 25
	laser = 20
	energy = 20
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/head/helmet/halflife/milhelm/poland
	name = "polish military helmet"
	desc = "A black old world military helmet for protecting your noggin. This one has a band in the colours of the Polish flag wrapped around it."
	icon_state = "milhelm_poland"
	base_icon_state = "milhelm_poland"

/obj/item/clothing/head/helmet/halflife/headcrab
	name = "headcrab helmet"
	desc = "A hollowed out armored headcrab. Hard to see out of, but is surpsingly good at protecting your head."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "headcrab"
	base_icon_state = "headcrab"
	armor_type = /datum/armor/headcrab
	flags_cover = EARS_COVERED

/obj/item/clothing/head/halflife/cosmetic_headcrab
	name = "headcrab helmet"
	desc = "A hollowed out armored headcrab."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	icon_state = "headcrab"
	base_icon_state = "headcrab"

/obj/item/clothing/head/helmet/halflife/headcrab/gonome
	name = "gonome headcrab helmet"
	desc = "A huge, hollowed out armored headcrab. Hard to see out of, but is surpsingly good at protecting your head."
	icon_state = "gonomecrab"
	base_icon_state = "gonomecrab"
	armor_type = /datum/armor/gonomecrab

/datum/armor/headcrab
	melee = 25
	bullet = 20
	laser = 20
	energy = 20
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/datum/armor/gonomecrab
	melee = 40
	bullet = 35
	laser = 30
	energy = 30
	bomb = 35
	fire = 50
	acid = 50
	wound = 15

/obj/item/clothing/head/helmet/halflife/headcrab/deathmatch
	armor_type = /datum/armor/headcrab/deathmatch

/datum/armor/headcrab/deathmatch
	melee = 75
	bullet = 75
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

/obj/item/clothing/head/helmet/halflife/military/plf_veteran
	name = "modified altyn helmet"
	desc = "A heavily-modified explosives disposal helmet used by the Polish army."
	icon = 'hl13/icons/obj/clothing/hats.dmi'
	worn_icon = 'hl13/icons/mob/clothing/head.dmi'
	armor_type = /datum/armor/plf_veteran
	icon_state = "poland_heavy"
	base_icon_state = "poland_heavy"
	repairable_by = /obj/item/stack/kevlar

/obj/item/clothing/head/helmet/halflife/military/plf_veteran/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/clothing_fov_visor, FOV_180_DEGREES)

/obj/item/clothing/head/hats/halflife/sectorial
	name = "commander's beret"
	desc = "A well armored beret for the commander of local combine ground operations."
	icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#158691#f0cc8f"
	armor_type = /datum/armor/hats_hos
	strip_delay = 8 SECONDS

/obj/item/clothing/head/halflife/scout_hat
	name = "headset cap"
	desc = "A cap with a nonfunctional headset attached to it. Was once good for scouting things, now it's just a decoration."
	icon_state = "scouthat"
	armor_type = /datum/armor/scout_armor
