//clothes, common melee weapons, random loot
/obj/effect/spawner/random/halflife/loot
	name = "common loot"
	spawn_loot_count = 1

	loot = list(
				/obj/item/crowbar/large = 2,
				/obj/item/crowbar/halflife_hammer,
				/obj/item/storage/toolbox/mechanical,
				/obj/item/toy/cards/deck,
				/obj/item/binoculars,
				/obj/item/poster/halflife/rebel,
				/obj/item/seeds/potato,
				/obj/item/melee/tireiron,
				/obj/item/melee/brass_knuckles,
				/obj/item/melee/baton,
				/obj/item/circuitmaterial = 3,
				/obj/item/light/bulb = 2,
				/obj/item/circuitmaterial/advanced,
				/obj/item/toy/crayon/spraycan,
				/obj/item/screwdriver/halflife,
				/obj/item/wrench/halflife,
				/obj/item/weldingtool/halflife,
				/obj/item/storage/backpack/halflife/satchel,
				/obj/item/storage/backpack/halflife/satchel/military,
				/obj/item/storage/backpack/halflife,
				/obj/item/storage/backpack/satchel/flat,
				/obj/item/storage/belt/fannypack/black,
				/obj/item/storage/belt/pouch,
				/obj/item/book/bible,
				/obj/item/storage/wallet = 2,
				/obj/item/storage/halflife/suitcase,
				/obj/item/lockpick,
				/obj/item/clothing/under/citizen/refugee,
				/obj/item/clothing/under/citizen/refugee/green,
				/obj/item/radio/off/halflife,
				/obj/item/ammo_casing/rebar,
				/obj/item/flashlight/seclite,
				/obj/item/flashlight = 2,
				/obj/item/knife/kitchen,
				/obj/item/lighter/greyscale = 2,
				/obj/item/storage/box/matches,
				/obj/item/stack/sticky_tape = 3,
				/obj/item/camera,
				/obj/item/stack/cable_coil = 2,
				/obj/item/stack/sheet/cloth,
				/obj/item/stack/sheet/iron/five,
				/obj/item/stack/sheet/scrap_metal/two = 2,
				/obj/item/stack/sheet/scrap_copper,
				/obj/item/stack/sheet/scrap_parts,
				/obj/item/stack/sheet/glass = 2,
				/obj/item/stack/sheet/mineral/scrap_wood = 3,
				/obj/item/weaponcrafting/receiver = 3,
				/obj/item/halflife/antenna,
				/obj/item/reagent_containers/syringe,
				/obj/item/reagent_containers/medigel/sterilizine,
				/obj/item/reagent_containers/pill/patch/medkit,
				/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
				/obj/item/reagent_containers/pill/patch/medkit/vial = 3,
				/obj/item/clothing/head/beret/durathread/unitednations,
				/obj/item/reagent_containers/cup/bottle/welding_fuel,
				/obj/item/grenade/halflife/molotov,
				/obj/item/stack/bulletcasings/three,
				/obj/item/stack/sheet/halflife/bullets/three,
				/obj/item/customblank,
				/obj/item/customlock,
				/obj/item/stack/kevlar,
				/obj/item/halflife/combine_battery,
				/obj/item/fishing_hook,
				/obj/item/stack/spacecash/c10,
				/obj/item/stack/spacecash/c20
				)

/obj/effect/spawner/random/halflife/loot/two
	spawn_loot_count = 2

//mostly only scrap items, pretty much always needs crafting to be made useful
/obj/effect/spawner/random/halflife/loot/scrap
	name = "scrap loot"
	spawn_loot_count = 1

	loot = list(
				/obj/item/circuitmaterial = 4,
				/obj/item/light/bulb = 2,
				/obj/item/circuitmaterial/advanced = 2,
				/obj/item/stack/cable_coil = 2,
				/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/scrap_metal/two = 4,
				/obj/item/stack/sheet/iron,
				/obj/item/stack/sheet/scrap_parts = 2,
				/obj/item/stack/sheet/scrap_copper = 2,
				/obj/item/stack/sheet/glass = 2,
				/obj/item/stack/bulletcasings = 2,
				/obj/item/stack/sheet/halflife/bullets,
				/obj/item/stack/kevlar, //The rare goodie!
				/obj/item/stack/sheet/mineral/scrap_wood = 4
				)

