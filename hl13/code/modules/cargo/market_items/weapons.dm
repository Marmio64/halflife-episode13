/datum/market_item/halflife/weapon
	category = "Weapons"
	abstract_path = /datum/market_item/halflife/weapon

/datum/market_item/halflife/weapon/uspmatch
	name = "USP Match"
	desc = "A metropolice standard issue pistol."
	item = /obj/item/gun/ballistic/automatic/pistol/usp

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/weapon/uspammo
	name = "USP Match Magazine"
	desc = "A single magazine for the USP Match pistol."
	item = /obj/item/ammo_box/magazine/usp9mm

	price_min = CARGO_CRATE_VALUE/3
	price_max = CARGO_CRATE_VALUE/2
	stock_max = 5
	availability_prob = 80

/datum/market_item/halflife/weapon/makeshiftpistol
	name = "Makeshift Pistol"
	desc = "A makeshift 9mm pistol. Pretty shit for a gun, but a gun nonetheless, and will serve you well."
	item = /obj/item/gun/ballistic/automatic/pistol/makeshift

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	stock_max = 3
	availability_prob = 100

/datum/market_item/halflife/weapon/makeshiftpistolammo
	name = "Makeshift Pistol Magazine"
	desc = "A makeshift 9mm pistol magazine."
	item = /obj/item/ammo_box/magazine/makeshift9mm

	price_min = CARGO_CRATE_VALUE/5
	price_max = CARGO_CRATE_VALUE/4
	stock_max = 6
	availability_prob = 100

/datum/market_item/halflife/weapon/mp7
	name = "MP7"
	desc = "A metropolice standard issue SMG for suppression and high firepower."
	item = /obj/item/gun/ballistic/automatic/mp7

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 60

/datum/market_item/halflife/weapon/spas12
	name = "SPAS-12"
	desc = "High power pump action shotgun for quick and dirty room clearing."
	item = /obj/item/gun/ballistic/shotgun/spas12

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 3
	availability_prob = 60

/datum/market_item/halflife/weapon/coltpython
	name = "Colt Python"
	desc = "An old world high power 357 magnum revolver. What a beut'."
	item = /obj/item/gun/ballistic/revolver/coltpython

	price_min = CARGO_CRATE_VALUE * 2
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 2
	availability_prob = 60

/datum/market_item/halflife/weapon/m4a1
	name = "M4A1"
	desc = "Now this is a real prize. Old world, fully automatic, and high power. This is a killing machine. Good luck finding more ammo for it, however."
	item = /obj/item/gun/ballistic/automatic/m4a1

	price_min = CARGO_CRATE_VALUE * 3
	price_max = CARGO_CRATE_VALUE * 4
	stock_max = 1
	availability_prob = 50

/datum/market_item/halflife/weapon/rebarxbow
	name = "Heated Rebar Crossbow"
	desc = "A crossbow which can heat up and fire high power rebar bolts for extreme damage, all from a safe range."
	item = /obj/item/gun/ballistic/rifle/rebarxbow

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/weapon/switchblade
	name = "Switchblade"
	desc = "An extendable knife for shanking. Deadly, and concealable."
	item = /obj/item/switchblade

	price_min = CARGO_CRATE_VALUE/2
	price_max = CARGO_CRATE_VALUE
	stock_max = 3
	availability_prob = 80

/datum/market_item/halflife/weapon/c4
	name = "C4 Explosive"
	desc = "One C4 Explosive pack. Guaranteed to blow a hole through just about anything."
	item = /obj/item/grenade/c4

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 2
	availability_prob = 80
