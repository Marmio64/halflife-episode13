/mob/living/proc/checkmiss(mob/living/user)
	if(user == src)
		return FALSE
	if(stat)
		return FALSE
	if(body_position == LYING_DOWN)
		return FALSE
	if(incapacitated)
		return FALSE
	if(prob(3)) //small chance to just straight up miss
		var/list/usedp = list("Critical miss!", "You come up short in your swing! Critical Miss!", "It can't be! Critical miss!", "Bad luck! Critical miss!", "What?! Critical miss!")
		to_chat(user, "<span class='boldwarning'>[pick(usedp)]</span>")
		flash_fullscreen("blackflash2")
		playsound(get_turf(src), 'hl13/sound/weapons/woosh.ogg', 100, FALSE, -1)
		return TRUE

/mob/living/proc/checkdefense(obj/item/masteritem, mob/living/user)
	testing("begin defense")
	if(!combat_mode)
		return FALSE
	if(stat != CONSCIOUS)
		return FALSE
	if(!canparry && !candodge) //mob can do neither of these
		return FALSE
	if(user == src)
		return FALSE
	if(!(mobility_flags & MOBILITY_MOVE))
		return FALSE

	var/prob2defend = 20
	var/mob/living/H = src
	var/mob/living/U = user
	if(H && U)
		prob2defend = 0

	if(check_behind(user, src)) //If the attacker is on the three tiles behind the defender, there is no chance you're parrying them.
		return FALSE

	if(prob(25) && world.time > last_dodge + dodge_cooldown) //chance to dodge. Dodging is more reliable than parries and increases TTK even for unarmed people, but there is decent cooldown on dodges
		last_dodge = world.time
		var/list/usedp = list("They dodged the blow! Miss!", "They saw it coming! Miss!", "They evaded my hit! Miss!")
		to_chat(user, "<span class='boldwarning'>[pick(usedp)]</span>")
		flash_fullscreen("blackflash2")
		to_chat(src, "<span class='warning'>I just barely dodge an attack from [user]!</span>")
		playsound(get_turf(src), 'hl13/sound/weapons/woosh.ogg', 100, FALSE, -1)
		return TRUE

	if(move_intent == MOVE_INTENT_RUN)
		prob2defend = max(prob2defend-15,0)

	switch(d_intent)
		if(INTENT_PARRY)
			if(HAS_TRAIT(src, TRAIT_CHUNKYFINGERS))
				return FALSE
			if(pulledby == user && pulledby.grab_state >= GRAB_AGGRESSIVE)
				return FALSE
			if(pulling == user && grab_state >= GRAB_AGGRESSIVE)
				return FALSE
			last_parry = world.time
			var/drained = 10
			var/weapon_parry = FALSE
			var/offhand_defense = 0
			var/mainhand_defense = 0
			var/highest_defense = 0
			var/obj/item/mainhand = get_active_held_item()
			var/obj/item/offhand = get_inactive_held_item()
			var/obj/item/used_weapon = mainhand
			var/force_shield = FALSE // If our offhand weapon is a shield type, turn this on to force us to block with it.


			if(mainhand)
				if(mainhand.can_parry)
					mainhand_defense += (mainhand.wdefense * 10)
					weapon_parry = TRUE
			if(offhand)
				if(offhand.can_parry)
					weapon_parry = TRUE
					offhand_defense += (offhand.wdefense * 10)
					if(istype(offhand, /obj/item/shield))
						force_shield = TRUE
					else
						offhand_defense += (offhand.wdefense * 10)
			if(!force_shield)
				if(mainhand_defense >= offhand_defense)
					highest_defense += mainhand_defense
				else
					used_weapon = offhand // If our offhand wins the defense thug-of-war, use it
					highest_defense += offhand_defense
			else
				used_weapon = offhand // Forced to parry with offhand since we have a shield there.
				highest_defense += offhand_defense

			prob2defend += highest_defense

			if(!(mobility_flags & MOBILITY_STAND))	// checks if laying down and applies 20% defense malus if so
				prob2defend *= 0.8
			prob2defend = clamp(prob2defend, 5, 95)

			if(!prob(prob2defend))
				to_chat(src, "<span class='warning'>The enemy defeated my parry!</span>")
				return FALSE

			if(weapon_parry == TRUE)
				if(do_parry(used_weapon, drained, user)) //show message

					if(prob(66) && masteritem)
						if((used_weapon.obj_flags & CONDUCTS_ELECTRICITY) && (masteritem.obj_flags & CONDUCTS_ELECTRICITY))
							flash_fullscreen("whiteflash")
							user.flash_fullscreen("whiteflash")
							var/datum/effect_system/spark_spread/S = new()
							var/turf/front = get_step(src,src.dir)
							S.set_up(1, 1, front)
							S.start()
						else
							flash_fullscreen("blackflash2")
					else
						flash_fullscreen("blackflash2")

					return TRUE
				else
					return FALSE

			if(weapon_parry == FALSE)
				testing("failparry")
				return FALSE

/mob/proc/do_parry(obj/item/W, parrydrain as num, mob/living/user)
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(H.staminaloss < 100)
			if(W)
				playsound(get_turf(src), pick(W.parrysound), 100, FALSE)
			if(istype(W, /obj/item/shield))
				src.visible_message("<span class='boldwarning'><b>[src]</b> blocks [user] with [W]!</span>")
				var/shieldur
				shieldur = round(((W.atom_integrity / W.max_integrity) * 100), 1)
				if(shieldur <= 30)
					src.visible_message("<span class='boldwarning'><b>\The [W] is about to break!</b></span>")
			else
				src.visible_message("<span class='boldwarning'><b>[src]</b> parries [user] with [W]!</span>")
			H.adjustStaminaLoss(5)
			return TRUE
		else
			to_chat(src, "<span class='warning'>I'm too tired to parry!</span>")
			return FALSE //crush through
	else
		if(W)
			playsound(get_turf(src), pick(W.parrysound), 100, FALSE)
		return TRUE

