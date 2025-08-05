// Metal Smoothing Tables //

/obj/structure/table/halflife
	name = "table"
	desc = "Scream at the coders if you see this."
	custom_materials = null

/obj/structure/table/halflife/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>screwdriver</b> or a <b>wrench</b> to take apart [src].")

/obj/structure/table/halflife/metal
	name = "metal table"
	desc = "A square piece of metal standing on four metal legs. It can not move."
	icon = 'hl13/icons/obj/tables/table_metal.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	max_integrity = 225
	frame = /obj/structure/table_frame/halflife

/obj/structure/table/halflife/metal/alt
	desc = "A rounded piece of metal standing on a set of metal legs. It can not move."
	icon = 'hl13/icons/obj/tables/table_metal_alt.dmi'

/obj/structure/table/halflife/metal/grate
	desc = "A grated metal table, like a normal table but can't hold small stuff! Super industrial-y"
	icon = 'hl13/icons/obj/tables/table_metal_grate.dmi'
	max_integrity = 200

/obj/structure/table/halflife/metal/small
	desc = "A small, low down metal table. God only knows why these were sought out after in the old days."
	icon = 'hl13/icons/obj/tables/table_metal_small.dmi'

/obj/structure/table/halflife/metal/heavy
	name = "heavy-duty metal table"
	desc = "A heavy duty metal table, held together by strong rivets and expert engineering, built to hold up to the heaviest of tools."
	icon = 'hl13/icons/obj/tables/table_metal_heavy.dmi'
	max_integrity = 300
	integrity_failure = 0.25
	frame = /obj/structure/table_frame/halflife

// Wooden Smoothing Tables //

/obj/structure/table/halflife/wood
	name = "wood table"
	desc = "A simple wooden table. Good for propping your feet up on dramatically."
	icon = 'hl13/icons/obj/tables/table_wood.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	max_integrity = 150
	hl13hit_sounds = SFX_WOODIMPACT

	frame = /obj/structure/table_frame/halflife/wood
	framestack = /obj/item/stack/sheet/mineral/wood
	framestackamount = 2

/obj/structure/table/halflife/wood/bar
	desc = "A somewhat fancy table used at restauraunts of the past. Featuring a simplistic anchored leg design, wow!"
	icon = 'hl13/icons/obj/tables/table_wood_bar.dmi'
	max_integrity = 200

// Table Frames //

/obj/structure/table_frame/halflife
	name = "metal table frame"
	desc = "Four metal legs with four framing rods for a table."
	icon = 'hl13/icons/obj/standalone_tables.dmi'
	icon_state = "tableframe_metal"
	density = TRUE
	anchored = FALSE
	max_integrity = 20
	framestack = /obj/item/stack/sheet/iron
	framestackamount = 2

/obj/structure/table_frame/halflife/wood
	name = "wood table frame"
	desc = "Four wooden legs with four framing wooden rods for a wooden table. You could easily pass through this."
	icon_state = "tableframe_wood"
	resistance_flags = FLAMMABLE
	framestack = /obj/item/stack/sheet/mineral/wood
	framestackamount = 2
	hl13hit_sounds = SFX_WOODIMPACT

// Player-Made tables //

/obj/structure/table/halflife/metal/constructed
	name = "crude metal table"
	desc = "A crude table made of quality metal. Not too bad, as far as post apocalyptic furniture goes."
	icon = 'hl13/icons/obj/tables/table_metal_built.dmi'
	max_integrity = 140

/obj/structure/table/halflife/metal/constructed/cobbled
	name = "crude scrap metal table"
	desc = "A crude table made of scrap metal. Doesn't look pretty and seems barely finished, but it does it's job."
	icon = 'hl13/icons/obj/tables/table_metal_built_LQ.dmi'
	max_integrity = 110

/obj/structure/table/halflife/wood/constructed
	name = "crude wood table"
	desc = "A crude wood table of decent quality. It probably won't fall apart any time soon."
	icon = 'hl13/icons/obj/tables/table_wood_built.dmi'
	max_integrity = 120

/obj/structure/table/halflife/wood/constructed/cobbled
	name = "crude scrap wood table"
	desc = "A crude wood table made of scrap, low quality wood. About as rickety as you'd expect."
	icon = 'hl13/icons/obj/tables/table_wood_built_LQ.dmi'
	max_integrity = 90

// Metal Non-Smoothing tables //

/obj/structure/table/halflife/no_smooth
	name = "non-smoothing wasteland table"
	desc = "Much like a regular table, except it doesn't smooth. Revolutionary, I know."
	icon = 'hl13/icons/obj/standalone_tables.dmi'
	smoothing_flags = NONE
	canSmoothWith = null

