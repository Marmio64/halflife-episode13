/turf/open/floor/plating/indoor
	gender = PLURAL
	name = "flooring"
	baseturfs = /turf/open/floor/plating/ground/dirt
	icon = 'hl13/icons/turf/floor/floors.dmi'
	attachment_holes = FALSE

	footstep = FOOTSTEP_FLOOR

	var/has_alternate_states = FALSE //for damage, alts etc.
	var/alternate_states = 1
	var/has_base_states = FALSE //for starting variety (mainly wood)
	var/base_states = 1

/turf/open/floor/plating/indoor/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(45))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"

/turf/open/floor/plating/indoor/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/indoor/break_tile()
	return //unbreakable

/turf/open/floor/plating/indoor/burn_tile()
	return //unburnable

/turf/open/floor/plating/indoor/ex_act(severity, target)
	return //we're just going to make floors indestructible cause it solves a lot of problems

/turf/open/floor/plating/indoor/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/indoor/MakeDry()
	return

//turf/open/floor/plating/indoor/can_have_cabling()
	//return

/turf/open/floor/plating/indoor/wood
	name = "wood floor"
	icon_state = "wood"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/indoor/woodc
	name = "wood floor"
	icon_state = "wood_common"
	alternate_states = 7
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/woodc/fancy
	icon_state = "wood_fancy"

/turf/open/floor/plating/indoor/woodc/wide
	icon_state = "wood_wide"

/turf/open/floor/plating/indoor/woodc/mosaic
	icon_state = "wood_mosaic"

//for decorative fake stairs
/turf/open/floor/plating/indoor/woodc/stairs
	icon = 'hl13/icons/obj/stairs.dmi'
	icon_state = "wood"
	desc = "Wood stairs."

/turf/open/floor/plating/indoor/sterilesquares
	icon_state = "sterilesquares"

/turf/open/floor/plating/indoor/grooved
	icon_state = "grooved"

/turf/open/floor/plating/indoor/grooved2
	icon_state = "grooved2"

/turf/open/floor/plating/indoor/lino
	icon_state = "lino"

/turf/open/floor/plating/indoor/tiled9
	icon_state = "tiled9"

/turf/open/floor/plating/indoor/tiled10
	icon_state = "tiled10"

/turf/open/floor/plating/indoor/trainfloor
	icon_state = "train"


/turf/open/floor/plating/indoor/concrete
	icon_state = "concrete_big"
	desc = "Concrete slabs."
	footstep = FOOTSTEP_CONCRETE

//for decorative fake stairs
/turf/open/floor/plating/indoor/concrete/stairs
	icon = 'hl13/icons/obj/stairs.dmi'
	icon_state = "concrete"
	desc = "Concrete stairs."

/turf/open/floor/plating/indoor/concrete/small
	icon_state = "concrete_small"
	has_alternate_states = TRUE
	has_base_states = TRUE
	alternate_states = 2

/turf/open/floor/plating/indoor/concrete/bricks
	icon_state = "concrete_bricks"
	has_alternate_states = TRUE
	has_base_states = TRUE
	alternate_states = 8

/turf/open/floor/plating/indoor/checkered
	icon_state = "checker_large"
	alternate_states = 3
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/cafeteria
	icon_state = "cafe_large"
	alternate_states = 3
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/tile
	icon_state = "grey"
	alternate_states = 3
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/tile/kitchen
	icon_state = "kitchentile"
	alternate_states = 1
	has_alternate_states = FALSE
	has_base_states = FALSE

/turf/open/floor/plating/indoor/tile/navy
	icon_state = "navy"
	alternate_states = 3
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/tile/black
	icon_state = "black"
	alternate_states = 3
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/tile/green
	icon_state = "green_large"
	alternate_states = 2
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/tile/navy/cold
	initial_gas_mix = TCOMMS_ATMOS


