/obj/item/hl2/loadout_picker/hidden
	help_text_type = "hidden_human"

/obj/item/hl2/loadout_picker/hidden/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/hidden/combine/shotgunner,
			/datum/outfit/deployment_loadout/hidden/combine/riot_cop,
			/datum/outfit/deployment_loadout/hidden/combine/cremator,
			/datum/outfit/deployment_loadout/hidden/combine/conscript,
			/datum/outfit/deployment_loadout/hidden/combine/grunt,
			/datum/outfit/deployment_loadout/hidden/combine/medic_cop,
			/datum/outfit/deployment_loadout/hidden/combine/doctor,
			/datum/outfit/deployment_loadout/hidden/combine/engineer,
			/datum/outfit/deployment_loadout/hidden/combine/scientist,
			/datum/outfit/deployment_loadout/hidden/combine/overseer,
		)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/datum/outfit/deployment_loadout/hidden/combine/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NO_FOV_EFFECT, OUTFIT_TRAIT)
	H.deployment_faction = COMBINE_DEPLOYMENT_FACTION

/datum/outfit/deployment_loadout/hidden/combine
	faction = COMBINE_DEPLOYMENT_FACTION
	id = /obj/item/card/id/combine_tdm

//The defender, shotgunners specialize in demolishing the hidden if they dare get close to them.
//While their armor won't help to stop the hidden's knife, it does help a little bit against their grenades.
/datum/outfit/deployment_loadout/hidden/combine/shotgunner
	name = "Hidden: Shotgunner"
	display_name = "DEFENSE: Shotgunner"
	desc = "Use your high power shotgun to keep the Hidden away from you and your team."
	id_name = "Shotgunner"

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/hand_crank

	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12_hidden
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red/deathmatch

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

//The second defender, riot cop. They're pretty good at holding positions since they have a good chance to parry the Hidden
//They can't aim for shit though and if they do get hit they're still weak to damage.
/datum/outfit/deployment_loadout/hidden/combine/riot_cop
	name = "Hidden: Riot Cop"
	display_name = "DEFENSE: Riot Cop"
	desc = "Hold off the Hidden with your sledgehammer. You don't have any better chances of surviving getting stabbed than your comrades, but have a high chance to parry hits with your melee weapon."
	id_name = "Riotcop"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/riot
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	head = /obj/item/clothing/head/helmet/toggleable/riot

	mask = /obj/item/clothing/mask/gas/civilprotection

	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/hand_crank

	belt = /obj/item/storage/belt/civilprotection/riotcop_hidden

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	back = /obj/item/melee/sledgehammer

	extra_str = 10

/datum/outfit/deployment_loadout/hidden/combine/riot_cop/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_TERRIBLE_AIM, OUTFIT_TRAIT)

//The third defender, cremator. They're very good at holding locations thanks to high damage output and the ability to lay down flame trails.
//However, they're slow, their gun runs out of juice quick, and you need to be careful not to set team mates on fire either...
//They also don't get a flare, since their flame trails can show light.
/datum/outfit/deployment_loadout/hidden/combine/cremator
	name = "Hidden: Cremator"
	display_name = "DEFENSE: Cremator"
	desc = "Keep the Hidden at bay both with flame trails and high power plasma blasts from your immolator. Take care not to ignite your team mates."
	id_name = "Cremator"

	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/cremator
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/cremator
	suit_store = /obj/item/gun/energy/immolator/hidden

	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch/cremator
	gloves = /obj/item/clothing/gloves/color/civilprotection
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch

	belt = /obj/item/halflife/combine_battery

	l_pocket = /obj/item/stack/medical/gauze/quik_gauze
	r_pocket = /obj/item/flashlight/hand_crank

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

/datum/outfit/deployment_loadout/hidden/combine/cremator/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/human/synth/cremator)

