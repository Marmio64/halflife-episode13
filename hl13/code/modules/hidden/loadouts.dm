/obj/item/hl2/loadout_picker/hidden/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/combine/shotgunner,
			/datum/outfit/deployment_loadout/hidden/combine/conscript,
			/datum/outfit/deployment_loadout/hidden/combine/medic_cop,
			/datum/outfit/deployment_loadout/hidden/combine/engineer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

//The defender, shotgunners specialize in demolishing the hidden if they dare get close to them.
//While their armor won't help to stop the hidden's knife, it does help a little bit against their grenades.
/datum/outfit/deployment_loadout/hidden/combine/shotgunner
	name = "Hidden: Shotgunner"
	display_name = "DEFENSE: Shotgunner"
	desc = "Use your high power shotgun to keep the Hidden away from you and your team. All you need to put them down are two clean bursts."

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12_hidden
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red/deathmatch

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = "none"

//The attacker, conscripts move a bit faster than their comrades and have the best medium to long range weapon.
//They excel at giving chase to the hidden, just don't get cocky.
/datum/outfit/deployment_loadout/hidden/combine/conscript
	name = "Hidden: Conscript"
	display_name = "ASSAULT: Conscript"
	desc = "Utilize your high power M4A1 and extra speed to keep pressure on the Hidden from close and long range."

	suit = /obj/item/clothing/suit/armor/halflife/kevlar/fast
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight
	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/stack/medical/gauze = 1,
		/obj/item/ammo_box/magazine/m4a1 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = "none"

	extra_dex = 3

//The healer, excels at recovering allies from nonfatal injuries.
//The Hidden tends to finish off prey they have started to hunt, but in the case they don't, you are extremely useful at getting them back to tip top shape!
/datum/outfit/deployment_loadout/hidden/combine/medic_cop
	name = "Hidden: Medical Cop"
	display_name = "HEALER: Medical Cop"
	desc = "Keep your allies healed whenever they get hurt by the Hidden but not killed."

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical

	l_pocket = /obj/item/flashlight
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = "none"

	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 3,
		/obj/item/stack/medical/gauze = 1,
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden)
	extra_int = 4

//The trapper, you specialize in setting up trip beams at room entrances in order to get a heads up on Hidden activity.
//In addition, you get two more flares than everyone else, which is great for increasing the dismal visiblity your team tends to have!
//The downside is that you only have a sidearm and are thus extremely vulnerable, unless you manage to get a real gun off a dead teammate.
/datum/outfit/deployment_loadout/hidden/combine/engineer
	name = "Hidden: Engineer"
	display_name = "TRAPPER: Engineer"
	desc = "Use trip alarm beams and flares to get extra information on where the enemy is."

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	belt = /obj/item/gun/ballistic/automatic/pistol/usp

	l_pocket = /obj/item/stack/medical/gauze
	r_pocket = /obj/item/flashlight

	back = /obj/item/storage/backpack/halflife
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = "none"

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 2,
		/obj/item/flashlight/flare/the_hidden = 3,
		/obj/item/assembly/infra/the_hidden = 2,
	)


/obj/item/assembly/infra/the_hidden
	name = "sonic trip alarm"
	desc = "Emits a visible beam and is triggered when the beam is interrupted, sending out a noise. use in hand to activate. Note, it does not activate for movement on the last tile of it's beam or on the first tile, position it carefully."

	visible = TRUE
	hearing_range = 9
	visibility_changeable = FALSE

/obj/item/flashlight/flare/the_hidden
	name = "short-burst flare"
	desc = "A red flare. There are instructions on the side, it reads 'pull cord, make light'. This one has a very limited lifetime, only use when necessary."
	randomize_fuel = FALSE
	fuel = 90 SECONDS





/// THE MONSTER /// --------------------------------------

/datum/outfit/deployment_loadout/hidden/the_hidden
	name = "Hidden: The Hidden"
	display_name = "The Hidden"
	desc = "The monster itself. Utilize stealth and mobility to slaughter your opponents when they don't expect it."

	glasses = /obj/item/clothing/glasses/hidden_blindfold
	shoes = null

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	uniform = /obj/item/clothing/under/pants/the_hidden

	combat_music = "none"

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade, /datum/action/cooldown/spell/conjure_item/hidden_knife, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/hidden_taunt)

