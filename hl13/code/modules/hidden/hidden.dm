/// THE MONSTER /// --------------------------------------
/obj/item/hl2/loadout_picker/hidden/the_hidden
	help_text_type = "hidden_hidden"

/obj/item/hl2/loadout_picker/hidden/the_hidden/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/the_hidden,
			/datum/outfit/deployment_loadout/hidden/the_hidden/trapper,
			/datum/outfit/deployment_loadout/hidden/the_hidden/brute,
			/datum/outfit/deployment_loadout/hidden/the_hidden/necrotic,
			/datum/outfit/deployment_loadout/hidden/the_hidden/spitter,
			/datum/outfit/deployment_loadout/hidden/the_hidden/fleshstealer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/hidden/the_hidden
	name = "Hidden: The Hidden"
	display_name = "DEFAULT: The Hidden"
	desc = "The monster itself. Utilize stealth and mobility to slaughter your opponents when they don't expect it."

	glasses = /obj/item/clothing/glasses/hidden_blindfold
	shoes = null

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	uniform = /obj/item/clothing/under/pants/the_hidden

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 10
	faction = HIDDEN_DEPLOYMENT_FACTION


	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_knife, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

	var/update_globals = FALSE

/datum/outfit/deployment_loadout/hidden/the_hidden/blank
	name = "BLANK HIDDEN"

	spells_to_add = list(/datum/action/cooldown/spell/hidden_taunt)

	l_hand = /obj/item/hl2/loadout_picker/hidden/the_hidden

	update_globals = TRUE

/datum/outfit/deployment_loadout/hidden/the_hidden/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_species(/datum/species/human)
	H.skin_tone = "#e9dfd7"
	H.alpha = 25
	H.set_hairstyle("Bald", update = TRUE)
	H.set_facial_hairstyle("Shaved", update = TRUE)
	H.eye_color_left = "#b9b9b9"
	H.eye_color_right = "#b9b9b9"
	H.update_body()
	H.slowed_by_drag = FALSE
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOGUNS, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FILTHBORN, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_ANALGESIA, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITDAMAGE, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_THE_HIDDEN, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_FREERUNNING, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_PIERCEIMMUNE, OUTFIT_TRAIT)

	H.maxHealth = 50
	H.crit_threshold = -123
	H.hardcrit_threshold = -124
	H.fire_stack_decay_rate = -2 //otherwise fire is insane against them. Max stack size is 12, and this removes 4 stacks every 2 seconds
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)
	H.faction = list(FACTION_HEADCRAB)
	H.setdeploymentfaction(HIDDEN_DEPLOYMENT_FACTION)
	if(update_globals)
		GLOB.number_of_hidden++

/datum/outfit/deployment_loadout/hidden/the_hidden/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.fully_replace_character_name(H.real_name,"Subject-[rand(111,999)]")

	var/list/spawn_locs = list()
	for(var/X in GLOB.the_hidden)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	H.forceMove(pick(spawn_locs))

/obj/item/clothing/under/pants/the_hidden
	name = "pants"
	desc = "A pair of plain pants"
	icon_state = "trackpants"
	slowdown = -1.3
	body_parts_covered = GROIN|LEGS|FEET
	resistance_flags = INDESTRUCTIBLE

/obj/item/clothing/under/pants/the_hidden/trapper
	slowdown = -1

/obj/item/clothing/under/pants/the_hidden/brute
	slowdown = -0.75

/obj/item/clothing/glasses/hidden_blindfold
	name = "blindfold"
	desc = "A simple white blindfold."
	icon_state = "blindfoldwhite"
	inhand_icon_state = null
	vision_flags = SEE_MOBS
	color_cutoffs = list(40, 40, 40)
	resistance_flags = INDESTRUCTIBLE

/obj/item/clothing/glasses/hidden_blindfold_brute
	name = "blindfold"
	desc = "A simple white blindfold."
	icon_state = "blindfoldwhite"
	inhand_icon_state = null
	color_cutoffs = list(40, 40, 40)


//Will three shot everyone, one shot with backstabs
/obj/item/knife/combat/the_hidden
	desc = "An obscenely sharp and dangerous knife. Backstabs will instantly down. Stab a dead body to gib it and heal."

	force = 50
	demolition_mod = 2
	armour_penetration = 70
	wdefense = 0
	slot_flags = 0
	item_flags = DROPDEL //so the combine cant steal the absurdly powerful knife. The hidden can just summon a new one too.

	attack_speed = CLICK_CD_SLOW
	var/backstab_bonus = 125
	var/gib_time = 1 SECONDS

