///Your favourite Jojoke. Used for the gloves of the north star.
/datum/component/wearertargeting/punchcooldown
	signals = list(COMSIG_LIVING_UNARMED_ATTACK, COMSIG_LIVING_SLAP_MOB)
	mobtype = /mob/living/carbon
	proctype = PROC_REF(reducecooldown)
	valid_slots = list(ITEM_SLOT_GLOVES)
	///The warcry this generates
	var/warcry = "AT"

	var/punch_speed = CLICK_CD_RAPID

/datum/component/wearertargeting/punchcooldown/Initialize(warcry = "AT", punch_speed = CLICK_CD_RAPID)
	. = ..()
	if(. == COMPONENT_INCOMPATIBLE)
		return
	RegisterSignal(parent, COMSIG_ITEM_ATTACK_SELF, PROC_REF(changewarcry))
	src.warcry = warcry
	src.punch_speed = punch_speed

///Called on COMSIG_LIVING_UNARMED_ATTACK. Yells the warcry and and reduces punch cooldown.
/datum/component/wearertargeting/punchcooldown/proc/reducecooldown(mob/living/carbon/M, atom/target)
	if((M.combat_mode && isliving(target)) || istype(M.get_active_held_item(), /obj/item/hand_item/slapper))
		M.changeNext_move(punch_speed)
		if(warcry)
			M.say(warcry, ignore_spam = TRUE, forced = "north star warcry")

///Called on COMSIG_ITEM_ATTACK_SELF. Allows you to change the warcry.
/datum/component/wearertargeting/punchcooldown/proc/changewarcry(datum/source, mob/user)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(do_changewarcry), user)

/datum/component/wearertargeting/punchcooldown/proc/do_changewarcry(mob/user)
	var/input = tgui_input_text(user, "What do you want your battlecry to be?", "Battle Cry", max_length = 6)
	if(!QDELETED(src) && !QDELETED(user) && !user.Adjacent(parent))
		return
	if(input)
		warcry = input