/turf/open/floor/plating/indoor/metal
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	icon_state = "steel_tiles"
	desc = "Metal flooring."

/turf/open/floor/plating/indoor/metal/train
	icon_state = "train_floor"

/turf/open/floor/plating/indoor/metal/train/inner
	icon_state = "train_carpet"

/turf/open/floor/plating/indoor/metal/plate
	icon_state = "steel_solid"

/turf/open/floor/plating/indoor/metal/combine
	icon_state = "combine_metal"

/turf/open/floor/plating/indoor/metal/combine/alt2
	icon_state = "combine_metal_alt2"
	alternate_states = 2
	has_alternate_states = TRUE
	has_base_states = TRUE

/turf/open/floor/plating/indoor/metal/smooth
	icon_state = "combine_metal_smooth"

/turf/open/floor/plating/indoor/metal/grate
	icon_state = "steel_grate"

/turf/open/floor/plating/indoor/metal/pipe
	icon_state = "pipe_straight"

/turf/open/floor/plating/indoor/metal/pipe/corner
	icon_state = "pipe_corner"

/turf/open/floor/plating/indoor/metal/pipe/intersection
	icon_state = "pipe_intersection"

/turf/open/floor/plating/indoor/metal/industrial
	icon_state = "steel_industrial"

/turf/open/floor/plating/indoor/metal/grate
	icon_state = "steel_grate"

/turf/open/floor/plating/indoor/metal/grate/border
	icon_state = "steel_grate_border"

/turf/open/floor/plating/indoor/metal/grate/border/warning
	icon_state = "steel_grate_warning"

/turf/open/floor/plating/indoor/metal/walkway
	icon_state = "steel_walkway"

/turf/open/floor/plating/indoor/metal/walkway/corner
	icon_state = "steel_walkway_corner"

/turf/open/floor/plating/indoor/metal/walkway/end
	icon_state = "steel_walkway_end"

/turf/open/floor/plating/indoor/carpet
	name = "carpet"
	desc = "carpeted wooden flooring."
	icon_state = "carpet_fancy_red"
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_CARPET_BAREFOOT
	has_alternate_states = FALSE
	flags_1 = NONE
	bullet_bounce_sound = null
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	has_base_states = FALSE

/turf/open/floor/plating/indoor/carpet/blue
	icon_state = "carpet_fancy_blue"

/turf/open/floor/plating/indoor/carpet/green
	icon_state = "carpet_fancy_green"

/turf/open/floor/plating/indoor/carpet/violet
	icon_state = "carpet_fancy_violet"

/turf/open/floor/plating/indoor/carpet/shaggy
	icon_state = "carpet_red"


/turf/open/floor/plating/indoor/carpet/shaggy/blue
	icon_state = "carpet_blue"


/turf/open/floor/plating/indoor/carpet/shaggy/green
	icon_state = "carpet_green"


/turf/open/floor/plating/indoor/carpet/shaggy/violet
	icon_state = "carpet_violet"

//from Mojave Sun 13

/turf/open/floor/plating/ground
	baseturfs = /turf/open/floor/plating/ground/dirt
	turf_flags = NO_RUST
	tiled_dirt = FALSE
	light_power = 0.20
	light_range = 0.35
	var/border_icon
	var/has_alternate_states = FALSE //for damage, alts etc.
	var/alternate_states = 1
	var/has_base_states = FALSE //for starting variety (mainly wood)
	var/base_states = 1

	smoothing_groups = SMOOTH_GROUP_OPEN_FLOOR
	canSmoothWith = SMOOTH_GROUP_OPEN_FLOOR
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

/turf/open/floor/plating/ground/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(20))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"

/turf/open/floor/plating/ground/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/ground/ex_act(severity, target)
	return //we're just going to make floors indestructible cause it solves a lot of problems

/turf/open/floor/plating/ground/break_tile()
	return //unbreakable

/turf/open/floor/plating/ground/burn_tile()
	return //unburnable

