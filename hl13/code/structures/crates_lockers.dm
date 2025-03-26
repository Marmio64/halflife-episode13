/obj/structure/closet/secure_closet/freezer/halflife
	name = "fridge"
	desc = "A cooling fridge for keeping things cold."
	icon = 'hl13/icons/obj/storage/storage.dmi'
	icon_state = "fridge1"
	base_icon_state = "fridge1"

	secure = FALSE
	locked = FALSE

	door_anim_time = 0 // set to 0 to make the door not animate at all

/obj/structure/closet/secure_closet/freezer/halflife/alt1
	icon_state = "fridge2"
	base_icon_state = "fridge2"

/obj/structure/closet/secure_closet/freezer/halflife/alt2
	icon_state = "fridge3"
	base_icon_state = "fridge3"

/obj/structure/closet/halflife
	icon = 'hl13/icons/obj/storage/storage.dmi'
	icon_state = "locker"

	door_anim_time = 0 // set to 0 to make the door not animate at all

/obj/structure/closet/secure_closet/halflife
	icon = 'hl13/icons/obj/storage/storage.dmi'
	icon_state = "locker"

/obj/structure/closet/secure_closet/halflife/security
	name = "protection officer's locker"
	req_access = list(ACCESS_BRIG)

/obj/structure/closet/secure_closet/halflife/security/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/civilprotection(src)
	new /obj/item/clothing/mask/gas/civilprotection(src)
	new /obj/item/clothing/gloves/color/civilprotection(src)
	new /obj/item/clothing/under/combine/civilprotection(src)
	new /obj/item/clothing/glasses/hud/security(src)
	new /obj/item/radio/headset/civilprotection(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/shoes/jackboots/civilprotection(src)
