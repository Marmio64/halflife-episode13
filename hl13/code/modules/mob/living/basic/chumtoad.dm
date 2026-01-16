/mob/living/basic/halflife/chumtoad
	name = "Chumtoad"
	desc = "A little purple critter. It seems docile enough."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "chumtoad"
	icon_living = "chumtoad"
	icon_dead = "chumtoad_dead"
	faction = list(FACTION_NEUTRAL,FACTION_ANTLION) //it seems they have befriended one another?
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_AQUATIC
	verb_say = "ribbits"
	verb_ask = "ribbits inquisitively"
	verb_exclaim = "croaks"
	verb_yell = "croaks loudly"
	maxHealth = 15
	health = 15
	speed = 1.1
	melee_damage_lower = 5
	melee_damage_upper = 5
	obj_damage = 10
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	melee_attack_cooldown = 2.5 SECONDS
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "pokes"
	response_disarm_simple = "poke"
	response_harm_continuous = "splats"
	response_harm_simple = "splat"
	density = FALSE
	attack_sound = 'sound/items/weapons/bite.ogg'
	butcher_results = list(/obj/item/food/meat/slab/chumtoad = 1)
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	gold_core_spawnable = FRIENDLY_SPAWN
	can_be_held = TRUE
	held_w_class = WEIGHT_CLASS_TINY

	ai_controller = /datum/ai_controller/basic_controller/frog
