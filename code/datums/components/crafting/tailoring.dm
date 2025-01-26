/datum/crafting_recipe/durathread_vest
	name = "Durathread Vest"
	result = /obj/item/clothing/suit/armor/vest/durathread
	reqs = list(/obj/item/stack/sheet/durathread = 5,
				/obj/item/stack/sheet/leather = 4)
	time = 5 SECONDS
	category = CAT_ARMOR

/datum/crafting_recipe/durathread_helmet
	name = "Durathread Helmet"
	result = /obj/item/clothing/head/helmet/durathread
	reqs = list(/obj/item/stack/sheet/durathread = 4,
				/obj/item/stack/sheet/leather = 5)
	time = 4 SECONDS
	category = CAT_ARMOR

/datum/crafting_recipe/hudsunsec
	name = "Security HUDsunglasses"
	result = /obj/item/clothing/glasses/hud/security/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/hudsunsecremoval
	name = "Security HUD removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/security/sunglasses = 1)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/hudsunmed
	name = "Medical HUDsunglasses"
	result = /obj/item/clothing/glasses/hud/health/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/hudsunmedremoval
	name = "Medical HUD removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/health/sunglasses = 1)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/hudsundiag
	name = "Diagnostic HUDsunglasses"
	result = /obj/item/clothing/glasses/hud/diagnostic/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/hudsundiagremoval
	name = "Diagnostic HUD removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/hud/diagnostic/sunglasses = 1)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/scienceglasses
	name = "Science Glasses"
	result = /obj/item/clothing/glasses/sunglasses/chemical
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/science = 1,
				  /obj/item/clothing/glasses/sunglasses = 1,
				  /obj/item/stack/cable_coil = 5)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/scienceglassesremoval
	name = "Chemical Scanner removal"
	result = /obj/item/clothing/glasses/sunglasses
	time = 2 SECONDS
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/sunglasses/chemical = 1)
	category = CAT_EQUIPMENT

/datum/crafting_recipe/prisonsuit
	name = "Prisoner Uniform (Suit)"
	result = /obj/item/clothing/under/rank/prisoner
	reqs = list(/obj/item/stack/sheet/cloth = 3, /obj/item/stack/license_plates = 1)
	time = 2 SECONDS
	category = CAT_CLOTHING

/datum/crafting_recipe/prisonskirt
	name = "Prisoner Uniform (Skirt)"
	result = /obj/item/clothing/under/rank/prisoner/skirt
	reqs = list(/obj/item/stack/sheet/cloth = 3, /obj/item/stack/license_plates = 1)
	time = 2 SECONDS
	category = CAT_CLOTHING

/datum/crafting_recipe/prisonshoes
	name = "Orange Prison Shoes"
	result = /obj/item/clothing/shoes/sneakers/orange
	reqs = list(/obj/item/stack/sheet/cloth = 2, /obj/item/stack/license_plates = 1)
	time = 1 SECONDS
	category = CAT_CLOTHING

/datum/crafting_recipe/bonetalisman
	name = "Bone Talisman"
	result = /obj/item/clothing/accessory/talisman
	time = 2 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 2,
		/obj/item/stack/sheet/sinew = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/bonecodpiece
	name = "Skull Codpiece"
	result = /obj/item/clothing/accessory/skullcodpiece
	time = 2 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 2,
		/obj/item/stack/sheet/animalhide/goliath_hide = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/mummy
	name = "Mummification Bandages (Mask)"
	result = /obj/item/clothing/mask/mummy
	time = 1 SECONDS
	tool_paths = list(/obj/item/nullrod/egyptian)
	reqs = list(/obj/item/stack/sheet/cloth = 2)
	category = CAT_CLOTHING

/datum/crafting_recipe/mummy/body
	name = "Mummification Bandages (Body)"
	result = /obj/item/clothing/under/costume/mummy
	reqs = list(/obj/item/stack/sheet/cloth = 5)