/obj/effect/spawner/random/halflife/loot/scrap/three
	spawn_loot_count = 3

/obj/effect/spawner/random/halflife/loot/scrap/five
	spawn_loot_count = 5

//actual garbage, low level loot, and scraps
/obj/effect/spawner/random/halflife/loot/trash
	name = "trash loot"
	spawn_loot_count = 1

	loot = list(
				/obj/item/circuitmaterial,
				/obj/item/light/bulb,
				/obj/item/stack/cable_coil,
				/obj/item/stack/sheet/cloth,
				/obj/item/stack/sheet/scrap_metal = 3,
				/obj/item/stack/sheet/scrap_parts,
				/obj/item/stack/sheet/scrap_copper,
				/obj/item/stack/sheet/mineral/scrap_wood = 3,
				/obj/item/trash/halflife/nutrient_bar_waste/water = 5,
				/obj/item/reagent_containers/cup/soda_cans/breenwater/empty = 5,
				/obj/item/trash/halflife/nutrient_bar_waste/pork = 3,
				/obj/item/trash/halflife/nutrient_bar_waste/beef = 3,
				/obj/item/food/canned/halflife/seafood/expired,
				/obj/item/food/bait/worm,
				/obj/item/stack/spacecash/c1
				)

//crafting benches
/obj/effect/spawner/random/halflife/loot/crafting_bench
	name = "random crafting bench"
	spawn_loot_count = 1

	loot = list(
				/obj/structure/table/halflife/no_smooth/large/crafting/workbench,
				/obj/structure/table/halflife/no_smooth/large/crafting/ammobench,
				/obj/structure/table/halflife/no_smooth/large/crafting/armorbench,
				/obj/structure/table/halflife/no_smooth/large/crafting/weaponbench,
				/obj/structure/table/halflife/no_smooth/large/crafting/tinkerbench
				)

//only healing items
/obj/effect/spawner/random/halflife/loot/heal
	name = "healing loot"
	spawn_loot_count = 1

	loot = list(
				/obj/item/reagent_containers/pill/patch/medkit = 3,
				/obj/item/reagent_containers/hypospray/medipen/healthpen = 5,
				/obj/item/reagent_containers/pill/patch/medkit/vial = 4,
				/obj/item/storage/halflife/pill_bottle/antitox,
				/obj/item/stack/medical/gauze,
				/obj/item/stack/medical/suture,
				/obj/item/stack/medical/bandage = 2,
				)

//only consumable loot. Food, drinks, drugs, cigarettes, etc.
/obj/effect/spawner/random/halflife/loot/consumables
	name = "consumables loot"


	loot = list(
				/obj/item/reagent_containers/cup/soda_cans/breenwater = 2,
				/obj/item/reagent_containers/cup/soda_cans/breenwater/red,
				/obj/item/reagent_containers/cup/soda_cans/breenwater/yellow,
				/obj/item/reagent_containers/cup/soda_cans/breenwater/purple,
				/obj/item/reagent_containers/cup/glass/waterbottle/empty = 2,
				/obj/item/halflife/nutrient_bar_wrapping/water,
				/obj/item/storage/halflife/hand_box/flour,
				/obj/item/halflife/nutrient_bar_wrapping/pork,
				/obj/item/reagent_containers/cup/halflife/sustenance_dust,
				/obj/item/food/canned/halflife/seafood,
				/obj/item/food/canned/halflife/seafood/expired,
				/obj/item/storage/fancy/cigarettes/cigars,
				/obj/item/cigarette/cigar,
				/obj/item/storage/fancy/cigarettes/halflife,
				/obj/item/cigarette/halflife = 2,
				/obj/item/food/canned/halflife/crisps,
				/obj/item/reagent_containers/cup/glass/bottle/beer = 2,
				/obj/item/reagent_containers/cup/glass/bottle/moonshine,
				/obj/item/reagent_containers/cup/glass/bottle/absinthe,
				/obj/item/reagent_containers/cup/glass/bottle/hcider,
				/obj/item/reagent_containers/cup/glass/bottle/whiskey,
				/obj/item/reagent_containers/cup/glass/bottle/vodka = 2, // Na Zdrowie!
				/obj/item/storage/halflife/pill_bottle/antifatigue,
				/obj/item/reagent_containers/pill/lsd = 2,
				/obj/item/reagent_containers/cup/glass/mouthwash,
				/obj/item/reagent_containers/cup/bottle/welding_fuel,
				/obj/item/reagent_containers/cup/bottle/morphine
				)

