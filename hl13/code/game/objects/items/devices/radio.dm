/obj/item/radio/headset/earpiece
	name = "earpiece"
	desc = "A micro sized headset which is barely visible when worn. Fits better on vortigaunt and stalkers, and are sometimes even embedded directly into their ears."
	icon_state = "earpiece"
	worn_icon_state = "earpiece"

/obj/item/radio/off/halflife
	icon_state = "radio"
	icon = 'hl13/icons/obj/radio.dmi'
	name = "old radio"
	desc = "An old radio that can communicate over specified radio waves."

/obj/item/radio/off/halflife/vort
	name = "vortigaunt radio"
	desc = "A standard issue old world radio assigned to vorts so that they can listen to orders given to them over radio waves."

/obj/item/radio/civpro
	name = "civil protection transceiver"
	desc = "A secure walkie talkie which is able to communicate independently of working city communication infrastructure."
	icon = 'hl13/icons/obj/radio.dmi'
	icon_state = "walkietalkie"
	inhand_icon_state = null
	freerange = TRUE
	frequency = 1359
	freqlock = TRUE
	keyslot = /obj/item/encryptionkey/headset_sec
