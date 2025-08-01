
/obj/item/seeds/hl2
	icon = 'hl13/icons/obj/hydroponics/seeds.dmi'
	plant_icon_offset = -5
	icon_state = "seed"

/obj/item/seeds/hl2/redshroom
	name = "red mushroom seeds"
	desc = "These seeds grow into red mushrooms."
	species = "red mushroom"
	plantname = "Red Mushrooms"
	product = /obj/item/food/grown/hl2shroom/redshroom
	growthstages = 1
	growing_icon = 'hl13/icons/obj/hydroponics/growing.dmi'
	icon_grow = "redshroom-grow"
	icon_dead = "redshroom-dead"
	icon_harvest = "redshroom-harvest"
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.1)

/obj/item/seeds/hl2/blueshroom
	name = "blue mushroom seeds"
	desc = "These seeds grow into blue mushrooms."
	species = "blue mushroom"
	plantname = "blue Mushrooms"
	product = /obj/item/food/grown/hl2shroom/blueshroom
	growthstages = 1
	growing_icon = 'hl13/icons/obj/hydroponics/growing.dmi'
	icon_grow = "blueshroom-grow"
	icon_dead = "blueshroom-dead"
	icon_harvest = "blueshroom-harvest"
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.1)

/obj/item/seeds/hl2/yellowshroom
	name = "yellow mushroom seeds"
	desc = "These seeds grow into yellow mushrooms."
	species = "yellow mushroom"
	plantname = "yellow Mushrooms"
	product = /obj/item/food/grown/hl2shroom/yellowshroom
	growthstages = 1
	growing_icon = 'hl13/icons/obj/hydroponics/growing.dmi'
	icon_grow = "yellowshroom-grow"
	icon_dead = "yellowshroom-dead"
	icon_harvest = "yellowshroom-harvest"
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.1)

/obj/item/food/grown/hl2shroom
	foodtypes = VEGETABLES
	icon = 'hl13/icons/obj/hydroponics/harvest_inventory.dmi'
	var/watermix_type

/obj/item/food/grown/hl2shroom/redshroom
	seed = /obj/item/seeds/hl2/redshroom
	name = "red mushroom"
	desc = "A bioengineered red mushroom which can be processed into tablets at a masher for use in the factory."
	icon_state = "redshroom"
	watermix_type = /obj/item/ration_construction/watermix/redadditive

/obj/item/food/grown/hl2shroom/blueshroom
	seed = /obj/item/seeds/hl2/blueshroom
	name = "blue mushroom"
	desc = "A bioengineered blue mushroom which can be processed into tablets at a masher for use in the factory."
	icon_state = "blueshroom"
	watermix_type = /obj/item/ration_construction/watermix/blueadditive

/obj/item/food/grown/hl2shroom/yellowshroom
	seed = /obj/item/seeds/hl2/yellowshroom
	name = "yellow mushroom"
	desc = "A bioengineered yellow mushroom which can be processed into tablets at a masher for use in the factory."
	icon_state = "yellowshroom"
	watermix_type = /obj/item/ration_construction/watermix/yellowadditive
