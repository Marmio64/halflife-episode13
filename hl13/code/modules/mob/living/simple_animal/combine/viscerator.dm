/mob/living/simple_animal/hostile/halflife/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASSTABLE | PASSMOB
	combat_mode = TRUE
	mob_biotypes = MOB_ROBOTIC
	loot = list(/obj/item/circuitmaterial)
	health = 55
	maxHealth = 55
	rapid_melee = 2
	melee_damage_lower = 14
	melee_damage_upper = 18
	attack_vis_effect = ATTACK_EFFECT_SLASH
	wound_bonus = -10
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attack_verb_continuous = "cuts"
	attack_verb_simple = "cut"
	attack_sound = 'hl13/sound/creatures/viscerator/grind_flesh1.ogg'
	faction = list(FACTION_COMBINE)
	minbodytemp = 0
	mob_size = MOB_SIZE_TINY
	movement_type = FLYING
	move_to_delay = 2 //super fast spinny death machine
	limb_destroyer = 1
	speak_emote = list("states")
	bubble_icon = "syndibot"
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	death_message = "is smashed into pieces!"
	death_sound = 'hl13/sound/creatures/viscerator/gib.ogg'
	var/operating_power = 100
	var/low_power_melee_damage_lower = 5
	var/low_power_melee_damage_upper = 10

/mob/living/simple_animal/hostile/halflife/viscerator/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/swarming)

/mob/living/simple_animal/hostile/halflife/viscerator/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(operating_power < 1)
		//Viscerators will eventually run low on power and deal less damage.
		melee_damage_lower = low_power_melee_damage_lower
		melee_damage_upper = low_power_melee_damage_upper
	else
		operating_power--

/mob/living/simple_animal/hostile/halflife/viscerator/deathmatch
	health = 150
	maxHealth = 150
	melee_damage_lower = 25
	melee_damage_upper = 30