/obj/item/knife/combat/the_hidden/brute
	name = "brutish machete"
	desc = "A monstrous looking machete. Deals more frontal damage than the standard hidden knife, but cannot instantly down someone through backstabs, alongside weighing you down. Is capable of quickly hacking apart dead bodies to gib and heal from them."
	icon = 'hl13/icons/obj/melee.dmi'
	icon_state = "machete_scrap"
	inhand_icon_state = "machete_scrap"
	lefthand_file = 'hl13/icons/mob/inhands/melee_inhand_left.dmi'
	righthand_file = 'hl13/icons/mob/inhands/melee_inhand_right.dmi'
	hitsound = 'hl13/sound/halflifeweapons/meleesounds/hatchet_hit.ogg'
	force = 60
	backstab_bonus = 30
	gib_time = 0.5 SECONDS

	item_flags = SLOWS_WHILE_IN_HAND

	//while your machete is out, you'll move at the same pace as assault classes.
	slowdown = 0.4
	drag_slowdown = 0.4

/obj/item/knife/combat/the_hidden/attack(mob/living/target_mob, mob/living/user, params)
	if(target_mob == user) //self stab protection, i feel bad for the hidden
		user.balloon_alert(user, "don't stab yourself!")
		return
	if(target_mob.deployment_faction == HIDDEN_DEPLOYMENT_FACTION)
		user.balloon_alert(user, "don't attack fellow hidden!") //so you dont accidentally stab fleshstealer team mates
		return
	. = ..()

/obj/item/knife/combat/the_hidden/afterattack(atom/target, mob/user, click_parameters)
	. = ..()
	if(!isliving(target) || !isliving(user))
		return
	var/mob/living/living_target = target
	var/mob/living/living_user = user

	if(living_target.stat == DEAD && ishuman(living_target)) //heal up from gibbing the dead
		if(do_after(user, gib_time, src))
			dead_effect(living_target, living_user)
		return

	if(!check_behind(user, living_target))
		return
	// We're officially behind them, apply effects
	living_target.apply_damage(backstab_bonus, BRUTE, BODY_ZONE_CHEST, wound_bonus = CANT_WOUND)
	living_target.balloon_alert(user, "backstab!")
	playsound(living_target, 'sound/items/weapons/guillotine.ogg', 100, TRUE)

/obj/item/knife/combat/the_hidden/proc/dead_effect(mob/living/target, mob/living/user)
	user.adjustStaminaLoss(-25)
	user.adjustBruteLoss(-25)
	user.adjustFireLoss(-35)
	target.gib()

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

/datum/action/cooldown/spell/conjure_item/hidden_climbing_hook
	name = "Summon Climbing Hook"
	desc = "Summons a climbing hook to scale walls with. 'Look Up' to find somewhere you can scale. Gets rid of the previous one if it exists."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "climbinghook"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 3 SECONDS
	item_type = /obj/item/climbing_hook/halflife/hidden
	requires_hands = TRUE
	delete_old = TRUE

/obj/item/climbing_hook/halflife/hidden
	name = "climbing hook"
	desc = "A hook and rope for scaling walls with."
	uses = 1
	climb_time = 2 SECONDS
	item_flags = DROPDEL

/datum/action/cooldown/spell/conjure_item/hidden_knife/brute
	name = "Summon Machete"
	desc = "Summons your favorite and deadliest friend. Gets rid of the previous one if it exists."
	item_type = /obj/item/knife/combat/the_hidden/brute


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
	desc = "Unleash an adrenaline burst to regain all your stamina and part of your health, while also extinguishing any flames present on you. Will make you scream and thus reveal your location on use."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "medkit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 90 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE

	var/taunt_sounds = list(
	'hl13/sound/voice/stalker/stalker_scream.ogg',
	'hl13/sound/voice/stalker/stalker_scream2.ogg',
	'hl13/sound/voice/stalker/stalker_scream3.ogg',
)

/datum/action/cooldown/spell/hidden_heal/cast(mob/living/cast_on)
	. = ..()
	cast_on.adjustStaminaLoss(-125)
	cast_on.adjustBruteLoss(-50)
	cast_on.adjustFireLoss(-60)
	cast_on.extinguish_mob()
	var/chosen_sound = pick(taunt_sounds)
	playsound(owner.loc, chosen_sound, 50, FALSE)