/obj/structure/table/halflife/no_smooth/metal
	name = "metal table"
	desc = "A table, masterfully designed with high-tech to become... round."
	icon_state = "table_metal_round"
	max_integrity = 225

/obj/structure/table/halflife/no_smooth/metal/Initialize(mapload)
	. = ..()
	if(prob(35))
		icon_state = "[initial(icon_state)]-[rand(1,2)]"

// Large tables //

/obj/structure/table/halflife/no_smooth/large
	name = "base class large halflife table"
	desc = "CALL A CODER, CALL A CODER. For ME!"
	icon = 'hl13/icons/obj/64x64_large_furniture.dmi'

/obj/structure/table/halflife/no_smooth/large/Initialize(mapload)
	. = ..()
	if(dir == NORTH)
		bound_width = 64

	if(dir == EAST)
		bound_height = 64

	if(dir == SOUTH)
		bound_width = 64

	if(dir == WEST)
		bound_height = 64

// Metal Large tables /

/obj/structure/table/halflife/no_smooth/large/metal
	name = "metal table"
	desc = "A solid, wide metal table. Nothing about it stands out in particular."
	icon_state = "table_metal_wide"
	max_integrity = 300
	frame = /obj/item/stack/sheet/iron

/obj/structure/table/halflife/no_smooth/large/metal/desk
	name = "metal desk"
	desc = "A solid, wide metal table. Nothing about it stands out in particular."
	icon_state = "desk_metal"

/obj/structure/table/halflife/no_smooth/large/metal/desk/alt
	name = "metal desk"
	desc = "A compact metal desk, used by a wide variety of individuals before the war, once upon a time."
	icon_state = "desk_metal_small"

// Wood Non-Smoothing tables //

/obj/structure/table/halflife/no_smooth/wood
	name = "wood table"
	desc = "A simple round wooden table. You wish you could make something this nice."
	icon_state = "table_wood_round"
	max_integrity = 150
	frame = /obj/item/stack/sheet/mineral/wood
	hl13hit_sounds = SFX_WOODIMPACT

/obj/structure/table/halflife/no_smooth/wood/square
	name = "wood table"
	desc = "A simple squared wooden table. You wish you could make something this nice."
	icon_state = "table_wood_square"

/obj/structure/table/halflife/no_smooth/wood/low
	name = "coffee table"
	desc = "A table that is relatively low to the ground, designed to prop things up on while you sit on your sofa."
	icon_state = "table_wood_low"

/obj/structure/table/halflife/no_smooth/wood/stand
	name = "bed stand"
	desc = "A tall table that is often found beside beds. This one is wood with a basic finish on it. Minimal mold on the inside, impressive!"
	icon_state = "table_wood_stand"

/obj/structure/table/halflife/no_smooth/wood/end
	name = "console end"
	desc = "A separate optional add-on for your console. More storage for books you never read!"
	icon_state = "table_wood_end"

// Wood Large tables //

/obj/structure/table/halflife/no_smooth/large/wood
	name = "wood table"
	desc = "A large oval shaped wood table. Perfect for displaying the 200 year old family photos you found."
	icon_state = "table_wood_wide_oval"
	max_integrity = 200
	frame = /obj/item/stack/sheet/mineral/wood
	hl13hit_sounds = SFX_WOODIMPACT

/obj/structure/table/halflife/no_smooth/large/wood/square
	desc = "A large rectangular wood table. Very sturdy."
	icon_state = "table_wood_wide_square"

/obj/structure/table/halflife/no_smooth/large/wood/desk
	name = "wood desk"
	desc = "A full size wood desk, used by the pre-war soul lackers of the working world that once was."
	icon_state = "desk_wood"

/obj/structure/table/halflife/no_smooth/large/wood/desk/alt
	name = "wood desk"
	desc = "A compact wood desk, used by a wide variety of individuals before the war, once upon a time."
	icon_state = "desk_wood_small"

/obj/structure/table/halflife/no_smooth/large/wood/stand
	name = "wood console"
	desc = "A smooth console, designed specifically in mind for your brand new Radiation King! But those days are now over. Mostly just looks good in a room."
	icon_state = "stand_wood"

/obj/structure/table/halflife/no_smooth/large/wood/stand/alt
	icon_state = "stand_wood_small"

//Misc tables //

/obj/structure/table/halflife/no_smooth/dice
	name = "dice table"
	desc = "Shoot the dice with your friends. Preferably not literally."
	icon_state = "dice_dirty"
	max_integrity = 150
	frame = /obj/item/stack/sheet/mineral/wood

