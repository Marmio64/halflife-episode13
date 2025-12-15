/mob/living/basic/halflife/zombie/gonome
	name = "Gestating Fungal Gonome"
	desc = "A rapidly developing abomination of flesh and fungus. New pieces grow on it in real time. It must be stopped before it finishes this process."
	icon = 'hl13/icons/mob/halflife_tall.dmi'
	icon_state = "weakgonome"
	icon_living = "weakgonome"
	icon_dead = "gonome_dead"
	melee_damage_lower = 25
	melee_damage_upper = 35
	armour_penetration = 20
	maxHealth = 350
	health = 350
	obj_damage = 25
	wound_bonus = -20
	butcher_results = list(/obj/item/food/meat/slab/halflife/zombie = 3, /obj/item/stack/sheet/animalhide/goliath_hide = 3)
	crabless_possible = FALSE
	lighting_cutoff_red = 15
	lighting_cutoff = 35
	speed = 1.85
	fungalheal = TRUE
	fungalheal_amt = 0.05

	mob_size = MOB_SIZE_LARGE

	can_play_dead = FALSE

	attack_sound = 'hl13/sound/creatures/gonome/attack_player.ogg'
	death_sound = 'hl13/sound/creatures/gonome/react_minor_scream_03.ogg'
	//aggro_sound = 'hl13/sound/creatures/gonome/react_minor_scream_01.ogg'
	idle_sounds = list('hl13/sound/creatures/gonome/wander_breath_in_01.ogg', 'hl13/sound/creatures/gonome/wander_breath_in_02.ogg', 'hl13/sound/creatures/gonome/wander_breath_in_03.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_01.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_02.ogg', 'hl13/sound/creatures/gonome/wander_breath_out_03.ogg')

	var/playstyle_string = span_notice("You are a Fungal Gonome, an abomination of flesh and fungus. Consume the corpses of creatures to gain nutrition, so you may complete your gestation, and to be able to create headcrabs for taking over the district.")

	hud_type = /datum/hud/ooze
	var/fungal_nutrition = 50

	///How long does it take to create a headcrab?
	var/headcrab_delay = 4 SECONDS

	var/fully_grown = FALSE

	var/datum/action/cooldown/spell/conjure/xenfloor/gonome/infest

	/// Our evolve action
	var/datum/action/innate/gonome/evolve/evolve_action
	/// Our headcrab action
	var/datum/action/innate/gonome/headcrab/headcrab_action

/mob/living/basic/halflife/zombie/gonome/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_GONOME)

	infest = new(src)
	infest.Grant(src)

	evolve_action = new (src)
	evolve_action.Grant(src)

	headcrab_action = new (src)
	headcrab_action.Grant(src)

	RegisterSignal(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(pre_attack))

	updateNutritionDisplay()

/// Before we attack something, check if we want to do something else instead
/mob/living/basic/halflife/zombie/gonome/proc/pre_attack(mob/living/source, atom/target)
	SIGNAL_HANDLER
	if (target == src)
		return COMPONENT_HOSTILE_NO_ATTACK // Easy to misclick yourself, let's not
	if (!isliving(target))
		return
	var/mob/living/living_target = target
	if (living_target.stat != DEAD)
		return
	INVOKE_ASYNC(src, PROC_REF(try_eat), living_target)
	return COMPONENT_HOSTILE_NO_ATTACK

/// Try devouring
/mob/living/basic/halflife/zombie/gonome/proc/try_eat(atom/movable/food)
	balloon_alert(src, "devouring...")
	if (do_after(src, 3 SECONDS, target = food))
		if(isliving(food))
			var/mob/living/livvy = food
			livvy.gib(DROP_ALL_REMAINS)
			if(ishuman(food))
				adjust_fungal_nutrition(100)
			else
				adjust_fungal_nutrition(10)

///Does fungal_nutrition + supplied amount and clamps it within 0 and 500
/mob/living/basic/halflife/zombie/gonome/proc/adjust_fungal_nutrition(amount)
	fungal_nutrition = clamp(fungal_nutrition + amount, 0, 500)
	updateNutritionDisplay()