//The attacker, conscripts move a bit faster than their comrades and have the best medium to long range weapon.
//They excel at giving chase to the hidden, just don't get cocky.
/datum/outfit/deployment_loadout/hidden/combine/conscript
	name = "Hidden: Conscript"
	display_name = "ASSAULT: Conscript"
	desc = "Utilize your high power M4A1 and extra speed to keep pressure on the Hidden from close and long range."
	id_name = "Conscript"

	suit = /obj/item/clothing/suit/armor/halflife/kevlar/fast
	mask = /obj/item/clothing/mask/gas/hl2/military
	suit_store = /obj/item/gun/ballistic/automatic/m4a1
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/flashlight/hand_crank
	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	head = /obj/item/clothing/head/helmet/halflife/military/weak
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/fingerless

	back = /obj/item/storage/backpack/halflife/satchel/military

	backpack_contents = list(
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/m4a1 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 3

//The other attacker. Mostly an aesthetic difference.
//They have slightly higher close range DPS compared to the conscript, but less long range accuracy and don't have a backup knife.
/datum/outfit/deployment_loadout/hidden/combine/grunt
	name = "Hidden: Grunt"
	display_name = "ASSAULT: Grunt"
	desc = "You have a slightly higher close range damage firearm compared to the conscript but lack their backup knife and longer range accuracy."
	id_name = "Grunt"

	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg_hidden

	suit = /obj/item/clothing/suit/halflife/invis_grunt_harness
	suit_store = /obj/item/gun/ballistic/automatic/pulsesmg/standardpin

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	uniform = /obj/item/clothing/under/combine/grunt/fused/hidden
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt

	l_pocket = /obj/item/gun/ballistic/automatic/pistol/usp
	r_pocket = /obj/item/flashlight/hand_crank

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	extra_dex = 3

//The healer, excels at recovering allies from nonfatal injuries.
//The Hidden tends to finish off prey they have started to hunt, but in the case they don't, you are extremely useful at getting them back to tip top shape!
/datum/outfit/deployment_loadout/hidden/combine/medic_cop
	name = "Hidden: Medical Cop"
	display_name = "HEALER: Medical Cop"
	desc = "Keep your allies healed whenever they get hurt by the Hidden but not killed."
	id_name = "Medic"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/health

	mask = /obj/item/clothing/mask/gas/civilprotection/medical

	l_pocket = /obj/item/flashlight/hand_crank
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/oxycodone = 3,
		/obj/item/reagent_containers/hypospray/medipen/blood = 2,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/mp7 = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden)
	extra_int = 4

//The second healer, excels at recovering allies from nonfatal injuries.
//You have no business fighting, but were brought in to help with healing any survivors. Good luck.
/datum/outfit/deployment_loadout/hidden/combine/doctor
	name = "Hidden: Citizen Doctor"
	display_name = "HEALER: Unarmed Citizen Doctor"
	desc = "You're a knowledgable doctor forcefully taken from a nearby city to help on what looks like a suicide mission. You're light on your feet and packed with medical supples, but are armed with but a scalpel and have zero firearm experience!"
	id_name = "Doctor"

	uniform = /obj/item/clothing/under/citizen
	gloves = /obj/item/clothing/gloves/latex/nitrile
	suit = /obj/item/clothing/suit/whitejacket/fast
	glasses = /obj/item/clothing/glasses/hud/health
	head = /obj/item/clothing/head/soft/paramedic
	mask = /obj/item/clothing/mask/gas/hl2/oldmask_hidden

	l_pocket = /obj/item/flashlight/hand_crank
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

	ears = /obj/item/radio/headset/civilprotection/deployment
	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	belt = /obj/item/defibrillator/compact/loaded

	back = /obj/item/storage/backpack/halflife/satchel

	backpack_contents = list(
		/obj/item/storage/medkit/halflife_combine = 1,
		/obj/item/reagent_containers/hypospray/medipen/blood = 2,
		/obj/item/scalpel/hidden_doctor = 1,
		/obj/item/flashlight/flare/the_hidden = 1,
	)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/medkit/the_hidden/faster)

	extra_int = 6

/datum/outfit/deployment_loadout/hidden/combine/doctor/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_TERRIBLE_AIM, OUTFIT_TRAIT)

