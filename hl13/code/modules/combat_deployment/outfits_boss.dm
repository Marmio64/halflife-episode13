/datum/outfit/deployment_loadout/boss/blank
	name = "BLANK BOSS"

	l_hand = /obj/item/hl2/loadout_picker/boss

/datum/outfit/deployment_loadout/boss/blank/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.setdeploymentfaction(HIDDEN_DEPLOYMENT_FACTION)
	H.faction = list(FACTION_HEADCRAB) //so friendly gonarchs dont fuck other bosses up
	GLOB.number_of_hidden++

	var/list/spawn_locs = list()
	for(var/X in GLOB.the_hidden)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))

/datum/outfit/deployment_loadout/boss/freeman
	name = "Bossfight: The Free Man"
	display_name = "The Free Man"
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
		/obj/item/grenade/syndieminibomb/bouncer = 3,
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
		/obj/item/ammo_casing/rocket/hl13,
	)

	extra_dex = 10
	extra_str = 10
	extra_end = 10
	extra_per = 3

/obj/item/clothing/glasses/regular/thin/thermals
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE

/datum/outfit/deployment_loadout/boss/wesker
	name = "Bossfight: The Mastermind"
	display_name = "The Mastermind"
	desc = "Seven minutes. Seven minutes is all you have to play with your enemies. You have relatively low durability, but can disorient enemies with swift dashes, utilize devestating martial arts combos, self heal, and can activate throw mode to become near invulnerable to anything but explosions."

	combat_music = 'hl13/sound/music/combat/farben.ogg'

	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/jacket/trenchcoat/wesker
	glasses = /obj/item/clothing/glasses/sunglasses/wesker
	gloves = /obj/item/clothing/gloves/color/black/wesker

	l_pocket = /obj/item/knife/combat/survival

	spells_to_add = list(/datum/action/cooldown/spell/wesker_taunt, /datum/action/cooldown/mob_cooldown/dash/wesker)

	extra_dex = 5
	extra_str = 3
	extra_end = 5

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

	H.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_NOCRITDAMAGE, TRAIT_NEVER_WOUNDED, TRAIT_IGNORESLOWDOWN, TRAIT_ANALGESIA, TRAIT_NOCRITOVERLAY), OUTFIT_TRAIT)

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
	'hl13/sound/effects/wesker/wesker-isthatall.ogg',
	'hl13/sound/effects/wesker/wesker-playtimeover.ogg',
	'hl13/sound/effects/wesker/wesker-poorperformance.ogg',
	'hl13/sound/effects/wesker/wesker-7minutes.ogg',
	'hl13/sound/effects/wesker/wesker-disappoint.ogg',
)

/datum/action/cooldown/spell/wesker_taunt/cast(mob/living/cast_on)
	. = ..()
	var/chosen_sound = pick(taunt_sounds)
	playsound(owner.loc, chosen_sound, 50, FALSE)
	cast_on.adjustBruteLoss(-75)
	cast_on.adjustFireLoss(-75)
	cast_on.extinguish_mob()
	cast_on.SetAllImmobility(0)
	cast_on.setStaminaLoss(0)
	cast_on.set_resting(FALSE, instant = TRUE)

/datum/outfit/deployment_loadout/boss/gonarch
	name = "Bossfight: Gonarch"
	display_name = "Gonarch"
	desc = "You are exceptionally tanky, and have a wide variety of dangerous bio attacks to use against opponents."
	uniform = null
	shoes = null
	id = null

/datum/outfit/deployment_loadout/boss/gonarch/post_equip(mob/living/carbon/human/H)
	var/datum/mind/player_mind = H.mind
	var/mob/living/simple_animal/hostile/asteroid/elite/gonarch/boss/S = new (H.loc)
	player_mind.transfer_to(S)
	qdel(H)
