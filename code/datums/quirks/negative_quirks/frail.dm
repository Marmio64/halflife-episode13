/datum/quirk/frail
	name = "Frail"
	desc = "You have a weak constitution, which lowers your endurance. You're more effected by pain, and are more easily wounded than others."
	icon = FA_ICON_SKULL
	value = -7
	gain_text = span_danger("You feel frail.")
	lose_text = span_notice("You feel sturdy again.")
	medical_record_text = "Patient has a weak constitution, and is prone to injury and pain. Please take all due diligence to avoid possible malpractice suits."
	hardcore_value = 4
	mail_goodies = list(/obj/effect/spawner/random/medical/minor_healing)

/datum/quirk/frail/add()
	quirk_holder.change_stat(STATKEY_END, -3)

/datum/quirk/frail/remove()
	quirk_holder.change_stat(STATKEY_END, -3)

