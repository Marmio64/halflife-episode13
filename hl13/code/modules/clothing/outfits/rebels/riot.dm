/datum/outfit/rioter
	name = "Citizen Rioter"

	uniform = /obj/item/clothing/under/citizen
	mask = /obj/item/clothing/mask/bandana/black
	shoes = /obj/item/clothing/shoes/boots
	l_hand = /obj/item/stack/sheet/halflife/brick
	r_pocket = /obj/item/stack/sheet/halflife/brick

/datum/outfit/rioter/gasmask
	name = "Citizen Rioter (Gasmask)"

	mask = /obj/item/clothing/mask/gas/hl2/modern

/datum/outfit/rioter/molotov
	name = "Citizen Rioter (Molotov)"

	l_hand = /obj/item/lighter
	r_hand = /obj/item/grenade/halflife/molotov

/datum/outfit/rioter/equipped
	name = "Citizen Rioter (Fully Equipped)"

	mask = /obj/item/clothing/mask/gas/hl2/modern
	back = /obj/item/storage/backpack/halflife/satchel
	backpack_contents = list(
		/obj/item/grenade/halflife/molotov = 2,
		/obj/item/lighter = 1,
		/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
	)