/obj/item/scalpel/hidden_doctor
	desc = "A particularly sharp scalpel. While useful for surgery, you have a feeling it'll be even better for stabbing people instead."
	force = 22

//The tracker, you specialize in setting up trip beams at room entrances in order to get a heads up on Hidden activity.
//In addition, you get two more flares than everyone else, which is great for increasing the dismal visiblity your team tends to have! Also, sandbags for defending terminal sites.
//The downside is that you only have a sidearm and are thus extremely vulnerable, unless you manage to get a real gun off a dead teammate.
/datum/outfit/deployment_loadout/hidden/combine/engineer
	name = "Hidden: Engineer"
	display_name = "TRACKER: Engineer"
	desc = "Use trip alarm beams and flares to get extra information on where the enemy is. In addition, wisely use your sandbags to help protect the team during terminal activations."
	id_name = "Engineer"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/engineer
	gloves = /obj/item/clothing/gloves/halflife/engineer

	belt = /obj/item/gun/ballistic/automatic/pistol/usp

	l_pocket = /obj/item/stack/medical/gauze/quik_gauze
	r_pocket = /obj/item/flashlight/hand_crank

	back = /obj/item/storage/backpack/halflife
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	backpack_contents = list(
		/obj/item/ammo_box/magazine/usp9mm = 3,
		/obj/item/stack/sheet/mineral/sandbags = 5,
		/obj/item/flashlight/flare/the_hidden = 3,
		/obj/item/assembly/infra/the_hidden = 4,
	)


/obj/item/assembly/infra/the_hidden
	name = "sonic trip alarm"
	desc = "Emits a visible beam and is triggered when the beam is interrupted, sending out a noise. use in hand to activate. Note, it does not activate for movement on the last tile of it's beam or on the first tile, position it carefully."

	visible = TRUE
	hearing_range = 9
	extra_volume = 10
	visibility_changeable = FALSE

/obj/item/assembly/infra/the_hidden/atom_blocks_beam(atom/movable/beam_atom)
	if(isnull(beam_atom))
		return FALSE
	if(beam_atom == src || beam_atom == holder)
		return FALSE
	// Blocks beams from triggering themselves, important to avoid infinite loops
	if(istype(beam_atom, /obj/effect/ebeam))
		return FALSE
	// Anti-revenant / anti-ghost guard
	if(beam_atom.invisibility)
		return FALSE
	// In general non-dense items should not block beams, but make special cases for things being thrown
	if(!beam_atom.density && !beam_atom.throwing)
		return FALSE
	// The actually important check. Ensures stuff like mobs trip it but stuff like laser projectiles don't
	if(beam_atom.pass_flags_self & beam_pass_flags)
		return FALSE
	if(isitem(beam_atom))
		var/obj/item/beam_item = beam_atom
		if(beam_item.item_flags & ABSTRACT)
			return FALSE
	if(ishuman(beam_atom))
		var/mob/living/carbon/human/H = beam_atom
		if(H.deployment_faction == COMBINE_DEPLOYMENT_FACTION)
			return FALSE

	return TRUE


/obj/item/flashlight/flare/the_hidden
	name = "short-burst flare"
	desc = "A red flare. There are instructions on the side, it reads 'pull cord, make light'. This one has a very limited lifetime, only use when necessary."
	randomize_fuel = FALSE
	fuel = 60 SECONDS

/obj/item/flashlight/hand_crank
	name = "hand-crank flashlight"
	desc = "A hand-held emergency light powered by a hand crank, which can be used in hand to charge it up."
	actions_types = list()

	var/fuel = 0
	var/max_fuel = 60 SECONDS

/obj/item/flashlight/hand_crank/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/flashlight/hand_crank/process(seconds_per_tick)
	fuel -= 1 SECONDS
	check_fuel()

