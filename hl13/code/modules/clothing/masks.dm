// Cooldown times
#define PHRASE_COOLDOWN (5 SECONDS)

/obj/item/clothing/mask/gas/civilprotection
	name = "civil protection mask"
	desc = "Heavy duty white mask for civil protection units. Provides some protection to the face."
	icon = 'hl13/icons/obj/clothing/masks.dmi'
	worn_icon = 'hl13/icons/mob/clothing/masks.dmi'
	icon_state = "civilprotection"
	inhand_icon_state = "swat"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	flags_inv = HIDEFACIALHAIR|HIDEFACE
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH | PEPPERPROOF
	visor_flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH | PEPPERPROOF
	modifies_speech = TRUE
	voice_change = TRUE

	use_radio_beeps_tts = TRUE

	unique_death = 'hl13/sound/voice/cpdeath/die1.ogg'

	actions_types = list(/datum/action/item_action/halt, /datum/action/item_action/help_request)

	COOLDOWN_DECLARE(hailer_cooldown)

	var/overwatch = FALSE

	repairable_by = /obj/item/stack/kevlar

	limb_integrity = 250

	///List of all lines that can be said by the mask, with their respective sound file.
	var/static/list/cp_voicelines = list(
		"Affirmative" = 'hl13/sound/voice/cpvoicelines/affirmative.ogg',
		"Copy" = 'hl13/sound/voice/cpvoicelines/copy.ogg',
		"Alright, you can go" = 'hl13/sound/voice/cpvoicelines/allrightyoucango.ogg',
		"Backup" = 'hl13/sound/voice/cpvoicelines/backup.ogg',
		"Anticitizen" = 'hl13/sound/voice/cpvoicelines/anticitizen.ogg',
		"Citizen" = 'hl13/sound/voice/cpvoicelines/citizen.ogg',
		"Get down" = 'hl13/sound/voice/cpvoicelines/getdown.ogg',
		"Get out of here" = 'hl13/sound/voice/cpvoicelines/getoutofhere.ogg',
		"Grenade" = 'hl13/sound/voice/cpvoicelines/grenade.ogg',
		"Help" = 'hl13/sound/voice/cpvoicelines/help.ogg',
		"Hold it" = 'hl13/sound/voice/cpvoicelines/holdit.ogg',
		"In position" = 'hl13/sound/voice/cpvoicelines/inposition.ogg',
		"I said move along" = 'hl13/sound/voice/cpvoicelines/isaidmovealong.ogg',
		"Keep moving" = 'hl13/sound/voice/cpvoicelines/keepmoving.ogg',
		"Lookout" = 'hl13/sound/voice/cpvoicelines/Lookout.ogg',
		"Move along" = 'hl13/sound/voice/cpvoicelines/movealong.ogg',
		"Move back right now" = 'hl13/sound/voice/cpvoicelines/movebackrightnow.ogg',
		"Move it" = 'hl13/sound/voice/cpvoicelines/moveit2.ogg',
		"Now get out of here" = 'hl13/sound/voice/cpvoicelines/nowgetoutofhere.ogg',
		"Pick up that can" = 'hl13/sound/voice/cpvoicelines/pickupthecan1.ogg',
		"I said pick up the can" = 'hl13/sound/voice/cpvoicelines/pickupthecan3.ogg',
		"Suspect prepare to receive civil judgement" = 'hl13/sound/voice/cpvoicelines/prepareforjudgement.ogg',
		"Now put it in the trash can" = 'hl13/sound/voice/cpvoicelines/putitinthetrash1.ogg',
		"Responding" = 'hl13/sound/voice/cpvoicelines/responding2.ogg',
		"Roger that" = 'hl13/sound/voice/cpvoicelines/rodgerthat.ogg',
		"Shit" = 'hl13/sound/voice/cpvoicelines/shit.ogg',
		"Take cover" = 'hl13/sound/voice/cpvoicelines/takecover.ogg',
		"You knocked it over, pick it up" = 'hl13/sound/voice/cpvoicelines/youknockeditover.ogg',
		"Searching for suspect" = 'hl13/sound/voice/cpvoicelines/searchingforsuspect.ogg',
		"First warning, move away" = 'hl13/sound/voice/cpvoicelines/firstwarningmove.ogg',
		"Sentence delivered" = 'hl13/sound/voice/cpvoicelines/sentencedelivered.ogg',
		"Issuing malcompliant citation" = 'hl13/sound/voice/cpvoicelines/issuingmalcompliantcitation.ogg',
		"Apply" = 'hl13/sound/voice/cpvoicelines/apply.ogg',
		"Hehe" = 'hl13/sound/voice/cpvoicelines/chuckle.ogg',
		"Haha" = 'hl13/sound/voice/cpvoicelines/chuckle.ogg',
		"CP is compromised" = 'hl13/sound/voice/cpvoicelines/cpiscompromised.ogg',
		"Expired" = 'hl13/sound/voice/cpvoicelines/expired.ogg',
		"Hes running" = 'hl13/sound/voice/cpvoicelines/hesrunning.ogg',
		"Infection" = 'hl13/sound/voice/cpvoicelines/infection.ogg',
		"CP is overrun we have no containment" = 'hl13/sound/voice/cpvoicelines/cpisoverrunwehavenocontainment.ogg',
		"all units report in" = 'hl13/sound/voice/cpvoicelines/cprequestsallunitsreportin.ogg',
		"Officer down" = 'hl13/sound/voice/cpvoicelines/officerdowniam10-99.ogg',
		"Officer needs assistance" = 'hl13/sound/voice/cpvoicelines/officerneedsassistance.ogg',
		"Cover me" = 'hl13/sound/voice/cpvoicelines/covermegoingin.ogg',
		"Converging" = 'hl13/sound/voice/cpvoicelines/converging.ogg',
		"Final warning" = 'hl13/sound/voice/cpvoicelines/finalwarning.ogg',
		"Officer under fire" = 'hl13/sound/voice/cpvoicelines/officerunderfiretakingcover.ogg',
		"Running low on verdicts" = 'hl13/sound/voice/cpvoicelines/runninglowonverdicts.ogg',
		"Viscerator deployed" = 'hl13/sound/voice/cpvoicelines/visceratordeployed.ogg',

	)

	//like CP voicelines, but only for overwatch
	var/static/list/ota_voicelines = list(
		"Affirmative" = 'hl13/sound/voice/otavoicelines/affirmative.ogg',
		"Anticitizen" = 'hl13/sound/voice/otavoicelines/anticitizenone.ogg',
		"Administer" = 'hl13/sound/voice/otavoicelines/administer.ogg',
		"Boomer" = 'hl13/sound/voice/otavoicelines/boomer.ogg',
		"Antiseptic" = 'hl13/sound/voice/otavoicelines/antiseptic.ogg',
		"Body pack holding" = 'hl13/sound/voice/otavoicelines/bodypackholding.ogg',
		"Bouncer" = 'hl13/sound/voice/otavoicelines/bouncerbouncer.ogg',
		"Call contact parasitics" = 'hl13/sound/voice/otavoicelines/callcontactparasitics.ogg',
		"Heavy resistance" = 'hl13/sound/voice/otavoicelines/heavyresistance.ogg',
		"Ripcord" = 'hl13/sound/voice/otavoicelines/ripcord.ogg',
		"Contact" = 'hl13/sound/voice/otavoicelines/contact.ogg',
		"Shit" = 'hl13/sound/voice/cpvoicelines/shit.ogg',
		"Take cover" = 'hl13/sound/voice/cpvoicelines/takecover.ogg',
	)

	armor_type = /datum/armor/cpmask