/datum/action/cooldown/spell/conjure_item/hidden_beartrap
	name = "Summon Mantrap"
	desc = "Summons a mantrap that you can arm and place down. You won't trigger it if you step over it, but humans will."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "trap"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 20 SECONDS
	item_type = /obj/item/restraints/legcuffs/beartrap/the_hidden
	requires_hands = TRUE

/obj/item/restraints/legcuffs/beartrap/the_hidden
	name = "man trap"
	throw_speed = 1
	throw_range = 1
	icon_state = "beartrap"
	desc = "A terrible looking trap that is barely visible when armed. Watch your step."
	breakouttime = 10 SECONDS
	trap_damage = 25

/obj/item/restraints/legcuffs/beartrap/the_hidden/prearmed
	armed = TRUE
	alpha = 60

/obj/item/restraints/legcuffs/beartrap/the_hidden/attack_self(mob/user)
	. = ..()
	if(armed)
		alpha = 60
	else
		alpha = 255

/obj/item/restraints/legcuffs/beartrap/the_hidden/spring_trap(atom/movable/target, ignore_movetypes = FALSE, hit_prone = FALSE)
	if(!armed || !isturf(loc) || !isliving(target))
		return

	var/mob/living/victim = target
	if(istype(victim.buckled, /obj/vehicle))
		var/obj/vehicle/ridden_vehicle = victim.buckled
		if(!ridden_vehicle.are_legs_exposed) //close the trap without injuring/trapping the rider if their legs are inside the vehicle at all times.
			close_trap()
			ridden_vehicle.visible_message(span_danger("[ridden_vehicle] triggers \the [src]."))
			return

	//don't close the trap if they're as small as a mouse
	if(victim.mob_size <= MOB_SIZE_TINY)
		return
	if(!ignore_movetypes && (victim.movement_type & MOVETYPES_NOT_TOUCHING_GROUND))
		return
	if(HAS_TRAIT(victim, TRAIT_THE_HIDDEN))
		return

	close_trap()

	if(ignore_movetypes)
		victim.visible_message(span_danger("\The [src] bites into [victim] before breaking apart!"), \
				span_userdanger("\The [src] bites into you before breaking apart!"))
	else
		victim.visible_message(span_danger("[victim] triggers \the [src], causing it to bite into them before smashing apart."), \
				span_userdanger("You trigger \the [src], causing it to bite into you before smashing apart!"))
	var/def_zone = BODY_ZONE_CHEST
	if(victim.body_position == STANDING_UP || hit_prone)
		def_zone = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	if(ishuman(victim))
		var/mob/living/carbon/human/human_victim = victim
		human_victim.adjust_temppain(100)
		human_victim.Immobilize(6 SECONDS)
		human_victim.Stun(2 SECONDS)

	victim.apply_damage(trap_damage, BRUTE, def_zone)
	qdel(src)

/datum/action/cooldown/spell/aoe/repulse/hidden_brute
	name = "Punch Away"
	desc = "Forcefully punch and fling away anyone adjacent to you."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "arm"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	sound = 'hl13/sound/weapons/woosh.ogg'
	aoe_radius = 1
	max_throw = 3

	cooldown_time = 25 SECONDS

/datum/action/cooldown/spell/aoe/repulse/hidden_brute/cast_on_thing_in_aoe(atom/movable/victim, atom/caster)
	var/turf/throwtarget = get_edge_target_turf(caster, get_dir(caster, get_step_away(victim, caster)))
	var/dist_from_caster = get_dist(victim, caster)

	if(HAS_TRAIT(victim, TRAIT_THE_HIDDEN))
		return

	if(dist_from_caster == 0)
		if(isliving(victim))
			var/mob/living/victim_living = victim
			victim_living.Paralyze(3 SECONDS)
			victim_living.adjustBruteLoss(50)
			to_chat(victim, span_userdanger("You're slammed into the floor by [caster]!"))
			playsound(get_turf(caster), 'hl13/sound/effects/injury/trauma1.ogg', 80, TRUE, TRUE)
	else

		if(isliving(victim))
			var/mob/living/victim_living = victim
			victim_living.Immobilize(1 SECONDS)
			to_chat(victim, span_userdanger("You're punched back by [caster]!"))
			victim_living.adjustBruteLoss(50)
			playsound(get_turf(caster), 'hl13/sound/effects/injury/trauma1.ogg', 80, TRUE, TRUE)

		// So stuff gets tossed around at the same time.
		victim.safe_throw_at(
			target = throwtarget,
			range = clamp((max_throw - (clamp(dist_from_caster - 2, 0, dist_from_caster))), 3, max_throw),
			speed = 1,
			thrower = ismob(caster) ? caster : null,
			force = repulse_force,
		)

