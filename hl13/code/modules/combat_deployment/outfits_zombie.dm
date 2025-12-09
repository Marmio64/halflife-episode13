/datum/outfit/deployment_loadout/xen
	uniform = null
	shoes = null
	var/mob_to_be = /mob/living/basic/halflife/headcrab

/datum/outfit/deployment_loadout/xen/post_equip(mob/living/carbon/human/H)
	if(mob_to_be)
		var/datum/mind/player_mind = H.mind
		var/mob/living/basic/halflife/S = new mob_to_be(H.loc)
		if(player_mind)
			player_mind.transfer_to(S)
		var/datum/action/new_action = new /datum/action/cooldown/mob_cooldown/talk_xen(S.mind || S)
		new_action.Grant(S)
		S.deployment_faction = XEN_DEPLOYMENT_FACTION
		to_chat(S, span_notice("[desc]"))
		qdel(H)
	else
		. = ..()

/datum/outfit/deployment_loadout/xen/tier1/headcrab
	name = "Deployment: Headcrab"
	display_name = "Headcrab (Offense)"
	desc = "A basic headcrab. Plain and simple, with higher damage than other crabs."

	mob_to_be = /mob/living/basic/halflife/headcrab/deployment

/datum/outfit/deployment_loadout/xen/tier1/fast_headcrab
	name = "Deployment: Fast Headcrab"
	display_name = "Fast Headcrab (Offense)"
	desc = "A fast headcrab. Speedier but less durable, and deals less damage than the standard headcrab."

	mob_to_be = /mob/living/basic/halflife/headcrab/fast

/datum/outfit/deployment_loadout/xen/tier1/armored_headcrab
	name = "Deployment: Armored Headcrab"
	display_name = "Armored Headcrab (Defense)"
	desc = "An armored headcrab. Deals less damage than the standard headcrab, but is more durable."

	mob_to_be = /mob/living/basic/halflife/headcrab/armored

//// TIER 2 //////////////

/datum/outfit/deployment_loadout/xen/tier2/poison_headcrab
	name = "Deployment: Deadly Poison Headcrab"
	display_name = "Deadly Poison Headcrab (Support)"
	desc = "An extra venomous headcrab that plays the long game with large amounts of venom it injects each bite."

	mob_to_be = /mob/living/basic/halflife/headcrab/poison/deadly

/datum/outfit/deployment_loadout/xen/tier2/zombie
	name = "Deployment: Zombie"
	display_name = "Zombie (Offense)"
	desc = "A standard zombie. Very plain!"

	mob_to_be = /mob/living/basic/halflife/zombie

/datum/outfit/deployment_loadout/xen/tier2/fast_headcrab
	name = "Deployment: Upgraded Fast Headcrab"
	display_name = "Upgraded Fast Headcrab (Offense)"
	desc = "A fast headcrab. You're good at moving quick, but not much else."

	mob_to_be = /mob/living/basic/halflife/headcrab/fast/upgraded

//// TIER 3 //////////////

/datum/outfit/deployment_loadout/xen/tier3/fast_zombie
	name = "Deployment: Fast Zombie"
	display_name = "Fast Zombie (Offense)"
	desc = "Although sporting very low health, the fast zombie is fast enough to be able to run down humans and can deal a lot of damage quickly. You specialize in chasing down lone humans."

	mob_to_be = /mob/living/basic/halflife/zombie/fast/deployment

/datum/outfit/deployment_loadout/xen/tier3/grunt_zombie
	name = "Deployment: Grunt Zombie"
	display_name = "Grunt Zombie (Offense)"
	desc = "You have decent health, and move at a good pace, though lack any special abilities. You are a jack of all trades, that can assault locations and chase down slower humans."

	mob_to_be = /mob/living/basic/halflife/zombie/zombie_grunt/deployment

/datum/outfit/deployment_loadout/xen/tier3/poison_zombie
	name = "Deployment: Poison Zombie"
	display_name = "Poison Zombie (Support)"
	desc = "An espescially tanky and slow zombie, which can provide backup by tossing poison headcrabs. You specialize in tanking and swarming with headcrabs."

	mob_to_be = /mob/living/basic/halflife/zombie/poison/deployment

