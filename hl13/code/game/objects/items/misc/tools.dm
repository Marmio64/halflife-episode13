/obj/item/halflife/brick
	name = "brick"
	desc = "A simple brick. Surpisingly deadly."
	icon = 'hl13/icons/obj/tools/tools_inventory.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/items_righthand.dmi'
	icon_state = "brick"
	inhand_icon_state = "brick"
	hitsound = 'hl13/sound/halflifeweapons/meleesounds/genericblunt_hit.ogg'
	pickup_sound = 'hl13/sound/halflifeweapons/meleesounds/general_grip.ogg'
	attack_verb_continuous = list("clonks", "smacks", "clocks", "nails", "bludgeons", "whacks", "bonks", "bricks")
	attack_verb_simple = list("clonk", "smack", "clock", "nail", "bludgeon", "whack", "bonk", "brick")
	force = 18
	throwforce = 20 //brick
	throw_speed = 1.5
	throw_range = 6
	wound_bonus = 0
	bare_wound_bonus = 5
	w_class = WEIGHT_CLASS_SMALL
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF
