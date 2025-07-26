/obj/structure/sign/poster/halflife
	name = "halfy lifey Poster"
	desc = "Your life... has been halved! Also, this is a basetype poster that shouldnt exist in game so if you see it im going to cry, and you should cry too, maybe even shout, and let it all out. For real."
	icon = 'hl13/icons/obj/poster.dmi'

/obj/structure/sign/poster/halflife/combine
	name = "Combine Poster"
	desc = "A poster celebrating the combine's rule."
	icon_state = "combine1"
	socio_modify = -5

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
	socio_modify = 5

/obj/structure/sign/poster/halflife/rebel/two
	icon_state = "rebel2"

/obj/structure/sign/poster/halflife/rebel/plf
	name = "PLF poster"
	desc = "A poster in the colours of the Polish Liberation Front, depicting multiple Citadels ablaze. 'HOPE' is written on it."
	icon_state = "plf_hope"

/obj/structure/sign/poster/halflife/rebel/plf/hold
	desc = "A poster in the colours of the Polish Liberation Front, depicting the Combine shattered behind a concrete wall. 'HOLD' is written on it."
	icon_state = "plf_hold"

/obj/structure/sign/poster/halflife/rebel/vault
	icon_state = "lambda_vault"
	name = "Lambda propaganda poster"
	desc = "A poster from the Lambda Resistance, taking credit for the 'incident' that occured in the City 17 quarantine zone a few months ago, and threatening the Citadel with the bold word 'NEXT'."

/obj/effect/spawner/random/trash/graffiti/halflife/rebelspray
	graffiti_icons = list(
		"lambda", "polska", "resistance",
	)
	color = COLOR_ORANGE
	random_color = FALSE

/obj/item/poster/halflife/combine
	name = "random combine poster"
	poster_type = /obj/structure/sign/poster/halflife/combine/random
	icon_state = "rolled_traitor"
	socio_modify = 5 //+5 sociostability for being put up

/obj/structure/sign/poster/halflife/combine/random
	name = "random combine poster"
	icon_state = ""
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/halflife/combine