//specifically only alcohol
/obj/effect/spawner/random/halflife/loot/alcohol
	name = "alcohol loot"

	loot = list(
				/obj/item/reagent_containers/cup/glass/bottle/beer = 2,
				/obj/item/reagent_containers/cup/glass/bottle/moonshine,
				/obj/item/reagent_containers/cup/glass/bottle/absinthe,
				/obj/item/reagent_containers/cup/glass/bottle/vodka = 2, // Na Zdrowie!
				/obj/item/reagent_containers/cup/glass/bottle/whiskey
				)

//only clothing items
/obj/effect/spawner/random/halflife/loot/clothing
	name = "clothing loot"

	loot = list(
				/obj/item/clothing/under/citizen/refugee,
				/obj/item/clothing/under/citizen/refugee/green,
				/obj/item/clothing/head/beanie/black = 2,
				/obj/item/clothing/mask/balaclava,
				/obj/item/clothing/gloves/fingerless = 2,
				/obj/item/clothing/gloves/color/black,
				/obj/item/clothing/head/beret,
				/obj/item/clothing/head/soft/black,
				/obj/item/clothing/head/flatcap,
				/obj/item/clothing/glasses/eyepatch,
				/obj/item/clothing/suit/jacket/miljacket,
				/obj/item/clothing/gloves/fishing,
				/obj/item/clothing/head/utility/welding,
				/obj/item/clothing/head/beret/durathread/unitednations,
				/obj/item/clothing/suit/armor/browncoat,
				/obj/item/clothing/mask/gas/hl2/swat,
				/obj/item/clothing/mask/gas/hl2/russia,
				/obj/item/clothing/mask/bandana/black,
				/obj/item/storage/backpack/halflife/satchel,
				/obj/item/clothing/suit/bio_suit/boiler,
				/obj/item/clothing/head/bio_hood/boiler
				)

//ammo
/obj/effect/spawner/random/halflife/loot/ammo
	name = "ammo loot"

	loot = list(
				/obj/item/ammo_box/magazine/mp7 = 2,
				/obj/item/storage/box/lethalshot/halflife,
				/obj/item/ammo_box/magazine/usp9mm = 2,
				/obj/item/ammo_box/colta357,
				/obj/item/ammo_casing/rebar = 2,
				/obj/item/ammo_box/magazine/m4a1
				)

//common loot, but some of the worse stuff is tossed out, many good things come with more quantity, and small chance for higher tier items
/obj/effect/spawner/random/halflife/loot/uncommon
	name = "uncommon loot"

	loot = list(
				/obj/item/crowbar/large = 2,
				/obj/item/crowbar/halflife_hammer,
				/obj/item/melee/brass_knuckles,
				/obj/item/binoculars,
				/obj/item/melee/baton,
				/obj/item/circuitmaterial = 3,
				/obj/item/light/bulb = 2,
				/obj/item/circuitmaterial/advanced,
				/obj/item/toy/crayon/spraycan,
				/obj/item/screwdriver/halflife,
				/obj/item/wrench/halflife,
				/obj/item/weldingtool/halflife,
				/obj/item/storage/backpack/halflife/satchel,
				/obj/item/storage/backpack/halflife/satchel/military,
				/obj/item/storage/backpack/halflife,
				/obj/item/storage/belt/fannypack/black,
				/obj/item/storage/belt/pouch,
				/obj/item/storage/wallet,
				/obj/item/storage/halflife/suitcase,
				/obj/item/lockpick,
				/obj/item/clothing/under/citizen/refugee,
				/obj/item/radio/off/halflife,
				/obj/item/flashlight/seclite,
				/obj/item/lighter/greyscale = 2,
				/obj/item/stack/sticky_tape = 3,
				/obj/item/camera,
				/obj/item/stack/cable_coil = 2,
				/obj/item/stack/sheet/cloth/five,
				/obj/item/stack/sheet/iron/five,
				/obj/item/weaponcrafting/receiver = 3,
				/obj/item/halflife/antenna,
				/obj/item/reagent_containers/pill/patch/medkit,
				/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
				/obj/item/reagent_containers/pill/patch/medkit/vial = 3,
				/obj/item/clothing/head/beret/durathread/unitednations,
				/obj/item/reagent_containers/cup/bottle/welding_fuel,
				/obj/item/grenade/halflife/molotov,
				/obj/item/stack/kevlar/two = 2,
				/obj/item/halflife/combine_battery,
				/obj/item/clothing/head/helmet/halflife/military/weak/crafted,
				/obj/item/clothing/head/utility/welding,
				/obj/item/switchblade = 2,
				/obj/item/weaponcrafting/frame/usp,
				/obj/item/gun/ballistic/automatic/pistol/makeshift,
				/obj/item/stack/spacecash/c20 = 2
				)

