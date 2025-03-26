/obj/item/clothing/gloves/color/civilprotection
	name = "civil protection gloves"
	desc = "Heavy duty gloves, made to fit well with a stun baton in the palm."
	icon_state = "civilprotection"
	inhand_icon_state = "blackgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	strip_delay = 40
	worn_icon = 'hl13/icons/mob/clothing/hands.dmi'
	icon = 'hl13/icons/obj/clothing/gloves.dmi'
	armor_type = /datum/armor/combine_gloveshoes

/datum/armor/combine_gloveshoes
	melee = 10
	bullet = 10

/obj/item/clothing/gloves/color/civilprotection/grunt
	icon_state = "grunt"

/obj/item/clothing/gloves/combat/overwatch
	name = "combat gloves"
	desc = "These tactical gloves are fireproof and shock resistant."
	icon_state = "overwatch"
	worn_icon = 'hl13/icons/mob/clothing/hands.dmi'
	icon = 'hl13/icons/obj/clothing/gloves.dmi'
	body_parts_covered = ARMS|HANDS
	armor_type = /datum/armor/combine_gloveshoes

/obj/item/clothing/gloves/combat/overwatch/Initialize(mapload) //fused to the soldiers, you cant take it off
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)
