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

/obj/structure/closet/crate/freezer/halflife
	desc = "A freezer."
	name = "freezer"
	icon = 'hl13/icons/obj/storage/crates.dmi'
	icon_state = "medical"
	base_icon_state = "medical"

/obj/structure/closet/crate/freezer/halflife/blood
	name = "blood freezer"
	desc = "A freezer containing packs of blood."

/obj/structure/closet/crate/freezer/halflife/blood/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood/a_minus(src)
	new /obj/item/reagent_containers/blood/b_minus(src)
	new /obj/item/reagent_containers/blood/b_plus(src)
	new /obj/item/reagent_containers/blood/o_minus(src)
	new /obj/item/reagent_containers/blood/o_plus(src)

/obj/structure/closet/crate/halflife
	icon = 'hl13/icons/obj/storage/crates.dmi'
	icon_state = "aluminum"
	base_icon_state = "aluminum"
	paint_jobs = null

/obj/structure/closet/crate/halflife
	icon = 'hl13/icons/obj/storage/crates.dmi'
	icon_state = "aluminum"
	base_icon_state = "aluminum"
	paint_jobs = null

/obj/structure/closet/crate/secure/halflife
	icon_state = "vault_standard_clean"
	base_icon_state = "vault_standard_clean"
	icon = 'hl13/icons/obj/storage/crates.dmi'

/obj/structure/closet/crate/halflife/wooden
	name = "wooden crate"
	desc = "Works just as well as a metal one."
	material_drop = /obj/item/stack/sheet/mineral/wood
	material_drop_amount = 6
	icon_state = "plain_crate"
	base_icon_state = "plain_crate"
	open_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	close_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50
	paint_jobs = null
	cutting_tool = /obj/item/crowbar