/datum/outfit/deployment_loadout/hidden/the_hidden/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.skin_tone = "#e9dfd7"
	H.alpha = 25
	H.set_hairstyle("Bald", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.eye_color_left = "#b9b9b9"
	H.eye_color_right = "#b9b9b9"
	H.update_body()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOGUNS, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FILTHBORN, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_ANALGESIA, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_PIERCEIMMUNE, OUTFIT_TRAIT) //so you dont get fucked from stepping on a glass shard
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)
	H.setdeploymentfaction(HIDDEN_DEPLOYMENT_FACTION)

/obj/item/clothing/under/pants/the_hidden
	name = "pants"
	desc = "A pair of plain pants"
	icon_state = "trackpants"
	slowdown = -1.35

/obj/item/clothing/glasses/hidden_blindfold
	name = "blindfold"
	desc = "A simple white blindfold."
	icon_state = "blindfoldwhite"
	inhand_icon_state = null
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)

//Will three shot everyone, one shot with backstabs
/obj/item/knife/combat/the_hidden
	desc = "An obscenely sharp and dangerous knife. Backstabs will instantly down. Stab a dead body to gib it and heal."

	force = 50
	armour_penetration = 50
	wdefense = 0
	slot_flags = 0
	item_flags = DROPDEL //so the combine cant steal the absurdly powerful knife. The hidden can just summon a new one too.

	attack_speed = CLICK_CD_SLOW
	var/backstab_bonus = 125

/obj/item/knife/combat/the_hidden/afterattack(atom/target, mob/user, click_parameters)
	. = ..()
	if(target == user || !isliving(target) || !isliving(user))
		return
	var/mob/living/living_target = target
	var/mob/living/living_user = user

	if(living_target.stat == DEAD) //heal up from gibbing the dead
		living_user.adjustStaminaLoss(-50)
		living_user.adjustBruteLoss(-35)
		living_user.adjustFireLoss(-35)
		living_target.gib()
		return

	if(!check_behind(user, living_target))
		return
	// We're officially behind them, apply effects
	living_target.apply_damage(backstab_bonus, BRUTE, BODY_ZONE_CHEST, wound_bonus = CANT_WOUND)
	living_target.balloon_alert(user, "backstab!")
	playsound(living_target, 'sound/items/weapons/guillotine.ogg', 100, TRUE)

/datum/action/cooldown/spell/conjure_item/hidden_knife
	name = "Summon Knife"
	desc = "Summons your favorite and deadliest little buddy. Gets rid of the previous one if it exists."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "knife"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 3 SECONDS
	item_type = /obj/item/knife/combat/the_hidden
	requires_hands = TRUE
	delete_old = TRUE

/datum/action/cooldown/spell/hidden_taunt
	name = "Taunt"
	desc = "Taunt your enemy with a voiceline that is sure to instill terror."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "cloak"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 10 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE
	var/taunt_sounds = list(
	'sound/effects/hallucinations/behind_you1.ogg',
	'sound/effects/hallucinations/behind_you2.ogg',
	'sound/effects/hallucinations/i_see_you1.ogg',
	'sound/effects/hallucinations/i_see_you2.ogg',
	'sound/effects/hallucinations/im_here1.ogg',
	'sound/effects/hallucinations/im_here2.ogg',
	'sound/effects/hallucinations/look_up1.ogg',
	'sound/effects/hallucinations/look_up2.ogg',
	'sound/effects/hallucinations/over_here1.ogg',
	'sound/effects/hallucinations/over_here2.ogg',
	'sound/effects/hallucinations/over_here3.ogg',
	'sound/effects/hallucinations/turn_around1.ogg',
	'sound/effects/hallucinations/turn_around2.ogg',
)

/datum/action/cooldown/spell/hidden_taunt/cast(mob/living/cast_on)
	. = ..()
	var/chosen_sound = pick(taunt_sounds)
	playsound(owner.loc, chosen_sound, 50, FALSE)

/datum/action/cooldown/spell/hidden_heal
	name = "Adrenal Burst"
	desc = "Unleash an adrenaline burst to regain all your stamina and part of your health."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 90 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE

/datum/action/cooldown/spell/hidden_heal/cast(mob/living/cast_on)
	. = ..()
	living_user.adjustStaminaLoss(-100)
	living_user.adjustBruteLoss(-25)
	living_user.adjustFireLoss(-25)
