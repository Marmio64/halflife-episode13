/obj/item/clothing/suit/armor/civilprotection
	name = "civil protection vest"
	desc = "A one size fits all type of vest, made with kevlar. Encases your upper chest to provide good protection."
	icon_state = "civilprotection"
	inhand_icon_state = "armoralt"
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

	armor_type = /datum/armor/civpro_vest

	limb_integrity = 225
	repairable_by = /obj/item/stack/kevlar

/datum/armor/civpro_vest
	melee = 35
	bullet = 25
	laser = 30
	energy = 40
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

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
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

	armor_type = /datum/armor/overwatcharmor

	limb_integrity = 400
	repairable_by = /obj/item/stack/kevlar

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
	slowdown = 0.5

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

/obj/item/clothing/suit/armor/halflife
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

//old armor found only as loot
/obj/item/clothing/suit/armor/kevlar
	name = "kevlar vest"
	desc = "A old kevlar vest. While still decently protective against bullets, the kevlar has broken down over time and is much less protective than it once was."
	icon_state = "bulletproof"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/kevlararmor

	limb_integrity = 175
	repairable_by = /obj/item/stack/kevlar

/datum/armor/kevlararmor
	melee = 20
	bullet = 25
	laser = 10
	energy = 100
	bomb = 20
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/suit/armor/halflife/milvest
	name = "military vest"
	desc = "A heavily armored old military vest. The layers of kevlar have weakened over the years, but it remains a potent defensive piece of equipment."
	icon_state = "milvest"
	blood_overlay_type = "armor"
	slowdown = 0.25
	armor_type = /datum/armor/milvest

	limb_integrity = 225
	repairable_by = /obj/item/stack/kevlar

/datum/armor/milvest
	melee = 30
	bullet = 40
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

	limb_integrity = 100

/datum/armor/armoredvest
	melee = 20
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

	limb_integrity = 200

/datum/armor/armoredvest_upgraded
	melee = 30
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

	limb_integrity = 100

/obj/item/clothing/suit/armor/browncoat/deathmatch
	slowdown = -0.5

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

/obj/item/clothing/suit/bluejacket
	name = "blue citizen jacket"
	desc = "A blue jacket for citizens to wear."
	icon_state = "bluejacket"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	strip_delay = 80
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/greenjacket
	name = "green union jacket"
	desc = "A heavily faded jacket. It was supposedly rather green, but now you can barely tell it from a grey jacket."
	icon_state = "greenjacket"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	strip_delay = 80
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'

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
	melee = 0
	bullet = 0
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

	limb_integrity = 350
	repairable_by = /obj/item/stack/kevlar

/datum/armor/rebelheavy
	melee = 40
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

	limb_integrity = 250

/datum/armor/rebellight
	melee = 40
	bullet = 30
	laser = 35
	energy = 30
	bomb = 35
	fire = 25
	acid = 25
	wound = 15

//Fungal plate armor. Provides the same protection as a civil protection officer vest, but slows you down quite a lot.
/obj/item/clothing/suit/armor/platearmor
	name = "fungal plate armor"
	desc = "Chest armor comprised of fungal plates harvested from xenian lifeforms. Offers decent protection, but is heavy and uncomfortable."
	icon_state = "platearmor"
	icon = 'hl13/icons/obj/clothing/suits.dmi'
	worn_icon = 'hl13/icons/mob/clothing/suit.dmi'
	slowdown = 0.5
	repairable_by = /obj/item/stack/sheet/animalhide/goliath_hide

	limb_integrity = 350

	armor_type = /datum/armor/civpro_vest

/obj/item/clothing/suit/armor/platearmor/deathmatch
	body_parts_covered = CHEST|GROIN|ARMS|LEGS

	armor_type = /datum/armor/platearmor_deathmatch

/datum/armor/platearmor_deathmatch
	melee = 70
	bullet = 70
	laser = 70
	energy = 70
	bomb = 70
	fire = 70
	acid = 70
	wound = 15