/obj/structure/table/halflife/no_smooth/dice/pristine
	icon_state = "dice_clean"
	max_integrity = 200

/obj/structure/table/halflife/no_smooth/cable_reel
	name = "cable reel"
	desc = "An old cable reel for holding, you guessed it, cable. Now all it's good for though is holding your stuff."
	icon_state = "cable_reel"
	frame = /obj/item/stack/sheet/mineral/wood

// Misc Large tables //

/obj/structure/table/halflife/no_smooth/large/pool
	name = "pool table"
	desc = "A favourite of students and drunkards alike. Watch out for sharks!"
	icon_state = "table_pool"
	max_integrity = 200
	frame = /obj/item/stack/sheet/mineral/wood

/obj/structure/table/halflife/no_smooth/large/cards
	name = "cards table"
	desc = "Very classy. Reminds you of that time in New Reno..."
	icon_state = "table_cards"

/obj/structure/table/rolling/halflife
	name = "rolling table"
	desc = "A rolling medical table. Extremely useful in a surgical environment."
	icon = 'hl13/icons/obj/standalone_tables.dmi'
	icon_state = "table_rolling"
	max_integrity = 200
	buildstack = null
	custom_materials = null
	frame = /obj/item/stack/sheet/iron
	framestack = /obj/item/stack/sheet/iron
	framestackamount = 2

/obj/structure/table/rolling/halflife/deconstruction_hints(mob/user)
	return

///// CRAFTING TABLES /////

/obj/structure/table/halflife/no_smooth/large/crafting // Functionality of these is applied via individual crafting element var 'surfacetype'
	name = "base class Half Life Sun crafting bench"
	desc = "Scream at yo MAMA if you see this."
	icon = 'hl13/icons/obj/workbenches.dmi'
	smoothing_flags = NONE
	canSmoothWith = null
	deconstruction_ready = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/datum/component/personal_crafting/crafting
	var/crafting_type = CRAFTING_BENCH_GENERAL

/obj/structure/table/halflife/no_smooth/large/crafting/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Click on the [src] to begin crafting.</span>"

/obj/structure/table/halflife/no_smooth/large/crafting/wrench_act(mob/living/user, obj/item/weapon)
	return

/obj/structure/table/halflife/no_smooth/large/crafting/screwdriver_act(mob/living/user, obj/item/weapon)
	return

/obj/structure/table/halflife/no_smooth/large/crafting/deconstruction_hints(mob/user)
	return

/obj/structure/table/halflife/no_smooth/large/crafting/Initialize(mapload)
	. = ..()
	crafting = AddComponent(/datum/component/personal_crafting)
	crafting.crafting_interface = crafting_type

/obj/structure/table/halflife/no_smooth/large/crafting/attack_hand(mob/user = usr)
	. = ..()
	crafting.ui_interact(user)

/obj/structure/table/halflife/no_smooth/large/crafting/workbench
	name = "workbench"
	desc = "A basic workbench. Solid metal surface and a few tools to help you make basic tools and items you require."
	icon_state = "workbench"
	crafting_type = CRAFTING_BENCH_GENERAL

// TODO FIX
/obj/structure/table/halflife/no_smooth/large/crafting/ammobench
	name = "loading bench"
	desc = "An ammo loading bench, with some tools that assist you in assembling cartridges to send towards your foe."
	icon_state = "ammobench"
	crafting_type = CRAFTING_BENCH_RELOADING

/obj/structure/table/halflife/no_smooth/large/crafting/armorbench
	name = "armor and tailoring bench"
	desc = "A sturdy bench. It's got an anvil and sewing machine, it'd be a good surface to try and fabricate clothing or armor with."
	icon_state = "armorbench"
	crafting_type = CRAFTING_BENCH_ARMTAILOR

/obj/structure/table/halflife/no_smooth/large/crafting/weaponbench
	name = "weapon bench"
	desc = "A large bench with a functional drill press and a vice. Would be useful in creating and assembling weapons, to the best of your ability anyways."
	icon_state = "weaponbench"
	crafting_type = CRAFTING_BENCH_WEAPONS

/obj/structure/table/halflife/no_smooth/large/crafting/tinkerbench
	name = "electronics bench"
	desc = "A large bench with a power supply hooked up to it. There's a soldering iron and a few other tools scattered about to assist you in making electronics."
	icon_state = "tinkerbench"
	crafting_type = CRAFTING_BENCH_ELECTRIC