/datum/action/cooldown/spell/conjure/hidden_headcrab
	name = "Summon Headcrabs"
	desc = "Summons a few armored headcrabs to fight for you."
	button_icon = 'hl13/icons/mob/actions/actions_gonome.dmi'
	button_icon_state = "headcrab"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	sound = 'hl13/sound/creatures/headcrableap.ogg'

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 90 SECONDS
	summon_radius = 1
	summon_type = list(/mob/living/basic/halflife/headcrab/armored)
	summon_amount = 3

/datum/action/cooldown/spell/conjure_item/hidden_necro_knife
	name = "Summon Knife"
	desc = "Summons your favorite and deadliest little buddy. Gets rid of the previous one if it exists."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "knife"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 3 SECONDS
	item_type = /obj/item/knife/combat/the_hidden/necrotic
	requires_hands = TRUE
	delete_old = TRUE

/obj/item/knife/combat/the_hidden/necrotic
	desc = "An obscenely sharp and dangerous knife. Backstabs will instantly down. Stab a dead body to reanimate them into a headcrab zombie."

/obj/item/knife/combat/the_hidden/necrotic/dead_effect(mob/living/target, mob/living/user)
	if(prob(25))
		new /mob/living/basic/halflife/zombie/zombine(get_turf(target))
	else if(prob(25))
		new /mob/living/basic/halflife/zombie/poison(get_turf(target))
	else
		new /mob/living/basic/halflife/zombie(get_turf(target))
	user.adjustStaminaLoss(-25)
	user.adjustBruteLoss(-25)
	user.adjustFireLoss(-35)
	target.gib()

/datum/action/cooldown/spell/pointed/projectile/hidden_spit
	name = "Acidic Spit"
	desc = "Ready yourself to fire an acidic projectile forward. Deals high damage, but moves relatively slowly."

	sound = 'hl13/sound/effects/acidspit.ogg'

	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "spit"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 7 SECONDS

	active_msg = "You prepare to spit!"
	deactive_msg = "You stop trying to spit."
	cast_range = 9
	projectile_type = /obj/projectile/hidden_spit

/obj/projectile/hidden_spit
	name = "acidic bile"
	icon_state = "neurotoxin"
	hitsound = 'hl13/sound/creatures/antlion_worker/antlion_shoot.ogg'
	damage = 50
	armour_penetration = 50
	wound_bonus = -70
	speed = 1.25
	range = 10
	damage_type = BURN


////// ACTUAL OTHER OUTFITS /////////////////////////////////////////

/datum/outfit/deployment_loadout/hidden/the_hidden/trapper
	name = "Hidden: The Hidden (Hunter)"
	display_name = "TRAPPER: The Hunter"
	desc = "You exchange some of your speed for the ability to lay down near-invisible mantraps to immobilize your prey while you swoop in for the kill."

	uniform = /obj/item/clothing/under/pants/the_hidden/trapper

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_knife, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/conjure_item/hidden_beartrap, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

/// Monstrously strong, but slow. They excel at demolishing humans who refuse to backdown, but their slow speed can allow them to be kited by assault classes, and scientist syringes are extra hazardous.
/datum/outfit/deployment_loadout/hidden/the_hidden/brute
	name = "Hidden: The Hidden (Brute)"
	display_name = "ASSAULT: The Brute"
	desc = "You take much less damage, have a unique machete, and have a unique area of effect ability to forcefully punch everyone nearby away. However, you are more visible, slower, and lack heat vision."

	uniform = /obj/item/clothing/under/pants/the_hidden/brute

	glasses = /obj/item/clothing/glasses/hidden_blindfold_brute

	extra_dex = 0
	extra_str = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_knife/brute, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/aoe/repulse/hidden_brute, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

/datum/outfit/deployment_loadout/hidden/the_hidden/brute/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.alpha = 50
	H.physiology.damage_resistance += 50

