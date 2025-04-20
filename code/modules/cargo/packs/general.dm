/datum/supply_pack/misc
	group = "Miscellaneous Supplies"

/datum/supply_pack/misc/commandkeys
	name = "Command Encryption Key Crate"
	desc = "A pack of encryption keys that give access to the command radio network. \
		The Combine reminds unauthorized citizens not to eavesdrop in on secure communications channels."
	access_view = ACCESS_COMMAND
	access = ACCESS_COMMAND
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/encryptionkey/headset_com = 3)
	crate_type = /obj/structure/closet/crate/secure/centcom
	crate_name = "command encryption key crate"

/datum/supply_pack/misc/paper
	name = "Bureaucracy Crate"
	desc = "High stacks of papers on your desk are a big problem - make it pea-sized with \
		these bureaucratic supplies! Contains six pens, some camera film, hand labeler supplies, \
		a paper bin, a carbon paper bin, three folders, a laser pointer, two clipboards and two stamps."
	cost = CARGO_CRATE_VALUE * 3.2
	contains = list(/obj/structure/filingcabinet/chestdrawer/wheeled,
					/obj/item/camera_film,
					/obj/item/hand_labeler,
					/obj/item/hand_labeler_refill = 2,
					/obj/item/paper_bin,
					/obj/item/paper_bin/carbon,
					/obj/item/pen/fourcolor = 2,
					/obj/item/pen,
					/obj/item/pen/fountain,
					/obj/item/pen/blue,
					/obj/item/pen/red,
					/obj/item/folder/blue,
					/obj/item/folder/red,
					/obj/item/folder/yellow,
					/obj/item/clipboard = 2,
					/obj/item/stamp,
					/obj/item/stamp/denied,
					/obj/item/laser_pointer/purple,
				)
	crate_name = "bureaucracy crate"

/datum/supply_pack/misc/fountainpens
	name = "Calligraphy Crate"
	desc = "Sign death warrants in style with these seven executive fountain pens."
	cost = CARGO_CRATE_VALUE * 1.45
	contains = list(/obj/item/storage/box/fountainpens)
	crate_type = /obj/structure/closet/crate/wooden
	crate_name = "calligraphy crate"

/datum/supply_pack/misc/candles_bulk
	name = "Candle Box Crate"
	desc = "Keep your local chapel lit with three candle boxes!"
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/storage/fancy/candle_box = 3)
	crate_name = "candle box crate"

/datum/supply_pack/misc/toner
	name = "Toner Crate"
	desc = "Spent too much ink printing butt pictures? Fret not, with these six toner refills, \
		you'll be printing butts 'till the cows come home!'"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/toner = 6)
	crate_name = "toner crate"

/datum/supply_pack/misc/toner_large
	name = "Toner Crate (Large)"
	desc = "Tired of changing toner cartridges? These six extra heavy duty refills contain \
		roughly five times as much toner as the base model!"
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/toner/large = 6)
	crate_name = "large toner crate"

///Special supply crate that generates random syndicate gear up to a determined TC value
/datum/supply_pack/misc/syndicate
	name = "Assorted Syndicate Gear"
	desc = "Contains a random assortment of syndicate gear."
	special = TRUE //Cannot be ordered via cargo
	contains = list()
	crate_name = "syndicate gear crate"
	crate_type = /obj/structure/closet/crate
	///Total TC worth of contained uplink items
	var/crate_value = 30
	///What uplink the contents are pulled from
	var/contents_uplink_type = UPLINK_TRAITORS

///Generate assorted uplink items, taking into account the same surplus modifiers used for surplus crates
/datum/supply_pack/misc/syndicate/fill(obj/structure/closet/crate/C)
	var/list/uplink_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/item = SStraitor.uplink_items_by_type[item_path]
		if(item.purchasable_from & contents_uplink_type && item.item)
			uplink_items += item

	while(crate_value)
		var/datum/uplink_item/uplink_item = pick(uplink_items)
		if(!uplink_item.surplus || prob(100 - uplink_item.surplus))
			continue
		if(length(uplink_item.restricted_roles) || length(uplink_item.restricted_species))
			continue
		if(crate_value < uplink_item.cost)
			continue
		crate_value -= uplink_item.cost
		new uplink_item.item(C)

///Syndicate supply crate that can have its contents value changed by admins, uses a seperate datum to avoid having admins touch the original one.
/datum/supply_pack/misc/syndicate/custom_value

/datum/supply_pack/misc/syndicate/custom_value/proc/setup_contents(value, uplink)
	crate_value = value
	contents_uplink_type = uplink

/datum/supply_pack/misc/papercutter
	name = "Paper Cutters Crate"
	desc = "Contains 3 office-grade paper cutters, equipped with sharp blades that can cut any paper into two thin slips.\
		Comes with one replacement blade."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(
		/obj/item/papercutter = 3,
		/obj/item/hatchet/cutterblade = 1,
	)
	crate_name = "paper cutters crate"

/datum/supply_pack/misc/vouchers
	name = "Reward Voucher Crate"
	desc = "A large crate with 40 reward vouchers, totalling to 200 credits. A useful way for giving out rewards to citizens with less risk of Civil Protection embezzlement."
	cost = 200 + CARGO_CRATE_VALUE * 1.4 //No credit or loss or gain
	contains = list(/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10,
					/obj/item/stack/credit_voucher/a10)
	crate_name = "reward voucher crate"

/datum/supply_pack/misc/ration_vouchers
	name = "Ration Voucher Crate"
	desc = "A crate with five ration vouchers inside. The vouchers can be inserted into an ID to gain a usuable ration token, useful to give out as a reward perhaps, and is cheaper than buying rations wholesale."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/item/ration_voucher,
					/obj/item/ration_voucher,
					/obj/item/ration_voucher,
					/obj/item/ration_voucher,
					/obj/item/ration_voucher)
	crate_name = "ration voucher crate"