/obj/item/flashlight/hand_crank/proc/check_fuel(seconds_per_tick)
	if(45 SECONDS < fuel)
		set_light_range(4)
		set_light_power(0.55)
		update_brightness()
	else if(30 SECONDS < fuel)
		set_light_range(4)
		set_light_power(0.5)
		update_brightness()
	else if(15 SECONDS < fuel)
		set_light_range(3)
		set_light_power(0.4)
		update_brightness()
	else if(0 < fuel)
		set_light_range(2)
		set_light_power(0.3)
		update_brightness()

	if(!fuel || !light_on)
		set_light_range(0)
		set_light_power(0)
		set_light_on(FALSE)
		STOP_PROCESSING(SSobj, src)

/obj/item/flashlight/hand_crank/attack_self(mob/user)
	user.visible_message(span_notice("[user] starts cranking \the [src]."), span_notice("You start cranking the [initial(src.name)]!"))
	playsound(src, 'hl13/sound/effects/flashlight_crank.ogg', 10, TRUE, extrarange = -3)
	if(do_after(user, 2 SECONDS, src))
		if(fuel == 0)
			set_light_on(TRUE)

		fuel = max_fuel
		check_fuel()
		START_PROCESSING(SSobj, src)

//The second tracker, you specialize in revealing and slowing the Hidden via your unique syringe dart gun.
//The downside is that you suck at actually doing any real harm to the Hidden.
/datum/outfit/deployment_loadout/hidden/combine/scientist
	name = "Hidden: Scientist"
	display_name = "TRACKER: Scientist"
	desc = "Use a special syringe gun which can fire chemicals into the Hidden in order to slow them and make them glow for a while."
	id_name = "Scientist"

	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/utility/radiation/cleanup/scientist/no_slow
	head = /obj/item/clothing/head/utility/radiation/scientist
	mask = /obj/item/clothing/mask/gas/cwuengi
	shoes = /obj/item/clothing/shoes/halflife/cleanup
	gloves = /obj/item/clothing/gloves/halflife/cleanup

	suit_store =  /obj/item/gun/syringe/two_capacity

	belt = /obj/item/gun/ballistic/automatic/pistol/usp
	l_pocket = /obj/item/ammo_box/magazine/usp9mm
	r_pocket = /obj/item/flashlight/hand_crank

	back = /obj/item/storage/backpack/halflife
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	backpack_contents = list(
		/obj/item/reagent_containers/syringe/piercing/hidden_scientist = 10,
		/obj/item/flashlight/flare/the_hidden = 3,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/usp9mm = 1,
	)

/obj/item/reagent_containers/syringe/piercing/hidden_scientist
	name = "syringe (scientist mix)"
	desc = "Contains glowing compounds and harmful muscle blockers."
	list_reagents = list(/datum/reagent/consumable/tinlux = 5, /datum/reagent/slowing_compound = 3)
	inject_flags = INJECT_CHECK_IGNORE_PIERCEIMMUNITY | INJECT_CHECK_PENETRATE_THICK

//The third tracker, you specialize in deploying manhacks that will follow and attack The Hidden.
//You don't get a primary weapon however, and your viscerators deal very low damage, and are better at tracking and soaking up a knife hit or two than actually attacking.
/datum/outfit/deployment_loadout/hidden/combine/overseer
	name = "Hidden: Overseer"
	display_name = "TRACKER: Viscerator Overseer"
	desc = "Deploy viscerators that deal low damage, but can distract and track the Hidden, while keeping areas lit up with flares."
	id_name = "Overseer"

	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/overseer
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	mask = /obj/item/clothing/mask/gas/civilprotection/overseer
	ears = /obj/item/radio/headset/civilprotection/deployment

	combat_music = 'hl13/sound/ambience/bgm/dark_interval_bgm_10.ogg'

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	back = /obj/item/storage/backpack/halflife/satchel/civilprotection

	r_pocket = /obj/item/flashlight/hand_crank

	backpack_contents = list(
		/obj/item/grenade/spawnergrenade/manhacks/hidden = 3,
		/obj/item/flashlight/flare/the_hidden = 3,
		/obj/item/stack/medical/gauze/quik_gauze = 1,
		/obj/item/ammo_box/magazine/usp9mm = 2,
	)