///Updates the display that shows the mobs nutrition
/mob/living/basic/halflife/zombie/gonome/proc/updateNutritionDisplay()
	if(hud_used) //clientless zombies
		hud_used.alien_plasma_display.maptext = MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='green'>[round(fungal_nutrition)]</font></div>")

/mob/living/basic/halflife/zombie/gonome/deployment
	melee_damage_lower = 22
	melee_damage_upper = 26
	armour_penetration = 0
	maxHealth = 200
	health = 200
	obj_damage = 18
	speed = 2.5
	fungalheal_amt = 0.1
	fully_grown = TRUE //cannot grow fully

/mob/living/basic/halflife/zombie/gonome/complete
	name = "Fungal Gonome"
	desc = "A massive, grotesque abomination of flesh and fungas. A horror, which should not be."
	icon_state = "gonome"
	icon_living = "gonome"
	melee_damage_lower = 30
	melee_damage_upper = 35
	speed = 1.6
	maxHealth = 425
	health = 425
	fully_grown = TRUE

/mob/living/basic/halflife/zombie/gonome/complete/deployment
	speed = 1.4
	headcrab_delay = 3 SECONDS

/mob/living/basic/halflife/zombie/gonome/Login()
	..()
	to_chat(src, playstyle_string)

/datum/action/innate/gonome
	check_flags = AB_CHECK_CONSCIOUS
	button_icon = 'hl13/icons/mob/actions/actions_gonome.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	///Does the ability cost nutrition?
	var/nutrition_cost = 0
	///Do you need to be evolved to use?
	var/need_growth = FALSE

/datum/action/innate/gonome/IsAvailable(feedback = FALSE)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/basic/halflife/zombie/gonome/slime_owner = owner

	if(slime_owner.fungal_nutrition < nutrition_cost)
		return FALSE

	if(need_growth && !slime_owner.fully_grown)
		return FALSE

	return TRUE

//Evolving

/datum/action/innate/gonome/evolve
	name = "Evolve"
	button_icon_state = "evolve"
	desc = "Complete your gestation, and turn into an armored and more deadly gonome. Requires 500 nutrition."
	nutrition_cost = 500

///Turns a baby slime into an adult slime
/datum/action/innate/gonome/evolve/Activate()
	var/mob/living/basic/halflife/zombie/gonome/slime_owner = owner

	if(slime_owner.fully_grown)
		slime_owner.balloon_alert(slime_owner, "already adult!")
		return
	if(slime_owner.fungal_nutrition < nutrition_cost)
		slime_owner.balloon_alert(slime_owner, "need food!")
		return

	slime_owner.balloon_alert(slime_owner, "evolving...")
	if (do_after(slime_owner, 4 SECONDS, slime_owner))

		slime_owner.adjust_fungal_nutrition(-nutrition_cost)

		slime_owner.name = "Fungal Gonome"
		slime_owner.desc = "A massive, grotesque abomination of flesh and fungas. A horror, which should not be."
		slime_owner.icon_state = "gonome"
		slime_owner.icon_living = "gonome"
		slime_owner.melee_damage_lower = 30
		slime_owner.melee_damage_upper = 35
		slime_owner.maxHealth = 475
		slime_owner.fully_grown = TRUE
		slime_owner.speed = 1.6

/datum/action/innate/gonome/headcrab
	name = "Create Headcrab"
	button_icon_state = "headcrab"
	desc = "Spit out an armored headcrab after a short delay, which can be controlled by ghosts and latch onto dying people. Requires 25 nutrition."
	nutrition_cost = 25

///Spit out a armored headcrab
/datum/action/innate/gonome/headcrab/Activate()
	var/mob/living/basic/halflife/zombie/gonome/slime_owner = owner

	if(slime_owner.fungal_nutrition < nutrition_cost)
		slime_owner.balloon_alert(slime_owner, "need food!")
		return

	slime_owner.balloon_alert(slime_owner, "creating headcrab...")
	if (do_after(slime_owner, slime_owner.headcrab_delay, slime_owner))
		slime_owner.adjust_fungal_nutrition(-nutrition_cost)
		new /mob/living/basic/halflife/headcrab/armored/ghost_controlled(slime_owner.loc)
