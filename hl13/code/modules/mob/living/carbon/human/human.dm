/mob/living/proc/do_zoom()
	var/do_normal_zoom = TRUE
	if(!zoomed)
		if(src.body_position == LYING_DOWN)
			return
		if(do_normal_zoom)
			var/_x = 0
			var/_y = 0
			switch(dir)
				if (NORTH)
					_y = 7
				if (EAST)
					_x = 7
				if (SOUTH)
					_y = -7
				if (WEST)
					_x = -7
			ADD_TRAIT(src, TRAIT_TOTAL_FOV, "peeper")
			zoomed = TRUE
			animate(client, pixel_x = world.icon_size*_x, pixel_y = world.icon_size*_y, time = 5, easing = SINE_EASING)
			visible_message(span_notice("[src] peers into the distance"), vision_distance = 2)
			//overlay_fullscreen("peeper", /atom/movable/screen/fullscreen/impaired, 1)
			add_movespeed_modifier(/datum/movespeed_modifier/hl13/peeper) //Too busy peeping the horror to walk the chungus

	else
		REMOVE_TRAIT(src, TRAIT_TOTAL_FOV, "peeper")
		reset_zoom()
	update_fov()

/mob/living/proc/reset_zoom()
	animate(client, pixel_x = 0, pixel_y = 0, time = 2, easing = SINE_EASING)
	remove_movespeed_modifier(/datum/movespeed_modifier/hl13/peeper) //Too busy peeping the horror to walk the chungus
	//clear_fullscreen("peeper")
	visible_message(span_notice("[src] focuses near themselves again."), vision_distance = 2)
	update_fov()
	zoomed = FALSE

/datum/movespeed_modifier/hl13/peeper
	multiplicative_slowdown = 1.5
