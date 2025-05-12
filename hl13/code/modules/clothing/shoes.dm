/obj/item/clothing/shoes/jackboots/civilprotection
	desc = "Snug and secure black boots worn by civil protection forces."
	icon_state = "civilprotection"
	worn_icon = 'hl13/icons/mob/clothing/feet.dmi'
	icon = 'hl13/icons/obj/clothing/shoes.dmi'
	var/list/squeak_sound = list('hl13/sound/movement/civilprotection/gear1.ogg'=1,'hl13/sound/movement/civilprotection/gear2.ogg'=1,'hl13/sound/movement/civilprotection/gear3.ogg'=1,'hl13/sound/movement/civilprotection/gear4.ogg'=1,'hl13/sound/movement/civilprotection/gear5.ogg'=1,'hl13/sound/movement/civilprotection/gear6.ogg'=1)
	armor_type = /datum/armor/combine_gloveshoes
	body_parts_covered = LEGS|FEET

/obj/item/clothing/shoes/jackboots/civilprotection/Initialize(mapload)
	. = ..()
	LoadComponent(/datum/component/squeak, squeak_sound, 25, 100, 0)

/obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	desc = "Snug and secure black boots worn by overwatch forces."
	icon_state = "overwatch"
	squeak_sound = list('hl13/sound/movement/overwatch/gear1.ogg'=1,'hl13/sound/movement/overwatch/gear2.ogg'=1,'hl13/sound/movement/overwatch/gear3.ogg'=1,'hl13/sound/movement/overwatch/gear4.ogg'=1,'hl13/sound/movement/overwatch/gear5.ogg'=1,'hl13/sound/movement/overwatch/gear6.ogg'=1)

/obj/item/clothing/shoes/jackboots/civilprotection/overwatch/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, COMBINESUIT_TRAIT)
	LoadComponent(/datum/component/squeak, squeak_sound, 25, 100, 0)

/obj/item/clothing/shoes/boots
	name = "boots"
	desc = "Old boots, usually given to any and all citizens."
	icon_state = "workboots"
	inhand_icon_state = "jackboots"
	worn_icon = 'hl13/icons/mob/clothing/feet.dmi'
	icon = 'hl13/icons/obj/clothing/shoes.dmi'
	strip_delay = 20
	equip_delay_other = 40
	lace_time = 8 SECONDS
