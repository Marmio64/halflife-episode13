
/mob/living/AltClickSecondaryOn(var/atom/A)
	var/user_perception = src.get_stat_level(STATKEY_PER)
	if(13 <= user_perception)
		to_chat(src, span_notice("You start to focus far away..."))
		var/look_delay = 4.5 SECONDS - (user_perception * 2) //each point of perception reduces look time by 0.2 seconds. So at 20 perception that reduces it by 4 seconds
		if(do_after(src, look_delay, A))
			src.face_atom(A)//Face what we're zoomed in on.
			src.do_zoom(A)
			return
		else
			to_chat(src, span_notice("You fail to focus."))
			return
	else
		to_chat(src, span_notice("You don't have enough Perception to focus far away."))
