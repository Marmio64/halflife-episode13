/obj/item/stack/credit_voucher
	name = "Reward Voucher"
	desc = "A voucher that citizens can feed into their identification cards for a credit reward. Civil Protection Officers often give these out in exchange for a service done for them, or it may be included in rations."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "voucher"
	singular_name = "reward voucher"
	w_class = WEIGHT_CLASS_SMALL
	max_amount = 10

	custom_price = 5

	var/value = 5

/obj/item/stack/credit_voucher/get_item_credit_value()
	return (amount*value)

/obj/item/stack/credit_voucher/a5
	amount = 5

/obj/item/stack/credit_voucher/a10
	amount = 10

/obj/item/ration_voucher
	name = "Ration Voucher"
	desc = "A voucher that can be inserted into an identification card to add on a ration point, which can then be used to retrieve a ration during a distribution cycle."
	icon = 'hl13/icons/obj/misc_items.dmi'
	icon_state = "ration_voucher"
	w_class = WEIGHT_CLASS_SMALL
