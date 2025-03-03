//wip
/obj/machinery/light/combine
	name = "combine light"
	icon = 'hl13/icons/obj/lighting.dmi'
	icon_state = "tube"
	desc = "A tinted light tube."
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

/obj/machinery/combine_walllight
	name = "combine light"
	desc = "A wall mounted light manufactured by the combine to be rather efficient."
	icon = 'hl13/icons/obj/lighting.dmi'
	icon_state = "combinelight"
	light_angle = 230
	light_range = 6
	light_power = 1.5
	light_color = LIGHT_COLOR_FAINT_CYAN
	layer = WALL_OBJ_LAYER
	plane = GAME_PLANE_UPPER

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/combine_walllight, 0)

/obj/machinery/combine_walllight/Initialize(mapload)
	. = ..()

	switch(dir)
		if(NORTH)
			pixel_y = -1
		if(SOUTH)
			pixel_y = 25

	set_light(l_dir = dir)
