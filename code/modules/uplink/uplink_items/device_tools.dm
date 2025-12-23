/datum/uplink_category/device_tools
	name = "Misc. Gadgets"
	weight = 3

/datum/uplink_item/device_tools
	category = /datum/uplink_category/device_tools

/datum/uplink_item/device_tools/encryptionkey
	name = "Lambda Encryption Key"
	desc = "A key that, when inserted into a radio headset, allows you to listen to all district department channels \
			as well as talk on an encrypted Rebel channel with other agents that have the same key. In addition, this key also protects \
			your headset from radio jammers."
	item = /obj/item/encryptionkey/syndicate
	cost = 4
	surplus = 75
	restricted = TRUE

/datum/uplink_item/device_tools/thermal
	name = "Thermal Imaging Glasses"
	desc = "These goggles can be turned to resemble common eyewear found throughout the station. \
			They allow you to see organisms through walls by capturing the upper portion of the infrared light spectrum, \
			emitted as heat and light by objects. Hotter objects, such as warm bodies, cybernetic organisms \
			and artificial intelligence cores emit more of this light than cooler objects like walls and airlocks."
	item = /obj/item/clothing/glasses/thermal/syndi
	cost = 6

/datum/uplink_item/device_tools/satchel
	name = "Satchel"
	desc = "A plain leather satchel for carrying whatever goods you may need to."
	item = /obj/item/storage/backpack/halflife/satchel
	cost = 3

/datum/uplink_item/device_tools/briefcase_launchpad
	name = "Briefcase Launchpad"
	desc = "A briefcase containing a launchpad, a device able to teleport items and people to and from targets up to eight tiles away from the briefcase. \
			Also includes a remote control, disguised as an ordinary folder. Touch the briefcase with the remote to link it."
	surplus = 0
	item = /obj/item/storage/briefcase/launchpad
	cost = 6

/datum/uplink_item/device_tools/toolbox
	name = "Full Rebel Toolbox"
	desc = "The Rebel toolbox is a suspicious black and red. It comes loaded with a full tool set including a \
			multitool and combat gloves that are resistant to shocks and heat."
	item = /obj/item/storage/toolbox/syndicate
	cost = 2
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/datum/uplink_item/device_tools/emag
	name = "Multifunction Electrical Tool"
	desc = "A handheld device which subverts most machinery and devices, although it cannot get through advanced and well protected combine doors. Note, less intelligent people will find using this device much more difficult."
	item = /obj/item/card/emag/halflife
	cost = 5

/datum/uplink_item/device_tools/syndicate_contacts
	name = "Polarized Contact Lenses"
	desc = "High tech contact lenses that bind directly with the surface of your eyes to give them immunity to flashes and \
			bright lights. Effective, affordable, and nigh undetectable."
	item = /obj/item/syndicate_contacts
	cost = 3

/datum/uplink_item/device_tools/syndicate_climbing_hook
	name = "Rebel Climbing Hook"
	desc = "High-tech rope, a refined hook structure, the peak of climbing technology. Only useful for climbing up holes, provided the operation site has any."
	item = /obj/item/climbing_hook/syndicate
	cost = 2

/datum/uplink_item/device_tools/medvial
	name = "Medvial"
	desc = "A vial of biogel for healing wounds."
	item = /obj/item/reagent_containers/pill/patch/medkit/vial
	cost = 1

/datum/uplink_item/device_tools/medkit
	name = "Medkit"
	desc = "A larger kit with biogel. Holds twice as much healing power as a vial, but fits in less places and requires a minimum threat level to purchase."
	item = /obj/item/reagent_containers/pill/patch/medkit
	cost = 1
	progression_minimum = 10 MINUTES

/datum/uplink_item/device_tools/medicalkit
	name = "Oldworld Medical Kit"
	desc = "Fully equipped with all kinds of medical supplies, these old world style kits require a bit more finesse and effort than biogel medkits, but give you more healing power for the price."
	item = /obj/item/storage/medkit/halflife
	cost = 4
	progression_minimum = 5 MINUTES

/datum/uplink_item/device_tools/gasmask
	name = "Gasmask"
	desc = "A standard gas mask. Useful against gas attacks obviously, but also muffles your voice and covers your face enough to hide your identity."
	item = /obj/item/clothing/mask/gas/hl2/modern
	cost = 1

/datum/uplink_item/device_tools/blackmarketuplink
	name = "Blackmarket Uplink"
	desc = "A phone rigged to connect with various black market outfitters. You can use your bank account to purchase a wide array of illegal goods, though at a high credit cost."
	item = /obj/item/market_uplink/halflife/blackmarket
	cant_discount = TRUE //Too powerful to be super cheap ever, needs to be a significant investment.
	cost = 14

/datum/uplink_item/device_tools/antenna
	name = "Destabilizer Antenna"
	desc = "An antenna needed for building a sociostability destabilizer. You'll have to procure all the rest of the (difficult to acquire) parts, but at least this one is the hardest one to find."
	item = /obj/item/halflife/antenna
	cost = 2

/datum/uplink_item/device_tools/headset
	name = "Headset"
	desc = "Need a headset quick for communication? We've got you covered."
	item = /obj/item/radio/headset
	cost = 1

/datum/uplink_item/device_tools/beans
	name = "Canned Beans"
	desc = "Not really a gadget, but an extremely useful item considering how poorly fed citizens often are. Contains more nutrition than just about any ration the combine will give you, \
			but as these are becoming more and more a rarity, we cannot afford to give them out cheap."
	item = /obj/item/food/canned/halflife/beans
	cost = 4

/datum/uplink_item/device_tools/receiver
	name = "Firearm Receiver"
	desc = "Need a receiver for making a firearm, but can't find one? This'll solve your problem, at a cost."
	item = /obj/item/weaponcrafting/receiver
	cost = 2

/datum/uplink_item/device_tools/sticky_tape
	name = "Sticky Tape Roll"
	desc = "A roll of sticky tape for crafting with, for if you can't find any yourself."
	item = /obj/item/stack/sticky_tape
	cost = 3
