/obj/structure/halflife/combine
	name = "combine debris"
	desc = "..."
	icon = 'hl13/icons/obj/port/comm_tower3.dmi'
	icon_state = "resin_final"

/obj/structure/halflife/cargotruck
	name = "Hauler"
	desc = "Some kind of cargo truck."
	icon = 'hl13/icons/obj/port/van.dmi'
	max_integrity = 1500
	pixel_x = -12
	bound_width = 64
	bound_height = 96
	density = TRUE
	anchored = TRUE
	icon_state = "van_base"

/obj/structure/halflife/vehicle/tau
	name = "Destroyed Combine APC"
	desc = "A destroyed armored personnel carrier of combine origin."
	icon = 'hl13/icons/obj/port/apc.dmi'
	icon_state = "apc"

/obj/structure/halflife/combine/broadcaster
	name = "combine broadcaster"
	desc = "A massive communication tower of combine origin."
	icon = 'hl13/icons/obj/port/comm_tower3.dmi'
	icon_state = "static1"

/obj/structure/halflife/combine/broadcasterbroken
	name = "combine broadcaster"
	desc = "A massive communication tower of combine origin."
	icon = 'hl13/icons/obj/port/comm_tower3.dmi'
	icon_state = "static1_broken"

/obj/structure/halflife/combine/coolanttank
	name = "coolant tank"
	desc = "A bubbling container of coolant fluid."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "coolanttank"

// add in crystal crate, crystals -- etc for the cave systems.

/obj/structure/halflife/combine/siphon
	name = "siphon"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "psiphon:0"

/obj/structure/halflife/combine/scrubber
	name = "scrubber"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "pscrubber:0"

/obj/structure/halflife/processor
	anchored = TRUE //marmio youre better than this
	name = "mysterious machine"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "processor_off"
	density = TRUE
	anchored = TRUE

/obj/structure/halflife/processor/substrate
	icon_state = "substrate_off"

/obj/structure/halflife/processor/cpu
	icon_state = "CPU"

/obj/structure/halflife/processor/int
	icon_state = "int_processor_off"

/obj/structure/halflife/processor/console
	icon_state = "console"

/obj/structure/halflife/processor/time
	icon_state = "time"

/obj/structure/halflife/processor/toggle
	icon_state = "toggle"

/obj/structure/halflife/processor/cracker
	icon_state = "cracker"

/obj/structure/halflife/floodlight
	name = "floodlight" // does not create light. use with an invisible light source
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "flood01"

/obj/structure/halflife/combine/terminal
	name = "combine terminal"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "frame_med"

/obj/structure/halflife/combine/powergen
	name = "combine generator"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "generator"

/obj/structure/halflife/combine/powergen/on
	name = "combine generator"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "generator_on"


/obj/structure/halflife/barrelalt
	name = "chemical barrel"
	desc = "..."
	icon = 'hl13/icons/obj/port/objects.dmi'
	icon_state = "barrel_blue"

/obj/structure/halflife/barrelalt/green
	icon_state = "barrel_green"

/obj/structure/halflife/barrelalt/red
	icon_state = "barrel_red"

/obj/structure/halflife/barrelalt/yellow
	icon_state = "barrel_yellow"

/obj/structure/halflife/barrelalt/white
	icon_state = "barrel_white"

/obj/structure/halflife/barrelaltmany
	name = "chemical barrel yard"
	desc = "..."
	icon = 'hl13/icons/obj/port/barrel_yard.dmi'
	icon_state = "pile"
	density = 0
