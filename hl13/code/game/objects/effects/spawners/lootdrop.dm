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
				/obj/item/seeds/potato,
				/obj/item/melee/tireiron,
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
				/obj/item/circuitboard/machine/skill_station,
				/obj/item/skillchip/fitness,
				/obj/item/skillchip/painsuppress,
				/obj/item/skillchip/aiming,
				/obj/item/clothing/head/beret/durathread/unitednations,
				/obj/item/reagent_containers/cup/bottle/welding_fuel,
				/obj/item/grenade/halflife/molotov,
				/obj/item/stack/bulletcasings,
				/obj/item/customblank,
				/obj/item/customlock,
				/obj/item/stack/kevlar,
				/obj/item/halflife/combine_battery,
				/obj/item/stack/spacecash/c10,
				/obj/item/stack/spacecash/c20
				)

/obj/effect/spawner/random/halflife/loot/two
	spawn_loot_count = 2

//only scrap items, pretty much always needs crafting to be made useful
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
				/obj/item/stack/sheet/scrap_parts = 2,
				/obj/item/stack/sheet/scrap_copper = 2,
				/obj/item/stack/sheet/glass = 2,
				/obj/item/stack/bulletcasings = 2,
				/obj/item/stack/kevlar, //The rare goodie!
				/obj/item/stack/sheet/mineral/scrap_wood = 4
				)

/obj/effect/spawner/random/halflife/loot/scrap/three
	spawn_loot_count = 3

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
				/obj/item/reagent_containers/pill/patch/medkit,
				/obj/item/reagent_containers/hypospray/medipen/healthpen = 3,
				/obj/item/reagent_containers/pill/patch/medkit/vial = 2,
				/obj/item/stack/medical/gauze,
				/obj/item/stack/medical/suture,
				/obj/item/stack/medical/bandage = 2,
				/obj/item/stack/medical/bandage/makeshift
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
				/obj/item/food/halflife/nutrient_bar/pork,
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
				/obj/item/knife/kitchen,
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
				/obj/item/switchblade,
				/obj/item/weaponcrafting/frame/usp,
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
				/obj/item/weaponcrafting/frame/usp = 2,
				/obj/item/weaponcrafting/frame/mp7 = 3,
				/obj/item/clothing/suit/armor/civilprotection = 3,
				/obj/item/clothing/under/citizen/rebel,
				/obj/item/weaponcrafting/frame/spas12,
				/obj/item/weaponcrafting/frame/coltpython,
				/obj/item/gun/ballistic/rifle/rebarxbow = 2,
				/obj/item/weaponcrafting/frame/m4a1,
				/obj/item/machinepiece/multifunctiontool = 2,
				/obj/item/grenade/syndieminibomb/bouncer,
				/obj/item/gun/ballistic/automatic/pistol/makeshift,
				/obj/item/fireaxe,
				/obj/item/switchblade = 3,
				/obj/item/melee/baton/security/loaded,
				/obj/item/stack/telecrystal/five,
				/obj/item/stack/kevlar/five,
				/obj/item/clothing/suit/armor/halflife/kevlar,
				/obj/item/clothing/suit/armor/rebel/light,
				/obj/item/clothing/head/helmet/halflife/military
				)

//guaranteed ready weapon and loot spawns
/obj/effect/spawner/random/halflife/loot/legendary
	name = "legendary loot"

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

/obj/effect/spawner/random/halflife/plant_spawner
	name = "random grass/bush spawner"
	icon = 'hl13/icons/effects/random_spawners.dmi'
	icon_state = "random_plant"

	loot = list(
				/obj/structure/flora/bush/sparsegrass/style_random = 50,
				/obj/structure/flora/bush/fullgrass/style_random = 50,
				/obj/structure/flora/root/wild_potato,
				/obj/structure/flora/root/wild_onion,
				/obj/structure/flora/bush/pointy/style_random = 5,
				/obj/structure/flora/bush/lavendergrass/style_random = 5,
				/obj/structure/flora/bush/style_random = 5,
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
