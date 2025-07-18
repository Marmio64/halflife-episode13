/datum/outfit/centcom/ert/overwatch
	name = "OTA Unit"

	id = /obj/item/card/id/advanced/four/ert
	glasses = /obj/item/clothing/glasses/hud/security/night/combine
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch
	uniform = /obj/item/clothing/under/combine/overwatch
	suit = /obj/item/clothing/suit/armor/overwatch
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/overwatch
	gloves = /obj/item/clothing/gloves/combat/overwatch
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch
	belt = /obj/item/storage/belt/civilprotection/overwatch
	l_pocket = /obj/item/reagent_containers/pill/patch/medkit
	skillchips = list(/obj/item/skillchip/overwatch) //Skilled soldiers
	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/ota)

	back = null

	var/role = "OTA.C13-"
	var/name_source = list("Blade", "Dagger", "Hammer", "Hunter", "Razor", "Spear", "Striker", "Tracker", "Echo")

/datum/outfit/centcom/ert/overwatch/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.cmode_music = 'hl13/sound/music/combat/guarddown.ogg'
	H.skin_tone = "#e9dfd7"
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_hairstyle("Bald") //this will call update_body_parts()
	H.eye_color_left = "#b9b9b9"
	H.eye_color_right = "#b9b9b9"
	H.update_body()
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT) //OTA dont need to eat or drink

	H.change_stat(STATKEY_DEX, 2)
	H.change_stat(STATKEY_STR, 4)

/datum/outfit/centcom/ert/overwatch/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"[role][pick(name_source)] [rand(111,999)]")

/datum/outfit/centcom/ert/overwatch/spas12
	name = "OTA Shotgun Unit"
	suit_store = /obj/item/gun/ballistic/shotgun/spas12
	belt = /obj/item/storage/belt/civilprotection/overwatch/spas12
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/red
	uniform = /obj/item/clothing/under/combine/overwatch/red
	suit = /obj/item/clothing/suit/armor/overwatch/red

/datum/outfit/centcom/ert/overwatch/mp7
	name = "OTA SMG Unit"
	suit_store = /obj/item/gun/ballistic/automatic/mp7
	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7

/datum/outfit/centcom/ert/overwatch/ar2
	name = "OTA Rifle Unit"
	suit_store = /obj/item/gun/ballistic/automatic/ar2
	belt = /obj/item/storage/belt/civilprotection/overwatch/ar2

/datum/outfit/centcom/ert/overwatch/sniper
	name = "OTA Sniper Unit"
	suit_store = /obj/item/gun/ballistic/combine_sniper
	belt = /obj/item/storage/belt/civilprotection/overwatch/sniper

/datum/outfit/centcom/ert/overwatch/ar2/elite
	name = "OTA Elite Unit"
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	uniform = /obj/item/clothing/under/combine/overwatch/elite
	suit = /obj/item/clothing/suit/armor/overwatch/elite

	role = "ELITE.C13-"

/datum/outfit/centcom/ert/overwatch/ar2/elite/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/cqc/elitecqc = new
	elitecqc.teach(H)

	H.change_stat(STATKEY_DEX, 1) //extra stats
	H.change_stat(STATKEY_STR, 1) //extra stats


/datum/outfit/centcom/ert/overwatch/grunt
	name = "OTA SMG Grunt"

	belt = /obj/item/storage/belt/civilprotection/overwatch/pulsesmg
	l_hand = /obj/item/gun/ballistic/automatic/pulsesmg

	back = /obj/item/tank/internals/oxygen/grunt
	mask = /obj/item/clothing/mask/gas/civilprotection/overwatch/grunt/fused
	uniform = /obj/item/clothing/under/combine/grunt/fused
	suit = null
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection/grunt

/datum/outfit/centcom/ert/police
	name = "Metropolice ERT Unit"

	id = /obj/item/card/id/advanced/four/ert
	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security

	mask = /obj/item/clothing/mask/gas/civilprotection
	belt = /obj/item/storage/belt/civilprotection/full

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert/cp)

/datum/outfit/centcom/ert/police/mp7
	name = "Metropolice MP7 ERT Unit"
	suit = /obj/item/gun/ballistic/automatic/mp7
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp

	belt = /obj/item/storage/belt/civilprotection/overwatch/mp7

	r_pocket = /obj/item/reagent_containers/hypospray/medipen/healthpen

/datum/outfit/centcom/ert/police/riot
	name = "Metropolice Riot Unit"

	suit = /obj/item/clothing/suit/armor/riot
	suit_store = /obj/item/melee/baton/security/heavy/loaded
	head = /obj/item/clothing/head/helmet/toggleable/riot

	belt = /obj/item/storage/belt/civilprotection/riotfull

	r_pocket = /obj/item/grenade/halflife/cs_gas

	back = /obj/item/shield/riot

/datum/outfit/centcom/ert/police/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.cmode_music = 'hl13/sound/music/combat/apprehensionandevasion.ogg'
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_hairstyle("Bald") //this will call update_body_parts()
	H.update_body()

	H.change_stat(STATKEY_DEX, 2)