/obj/effect/spawner/random/halflife/loot/uncommon/two
	spawn_loot_count = 1

//guns, armor, and some lesser items occasionally
/obj/effect/spawner/random/halflife/loot/rare
	name = "rare loot"

	loot = list(
				/obj/item/gun/ballistic/automatic/pistol/usp,
				/obj/item/gun/ballistic/automatic/pistol/usp/no_mag,
				/obj/item/weaponcrafting/frame/usp,
				/obj/item/weaponcrafting/frame/mp7 = 3,
				/obj/item/clothing/suit/armor/civilprotection = 3,
				/obj/item/clothing/under/citizen/rebel,
				/obj/item/weaponcrafting/frame/spas12,
				/obj/item/weaponcrafting/frame/coltpython,
				/obj/item/gun/ballistic/rifle/rebarxbow = 2,
				/obj/item/weaponcrafting/frame/m4a1,
				/obj/item/weaponcrafting/frame/mosin,
				/obj/item/machinepiece/multifunctiontool = 2,
				/obj/item/grenade/syndieminibomb/bouncer,
				/obj/item/fireaxe,
				/obj/item/switchblade = 3,
				/obj/item/melee/baton/security/loaded,
				/obj/item/stack/telecrystal/five,
				/obj/item/stack/kevlar/five,
				/obj/item/clothing/suit/armor/halflife/kevlar,
				/obj/item/clothing/suit/armor/rebel/light,
				/obj/item/clothing/head/helmet/halflife/military
				)

//the very best shit, these loot spawns are very rare but have some otherwise unobtainable stuff and ready built weapons
/obj/effect/spawner/random/halflife/loot/legendary
	name = "legendary loot"

	loot = list(
				/obj/item/gun/ballistic/automatic/m4a1,
				/obj/item/gun/ballistic/automatic/ak47,
				/obj/item/clothing/suit/armor/rebel,
				/obj/item/clothing/suit/armor/halflife/milvest,
				/obj/item/clothing/head/helmet/halflife/milhelm,
				/obj/item/clothing/head/helmet/halflife/military/plf_veteran,
				)

/obj/effect/spawner/random/halflife/plant_spawner
	name = "random grass/bush spawner"
	icon = 'hl13/icons/effects/random_spawners.dmi'
	icon_state = "random_plant"

	loot = list(
				/obj/structure/flora/bush/sparsegrass/style_random = 60,
				/obj/structure/flora/bush/fullgrass/style_random = 60,
				/obj/structure/flora/root/wild_potato,
				/obj/structure/flora/root/wild_onion,
				/obj/structure/flora/bush/pointy/style_random = 6,
				/obj/structure/flora/bush/lavendergrass/style_random = 6,
				/obj/structure/flora/bush/style_random = 6,
				/obj/structure/flora/bush/shrub = 6,
				)

//meds, grenades, ammo
/obj/effect/spawner/random/halflife/loot/deathmatch/nexus
	name = "nexus deathmatch loot"

	loot = list(
				/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
				/obj/item/reagent_containers/pill/patch/medkit = 2,
				/obj/item/grenade/syndieminibomb/bouncer,
				/obj/item/ammo_box/magazine/mp7,
				/obj/item/storage/box/lethalshot/halflife,
				/obj/item/ammo_box/magazine/usp9mm,
				/obj/item/ammo_box/colta357,
				/obj/item/ammo_casing/rebar,
				/obj/item/ammo_box/magazine/m4a1
				)