/obj/item/clothing/mask/gas/civilprotection/Initialize(mapload)
	. = ..()
	GLOB.cpmasks += src

/obj/item/clothing/mask/gas/civilprotection/Destroy()
	GLOB.cpmasks -= src
	. = ..()

/obj/item/clothing/mask/gas/civilprotection/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/halt))
		halt()
	if(istype(action, /datum/action/item_action/help_request))
		help_request()

/datum/action/item_action/halt
	name = "HALT!"

/obj/item/clothing/mask/gas/civilprotection/verb/halt()
	set category = "Object"
	set name = "HALT"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, hailer_cooldown))
		return

	COOLDOWN_START(src, hailer_cooldown, PHRASE_COOLDOWN)

	usr.audible_message("[usr]'s Vocoder: <font color='red' size='4'><b>Hold it right there!</b></font>")

	playsound(src, 'hl13/sound/voice/cpvoicelines/holditrightthere.ogg', 75, FALSE)

/datum/action/item_action/help_request
	name = "Request Assistance!"

/obj/item/clothing/mask/gas/civilprotection/verb/help_request()
	set category = "Object"
	set name = "Request Assistance!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, hailer_cooldown))
		return

	COOLDOWN_START(src, hailer_cooldown, PHRASE_COOLDOWN)

	if(overwatch)
		playsound(src, 'hl13/sound/voice/otavoicelines/heavyresistance.ogg', 75, FALSE)
		usr.say(".s Overwatch advised, we have heavy resistance. Need units on my 10-20.", forced = src.name)
	else
		playsound(src, 'hl13/sound/voice/cpvoicelines/officerneedsassistance.ogg', 75, FALSE)
		usr.say(".s Requesting assistance on my position!", forced = src.name)

/datum/armor/cpmask
	melee = 25
	bullet = 25
	laser = 10
	energy = 10
	bomb = 10
	fire = 80
	acid = 80
	wound = 5

