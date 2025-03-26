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
	if(combat_mode)
		if(prob(5)) //extra chance to dodge if in combat mode
			var/list/usedp = list("They dodged the blow! Miss!", "They saw it coming! Miss!", "They must've moved! Miss!")
			to_chat(user, "<span class='boldwarning'>[pick(usedp)]</span>")
			flash_fullscreen("blackflash2")
			playsound(get_turf(src), 'hl13/sound/weapons/woosh.ogg', 100, FALSE, -1)
			return TRUE
