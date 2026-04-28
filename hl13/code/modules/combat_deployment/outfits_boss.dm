/datum/outfit/deployment_loadout/boss/blank
	name = "BLANK BOSS"

	l_hand = /obj/item/hl2/loadout_picker/boss

/datum/outfit/deployment_loadout/boss/blank/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.setdeploymentfaction(HIDDEN_DEPLOYMENT_FACTION)
	H.faction = list(FACTION_HEADCRAB, FACTION_REFUGEE) //so friendly gonarchs dont fuck other bosses up
	GLOB.number_of_hidden++

	H.remove_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_TERRIBLE_AIM), OUTFIT_TRAIT) //remove any riot cop traits which may be present

	H.add_traits(list(TRAIT_NEVER_WOUNDED, TRAIT_NODISMEMBER), OUTFIT_TRAIT) //ehhh just take these out of the equation, since these are BOSSES

	H.dna.species.stunmod = 0.1 //all bosses are very resilient to stuns

	H.fire_stack_decay_rate = -2

	var/list/spawn_locs = list()
	for(var/X in GLOB.the_hidden)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))

/datum/outfit/deployment_loadout/boss/freeman
	name = "Bossfight: The Free Man"
	display_name = "The Free Man (ALL-ROUNDER)"
	desc = "Time to fuck up someone's face."

	uniform = /obj/item/clothing/under/citizen/rebel
	back = /obj/item/storage/backpack/halflife/satchel/huge
	suit = /obj/item/clothing/suit/hooded/hev/deathmatch/boss

	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

	neck = /obj/item/storage/bag/rebar_quiver/syndicate

	glasses = /obj/item/clothing/glasses/regular/thin/thermals

	combat_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	belt = /obj/item/crowbar/large/freeman

	backpack_contents = list(
		/obj/item/grenade/syndieminibomb/bouncer = 4,
		/obj/item/gun/ballistic/automatic/pistol/usp,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/gun/ballistic/revolver/coltpython,
		/obj/item/ammo_box/colta357,
		/obj/item/gun/ballistic/shotgun/spas12,
		/obj/item/storage/box/lethalshot/halflife,
		/obj/item/gun/ballistic/automatic/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/ammo_box/magazine/mp7,
		/obj/item/gun/ballistic/automatic/ar2/standardpin,
		/obj/item/gun/ballistic/rifle/rebarxbow/upgraded,
		/obj/item/gun/ballistic/rocketlauncher/halflife,
		/obj/item/ammo_casing/rocket/hl13 = 3,
		/obj/item/reagent_containers/pill/patch/medkit,
		/obj/item/reagent_containers/pill/patch/medkit,
	)

	extra_dex = 10
	extra_str = 10
	extra_end = 10
	extra_per = 5

/obj/item/clothing/glasses/regular/thin/thermals
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE

/datum/outfit/deployment_loadout/boss/wesker
	name = "Bossfight: The Mastermind"
	display_name = "The Mastermind (RUSHDOWN)"
	desc = "Seven minutes. Seven minutes is all you have to play with your enemies. You have relatively low durability, but can disorient enemies with swift dashes, utilize devestating martial arts combos, self heal, and can activate throw mode to become near invulnerable to anything but explosions."

	combat_music = 'hl13/sound/music/combat/farben.ogg'

	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/jacket/trenchcoat/wesker
	glasses = /obj/item/clothing/glasses/sunglasses/wesker
	gloves = /obj/item/clothing/gloves/color/black/wesker

	spells_to_add = list(/datum/action/cooldown/spell/wesker_taunt, /datum/action/cooldown/mob_cooldown/dash/wesker)

	extra_dex = 8
	extra_str = 2 //dont need that much strength because CQC overrides strength bonuses for punching
	extra_end = 8

/datum/action/cooldown/mob_cooldown/dash/wesker
	dash_range = 5
	pick_range = 1
	cooldown_time = 0.5 SECONDS

/obj/item/clothing/suit/jacket/trenchcoat/wesker
	armor_type = /datum/armor/civpro_vest
	slowdown = -0.25
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|HEAD
	resistance_flags = INDESTRUCTIBLE

/obj/item/clothing/glasses/sunglasses/wesker
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE

/obj/item/clothing/gloves/color/black/wesker
	name = "Dark Gloves"
	desc = "Just looking at these fills you with an urge to beat the shit out of people."
	max_integrity = 9999

/obj/item/clothing/gloves/color/black/wesker/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/punchcooldown, "", CLICK_CD_FAST)

/datum/outfit/deployment_loadout/boss/wesker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.set_haircolor("#dab57f", update = FALSE) // dirty blonde
	H.skin_tone = "#e8c99b"
	H.set_hairstyle("Combover", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.update_body(0)

	//CQC
	var/datum/martial_art/cqc/wesker/elitecqc = new
	elitecqc.teach(H)

	//all of wesker's superhuman powers
	H.stamina_regen_time = 4 SECONDS

	H.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_NOCRITDAMAGE, TRAIT_IGNORESLOWDOWN, TRAIT_ANALGESIA, TRAIT_NOCRITOVERLAY), OUTFIT_TRAIT)

