/datum/action/cooldown/spell/conjure_item/infinite_guns/vort_blast
	name = "Vortal Blast"
	cooldown_time = 4 SECONDS
	desc = "Use the vortessence to ready a vortal bolt in your hand."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "blast"
	background_icon_state = "bg_nature"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	item_type = /obj/item/gun/ballistic/rifle/enchanted/vort_blast

/obj/item/gun/ballistic/rifle/enchanted/vort_blast
	name = "vortal blast"
	desc = "Galunga. Do not attempt to dual wield."
	slot_flags = 0
	pin = /obj/item/firing_pin/magic
	guns_left = 0
	icon = 'icons/obj/weapons/hand.dmi'
	fire_sound = "hl13/sound/weapons/attack_charge.ogg"
	icon_state = "mansus"
	inhand_icon_state = "vort"
	lefthand_file = 'icons/mob/inhands/items/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/touchspell_righthand.dmi'
	item_flags = NEEDS_PERMIT | DROPDEL | ABSTRACT | NOBLUDGEON
	flags_1 = NONE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

	spread = -15

	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast

/obj/item/ammo_box/magazine/internal/boltaction/enchanted/vort_blast
	max_ammo = 1
	ammo_type = /obj/item/ammo_casing/magic/vort_blast

/obj/item/ammo_casing/magic/vort_blast
	projectile_type = /obj/projectile/magic/vort_blast

/obj/projectile/magic/vort_blast
	name = "vortal bolt"
	icon_state = "xray"
	damage = 35
	damage_type = BURN
	armour_penetration = 20
	hitsound = 'hl13/sound/weapons/attack_shoot.ogg'

/datum/action/cooldown/spell/touch/vort_heal
	name = "Mend"
	desc = "Use the vortessence and ready your hand to be able to heal someone other than yourself."
	background_icon_state = "bg_nature"
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "mend"

	cooldown_time = 8 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	invocation_type = INVOCATION_NONE

	hand_path = /obj/item/melee/touch_attack/vort_heal

/obj/item/melee/touch_attack/vort_heal
	name = "Mending Hand"
	desc = "A healing ball of vortal energy."
	icon_state = "mansus"
	inhand_icon_state = "vort"

/datum/action/cooldown/spell/touch/vort_heal/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/caster)
	playsound(caster, 'hl13/sound/weapons/attack_shoot.ogg', 50, TRUE)
	victim.adjustBruteLoss(-30)
	victim.adjustFireLoss(-30)
	victim.visible_message(span_bold("[victim] appears to flash colors of green, before seemingly appearing healthier!"))
	to_chat(victim, span_warning("You feel soothed."))
	return TRUE

/datum/action/cooldown/spell/list_target/telepathy/vort
	desc = "Use the vortessence to telepathically transmit a message to the target."
	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "telepathy"
	background_icon_state = "bg_nature"

/datum/action/cooldown/spell/aoe/repulse/wizard/vort
	name = "Vortal Repulse"
	desc = "Clear your surroundings with the power of the vortessence."
	background_icon_state = "bg_nature"
	invocation = "TO THE VOID"
	cooldown_time = 25 SECONDS
	aoe_radius = 4
	cooldown_reduction_per_rank = 4 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
