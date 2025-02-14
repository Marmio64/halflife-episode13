/obj/structure/sign/poster/halflife
	name = "halfy lifey Poster"
	desc = "Your life... has been halved! Also, this is a basetype poster that shouldnt exist in game so if you see it im going to cry, and you should cry too, maybe even shout, and let it all out. For real."
	icon = 'hl13/icons/obj/poster.dmi'

/obj/structure/sign/poster/halflife/combine
	name = "Combine Poster"
	desc = "A poster celebrating the combine's rule."
	icon_state = "combine1"
	socio_modify = TRUE

/obj/structure/sign/poster/halflife/combine/two
	desc = "A poster advertising you to join the ranks of the civil protection."
	icon_state = "combine2"

/obj/structure/sign/poster/halflife/combine/three
	icon_state = "combine3"

/obj/structure/sign/poster/halflife/combine/four
	icon_state = "combine4"

/obj/structure/sign/poster/halflife/rebel
	name = "Rebel Poster"
	desc = "A poster inciting resistance against the combine."
	icon_state = "rebel1"

/obj/structure/sign/poster/halflife/rebel/two
	icon_state = "rebel2"

/obj/effect/spawner/random/trash/graffiti/halflife/rebelspray
	graffiti_icons = list(
		"lambda", "polska", "resistance",
	)
	color = COLOR_ORANGE
	random_color = FALSE