/turf/open/floor/plating/ground/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/ground/MakeDry()
	return

/turf/open/floor/plating/ground/can_have_cabling()
	return

/turf/open/floor/plating/ground/dirt
	gender = PLURAL
	name = "dirt"
	desc = "A floor of soil."
	icon = 'hl13/icons/turf/floor/floors.dmi'
	icon_state = "mud_1"
	baseturfs = /turf/open/floor/plating/ground/dirt
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/ground/dirt/alt
	icon_state = "mud_2"

/turf/open/floor/plating/ground/rockunder
	gender = PLURAL
	name = "stone"
	desc = "A floor of cold stone."
	icon = 'hl13/icons/turf/floor/floors.dmi'
	icon_state = "cave"
	baseturfs = /turf/open/floor/plating/ground/rockunder
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_CONCRETE
	light_power = 0
	light_range = 0
	has_base_states = TRUE
	has_alternate_states = TRUE
	alternate_states = 7


// Sprites from half life city 13 rebuilt
/turf/open/floor/plating/ground/brickroad
	name = "\proper road"
	desc = "Grey bricks of stone arranged into a stretch of road, the passage of time slowly taking its toll upon them."
	baseturfs = /turf/open/floor/plating/ground/brickroad
	icon = 'hl13/icons/turf/floor/road.dmi'
	icon_state = "road-0"
	base_icon_state = "road"
	footstep = FOOTSTEP_CONCRETE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_TURF_COBBLESTONE_ROAD
	canSmoothWith = SMOOTH_GROUP_TURF_COBBLESTONE_ROAD

////Sidewalks////

/turf/open/floor/plating/ground/sidewalk
	name = "sidewalk"
	desc = "Paved tiles specifically designed for walking upon."
	baseturfs = /turf/open/floor/plating/ground/sidewalk
	icon = 'hl13/icons/turf/floor/sidewalk.dmi'
	icon_state = "sidewalk"
	base_icon_state = "sidewalk"
	footstep = FOOTSTEP_CONCRETE

/turf/open/floor/plating/ground/sidewalk/inner
	baseturfs = /turf/open/floor/plating/ground/sidewalk/inner
	icon_state = "sidewalkinside"
	base_icon_state = "sidewalkinside"

/turf/open/floor/plating/ground/sidewalk/inner/slums
	baseturfs = /turf/open/floor/plating/ground/sidewalk/inner/slums
	icon_state = "sidewalkinsideslums"
	base_icon_state = "sidewalkinsideslums"

/turf/open/floor/plating/ground/sidewalk/cobblestone
	baseturfs = /turf/open/floor/plating/ground/sidewalk/cobblestone
	icon_state = "cobblestone"
	desc = "Laid out cobblestone. Forms a path easy enough to walk on."

/turf/open/floor/plating/ground/grass
	name = "grass"
	desc = "A patch of grass."
	icon = 'hl13/icons/turf/floor/floors.dmi'
	icon_state = "hl_grass"
	base_icon_state = "hl_grass"
	baseturfs = /turf/open/floor/plating/ground/grass
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_GRASS
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS
	smooth_broken = TRUE
	smooth_burnt = TRUE
	layer = HIGH_TURF_LAYER
	rust_resistance = RUST_RESISTANCE_ORGANIC
	planetary_atmos = TRUE
	/// The icon used for smoothing.
	var/smooth_icon = 'hl13/icons/turf/floor/cut/hl_grass.dmi'

/turf/open/floor/plating/ground/grass/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(LARGE_TURF_SMOOTHING_X_OFFSET, LARGE_TURF_SMOOTHING_Y_OFFSET)
		transform = translation
		icon = smooth_icon

	if(is_station_level(z))
		GLOB.station_turfs += src


/turf/open/floor/plating/ground/grass/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	. = ..()
	if (!.)
		return

	if(!smoothing_flags)
		return

	underlay_appearance.transform = transform