/datum/action/cooldown/spell/wesker_taunt
	name = "Recovering Taunt"
	desc = "Taunt your enemy with a voiceline that is sure to instill terror, while healing yourself and removing stuns."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "cloak"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 10 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE
	var/taunt_sounds = list(
	"Heheheh... is that all you have?" = 'hl13/sound/effects/wesker/wesker-isthatall.ogg',
	"Playtime is over." = 'hl13/sound/effects/wesker/wesker-playtimeover.ogg',
	"Poor performance indeed!" = 'hl13/sound/effects/wesker/wesker-poorperformance.ogg',
	"Seven minutes. Seven minutes is all I can spare to play with you." = 'hl13/sound/effects/wesker/wesker-7minutes.ogg',
	"You disappoint me! Is that the best you've got?" = 'hl13/sound/effects/wesker/wesker-disappoint.ogg',
)

/datum/action/cooldown/spell/wesker_taunt/cast(mob/living/cast_on)
	. = ..()
	var/chosen_sound = pick(taunt_sounds)
	playsound(owner.loc, taunt_sounds[chosen_sound], 50, FALSE)
	cast_on.say(chosen_sound)
	cast_on.adjustBruteLoss(-75)
	cast_on.adjustFireLoss(-75)
	cast_on.extinguish_mob()
	cast_on.SetAllImmobility(0)
	cast_on.setStaminaLoss(0)
	cast_on.set_resting(FALSE, instant = TRUE)


////////// PLF GENERAL //////////////////////////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/boss/plf_general
	name = "Bossfight: PLF General"
	display_name = "PLF General (SUPPORT, SNIPER, CROWD CONTROL)"
	desc = "You have the full backing of the PLF behind you, and call in missile airstrikes and have friendly soldiers teleported to your position, while you stay in the backlines sniping opponents with your Dragunov. Be wary however, you aren't very durable and are vulnerable to being rushed down."

	suit = /obj/item/clothing/suit/armor/halflife/reinforced_brown_jacket/boss
	mask = /obj/item/cigarette/halflife
	suit_store = /obj/item/gun/ballistic/automatic/svd
	belt = /obj/item/melee/baton
	l_pocket = /obj/item/knife/combat
	r_pocket = /obj/item/flashlight/seclite
	head = /obj/item/clothing/head/beret/sec/poland
	uniform = /obj/item/clothing/under/syndicate/camo/halflife/armored
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	id = null

	back = /obj/item/storage/backpack/halflife/satchel/radio/huge

	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/reagent_containers/hypospray/medipen/healthpen = 2,
		/obj/item/reagent_containers/pill/patch/medkit = 3,
		/obj/item/ammo_box/magazine/svd = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 2,
		/obj/item/grenade/smokebomb = 2,
		/obj/item/storage/fancy/cigarettes/halflife = 1,
		/obj/item/lighter = 1,
	)

	combat_music = 'hl13/sound/music/combat/darkstalker.ogg'

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/svd_ammo/fast, /datum/action/cooldown/spell/conjure/boss_rebel_soldier, /datum/action/cooldown/spell/conjure/boss_veteran, /datum/action/cooldown/spell/conjure_item/missile_targeter_general, /datum/action/cooldown/spell/summonitem/plf_general)


	extra_dex = 10
	extra_str = 8 //alright with a melee weapon, but using the dragunov is going to be way better
	extra_end = 10
	extra_per = 10

////////// EXTRACT VORT //////////////////////////////////////////////////////////////////////////////

/datum/outfit/deployment_loadout/boss/extract_vortigaunt
	name = "Boss: Extract Empowered Vortigaunt"
	display_name = "Extract Empowered Vortigaunt (SUPPORT)"
	desc = "You are durable with a wide array of low cooldown, powerful abilities. While you are a pretty good combatant yourself, perhaps your greatest strength is instead simply your ability to infinitely heal fellow bosses?"

	uniform = null
	shoes = null
	id = null

	combat_music = 'hl13/sound/music/combat/vortalcombat.ogg'

	extra_dex = 10
	extra_str = 8
	extra_end = 10

/datum/outfit/deployment_loadout/boss/extract_vortigaunt/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt/extract_boss)
	H.cmode_music = combat_music







/datum/outfit/deployment_loadout/boss/gonarch
	name = "Bossfight: Gonarch"
	display_name = "Gonarch (SUPPORT, TANK)"
	desc = "You are exceptionally tanky, and have a wide variety of dangerous bio attacks to use against opponents."
	uniform = null
	shoes = null
	id = null

/datum/outfit/deployment_loadout/boss/gonarch/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/simple_animal/hostile/asteroid/elite/gonarch/boss/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)

/datum/outfit/deployment_loadout/boss/guardian
	name = "Bossfight: Antlion Guardian"
	display_name = "Antlion Guardian (RUSHDOWN, TANK)"
	desc = "You are a tanky rushdown unit. Keep on the pressure and don't let up, you can't regenerate health and don't have any advantages for hanging back."
	uniform = null
	shoes = null
	id = null

/datum/outfit/deployment_loadout/boss/guardian/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/basic/halflife/antlion_guard/guardian/summoner_deployment/boss/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)