/datum/outfit/deployment_loadout/xen/tier3/fungal_zombie
	name = "Deployment: Fungal Zombie"
	display_name = "Fungal Zombie (Defense)"
	desc = "A slightly slower zombie which has higher health, the ability to plant fungus flooring, and the ability to quickly heal on said flooring. You specialize in absorbing damage and healing it off."

	mob_to_be = /mob/living/basic/halflife/zombie/fungal/deployment

/datum/outfit/deployment_loadout/xen/tier3/zombine
	name = "Deployment: Zombine"
	display_name = "Zombine (Offense)"
	desc = "A heavyweight zombie with good health reserves, a charge ability, and a deployable grenade. You specialize in blowing up enemy fortifications."

	mob_to_be = /mob/living/basic/halflife/zombie/zombine

/datum/outfit/deployment_loadout/xen/tier3/antlion_worker
	name = "Deployment: Antlion Worker"
	display_name = "Antlion Worker (Support)"
	desc = "Despite your very low durability, you have powerful acid spray attacks for putting pressure on enemies from afar. You specialize in wearing down enemies from afar."

	mob_to_be = /mob/living/basic/halflife/antlion_worker/zombie_faction

/datum/outfit/deployment_loadout/xen/tier3/antlion_grub
	name = "Deployment: Antlion Grub"
	display_name = "Antlion Grub (Support)"
	desc = "You have almost no health and deal very low damage, but can call upon and summon antlions from deep underground to protect you!"

	mob_to_be = /mob/living/basic/halflife/grub/deployment

/datum/outfit/deployment_loadout/xen/tier3/cremator
	name = "Deployment: Cremator Zombie"
	display_name = "Cremator Zombie (Offense)"
	desc = "You are slow and have low health, but are flameproof and create a large, fiery explosion when you die, in addition to being strong enough to inflict extra damage in melee. You specialize in blowing up enemy fortifications."

	mob_to_be = /mob/living/basic/halflife/zombie/cremator

//// TIER 4 //////////////

/datum/outfit/deployment_loadout/xen/tier4/gonome
	name = "Deployment: Fungal Gonome"
	display_name = "Fungal Gonome (Support)"
	desc = "You aren't as powerful in direct combat as antlion guards, but can sustain yourself through healing off fungal flooring you can plant, and can create headcrabs for extra pressure."

	mob_to_be = /mob/living/basic/halflife/zombie/gonome/complete/deployment

/datum/outfit/deployment_loadout/xen/tier4/antlion_guard
	name = "Deployment: Antlion Guard"
	display_name = "Antlion Guard (Offense)"
	desc = "A heavyweight antlion guard, you have the highest damage output and health of any antlion or zombie, and excel at smashing through enemy fortifications."

	mob_to_be = /mob/living/basic/halflife/antlion_guard/deployment

/datum/outfit/deployment_loadout/xen/tier4/heavy_crab_walker
	name = "Deployment: Heavy Crabwalker"
	display_name = "Heavy Crabwalker (Defense)"
	desc = "You are a human that has undergone severe transformations following years of living in toxic sludge, eating humans, and wearing rotting xenian flesh. Now feral, you fight on the side of Xen and are unique in being able to use your hands to heal yourself, set up traps, and even use human firearms (though you aren't very good with them)."
	id_name = "Crabwalker"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/platearmor/heavy/deployment

	l_pocket = /obj/item/knife/combat/bone

	back = /obj/item/storage/backpack/halflife/satchel
	head = /obj/item/clothing/head/helmet/halflife/headcrab/gonome
	gloves = /obj/item/clothing/gloves/fingerless
	mask = /obj/item/clothing/mask/bandana/sinew

	shoes = /obj/item/clothing/shoes/boots

	backpack_contents = list(
		/obj/item/spear/halflife/deathmatch/deployment = 1,
		/obj/item/restraints/legcuffs/beartrap = 3,
		/obj/item/stack/medical/bandage = 3,
		/obj/item/reagent_containers/pill/patch/grubnugget = 2,
	)

	extra_str = 6
	mob_to_be = null

/datum/outfit/deployment_loadout/xen/tier4/heavy_crab_walker/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/human/crabwalker)
	var/datum/action/new_action = new /datum/action/cooldown/mob_cooldown/talk_xen(H.mind || H)
	new_action.Grant(H)
