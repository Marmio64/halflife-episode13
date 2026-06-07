/obj/effect/spawner/random/halflife/loot/intruder
	name = "intruder loot"
	spawn_loot_count = 1
	spawn_loot_chance = 25

	loot = list( //thinking of stuff i'd usually find in my playthroughs + ammo for guards (they can search these lockers too), ordered from common to least common
		/obj/item/reagent_containers/pill/patch/medkit/ration = 5,
		/obj/item/ammo_box/magazine/m4a1 = 4,
		/obj/item/ammo_box/magazine/usp9mm = 3, //really wanna discourage gunsblazing for crab
		/obj/item/halflife/combine_battery = 3,
		/obj/item/grenade/flashbang = 2,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 2,
		/obj/item/reagent_containers/pill/antifatigue/high_grade = 2,
		/obj/item/hl2/deployable_box,
		/obj/item/grenade/smokebomb,
		/obj/item/grenade/decoy,
		/obj/item/grenade/syndieminibomb/bouncer,
	)

/obj/effect/spawner/random/halflife/loot/intruder/guaranteed
	spawn_loot_chance = 100

/obj/effect/spawner/random/halflife/loot/intruder/crab //only stuff crab would like. values changed so that snake is more likely to get things he wont typically find in lockers
	loot = list(
		/obj/item/reagent_containers/pill/patch/medkit/ration = 2, //already gonna be a lot of these
		/obj/item/ammo_box/magazine/solid_tranq = 4, //allows him to tranq at least 10 more guards
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/grenade/flashbang,
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 2,
		/obj/item/hl2/deployable_box = 2,
		/obj/item/grenade/smokebomb,
		/obj/item/grenade/decoy,
		/obj/item/grenade/syndieminibomb/bouncer,
		/obj/item/gun/ballistic/automatic/m4a1 = 2, //unlocked m4
	)

/obj/effect/spawner/random/halflife/loot/intruder/crab/guaranteed
	spawn_loot_chance = 100

/obj/effect/spawner/random/halflife/loot/intruder/crab/rare
	loot = list(
		/obj/item/reagent_containers/pill/patch/medkit/ration = 2, //already gonna be a lot of these
		/obj/item/ammo_box/magazine/solid_tranq = 4, //allows him to tranq at least 10 more guards
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/grenade/flashbang,
		/obj/item/grenade/smokebomb,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
	)
/obj/effect/spawner/random/halflife/loot/intruder/crab/rare/guaranteed
	spawn_loot_chance = 100

/obj/effect/spawner/random/halflife/loot/intruder/crab/rare/guaranteed/three
	spawn_loot_count = 3
