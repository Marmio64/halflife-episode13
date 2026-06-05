/obj/effect/spawner/random/halflife/loot/intruder
	name = "intruder loot"
	spawn_loot_count = 1
	spawn_loot_chance = 25

	loot = list( //thinking of stuff i'd usually find in my playthroughs + ammo for guards (they can search these lockers too), ordered from common to least common
		/obj/item/reagent_containers/pill/patch/medkit/ration = 5,
		/obj/item/ammo_box/magazine/m4a1 = 4,
		/obj/item/ammo_box/magazine/usp9mm = 3, //really wanna discourage gunsblazing for crab
		/obj/item/grenade/flashbang = 2,
		/obj/item/grenade/syndieminibomb/bouncer,
	)
