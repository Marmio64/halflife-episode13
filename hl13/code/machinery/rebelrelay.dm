/obj/item/rebel_relay
	name = "rebel uplink relay"
	desc = "A clunky and huge signal dish hooked up to a remote teleportation relay that is capable of sending over small items. It seems to have an intake port capable of taking combine datapods and xenian telecrystals."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "rebelrelay"
	w_class = WEIGHT_CLASS_HUGE

	drag_slowdown = 1
	slowdown = 1

/obj/item/rebel_relay/Initialize(mapload, owner, tc_amount = 10, datum/uplink_handler/uplink_handler_override = null)
	. = ..()
	AddComponent(\
		/datum/component/uplink, \
		owner = owner, \
		lockable = FALSE, \
		enabled = TRUE, \
		uplink_flag = UPLINK_TRAITORS, \
		starting_tc = 10, \
		uplink_handler_override = uplink_handler_override, \
	)

/obj/item/rebel_relay/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/combine_datapod))
		to_chat(usr, span_notice("Datapod accepted. Dispensing reward."))
		new /obj/item/stack/telecrystal(user.loc, 10)
		qdel(I)
		return
	..()

/datum/action/cooldown/spell/uprising/calldown_relay
	name = "Calldown Rebel Relay"
	desc = "After a short calling period, teleport a rebel uplink relay to your position. \
		You can only summon a relay once, and moving relays is very difficult and conspicuous, so make sure you have this relay in a good spot. \
		This relay is a gateway for using Combine Datapods and Xenian Telecrystals to purchase gear that you require. It only comes with a few telecrystals, so you'll need to get more."
	button_icon_state = "callrelay"

	cooldown_time = 1 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = SPELL_REQUIRES_MIND
	antimagic_flags = 0
	spell_max_level = 1

/datum/action/cooldown/spell/uprising/calldown_relay/cast(mob/living/cast_on)
	. = ..()

	to_chat(cast_on, span_green("You begin to call down your uplink relay..."))
	if(!do_after(cast_on, 5 SECONDS))
		to_chat(cast_on, span_warning("You halt the call."))
		return

	new /obj/item/rebel_relay(cast_on.loc)
	qdel(src)
