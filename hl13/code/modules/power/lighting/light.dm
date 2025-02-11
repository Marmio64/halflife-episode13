//wip
/obj/machinery/light/combine
	name = "combine light"
	icon = 'hl13/icons/obj/lighting.dmi'
	icon_state = "tube"
	desc = "A combine lighting device."
	light_angle = 120
	overlay_icon = 'hl13/icons/obj/lighting_overlay.dmi'
	///base description and icon_state
	base_state = "tube"
	brightness = 5
	bulb_colour = LIGHT_COLOR_ELECTRIC_CYAN

/obj/machinery/light/small/cyan
	bulb_colour = LIGHT_COLOR_FAINT_CYAN

/datum/light_template/read_light/cyan_bulb
	name = "Cyan Bulb"
	category = "Bulb"
	path_to_read = /obj/machinery/light/small/cyan

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/cyan, 0)