/datum/outfit/centcom/ert/police/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"VICE- [rand(111,999)]")

/datum/outfit/centcom/ert/police/riot/pistol
	name = "Metropolice Riot Pistol Unit"

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp/riot
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch
	belt = /obj/item/storage/belt/civilprotection/riotfullpistol

/datum/outfit/centcom/ert/conscript
	name = "Conscript Soldier"

	id = /obj/item/card/id/advanced/four/ert
	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	suit = /obj/item/clothing/suit/armor/halflife/kevlar
	suit_store = /obj/item/gun/ballistic/automatic/servicerifle
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	head = /obj/item/clothing/head/helmet/halflife/military/weak

	mask = /obj/item/clothing/mask/gas/hl2/military/hardened

	implants = list(/obj/item/implant/mindshield)

	back = /obj/item/storage/backpack/halflife/satchel/military

	belt = /obj/item/flashlight/seclite

	backpack_contents = list(
		/obj/item/ammo_box/magazine/m4a1/service = 3,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 1,
		/obj/item/stack/medical/gauze = 1,
	)

/datum/outfit/centcom/ert/conscript/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.cmode_music = 'hl13/sound/music/combat/forgetaboutfreeman.ogg'
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_hairstyle("Crewcut") //this will call update_body_parts()
	H.update_body()

	H.change_stat(STATKEY_DEX, 2)

/datum/outfit/centcom/ert/conscript/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"CONSCRIPT- [rand(111,999)]")

/datum/outfit/centcom/ert/conscript/officer
	name = "Conscript Officer"

	suit_store = /obj/item/gun/ballistic/revolver/coltpython
	head = /obj/item/clothing/head/beret/durathread/unitednations

	l_pocket = /obj/item/knife/combat

	backpack_contents = list(
		/obj/item/ammo_box/colta357 = 4,
		/obj/item/reagent_containers/pill/patch/medkit = 1,
		/obj/item/grenade/syndieminibomb/bouncer = 1,
		/obj/item/stack/medical/gauze = 1,
	)

/datum/outfit/centcom/ert/conscript/officer/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"LIEUTENANT- [rand(111,999)]")

/datum/outfit/centcom/ert/administrative
	name = "Combine Administrative Represenative"

	id = /obj/item/card/id/advanced/four/ert
	ears = /obj/item/radio/headset/civilprotection/divisional/overwatch
	uniform = /obj/item/clothing/under/halflife/blacksuit
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/melee/baton/telescopic
	l_hand = /obj/item/storage/briefcase
	mask = null
	gloves = null

	l_pocket = /obj/item/gun/ballistic/revolver/snubnose

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/centcom/ert/administrative/nogun
	l_pocket = null

/datum/outfit/centcom/ert/administrative/pre_equip(mob/living/carbon/human/H)
	H.faction += "combine"
	H.cmode_music = 'hl13/sound/music/combat/branescan.ogg'
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_hairstyle("Crewcut") //this will call update_body_parts()
	H.update_body()

	H.change_stat(STATKEY_INT, 2)

/datum/outfit/gman
	name = "G-Man"

	uniform = /obj/item/clothing/under/halflife/gsuit
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/halflife/suitcase

	/// This outfit will grant these spells if applied
	var/list/spells_to_add = list(/datum/action/cooldown/spell/teleport/area_teleport/wizard/gman)

/datum/action/cooldown/spell/teleport/area_teleport/wizard/gman
	name = "G-Man Teleport"

	cooldown_time = 5 SECONDS
	invocation = null
	spell_requirements = NONE
	antimagic_flags = NONE
	smoke_amt = 0

	invocation_says_area = FALSE

/datum/outfit/gman/pre_equip(mob/living/carbon/human/user, visuals_only = FALSE)
	. = ..()
	if(isdummy(user))
		return

	for(var/datum/action/act as anything in spells_to_add)
		var/datum/action/new_ability = new act(user)
		if(istype(new_ability, /datum/action/cooldown/spell))
			var/datum/action/cooldown/spell/new_spell = new_ability
			new_spell.spell_requirements = NONE
		new_ability.Grant(user)

	user.skin_tone = "#e9dfd7"
	user.set_facial_hairstyle("Shaved", update = FALSE)
	user.set_haircolor("#141414", update = FALSE)
	user.set_hairstyle("Crewcut")
	user.eye_color_left = "#3da9f1"
	user.eye_color_right = "#3da9f1"
	user.update_body()
	ADD_TRAIT(user, TRAIT_NOHUNGER, OUTFIT_TRAIT) //gman dont eat

	user.change_stat(STATKEY_DEX, 5)
	user.change_stat(STATKEY_STR, 5)
	user.change_stat(STATKEY_INT, 5)

/datum/outfit/gman/post_equip(mob/living/carbon/human/equipped, visuals_only)
	..()
	equipped.fully_replace_character_name(equipped.real_name,"Mysterious Man")
