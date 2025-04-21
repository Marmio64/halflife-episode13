/datum/supply_pack/critter
	group = "Livestock"
	crate_type = /obj/structure/closet/crate/critter

/datum/supply_pack/critter/garden_gnome
	name = "Garden Gnome Crate"
	desc = "Collect them all for your garden. Comes with three!"
	hidden = TRUE
	cost = CARGO_CRATE_VALUE * 15
	contains = list(/mob/living/basic/garden_gnome)
	crate_name = "garden gnome crate"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/critter/garden_gnome/generate()
	. = ..()
	for(var/i in 1 to 2)
		new /mob/living/basic/garden_gnome(.)
