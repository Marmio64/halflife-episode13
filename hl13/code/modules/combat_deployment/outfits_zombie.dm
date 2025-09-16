/datum/outfit/deployment_loadout/xen
	uniform = null
	shoes = null
	var/mob_to_be = /mob/living/basic/halflife/headcrab

/datum/outfit/deployment_loadout/xen/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/basic/halflife/S = new mob_to_be(H.loc)
	player_mind.transfer_to(S)
	qdel(H)

/datum/outfit/deployment_loadout/xen/tier1/headcrab
	name = "Deployment: Headcrab"
	display_name = "Headcrab"
	desc = "A basic headcrab. Plain and simple."

	mob_to_be = /mob/living/basic/halflife/headcrab

/datum/outfit/deployment_loadout/xen/tier1/fast_headcrab
	name = "Deployment: Fast Headcrab"
	display_name = "Fast Headcrab"
	desc = "A fast headcrab. Speedier but less durable than the standard headcrab."

	mob_to_be = /mob/living/basic/halflife/headcrab/fast

//// TIER 2 //////////////

/datum/outfit/deployment_loadout/xen/tier2/poison_headcrab
	name = "Deployment: Deadly Poison Headcrab"
	display_name = "Deadly Poison Headcrab"
	desc = "An extra venomous headcrab that plays the long game with large amounts of venom it injects each bite."

	mob_to_be = /mob/living/basic/halflife/headcrab/poison/deadly

/datum/outfit/deployment_loadout/xen/tier2/zombie
	name = "Deployment: Zombie"
	display_name = "Zombie"
	desc = "A standard zombie. Very plain!"

	mob_to_be = /mob/living/basic/halflife/zombie

//// TIER 3 //////////////

/datum/outfit/deployment_loadout/xen/tier3/fast_zombie
	name = "Deployment: Fast Zombie"
	display_name = "Fast Zombie"
	desc = "Although sporting less health, the fast zombie has a high speed advantage over standard zombies."

	mob_to_be = /mob/living/basic/halflife/zombie/fast

/datum/outfit/deployment_loadout/xen/tier3/poison_zombie
	name = "Deployment: Poison Zombie"
	display_name = "Poison Zombie"
	desc = "An espescially tanky and slow zombie, which can provide backup by tossing poison headcrabs."

	mob_to_be = /mob/living/basic/halflife/zombie/poison/slow

/datum/outfit/deployment_loadout/xen/tier3/fungal_zombie
	name = "Deployment: Fungal Zombie"
	display_name = "Fungal Zombie"
	desc = "A slightly slower zombie which has higher health, the ability to plant fungus flooring, and the ability to heal on said flooring."

	mob_to_be = /mob/living/basic/halflife/zombie/fungal

/datum/outfit/deployment_loadout/xen/tier3/zombine
	name = "Deployment: Zombine"
	display_name = "Zombine"
	desc = "A heavyweight zombie with good health reserves, and a deployable grenade. However, they're quite slow when not using their Charge ability."

	mob_to_be = /mob/living/basic/halflife/zombie/zombine/slow

/datum/outfit/deployment_loadout/xen/tier3/antlion_worker
	name = "Deployment: Antlion Worker"
	display_name = "Antlion Worker"
	desc = "Despite your very low durability, you have powerful acid spray attacks for putting pressure on enemies from afar."

	mob_to_be = /mob/living/basic/halflife/antlion_worker/zombie_faction

/datum/outfit/deployment_loadout/xen/tier3/antlion_grub
	name = "Deployment: Antlion Grub"
	display_name = "Antlion Grub"
	desc = "You have almost no health and can't attack by yourself, but can call upon and summon antlions from deep underground to protect you!"

	mob_to_be = /mob/living/basic/halflife/grub/deployment

//// TIER 4 //////////////

/datum/outfit/deployment_loadout/xen/tier4/gonome
	name = "Deployment: Fungal Gonome"
	display_name = "Fungal Gonome"
	desc = "You aren't as powerful in direct combat as antlion guards, but can sustain yourself through healing off fungal flooring you can plant, and can create headcrabs for extra pressure."

	mob_to_be = /mob/living/basic/halflife/zombie/gonome/complete

/datum/outfit/deployment_loadout/xen/tier4/antlion_guard
	name = "Deployment: Antlion Guard"
	display_name = "Antlion Guard"
	desc = "A heavyweight antlion guard, you have the highest damage output and health of any antlion or zombie, and excel at smashing through enemy fortifications."

	mob_to_be = /mob/living/basic/halflife/antlion_guard/zombie_faction
