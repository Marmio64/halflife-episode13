/datum/atom_hud/data/human/tdm_hud_reb
	hud_icons = list(TDM_HUD_REB)

/datum/atom_hud/data/human/tdm_hud_com
	hud_icons = list(TDM_HUD_COM)

/mob/living/carbon/human/proc/tdm_hud_reb()
	var/image/holder = hud_list[TDM_HUD_REB]
	var/icon/hud_icon = icon(icon, icon_state, dir)
	holder.pixel_y = hud_icon.Height() - ICON_SIZE_Y
	holder.icon_state = "hudfan_no"

	var/obj/item/clothing/under/undershirt = w_uniform
	if(!istype(undershirt))
		set_hud_image_inactive(TDM_HUD_REB)
		return

	for(var/accessory in undershirt.attached_accessories)
		if(istype(accessory, /obj/item/clothing/accessory/rebel_dogtags/captain))
			holder.icon_state = "hudrebel_c"
			break
		if(istype(accessory, /obj/item/clothing/accessory/rebel_dogtags))
			holder.icon_state = "hudrebel"
			break

	set_hud_image_active(TDM_HUD_REB)
	return

/mob/living/carbon/human/proc/tdm_hud_com()
	var/image/holder = hud_list[TDM_HUD_COM]
	var/icon/hud_icon = icon(icon, icon_state, dir)
	holder.pixel_y = hud_icon.Height() - ICON_SIZE_Y
	holder.icon_state = "hudfan_no"

	var/obj/item/clothing/under/undershirt = w_uniform
	if(!istype(undershirt))
		set_hud_image_inactive(TDM_HUD_COM)
		return

	for(var/accessory in undershirt.attached_accessories)
		if(istype(accessory, /obj/item/clothing/accessory/combine_dogtags/captain))
			holder.icon_state = "hudcombine_c"
			break
		if(istype(accessory, /obj/item/clothing/accessory/combine_dogtags))
			holder.icon_state = "hudcombine"
			break

	set_hud_image_active(TDM_HUD_COM)
	return

/obj/item/clothing/accessory/rebel_dogtags
	name = "rebel dogtags"
	desc = "Dogtags used by the rebels. Lazily designed, only showing one's allegiance rather than specific information."
	icon_state = "dogtags" //completely invisible

/obj/item/clothing/accessory/rebel_dogtags/captain

/obj/item/clothing/accessory/rebel_dogtags/can_attach_accessory(obj/item/clothing/under/attach_to, mob/living/user)
	. = ..()
	if(!.)
		return
	if(locate(/obj/item/clothing/accessory/combine_dogtags) in attach_to.attached_accessories)
		if(user)
			attach_to.balloon_alert(user, "can't pick both sides!")
		return FALSE
	return TRUE

/obj/item/clothing/accessory/rebel_dogtags/accessory_equipped(obj/item/clothing/under/clothes, mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.tdm_hud_reb()

/obj/item/clothing/accessory/rebel_dogtags/accessory_dropped(obj/item/clothing/under/clothes, mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.tdm_hud_reb()

/obj/item/clothing/accessory/combine_dogtags
	name = "combine dogtags"
	desc = "Dogtags used by the combine. Lazily designed, only showing one's allegiance rather than specific information."
	icon_state = "dogtags"

/obj/item/clothing/accessory/combine_dogtags/captain

/obj/item/clothing/accessory/combine_dogtags/can_attach_accessory(obj/item/clothing/under/attach_to, mob/living/user)
	. = ..()
	if(!.)
		return
	if(locate(/obj/item/clothing/accessory/rebel_dogtags) in attach_to.attached_accessories)
		if(user)
			attach_to.balloon_alert(user, "can't pick both sides!")
		return FALSE
	return TRUE

/obj/item/clothing/accessory/combine_dogtags/accessory_equipped(obj/item/clothing/under/clothes, mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.tdm_hud_com()

/obj/item/clothing/accessory/combine_dogtags/accessory_dropped(obj/item/clothing/under/clothes, mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.tdm_hud_com()
