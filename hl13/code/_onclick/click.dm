
/mob/living/AltClickSecondaryOn(var/atom/A)
	if(HAS_TRAIT(src, TRAIT_EAGLE_EYED))
		to_chat(src, span_notice("You start to focus far away..."))
		if(do_after(src, 1 SECONDS, A))
			src.face_atom(A)//Face what we're zoomed in on.
			src.do_zoom(A)
			return
		else
			to_chat(src, span_notice("You fail to focus."))
			return
