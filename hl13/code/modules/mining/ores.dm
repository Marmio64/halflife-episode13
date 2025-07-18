/obj/item/stack/ore/copper
	name = "copper ore"
	icon_state = "copper"
	singular_name = "copper ore chunk"
	points = 1
	mats_per_unit = list(/datum/material/copper=SHEET_MATERIAL_AMOUNT)
	refined_type = /obj/item/stack/sheet/scrap_copper
	icon = 'hl13/icons/obj/stack_objects.dmi'
	mine_experience = 5
	scan_state = "rock_Copper"
	merge_type = /obj/item/stack/ore/copper

/datum/material/copper
	name = "copper"
	desc = "Common copper ore often found in sedimentary and igneous layers of the crust."
	color = "#ffac12"
	categories = list(
		MAT_CATEGORY_SILO = TRUE,
		MAT_CATEGORY_RIGID=TRUE,
		MAT_CATEGORY_BASE_RECIPES = TRUE,
		MAT_CATEGORY_ITEM_MATERIAL = TRUE,
		MAT_CATEGORY_ITEM_MATERIAL_COMPLEMENTARY = TRUE,
	)
	sheet_type = /obj/item/stack/sheet/scrap_copper
	ore_type = /obj/item/stack/ore/copper
	value_per_unit = 5 / SHEET_MATERIAL_AMOUNT
	mat_rust_resistance = RUST_RESISTANCE_BASIC
	mineral_rarity = MATERIAL_RARITY_SEMIPRECIOUS
	points_per_unit = 1 / SHEET_MATERIAL_AMOUNT
	minimum_value_override = 0
	tradable = TRUE
	tradable_base_quantity = MATERIAL_QUANTITY_COMMON
	fish_weight_modifier = 1.3
	fishing_gravity_mult = 1.1
