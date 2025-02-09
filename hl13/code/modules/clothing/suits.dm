/obj/item/clothing/suit/armor/civilprotection
	name = "civil protection vest"
	desc = "A one size fits all type of vest, made with kevlar. Encases your upper chest to provide good protection."
	icon_state = "civilprotection"
	inhand_icon_state = "armoralt"
	icon = 'hl13/icons/obj/clothing/suits.dmi'

/obj/item/clothing/suit/armor/civilprotection/medical
	name = "medical officer vest"
	icon_state = "medicalofficer"

/obj/item/clothing/suit/armor/civilprotection/overseer
	name = "overseer vest"
	icon_state = "overseer"

/obj/item/clothing/suit/armor/civilprotection/trenchcoat
	name = "civil protection trench coat"
	desc = "A modified standard vest with a partial trenchcoat. Provides protection for your arms and legs, but will slightly slow you down."
	icon_state = "cp_trenchcoat"
	slowdown = 0.25
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/civilprotection/trenchcoat/overseer
	name = "overseer trenchcoat"
	icon_state = "cp_trenchcoatoverseer"

/obj/item/clothing/suit/armor/civilprotection/divisional
	name = "divisional lead vest"
	desc = "A variant of the standard officer's vest dyed with red highlights to broadcast the authority of its wearer."
	icon_state = "dv_vest"
	inhand_icon_state = "armoralt"

/obj/item/clothing/suit/armor/overwatch
	name = "overwatch chestpiece"
	desc = "Sturdy kevlar weave surrounding a ceramic plated core. Provides excellent chest protection, but somewhat slows you down."
	icon_state = "overwatch"
	inhand_icon_state = "armoralt"
	slowdown = 0.25
	icon = 'hl13/icons/obj/clothing/suits.dmi'

	armor_type = /datum/armor/overwatcharmor

/datum/armor/overwatcharmor
	melee = 40
	bullet = 40
	laser = 40
	energy = 30
	bomb = 50
	fire = 50
	acid = 50
	wound = 20

/obj/item/clothing/suit/armor/overwatch/deathmatch
	slowdown = 0.33

/obj/item/clothing/suit/armor/overwatch/red
	icon_state = "overwatch_red"

/obj/item/clothing/suit/armor/overwatch/red/deathmatch
	slowdown = 0.33

/obj/item/clothing/suit/armor/overwatch/elite
	name = "overwatch elite chestpiece"
	desc = "Reinforced white kevlar weave surrounding a ceramic plated core. Provides incredible chest protection."
	icon_state = "overwatch_white"
	armor_type = /datum/armor/eliteoverwatcharmor
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)

/datum/armor/eliteoverwatcharmor
	melee = 50
	bullet = 50
	laser = 50
	energy = 40
	bomb = 50
	fire = 50
	acid = 50
	wound = 20

//old armor found only as loot
/obj/item/clothing/suit/armor/kevlar
	name = "kevlar vest"
	desc = "A old kevlar vest. While still decently protective against bullets, the kevlar has broken down over time and is much less protective than it once was."
	icon_state = "bulletproof"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/kevlararmor

/datum/armor/kevlararmor
	melee = 15
	bullet = 25
	laser = 10
	energy = 100
	bomb = 20
	fire = 50
	acid = 50
	wound = 10

//crafted armor vest
/obj/item/clothing/suit/armor/armored
	name = "armored vest"
	desc = "Multiple layers of cloth stitched with cables, and a metal insert placed inside. Not terrible against melee, but provides little protection against firearms."
	icon_state = "bulletproof"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armoredvest

/datum/armor/armoredvest
	melee = 15
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 20
	fire = 40
	acid = 40
	wound = 5

//crafted armor vest
/obj/item/clothing/suit/armor/armored/upgraded
	name = "upgraded armored vest"
	desc = "A handcrafted armored vest made of cloth and metal, enhanced with xenian fungal plates for extra protection."
	armor_type = /datum/armor/armoredvest_upgraded

/datum/armor/armoredvest_upgraded
	melee = 25
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 20
	fire = 50
	acid = 50
	wound = 5

/obj/item/clothing/suit/armor/browncoat
	name = "brown overcoat"
	desc = "A well padded overcoat which offers a small amount of protection."
	icon_state = "brownover"
	inhand_icon_state = "greatcoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80
	clothing_flags = THICKMATERIAL
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	armor_type = /datum/armor/browncoat

/datum/armor/browncoat
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 20
	fire = 20
	acid = 20
	wound = 0

/obj/item/clothing/suit/utility/radiation/cleanup
	name = "cleanup suit"
	desc = "A suit which provides protection against radiation and hostile xenian fauna attacks."
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'
	icon_state = "cleanup"

/obj/item/clothing/suit/utility/radiation/engineer
	name = "engineer suit"
	desc = "A suit which offers some protection from hazardous environments."
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'
	icon_state = "cwuengi"
	inhand_icon_state = "bombsuit"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/geiger_counter)
	slowdown = 0
	armor_type = /datum/armor/engineersuit

/datum/armor/engineersuit
	melee = 5
	bullet = 5
	laser = 0
	energy = 0
	bomb = 5
	bio = 60
	fire = 50
	acid = 50
	wound = 0

//Siggraph boiler bio suit
/obj/item/clothing/suit/bio_suit/boiler
	icon_state = "bio_boiler"
	slowdown = 0
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'
	icon = 'hl13/icons/obj/clothing/suits.dmi'

/obj/item/clothing/suit/toggle/labcoat/halflife
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

//Resistance Raiders armor, only used in events or adminspawned
/obj/item/clothing/suit/armor/rebel
	name = "resistance heavy armour"
	desc = "An Overwatch chestplate with improvised pieces strapped on for more protection. Don't forget to reload, Dr. Freeman."
	icon_state = "rebelarmor_heavy"
	inhand_icon_state = "rebelarmor_heavy"
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'
	body_parts_covered = CHEST|GROIN|ARMS
	slowdown = 0.5
	armor_type = /datum/armor/rebelheavy

/datum/armor/rebelheavy
	melee = 35
	bullet = 50
	laser = 35
	energy = 30
	bomb = 50
	fire = 55
	acid = 45
	wound = 20

/obj/item/clothing/suit/armor/rebel/light
	name = "resistance light armour"
	desc = "A Civil Protection chestplate with some basic armour pieces strapped on. I'm gonna stay and hold down this spot."
	icon_state = "rebelarmor_light"
	inhand_icon_state = "rebelarmor_light"
	slowdown = 0
	armor_type = /datum/armor/rebellight

/datum/armor/rebellight
	melee = 35
	bullet = 30
	laser = 35
	energy = 30
	bomb = 35
	fire = 25
	acid = 25
	wound = 15
