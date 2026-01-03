/obj/structure/sign/block
	name = "block sign"
	desc = "A sign declaring which block this area is considered a part of."
	max_integrity = 500
	icon_state = "block"
	icon = 'hl13/icons/obj/signs.dmi'

/obj/structure/sign/block/twothree
	icon_state = "block23"

/obj/structure/sign/block/twofour
	icon_state = "block24"

/obj/structure/sign/block/onefive
	icon_state = "block15"

/obj/structure/sign/block/onesix
	icon_state = "block16"

/obj/structure/halflife/sign
	name = "Generic halflife sign"
	desc = "OOOOAAAGHHO OOOHOHHH HELP I DONT WANT TO ADD SHIT ANYMORE IM OVER IT HEEELP-"
	icon = 'hl13/icons/obj/64x64_signs.dmi'
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500 // Hardy but not immortal
	var/id = 1 // For toggling states with buttons or terminals. Namely neon signs.
	var/on = FALSE

/obj/structure/halflife/sign/snowcrest
	name = "snowcrest sign"
	desc = "A sign with the name 'Snowcrest'. You're filled with a slightly dreadful feeling."
	icon_state = "snowcrest"
	density = FALSE
	bound_x = 64
	pixel_y = 24

/obj/structure/halflife/sign/combine
	name = "combine sign"
	desc = "A combine sign."
	icon_state = "emptycombinesign"
	density = FALSE
	bound_x = 64
	pixel_y = 32
	light_range = 4
	light_power = 1
	light_color = "#658cac"

/obj/structure/halflife/sign/combine/dispatch
	name = "combine dispatch sign"
	desc = "A sign spelling out 'Dispatch' in the combine alphabet."
	icon_state = "dispatchsign"

/obj/structure/halflife/sign/combine/prison
	name = "combine 'Nowy Jutro' sign"
	desc = "A sign spelling out 'Nowy Jutro' in the polish alphabet. A New Tomorrow awaits you here, though it's unlikely a good one."
	icon_state = "prisonsign"

/obj/structure/halflife/sign/combine/nexus
	name = "combine nexus sign"
	desc = "A sign spelling out 'Nexus' in the combine alphabet."
	icon_state = "nexussign"

/obj/structure/halflife/sign/bazaar
	name = "bazaar sign"
	desc = "A set of signs clearly directing you to the heart of the Town. Obviously there is many things to be gained in this particular direction."
	icon_state = "bazaar"
	projectile_passchance = 50
	max_integrity = 750
	integrity_failure = 500
	var/datum/looping_sound/halflife/neonsign/soundloop

/obj/structure/halflife/sign/bazaar/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/halflife/sign/bazaar/Initialize(mapload)
	. = ..()
	set_light(1,1.5,"#da693c")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/halflife/sign/bazaar/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)
	QDEL_NULL(soundloop)

/obj/structure/halflife/sign/private
	name = "sign"
	desc = "A sign exclaiming 'Private Property'! You get the feeling the property ahead is private."
	icon_state = "private"
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/halflife/sign/workers
	name = "sign"
	desc = "A sign declaring a zone being off limits. Peculiar."
	icon_state = "workers"
	bound_x = 64
	pixel_y = 24
	density = FALSE

/obj/structure/halflife/sign/rent
	name = "rent sign"
	desc = "FOR RENT. How exciting."
	icon_state = "rent"
	pixel_y = 32
	density = FALSE

/obj/structure/halflife/sign/clinic
	name = "clinic sign"
	desc = "A sign reading 'SZPITAL', meaning 'Hospital'. Hopefully the combine have good health insurance."
	icon_state = "clinic"
	pixel_y = 32
	density = FALSE

/obj/structure/halflife/sign/shop
	name = "shop sign"
	desc = "I think this shop may be pointing us to a sign... Wait, no... the sign is pointing us to a shop!"
	icon_state = "shop"
	density = FALSE
	pixel_x = -15

/obj/structure/halflife/sign/bar
	name = "bar sign"
	desc = "Light blocks forming the word 'BAR'. Throat be dry no more!"
	icon_state = "bar"
	pixel_y = 32
	density = FALSE
	max_integrity = 75
	integrity_failure = 35

/obj/structure/halflife/sign/bar/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]")
	. += emissive_appearance(icon, "[icon_state]")

/obj/structure/halflife/sign/bar/Initialize(mapload)
	. = ..()
	set_light(1,1.5,"#dce62a")
	update_appearance()

/obj/structure/halflife/sign/bar/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)

/obj/structure/halflife/sign/open
	name = "open sign"
	desc = "A neon sign, showing if the building is open for business or not! Incredible!"
	icon_state = "open"
	max_integrity = 75
	integrity_failure = 35
	pixel_y = 32
	density = FALSE
	var/datum/looping_sound/halflife/neonsign/busted/soundloop

/obj/structure/halflife/sign/open/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/halflife/sign/open/Initialize(mapload)
	. = ..()
	set_light(2,2,"#9c476f")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/halflife/sign/open/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	do_sparks(1)
	QDEL_NULL(soundloop)

/obj/structure/halflife/sign/open/bar
	icon_state = "open_bar"

/obj/structure/halflife/sign/hotel
	name = "hotel sign"
	desc = "A hotel at last! Time to rest those weary feet."
	icon_state = "hotel"
	max_integrity = 800
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/halflife/sign/weopen
	name = "sign"
	desc = "A sign. We're OPEN? Fantastic news!"
	icon_state = "we_open"
	anchored = TRUE
	density = TRUE
	max_integrity = 650 // Hardy but not immortal
	integrity_failure = 500
	var/datum/looping_sound/halflife/neonsign/busted/soundloop

/obj/structure/halflife/sign/weopen/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[icon_state]_on")
	. += emissive_appearance(icon, "[icon_state]_on")

/obj/structure/halflife/sign/weopen/Initialize(mapload)
	. = ..()
	set_light(1.5,2,"#ab4775")
	update_appearance()
	soundloop = new(src)
	soundloop.start()

/obj/structure/halflife/sign/weopen/atom_break(damage_flag)
	. = ..()
	cut_overlays()
	set_light(0,0,"#000000")
	QDEL_NULL(soundloop)

/obj/structure/sign/halflfe_clock
	name = "wall clock"
	desc = "An old wall mounted clock, that may or may not still be accurate."
	icon_state = "clock"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/halflfe_clock, 32)

/obj/structure/sign/halflfe_clock/examine(mob/user)
	. = ..()
	. += span_info("The current twenty four hour time is: [SSdaylight.twentyfourhourstamp()].")