//guaranteed ready weapon and loot spawns
/obj/effect/spawner/random/halflife/loot/deathmatch/alleys_uprising
	name = "alleys uprising deathmatch loot"

	loot = list(
				/obj/item/gun/ballistic/automatic/pistol/usp,
				/obj/item/crowbar/large,
				/obj/item/fireaxe,
				/obj/item/melee/sledgehammer,
				/obj/item/chainsaw,
				/obj/item/gun/ballistic/automatic/mp7,
				/obj/item/clothing/suit/armor/civilprotection,
				/obj/item/gun/ballistic/rifle/rebarxbow,
				/obj/item/grenade/syndieminibomb/bouncer,
				/obj/item/knife/combat,
				/obj/item/melee/baton/security/loaded,
				/obj/item/clothing/head/helmet/halflife/military
				)

//melee weapons and makeshift crap
/obj/effect/spawner/random/halflife/loot/deathmatch/uprising
	name = "uprising deathmatch loot"

	loot = list(
				/obj/item/gun/ballistic/automatic/pistol/makeshift,
				/obj/item/ammo_box/magazine/makeshift9mm,
				/obj/item/crowbar/large,
				/obj/item/fireaxe,
				/obj/item/crowbar/halflife_hammer,
				/obj/item/melee/sledgehammer,
				/obj/item/spear/halflife,
				/obj/item/clothing/suit/armor/halflife/kevlar/heavy,
				/obj/item/gun/ballistic/rifle/rebarxbow,
				/obj/item/grenade/syndieminibomb/bouncer,
				/obj/item/switchblade,
				/obj/item/melee/baton/security/loaded,
				/obj/item/reagent_containers/pill/patch/medkit,
				/obj/item/clothing/head/helmet/halflife/military/weak/crafted
				)

/obj/effect/spawner/random/halflife/random_headcrab
	name = "random headcrab"
	spawn_loot_count = 1

	loot = list(
				/mob/living/basic/halflife/headcrab = 1,
				/mob/living/basic/halflife/headcrab/armored = 1,
				/mob/living/basic/halflife/headcrab/fast = 1,
				/mob/living/basic/halflife/headcrab/poison = 1,
				)

/obj/effect/spawner/random/halflife/random_headcrab/two
	spawn_loot_count = 2

/obj/effect/spawner/random/halflife/random_headcrab/three
	spawn_loot_count = 3

/obj/effect/spawner/random/halflife/random_headcrab/five
	spawn_loot_count = 5

/obj/effect/spawner/random/halflife/random_zombie
	name = "random zombie"
	spawn_loot_count = 1

	loot = list(
				/mob/living/basic/halflife/zombie = 1,
				/mob/living/basic/halflife/zombie/fast = 1,
				/mob/living/basic/halflife/zombie/poison = 1,
				/mob/living/basic/halflife/zombie/zombine = 1,
				)

/obj/effect/spawner/random/halflife/random_zombie/two
	spawn_loot_count = 2

/obj/effect/spawner/random/halflife/random_zombie/three
	spawn_loot_count = 3

/obj/effect/spawner/random/halflife/random_zombie/five
	spawn_loot_count = 5

/obj/effect/spawner/random/halflife/pet_spawner
	name = "pet spawner"
	icon = 'hl13/icons/effects/random_spawners.dmi'
	icon_state = "random_pet"
	spawn_loot_count = 1
	spawn_loot_chance = 5 //5% chance to get either a chumtoad or grub

	loot = list(
				/mob/living/basic/halflife/chumtoad = 1,
				/mob/living/basic/halflife/grub = 1,
				)

/obj/effect/spawner/random/halflife/barnacle_spawner
	name = "barnacle spawner"
	icon = 'hl13/icons/effects/random_spawners.dmi'
	icon_state = "random_barnacle"
	spawn_loot_count = 1
	spawn_loot_chance = 50

	loot = list(
				/mob/living/basic/halflife/barnacle = 1,
				)

/obj/effect/spawner/random/halflife/barnacle_spawner/high
	name = "high chance barnacle spawner"
	spawn_loot_chance = 75

/obj/effect/spawner/random/halflife/barnacle_spawner/low
	name = "low chance barnacle spawner"
	spawn_loot_chance = 25

/obj/effect/spawner/random/halflife/barnacle_spawner/rare
	name = "rare chance barnacle spawner"
	spawn_loot_chance = 10