/datum/crafting_recipe/chaplain_hood
	name = "Follower Hoodie"
	result = /obj/item/clothing/suit/hooded/chaplain_hoodie
	time = 1 SECONDS
	tool_paths = list(
		/obj/item/clothing/suit/hooded/chaplain_hoodie,
		/obj/item/book/bible,
	)
	reqs = list(/obj/item/stack/sheet/cloth = 4)
	category = CAT_CLOTHING

/datum/crafting_recipe/flower_garland
	name = "Flower Garland"
	result = /obj/item/clothing/head/costume/garland
	time = 1 SECONDS
	reqs = list(
		/obj/item/food/grown/poppy = 4,
		/obj/item/food/grown/harebell = 4,
		/obj/item/food/grown/rose = 4,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/poppy_crown
	name = "Poppy Crown"
	result = /obj/item/clothing/head/costume/garland/poppy
	time = 1 SECONDS
	reqs = list(
		/obj/item/food/grown/poppy = 5,
		/obj/item/stack/cable_coil = 3,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/lily_crown
	name = "Lily Crown"
	result = /obj/item/clothing/head/costume/garland/lily
	time = 1 SECONDS
	reqs = list(
		/obj/item/food/grown/poppy/lily = 5,
		/obj/item/stack/cable_coil = 3,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/sunflower_crown
	name = "Sunflower Crown"
	result = /obj/item/clothing/head/costume/garland/sunflower
	time = 1 SECONDS
	reqs = list(
		/obj/item/food/grown/sunflower = 5,
		/obj/item/stack/cable_coil = 3,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/rainbow_bunch_crown
	name = "Rainbow Flower Crown"
	result = /obj/item/clothing/head/costume/garland/rainbowbunch
	time = 1 SECONDS
	reqs = list(
		/obj/item/food/grown/rainbow_flower = 5,
		/obj/item/stack/cable_coil = 3,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/paper_hat
	name = "Paper Hat"
	result = /obj/item/clothing/head/costume/paper_hat
	time = 5 SECONDS
	reqs = list(
		/obj/item/paper = 1,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/biohood_sec
	name = "security biohood"
	result = /obj/item/clothing/head/bio_hood/security
	time = 2 SECONDS
	reqs = list(
		/obj/item/clothing/head/bio_hood/general = 1,
		/obj/item/clothing/head/helmet/sec = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/biosuit_sec
	name = "security biosuit"
	result = /obj/item/clothing/suit/bio_suit/security
	time = 2 SECONDS
	reqs = list(
		/obj/item/clothing/suit/bio_suit/general = 1,
		/obj/item/clothing/suit/armor/vest = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/press_armor
	name = "press armor vest"
	result = /obj/item/clothing/suit/armor/vest/press
	time = 2 SECONDS
	tool_paths = list(/obj/item/clothing/accessory/press_badge)
	reqs = list(
		/obj/item/clothing/suit/armor/vest = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/press_helmet
	name = "press helmet vest"
	result = /obj/item/clothing/head/helmet/press
	time = 2 SECONDS
	tool_paths = list(/obj/item/clothing/accessory/press_badge)
	reqs = list(
		/obj/item/clothing/head/helmet/sec = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/press_vest
	name = "press vest"
	result = /obj/item/clothing/suit/hazardvest/press
	time = 2 SECONDS
	tool_paths = list(/obj/item/clothing/accessory/press_badge)
	reqs = list(
		/obj/item/clothing/suit/hazardvest = 1,
	)
	category = CAT_ARMOR

/datum/crafting_recipe/press_fedora
	name = "press fedora"
	result = /obj/item/clothing/head/fedora/beige/press
	time = 2 SECONDS
	tool_paths = list(/obj/item/clothing/accessory/press_badge)
	reqs = list(
		/obj/item/clothing/head/fedora/beige = 1,
	)
	category = CAT_CLOTHING