/datum/outfit/deployment_loadout/hidden/the_hidden/necrotic
	name = "Hidden: The Hidden (Necrotic)"
	display_name = "SUPPORT: The Necrotic"
	desc = "You take more damage and move slower, but gain the ability to summon armored headcrabs and convert bodies to headcrab zombies"

	head = /obj/item/clothing/head/halflife/cosmetic_headcrab
	uniform = /obj/item/clothing/under/pants/the_hidden/trapper

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_necro_knife, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/conjure/hidden_headcrab, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

/datum/outfit/deployment_loadout/hidden/the_hidden/necrotic/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.physiology.damage_resistance -= 20

/datum/outfit/deployment_loadout/hidden/the_hidden/spitter
	name = "Hidden: The Hidden (Spitter)"
	display_name = "SUPPORT: The Spitter"
	desc = "You take more damage and move slower, but are able to spit acid at your enemies to wear them down through attrition."

	uniform = /obj/item/clothing/under/pants/the_hidden/trapper

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_knife, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/pointed/projectile/hidden_spit, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

/datum/outfit/deployment_loadout/hidden/the_hidden/spitter/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.physiology.damage_resistance -= 20

/datum/outfit/deployment_loadout/hidden/the_hidden/fleshstealer
	name = "Hidden: The Hidden (Flesh Stealer)"
	display_name = "SUPPORT: The Flesh Stealer"
	desc = "Upon gibbing enemies, you'll lose your near-invisiblity and instead steal their appearence as a disguise. You can change your speed from human-like to true speed as well. Beware, you can still set off trip alarms, and humans can examine you to find out your true nature."

	uniform = /obj/item/clothing/under/pants/the_hidden/fleshstealer

	extra_dex = 10

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/grenade/random_timer, /datum/action/cooldown/spell/conjure_item/hidden_knife/fleshstealer, /datum/action/cooldown/spell/hidden_heal, /datum/action/cooldown/spell/conjure_item/hidden_climbing_hook, /datum/action/cooldown/spell/hidden_taunt)

/datum/outfit/deployment_loadout/hidden/the_hidden/fleshstealer/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.physiology.damage_resistance += 20 //you're USUALLY easier to spot in spite of your disguises, so this gives you breathing room to make plays. This is balanced out by lower healing from gibbing.

/obj/item/clothing/under/pants/the_hidden/fleshstealer
	actions_types = list(/datum/action/item_action/change_speed)
	slowdown = -1

/datum/action/item_action/change_speed
	name = "Vary Self Speed"

/obj/item/clothing/under/pants/the_hidden/fleshstealer/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/change_speed))
		change_speed()

/obj/item/clothing/under/pants/the_hidden/fleshstealer/verb/change_speed()
	set category = "Object"
	set name = "Vary Self Speed"
	set src in usr
	if(!isliving(usr) || !can_use(usr))
		return

	var/mob/living/L = usr

	if(slowdown == -1)
		slowdown = 0
		L.balloon_alert(L, "faking human speed")
	else
		slowdown = -1
		L.balloon_alert(L, "using true speed")

	L.update_equipment_speed_mods()

/datum/action/cooldown/spell/conjure_item/hidden_knife/fleshstealer
	item_type = /obj/item/knife/combat/the_hidden/fleshstealer

/obj/item/knife/combat/the_hidden/fleshstealer
	desc = "An obscenely sharp and dangerous knife. Backstabs will instantly down. Stab a dead body to gib it, healing you while stealing their appearence. Takes longer to strip flesh than other knives."
	gib_time = 1.5 SECONDS
	var/stolen_name
	var/stolen_icon
	var/stolen_icon_state
	var/list/stolen_overlays

/obj/item/knife/combat/the_hidden/fleshstealer/dead_effect(mob/living/target, mob/living/user)
	user.adjustStaminaLoss(-25)
	user.adjustBruteLoss(-25)
	user.adjustFireLoss(-35)

	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		stolen_name = target.name
		stolen_icon = target.icon
		stolen_icon_state = target.icon_state
		stolen_overlays = H.get_overlays_copy(list(HANDS_LAYER)) //ugh
	else
		target.gib()
		return

	if(ishuman(user))
		var/mob/living/carbon/human/wearer = user
		wearer.real_name = stolen_name
		wearer.icon = stolen_icon
		wearer.icon_state = stolen_icon_state
		wearer.cut_overlays()
		wearer.add_overlay(stolen_overlays)
		wearer.update_held_items()
		wearer.alpha = 255
		wearer.faction |= FACTION_COMBINE //manhack protection


	target.gib()
