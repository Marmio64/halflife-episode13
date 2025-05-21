/obj/item/card/id/advanced/halflife
	name = "identification card"
	desc = "A plastic card laser engraved with multiple identifying numbers, and a small display on the back for important information."
	icon_state = "id_grey"

	icon = 'hl13/icons/obj/ID.dmi'
	trim_icon_override = 'hl13/icons/obj/ID.dmi'

/obj/item/card/id/advanced/halflife/grey
	icon_state = "id_grey"

/obj/item/card/id/advanced/halflife/navy
	icon_state = "id_navy"

/obj/item/card/id/advanced/halflife/green
	icon_state = "id_green"

/obj/item/card/id/advanced/halflife/vort
	icon_state = "id_vort"

/obj/item/card/id/advanced/halflife/purple
	icon_state = "id_purple"

/obj/item/card/id/advanced/halflife/red
	icon_state = "id_red"

/obj/item/card/id/advanced/halflife/orange
	icon_state = "id_orange"

/obj/item/card/id/advanced/halflife/combine
	wildcard_slots = WILDCARD_LIMIT_SILVER

/obj/item/card/id/advanced/halflife/combine/one
	icon_state = "id_combine"

/obj/item/card/id/advanced/halflife/combine/two
	icon_state = "id_combine2"

/obj/item/card/id/advanced/halflife/combine/three
	icon_state = "id_combine3"

/obj/item/card/id/advanced/halflife/combine/four
	icon_state = "id_combine4"
	wildcard_slots = WILDCARD_LIMIT_CENTCOM

/obj/item/card/id/advanced/four/ert
	name = "\improper Overwatch ID"
	desc = "An ID straight from Overwatch."
	icon_state = "card_centcom"
	assigned_icon_state = "assigned_centcom"
	//registered_name = JOB_CENTCOM
	registered_age = null
	trim = /datum/id_trim/centcom/ert
	wildcard_slots = WILDCARD_LIMIT_CENTCOM