/obj/item/clothing/mask/gas/civilprotection/handle_speech(mob/living/carbon/source, mob/speech_args)
	if(source.wear_mask == src)
		var/chosen_sound = file("hl13/sound/voice/cpradio/off[rand(1,4)].ogg")

		if(overwatch)
			chosen_sound = file("hl13/sound/voice/otaradio/off[rand(1,3)].ogg")

		playsound(source, chosen_sound, 50, FALSE)

	var/full_message = speech_args[SPEECH_MESSAGE]
	if(!overwatch)
		for(var/lines in cp_voicelines)
			if(findtext(full_message, lines))
				playsound(source, cp_voicelines[lines], 50, FALSE)
				return // only play the first.
	else
		for(var/lines in ota_voicelines)
			if(findtext(full_message, lines))
				playsound(source, ota_voicelines[lines], 50, FALSE)
				return // only play the first.

/obj/item/clothing/mask/gas/civilprotection/divisional
	name = "civil protection mask"
	desc = "Heavy duty white mask for civil protection units. Provides some protection to the face. This one is reinforced."
	icon_state = "dv_mask"
	inhand_icon_state = "swat"
	armor_type = /datum/armor/cpmask_upgraded

/datum/armor/cpmask_upgraded
	melee = 25
	bullet = 35
	laser = 10
	energy = 10
	bomb = 20
	fire = 80
	acid = 80
	wound = 10

/obj/item/clothing/mask/gas/civilprotection/medical
	name = "medical officer mask"
	icon_state = "medicalofficer"

/obj/item/clothing/mask/gas/civilprotection/overseer
	name = "overseer mask"
	icon_state = "overseer"

/obj/item/clothing/mask/gas/civilprotection/overwatch
	name = "overwatch soldier mask"
	desc = "Heavy duty armored mask for the overwatch transhuman team."
	icon_state = "overwatch"
	inhand_icon_state = "swat"
	overwatch = TRUE
	armor_type = /datum/armor/cpmask_upgraded

	limb_integrity = 400

	unique_death = 'hl13/sound/voice/otavoicelines/die1.ogg'

/obj/item/clothing/mask/gas/civilprotection/overwatch/red
	icon_state = "overwatch_red"

/obj/item/clothing/mask/gas/civilprotection/overwatch/elite
	name = "overwatch elite soldier mask"
	icon_state = "overwatch_white"
	armor_type = /datum/armor/eliteoverwatchmask

/datum/armor/eliteoverwatchmask
	melee = 25
	bullet = 45
	laser = 10
	energy = 10
	bomb = 25
	fire = 80
	acid = 80
	wound = 10

/obj/item/clothing/mask/gas/civilprotection/overwatch/grunt
	name = "grunt mask"
	desc = "Heavy duty white mask for overwatch units nicknamed 'grunts'. Provides some protection to the face. This one is reinforced against melee and biological threats, though lacks major firearm protection."
	icon_state = "grunt"
	armor_type = /datum/armor/gruntmask

/datum/armor/gruntmask
	melee = 40
	bullet = 15
	laser = 10
	energy = 10
	bomb = 20
	fire = 80
	acid = 80
	wound = 10
	bio = 100

/obj/item/clothing/mask/gas/cwuengi
	name = "gas mask"
	desc = "An engineering grade gas mask for civil union workers. Looks like it could muffle your voice well enough to hide it."
	icon = 'hl13/icons/obj/clothing/masks.dmi'
	worn_icon = 'hl13/icons/mob/clothing/masks.dmi'
	icon_state = "cwuengi"
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	voice_change = TRUE //Muffles your voice enough it can hide your identity.

/obj/item/clothing/mask/gas/hl2
	desc = "An old, but still relatively good looking gas mask. Hopefully it's filters hold up still. Looks like it could muffle your voice well enough to hide it."
	icon = 'hl13/icons/obj/clothing/masks.dmi'
	worn_icon = 'hl13/icons/mob/clothing/masks.dmi'
	voice_change = TRUE //Muffles your voice enough it can hide your identity.

/obj/item/clothing/mask/gas/hl2/modern
	icon_state = "moderngasmask"

/obj/item/clothing/mask/gas/hl2/military
	icon_state = "military_gasmask"

/obj/item/clothing/mask/gas/hl2/military/hardened
	name = "hardened gas mask"
	desc = "An old, hardened gas mask which protects the face against gas and some attacks."
	icon_state = "military_gasmask"
	armor_type = /datum/armor/militarygasmask

/datum/armor/militarygasmask
	melee = 15
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	fire = 80
	acid = 80
	wound = 5

/obj/item/clothing/mask/gas/hl2/russia
	icon_state = "russiamask"

/obj/item/clothing/mask/gas/hl2/swat
	icon_state = "swatmask"

/obj/item/clothing/mask/bandana/sinew
	name = "sinew bandana"
	desc = "A bandana made of finely weaved animal sinew."
	greyscale_colors = "#6d1b1b"
	flags_1 = NONE

#undef PHRASE_COOLDOWN
