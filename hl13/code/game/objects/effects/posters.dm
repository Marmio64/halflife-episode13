/obj/structure/sign/poster/halflife
	name = "halfy lifey Poster"
	desc = "Your life... has been halved! Also, this is a basetype poster that shouldnt exist in game so if you see it im going to cry, and you should cry too, maybe even shout, and let it all out. For real."
	icon = 'hl13/icons/obj/poster.dmi'

/obj/structure/sign/poster/halflife/combine
	name = "Combine Poster"
	desc = "A poster celebrating the Combine's rule."
	icon_state = "combine1"
	socio_modify = -5

/obj/structure/sign/poster/halflife/combine/two
	desc = "A poster advertising you to join the ranks of the Civil Protection."
	icon_state = "combine2"

/obj/structure/sign/poster/halflife/combine/three
	icon_state = "combine3"

/obj/structure/sign/poster/halflife/combine/four
	icon_state = "combine4"

/obj/structure/sign/poster/halflife/rebel
	name = "Rebel Poster"
	desc = "A defaced Combine poster with the insignia of the Lambda Resistance spraypainted upon it; a sign that no matter how hard you try, human spirit cannot be stamped out."
	icon_state = "rebel1"
	socio_modify = 5

/obj/structure/sign/poster/halflife/rebel/two
	icon_state = "rebel2"
	desc = "A printed poster with the insignia of the Lambda Resistance upon it."

/obj/structure/sign/poster/halflife/rebel/plf
	name = "Polish Liberation Front poster - HOPE"
	desc = "A poster in the colours of the Polish Liberation Front, depicting multiple Citadels ablaze. 'HOPE' is written on it."
	icon_state = "plf_hope"

/obj/structure/sign/poster/halflife/rebel/plf/hold
	name = "Polish Liberation Front poster - HOLD"
	desc = "A poster in the colours of the Polish Liberation Front, depicting the Combine shattered behind a concrete wall. 'HOLD' is written on it."
	icon_state = "plf_hold"

/obj/structure/sign/poster/halflife/rebel/plf/soldier
	name = "Polish Liberation Front poster - SOLDIER"
	desc = "A poster in the colours of the Polish Liberation Front, depicting a soldier of the PLF in full pre-War armour - a rare sight these days, even among the group's ranks. 'THIS IS A SOLDIER OF THE PLF - HE FIGHTS FOR YOUR FREEDOM' is printed on it."
	icon_state = "plf_trooper"

/obj/structure/sign/poster/halflife/rebel/plf/tyrant
	name = "Polish Liberation Front poster - TYRANTS"
	desc = "A poster in the colours of the Polish Liberation Front, depicting a Civil Protection officer and an officer of the KGB as one in the same; planting a bullet between their eyes. 'TYRANTS ALL THE SAME' is printed on it."
	icon_state = "plf_tyrants"

/obj/structure/sign/poster/halflife/rebel/plf/future
	name = "Polish Liberation Front poster - FUTURE"
	desc = "A poster in the colours of the Polish Liberation Front, depicting the Polish Free State's plans for mankind; the forging of a new, peaceful city under clear skies, the Polish banner hoisted upon a battle-torn Citadel. 'KNOW OUR FUTURE' is printed on it."
	icon_state = "plf_future"

/obj/structure/sign/poster/halflife/rebel/vault
	icon_state = "lambda_vault"
	name = "Lambda Resistance poster - NEXT"
	desc = "A poster from the Lambda Resistance, taking credit for the 'incident' that occured in the City 17 quarantine zone a few months ago, and threatening the Citadel with the bold word 'NEXT'."

/obj/effect/spawner/random/trash/graffiti/halflife/rebelspray
	graffiti_icons = list(
		"lambda", "polska", "resistance",
	)
	color = COLOR_ORANGE
	random_color = FALSE

/obj/effect/spawner/random/trash/graffiti/halflife/lambdaspray
	graffiti_icons = list(
		"lambda",
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

/obj/item/poster/halflife/rebel
	name = "random rebel poster"
	poster_type = /obj/structure/sign/poster/halflife/rebel/random
	icon_state = "rolled_traitor"
	socio_modify = -5 //-5 sociostability for being put up

/obj/structure/sign/poster/halflife/rebel/random
	name = "random rebel poster"
	icon_state = ""
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/halflife/rebel
