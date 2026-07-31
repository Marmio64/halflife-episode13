#define PHRASE_COOLDOWN (3 SECONDS)

//Bullsquids are proud creatures... they prefer to hunt alone

/datum/outfit/deployment_loadout/intruder/boss
	weapon_specialties = WEAPON_CAT_ALL

/datum/outfit/deployment_loadout/intruder/boss/bullsquid
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Revolver Bullsquid"
	desc = "A mercenary, originally part of an small elite black ops unit Pre-War, currently on the Combine's payroll. Known for his adeptness with a revolver and advanced interrogation techniques. He's been bested by Solid Crab a few times before, and now he's looking to settle the score."

	uniform = /obj/item/clothing/under/halflife/labor_lead/bullsquid
	suit = /obj/item/clothing/suit/jacket/det_suit/bullsquid
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/holster/bullsquid
	gloves = /obj/item/clothing/gloves/color/brown
	ears = /obj/item/radio/headset //for taunting crab, if you use it to call for help i will laugh at you

	l_pocket = /obj/item/ammo_box/colta357 //12 shots... (he'll get a conjure as well i suppose though). no radio either, see comment above
	r_pocket = /obj/item/ammo_box/colta357

	combat_music = 'hl13/sound/music/combat/duel.ogg'

	nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES, ITEM_SLOT_ID)

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NICE_SHOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_INTRUDER_OCELOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, OUTFIT_TRAIT) //he's got the eyes of a bullsquid. wait, do bullsquids have eyes. Yes they do have eyes, it is visible on their model.
	ADD_TRAIT(H, TRAIT_GRABRESISTANCE, OUTFIT_TRAIT) //prevents instant aggro grab cqc chicanery, have a real fight between boss and intruder
	var/obj/item/organ/eyes/empowered_eyes = H.get_organ_by_type(/obj/item/organ/eyes)
	if(empowered_eyes)
		empowered_eyes?.refresh() //needed for the night vision to actually apply
	RegisterSignal(H, COMSIG_MOB_FIRED_GUN, PROC_REF(reduce_spread))
	RegisterSignal(H, COMSIG_PROJECTILE_FIRER_BEFORE_FIRE, PROC_REF(apply_ricochet))

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/proc/reduce_spread(mob/user, obj/item/gun/gun_fired, target, params, zone_override, list/bonus_spread_values)
	SIGNAL_HANDLER
	bonus_spread_values[MIN_BONUS_SPREAD_INDEX] -= 50
	bonus_spread_values[MAX_BONUS_SPREAD_INDEX] -= 50

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/proc/apply_ricochet(mob/user, obj/projectile/projectile, datum/fired_from, atom/clicked_atom) //despite preferring a revolver, he seems to be capable of doing his ricochet trick with any firearm (like the makarov in mgs3), so i'll allow it unless it proves to be too good
	SIGNAL_HANDLER
	projectile.ricochets_max += 5
	projectile.min_ricochets += 2
	projectile.ricochet_auto_aim_range = 50
	projectile.ricochet_auto_aim_angle = 6
	projectile.ricochet_incidence_leeway = 0
	projectile.accuracy_falloff = 0
	projectile.ricochet_shoots_firer = FALSE

/datum/outfit/deployment_loadout/intruder/boss/bullsquid/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#DDDDDD", update = FALSE)
	H.set_facial_haircolor("#DDDDDD", update = FALSE)
	H.skin_tone = "caucasian1"
	H.set_hairstyle("Feather", update = TRUE)
	H.set_facial_hairstyle("Moustache (Selleck)", update = TRUE)
	H.update_body(1)
	H.tired_rate = 0
	H.fully_replace_character_name(H.real_name,"Revolver Bullsquid")
	H.death_sound = 'hl13/sound/voice/solid/ocelotdeath.ogg'
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

	var/datum/martial_art/cqc/bigboss = new
	bigboss.teach(H)
	var/datum/action/cooldown/spell/bullsquid_taunt/taunt = new
	taunt.Grant(H)
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/bullsquid/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)
	for(var/obj/item/item in H.get_all_gear()) //this probably isnt the best way to do it but its the one i found that actually worked
		if(istype(item, /obj/item/clothing/head/) || istype(item, /obj/item/clothing/mask) || istype(item, /obj/item/storage/backpack/) || istype(item, /obj/item/gun/ballistic/automatic/m4a1/))
			qdel(item)

/datum/outfit/deployment_loadout/intruder/boss/solidus
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Solidus Crab"
	desc = "Gor-den's godfather who raised him as a child soldier. Looks uncannily like the former City 13 Administrator Sears."

	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/halflife/plf_veteran/solidus
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/eyepatch
	belt = /obj/item/katana/raiden
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset //for taunting crab, if you use it to call for help i will laugh at you
	back = /obj/item/katana/raiden

	combat_music = 'hl13/sound/music/combat/fatherandson.ogg'

	nodrop_slots = list(ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_EYES, ITEM_SLOT_ID)

	spells_to_add = list(/datum/action/cooldown/mob_cooldown/halflife/solidus_charge, /datum/action/cooldown/spell/solidus_upgrade)

/datum/outfit/deployment_loadout/intruder/boss/solidus/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_INTRUDER_OCELOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_GRABRESISTANCE, OUTFIT_TRAIT) //prevents instant aggro grab cqc chicanery, have a real fight between boss and intruder
	var/obj/item/organ/eyes/empowered_eyes = H.get_organ_by_type(/obj/item/organ/eyes)
	if(empowered_eyes)
		empowered_eyes?.refresh() //needed for the night vision to actually apply

/datum/outfit/deployment_loadout/intruder/boss/solidus/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#BDBDBD", update = FALSE)
	H.set_facial_haircolor("#BDBDBD", update = FALSE)
	H.skin_tone = "caucasian1"
	H.set_hairstyle("Fade (Medium)", update = TRUE)
	H.set_facial_hairstyle("Beard (Cropped Fullbeard)", update = TRUE)
	H.update_body(1)
	H.tired_rate = 0
	H.fully_replace_character_name(H.real_name,"Solidus Crab")
	H.death_sound = 'hl13/sound/voice/solid/solidusdeath.ogg'
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

	var/datum/martial_art/cqc/bigboss = new
	bigboss.teach(H)
	var/obj/item/organ/eyes/eyes = H.get_organ_slot(ORGAN_SLOT_EYES)
	eyes.apply_scar(LEFT_EYE_SCAR)
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/bullsquid/solidus/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)

	for(var/obj/item/item in H.get_all_gear()) //this probably isnt the best way to do it but its the one i found that actually worked
		if(istype(item, /obj/item/clothing/head/) || istype(item, /obj/item/clothing/mask) || istype(item, /obj/item/storage/backpack/) || istype(item, /obj/item/gun/ballistic/automatic/m4a1/))
			qdel(item)
		if(istype(item, /obj/item/clothing/glasses/eyepatch))
			var/obj/item/clothing/glasses/eyepatch/eyepatch = item
			eyepatch.flip_eyepatch() //so that it covers his left eye

/datum/outfit/deployment_loadout/intruder/boss/liquid
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "Liquid Bullsquid"
	desc = "Originally the notorious Revolver Bullsquid before his mind was supposedly taken over by the late Liquid Crab. He has gained access to a system created by the combine, allowing him full control over all soldiers nanites."

	uniform = /obj/item/clothing/under/pants/slacks/liquid
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset //for taunting crab, if you use it to call for help i will laugh at you
	glasses = /obj/item/clothing/glasses/sunglasses/liquid //useless, only for aura farming
	suit = /obj/item/clothing/suit/jacket/det_suit/liquid //useless x2


	combat_music = 'hl13/sound/music/combat/themeoflove.ogg'

	nodrop_slots = list(ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS, ITEM_SLOT_HEAD, ITEM_SLOT_ID) //let him remove his sunglasses and coat

	spells_to_add = list(/datum/action/cooldown/spell/liquid_special)

/datum/outfit/deployment_loadout/intruder/boss/liquid/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_INTRUDER_OCELOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_GRABRESISTANCE, OUTFIT_TRAIT) //prevents instant aggro grab cqc chicanery, have a real fight between boss and intruder
	var/obj/item/organ/eyes/empowered_eyes = H.get_organ_by_type(/obj/item/organ/eyes)
	if(empowered_eyes)
		empowered_eyes?.refresh() //needed for the night vision to actually apply

/datum/outfit/deployment_loadout/intruder/boss/liquid/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#DDDDDD", update = FALSE)
	H.set_facial_haircolor("#DDDDDD", update = FALSE)
	H.skin_tone = "caucasian1"
	H.set_hairstyle("Feather", update = TRUE)
	H.set_facial_hairstyle("Moustache (Selleck)", update = TRUE)
	H.update_body(1)
	H.tired_rate = 0
	H.fully_replace_character_name(H.real_name,"Liquid Bullsquid")
	H.death_sound = 'hl13/sound/voice/solid/ocelotdeath.ogg'
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

	var/datum/martial_art/cqc/bigboss = new
	bigboss.teach(H)
	var/obj/item/organ/old_organ = H.get_organ_slot(ORGAN_SLOT_TONGUE)
	var/obj/item/organ/tongue/bullsquid/liquid/new_tongue = new()
	new_tongue.Insert(H)
	qdel(old_organ)
	for(var/obj/item/item in H.get_all_gear()) //this probably isnt the best way to do it but its the one i found that actually worked
		if(istype(item, /obj/item/clothing/head/) || istype(item, /obj/item/clothing/mask) || istype(item, /obj/item/storage/backpack/) || istype(item, /obj/item/gun/ballistic/automatic/m4a1/))
			qdel(item)

/datum/outfit/deployment_loadout/intruder/boss/end
	faction = COMBINE_DEPLOYMENT_FACTION
	name = "The Xend"
	desc = "Legendary sniper who is aged over 100 years old. His weapon of choice is a mosin which has been converted to fire tranquilizer rounds similar to the ones in Crab's pistol."

	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/halflife/kevlar/bigboss/the_end
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection/solid
	back = /obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/the_end
	belt = /obj/item/storage/belt/civilprotection/end
	ears = /obj/item/radio/headset

	l_pocket = /obj/item/ammo_box/strilka310/a762/tranq
	r_pocket = /obj/item/ammo_box/strilka310/a762/tranq

	implants = list(/obj/item/implant/explosive)

	spells_to_add = list(/datum/action/cooldown/spell/conjure_item/flashbang)

/datum/outfit/deployment_loadout/intruder/boss/end/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_NEVER_WOUNDED, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHUNGER, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_TOTAL_FOV, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOSLEEP, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NOCRITOVERLAY, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_INTRUDER_OCELOT, OUTFIT_TRAIT)
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, OUTFIT_TRAIT) //he's got the eyes of a bullsquid. wait, do bullsquids have eyes. Yes they do have eyes, it is visible on their model.
	ADD_TRAIT(H, TRAIT_GRABRESISTANCE, OUTFIT_TRAIT) //prevents instant aggro grab cqc chicanery, have a real fight between boss and intruder
	var/obj/item/organ/eyes/empowered_eyes = H.get_organ_by_type(/obj/item/organ/eyes)
	if(empowered_eyes)
		empowered_eyes?.refresh() //needed for the night vision to actually apply

/datum/outfit/deployment_loadout/intruder/boss/end/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_haircolor("#DDDDDD", update = FALSE)
	H.set_facial_haircolor("#DDDDDD", update = FALSE)
	H.skin_tone = "caucasian1"
	H.set_hairstyle("Bald", update = TRUE)
	H.set_facial_hairstyle("Beard (Full)", update = TRUE)
	H.update_body(1)
	H.tired_rate = 0
	H.fully_replace_character_name(H.real_name,"The Xend")
	H.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)

	//the only one who doesnt know cqc, stay away from crab
	for(var/obj/item/item in H.get_all_gear()) //this probably isnt the best way to do it but its the one i found that actually worked
		if(istype(item, /obj/item/clothing/head/) || istype(item, /obj/item/clothing/mask) || istype(item, /obj/item/storage/backpack/) || istype(item, /obj/item/gun/ballistic/automatic/m4a1/))
			qdel(item)

/datum/action/cooldown/spell/bullsquid_taunt
	name = "Revolvering Taunt"
	desc = "Taunt your enemy with a longer voiceline that is sure to instill terror, while filling your pockets with more ammunition, as well as restoring a portion of health. NOTE: WILL DELETE ANYTHING CURRENTLY IN YOUR POCKETS."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "python"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	cooldown_time = 15 SECONDS
	spell_requirements = NONE
	antimagic_flags = NONE
	var/taunt_sounds = list(
	"I love to reload during a battle! There's nothing like the feeling of slamming a long silver bullet into a well-greased chamber..." = 'hl13/sound/voice/solid/ocelotreload1.ogg',
	"I understand the bullets, you see... I make them go where I want!" = 'hl13/sound/voice/solid/ocelotreload2.ogg',
	"I love the smell of cordite! You know, that sulfury smell... but to you, it'll be the smell of your own death!" = 'hl13/sound/voice/solid/ocelotreload3.ogg',
	"Don't even think about using auto-fire, or I'll know!" = 'hl13/sound/voice/solid/ocelotreload4.ogg',
)

/datum/action/cooldown/spell/bullsquid_taunt/cast(mob/living/cast_on)
	. = ..()
	var/chosen_sound = pick(taunt_sounds)
	playsound(owner.loc, taunt_sounds[chosen_sound], 50, FALSE)
	cast_on.say(chosen_sound)
	var/item_l = cast_on.get_item_by_slot(ITEM_SLOT_LPOCKET)
	if(item_l)
		qdel(item_l)
	cast_on.equip_to_slot_or_del(new /obj/item/ammo_box/colta357, ITEM_SLOT_LPOCKET)
	var/item_r = cast_on.get_item_by_slot(ITEM_SLOT_RPOCKET)
	if(item_r)
		qdel(item_r)
	cast_on.equip_to_slot_or_del(new /obj/item/ammo_box/colta357, ITEM_SLOT_RPOCKET)
	cast_on.adjustBruteLoss(-30)
	cast_on.adjustFireLoss(-30)

/datum/action/cooldown/spell/solidus_upgrade
	name = "Upgrading Taunt"
	desc = "Once at sufficiently low health, taunt your enemy with a longer voiceline that is sure to instill terror. Decreases your armor significantly, but upgrades your charge ability and fully regenerates health."

	button_icon = 'hl13/icons/mob/actions/actions_vortal.dmi'
	button_icon_state = "revive"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	check_flags = NONE
	cooldown_time = 0 //no cooldown to the ability
	var/already_used = FALSE

/datum/action/cooldown/spell/solidus_upgrade/cast(mob/living/cast_on)
	. = ..()
	if(cast_on.health > -50)
		to_chat(cast_on, span_notice("You're not hurt enough to do that yet!"))
		return
	if(already_used)
		to_chat(cast_on, span_notice("You've already done this!"))
		return
	already_used = TRUE
	cast_on.fully_heal(ADMIN_HEAL_ALL)
	var/obj/item/organ/old_organ = cast_on.get_organ_slot(ORGAN_SLOT_TONGUE) //i would figure out how to make it so that ahealing doesnt get rid of your tongue but i dont care enough so im just giving it back to him
	var/obj/item/organ/tongue/bullsquid/solidus/new_tongue = new()
	new_tongue.Insert(cast_on)
	qdel(old_organ)
	for(var/obj/item/clothing/suit/armor/halflife/plf_veteran/solidus/armor in cast_on.get_all_gear())
		armor.set_armor(/datum/armor/plf_veteran/solidusdowngraded)
	playsound(cast_on, 'hl13/sound/voice/solid/solidusupgrade.ogg', 50, FALSE)
	cast_on.say("Good work, Jack! But this is where it gets interesting...")
	for(var/datum/action/cooldown/mob_cooldown/halflife/solidus_charge/solidus in cast_on.actions)
		solidus.extracharge_amount = 3

/datum/action/cooldown/spell/liquid_special
	name = "Activate Guns of The Combine"
	desc = "Disables the nanites of anyone in range of you, causing them to lose control of their emotions and even start infighting. However, Crab too is affected by this."

	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "punish"
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND

	check_flags = NONE
	cooldown_time = 30 SECONDS

	var/casting = FALSE //i think its sleeps fault i need this

	var/static/list/possible_emotions = list(
		"rage",
		"sadness",
		"laughter",
		"fear",
	)

/datum/action/cooldown/spell/liquid_special/cast(mob/living/cast_on)
	. = ..()
	if(!casting)
		casting = TRUE
		cast_on.visible_message(span_warning("[cast_on] fires an imaginary finger gun!"))
		cast_on.say("Bang!")
		playsound(cast_on,'hl13/sound/voice/solid/liquidbang.ogg', 50, FALSE)
		sleep(0.5 SECONDS)
		for(var/mob/living/carbon/human/victim in orange(cast_on, 7))
			SEND_SOUND(victim, sound('hl13/sound/effects/liquidemotions.ogg'))
			if(!HAS_TRAIT(victim, TRAIT_THE_INTRUDER))
				var/chosen_emotion = pick(possible_emotions)
				to_chat(victim, span_warning("You're suddenly overcome with [chosen_emotion]!"))
				addtimer(CALLBACK(src, PROC_REF(feel_emotion), victim, chosen_emotion, 0), rand(0.4 SECONDS, 1 SECONDS))
			else
				to_chat(victim, span_warning("Your body begins to fail you!"))
				cast_on.say("Hahahaha!!")
				playsound(cast_on,'hl13/sound/voice/solid/liquidlaugh.ogg', 50, FALSE)
				addtimer(CALLBACK(src, PROC_REF(old_snake), victim, 0), rand(0.4 SECONDS, 1 SECONDS))
		casting = FALSE

/datum/action/cooldown/spell/liquid_special/proc/feel_emotion(mob/living/carbon/human/victim, emotion, times_emoted)
	if(times_emoted >= 5)
		to_chat(victim, span_notice("You manage to regain control of your emotions..."))
		return
	switch(emotion) //i just learned what switch statements are, are you proud of me marm
		if("rage") //basically just the spasm effect but with two events removed
			if(victim.stat >= UNCONSCIOUS || victim.incapacitated || HAS_TRAIT(victim, TRAIT_HANDS_BLOCKED) || HAS_TRAIT(victim, TRAIT_IMMOBILIZED))
				return
			switch(rand(1,4))
				if(1)
					if((victim.mobility_flags & MOBILITY_MOVE) && isturf(victim.loc))
						to_chat(victim, span_warning("You're so enraged you can't sit still!"))
						step(victim, pick(GLOB.cardinals))
				if(2)
					victim.set_combat_mode(TRUE)

					var/range = 1
					if(istype(victim.get_active_held_item(), /obj/item/gun)) //get targets to shoot at
						range = 7

					var/list/mob/living/targets = list()
					for(var/mob/living/nearby_mobs in oview(victim, range))
						targets += nearby_mobs
					if(LAZYLEN(targets))
						to_chat(victim, span_warning("You attack someone in a fit of rage!"))
						victim.ClickOn(pick(targets))
					victim.set_combat_mode(FALSE)
				if(3)
					victim.set_combat_mode(TRUE)
					to_chat(victim, span_warning("You attack yourself in a fit of rage!"))
					victim.ClickOn(victim)
					victim.set_combat_mode(FALSE)
				if(4)
					victim.emote("scream")
					to_chat(victim, span_warning("You scream in a fit of rage!"))
		if("sadness")
			if(victim.stat >= UNCONSCIOUS)
				return
			if(prob(75))
				to_chat(victim, span_warning("You start crying, it's hard to see through the tears!"))
				victim.emote("cry")
				victim.adjust_eye_blur(6 SECONDS)
			else
				to_chat(victim, span_warning("You are inconsolable!"))
				victim.emote("cry")
				victim.adjust_eye_blur(6 SECONDS)
				victim.Paralyze(2 SECONDS)
		if("laughter") //the alt to rage, basically
			if(victim.stat >= UNCONSCIOUS || victim.incapacitated || HAS_TRAIT(victim, TRAIT_HANDS_BLOCKED) || HAS_TRAIT(victim, TRAIT_IMMOBILIZED))
				return
			switch(rand(1,4))
				if(1)
					victim.emote("laugh")
					to_chat(victim, span_warning("You're laughing too hard to move!"))
					victim.Paralyze(2 SECONDS)
				if(2)
					victim.set_combat_mode(TRUE)

					var/range = 1
					if(istype(victim.get_active_held_item(), /obj/item/gun)) //get targets to shoot at
						range = 7

					var/list/mob/living/targets = list()
					for(var/mob/living/nearby_mobs in oview(victim, range))
						targets += nearby_mobs
					if(LAZYLEN(targets))
						to_chat(victim, span_warning("You attack someone sadistically!"))
						victim.ClickOn(pick(targets))
					victim.set_combat_mode(FALSE)
				if(3)
					victim.set_combat_mode(TRUE)
					to_chat(victim, span_warning("You attack yourself masochistically!"))
					victim.ClickOn(victim)
					victim.set_combat_mode(FALSE)
				if(4)
					victim.emote("laugh")
					to_chat(victim, span_warning("You laugh at nothing in particular!"))
		if("fear") //the alt to sadness, basically
			if(victim.stat >= UNCONSCIOUS)
				return
			if(prob(50)) //more likely to get paralyzed since the first option doesnt actually do anything
				to_chat(victim, span_warning("You scream in fear!"))
				victim.emote("scream")
			else
				to_chat(victim, span_warning("You are paralyzed in fear!"))
				victim.emote("scream")
				victim.Paralyze(2 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(feel_emotion), victim, emotion, (times_emoted + 1)), rand(1 SECONDS, 3 SECONDS))

/datum/action/cooldown/spell/liquid_special/proc/old_snake(mob/living/carbon/human/snake, times_affected) //stolen from gutworms disease code for now
	if(times_affected >= 5)
		to_chat(snake, span_notice("You feel your strength begin to return to you..."))
		return
	if(times_affected == 0)
		to_chat(snake, span_danger("A deep ache appears in your stomach, as you suddenly hurl!"))
		snake.vomit(vomit_flags = (VOMIT_CATEGORY_DEFAULT | MOB_VOMIT_FORCE), lost_nutrition = 0)
	else
		switch(rand(1,3))
			if(1)
				to_chat(snake, span_danger("You feel weak and dizzy..."))
				snake.adjust_confusion(3 SECONDS)
				snake.adjustStaminaLoss(20)
			if(2)
				to_chat(snake, span_userdanger("You feel terrible, as a deep pain appears in your gut."))
				snake.adjust_dizzy(3)
				snake.adjust_confusion(3 SECONDS)
			if(3)
				to_chat(snake, span_danger("You feel very weak and dizzy..."))
				snake.adjust_confusion(3 SECONDS)
				snake.adjustStaminaLoss(30)
	addtimer(CALLBACK(src, PROC_REF(old_snake), snake, (times_affected + 1)), rand(1 SECONDS, 3 SECONDS))

/datum/action/cooldown/mob_cooldown/halflife/solidus_charge
	name = "Charge"
	desc = "A charge which allows you to close distance between you and the enemy, quickly attacking while leaving behind a trail of flames. The attack is indiscriminate (especially the flames), so watch where you aim."
	cooldown_time = 15 SECONDS
	var/extracharge_amount = 0

/datum/action/cooldown/mob_cooldown/halflife/solidus_charge/proc/do_charge(move_dir, times_ran, times_charged)
	if(times_ran >= 5)
		if(times_charged >= extracharge_amount)
			return
		else
			var/atom/movable/screen/fullscreen/cursor_catcher/catcher = owner.overlay_fullscreen("solidus", /atom/movable/screen/fullscreen/cursor_catcher, FALSE)
			catcher.assign_to_mob(owner)
			playsound(owner,'hl13/sound/voice/solid/soliduscharge.ogg', 50, FALSE)
			sleep(0.3 SECONDS)
			var/dir_to_target = get_dir(get_turf(owner), catcher.given_turf)
			owner.setDir(dir_to_target)
			do_charge(dir_to_target, 0, times_charged + 1)
			owner.clear_fullscreen("solidus", 0)
			return
	var/turf/T = get_step(get_turf(owner), move_dir)
	if(T.density)
		if(times_charged >= extracharge_amount)
			return
		else
			addtimer(CALLBACK(src, PROC_REF(do_charge), move_dir, (times_ran + 1), times_charged), 1)
			return
	for(var/obj/structure/window/W in T.contents)
		W.atom_deconstruct(FALSE) //breaks windows
		qdel(W)
	for(var/obj/machinery/door/D in T.contents)
		if(D.density)
			D.try_to_activate_door()
			playsound(D, 'hl13/sound/halflifeeffects/metal_door_break.ogg', 50, FALSE)
	for(var/obj/structure/halflife/fence/F in T.contents)
		playsound(F, 'hl13/sound/halflifeeffects/metal_door_break.ogg', 50, FALSE)
		qdel(F)
	for(var/obj/machinery/turnstile/brig/halflife/forcefield/S in T.contents) //when are there ever any other kind (besides this is the only type that has malfunction)
		if(S.on)
			S.malfunction()
	if(times_ran == 0)
		playsound(owner,'hl13/sound/effects/soliduscharge.ogg', 50, FALSE)
	var/turf/flameturf = get_turf(owner)
	flameturf.flame_magical(15, 10, "red", 9, 1)
	owner.forceMove(T)
	var/mob/living/owner_mob = owner
	var/list/hit_things = list()
	for(var/mob/living/L in T.contents - hit_things - owner)
		hit_things += L
		owner_mob.set_combat_mode(TRUE)
		owner_mob.ClickOn(L)
		L.adjustBruteLoss(20) //extra damage since this is a special attack
		return
	addtimer(CALLBACK(src, PROC_REF(do_charge), move_dir, (times_ran + 1), times_charged), 1)

/datum/action/cooldown/mob_cooldown/halflife/solidus_charge/proc/begin_charge(target)
	var/dir_to_target = get_dir(get_turf(owner), get_turf(target))
	owner.setDir(dir_to_target)
	playsound(owner,'hl13/sound/voice/solid/soliduscharge.ogg', 50, FALSE)
	owner.visible_message(span_boldwarning("[owner] begins to charge!"))
	addtimer(CALLBACK(src, PROC_REF(do_charge), dir_to_target, 0, 0), 5)

/datum/action/cooldown/mob_cooldown/halflife/solidus_charge/Activate(atom/target)
	begin_charge(target)
	StartCooldown()
	return TRUE

/obj/item/clothing/under/halflife/labor_lead/bullsquid
	name = "gunslinger's outfit"
	desc = "A pretty good, old and dusty suit. Smells like cordite... and Solid Crab's death."

/obj/item/clothing/suit/jacket/det_suit/bullsquid
	name = "gunslinger's trenchcoat"
	desc = "A trenchcoat that's been moderately reinforced with kevlar. Wearing this makes you feel like a true Son of Colossal Cell Lead." //like the terrorists led by Liquid Crab, not actually a son of Colossal Cell Lead
	armor_type = /datum/armor/milvest //same amount of armor as Crab
	repairable_by = /obj/item/stack/kevlar
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|HEAD //i think hes a bit easy to kill so i'm giving him head armor as well

/obj/item/clothing/suit/jacket/det_suit/liquid
	desc = "A trenchcoat that's purely for show. Can be removed dramatically."
	armor_type = /datum/armor/none
	repairable_by = /obj/item/stack/kevlar

/obj/item/clothing/glasses/sunglasses/liquid
	desc = "A pair of sunglasses purely for show. Can be removed dramatically."
	flash_protect = FLASH_PROTECTION_NONE

/obj/item/clothing/under/pants/slacks/liquid
	armor_type = /datum/armor/milvest //where is this armor coming from? that's for me to know and you to never find out
	slowdown = -0.25 //nothing really weighing him down
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|HEAD

/obj/item/clothing/suit/armor/halflife/plf_veteran/solidus
	name = "Solidus's suit"
	desc = "A suit similar in design to the ones used by PLF Veterans, but recreated with Combine materials and technology. Seems like it would be good at protecting you from, well, everything... excluding melee attacks."
	slowdown = 0
	armor_type = /datum/armor/plf_veteran/solidus
	icon_state = "solidus_heavy"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|HEAD
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED, TRAIT_NOFIRE, TRAIT_NOFIRE_SPREAD) //because he will set shit on fire he needs to not get set on fire

/datum/armor/plf_veteran/solidus
	melee = 35 //not so effective against melee so that raiden has incentive to engage in swordfights with him

/datum/armor/plf_veteran/solidusdowngraded
	melee = 17
	bullet = 50

/obj/item/clothing/suit/armor/halflife/kevlar/bigboss/the_end
	var/min_alpha = 0 //how invisible we are capable of being. this will be raised during an alert

	//these two mostly just exist so that i can test values ingame, increase should be more than decrease so that he reveals quicker
	var/alpha_decrease = 15
	var/alpha_increase = 60

	var/register_it = FALSE

	var/turf/turfcamo

/obj/item/clothing/suit/armor/halflife/kevlar/bigboss/the_end/examine(mob/user)
	. = ..()
	if(turfcamo)
		. += span_notice("CrabCamo is currently set to: [turfcamo.icon_state].")

/obj/item/clothing/suit/armor/halflife/kevlar/bigboss/the_end/process()
	if(GLOB.alert_cooldown >= 1 SECONDS)
		min_alpha = 60 //should still be pretty hard to spot
	else if (GLOB.caution_cooldown >= 1 SECONDS)
		min_alpha = 30
	else
		min_alpha = 0
	if(ishuman(loc))
		var/mob/living/carbon/human/hooman = loc
		if(!register_it)
			RegisterSignal(hooman, COMSIG_MOB_FIRED_GUN, PROC_REF(firing_gun_camo))
		for(var/mob/living/carbon/human/noticer in range(0, hooman))
			if(noticer != hooman)
				min_alpha = 120 //a lot more noticeable if you're standing right on top of him
		var/turf/currentturf = get_turf(hooman)
		if(HAS_TRAIT(hooman, TRAIT_UNDENSE) && hooman.stat == CONSCIOUS) //leaning against walls or crawling on the floor, only works if you're awake
			if(!turfcamo) //will only happen once, at the start of the game
				turfcamo = get_turf(hooman)
				playsound(hooman, 'hl13/sound/effects/camochange.ogg', 20, FALSE, -10) //quiet but not impossible to detect hopefully ill tweak it later
				to_chat(hooman, span_notice("Your CrabCamo begins to change to resemble the texture of [turfcamo.icon_state]."))
			if(istype(currentturf, turfcamo))
				hooman.alpha = max(hooman.alpha - alpha_decrease, min_alpha)
			else
				hooman.alpha = max(hooman.alpha, 120)
				turfcamo = get_turf(hooman)
				playsound(hooman, 'hl13/sound/effects/camochange.ogg', 20, FALSE, -10)
				to_chat(hooman, span_notice("Your CrabCamo begins to change to resemble the texture of [turfcamo.icon_state]."))
		else if(turfcamo)
			if(istype(currentturf, turfcamo))
				hooman.alpha = max(hooman.alpha - alpha_decrease, 120) //still somewhat effective if you already have the camo of the turf you're on
			else
				hooman.alpha = min(hooman.alpha + alpha_increase, 255)
		else
			hooman.alpha = min(hooman.alpha + alpha_increase, 255)

/obj/item/clothing/suit/armor/halflife/kevlar/bigboss/the_end/proc/firing_gun_camo(datum/source, obj/item/gun/gun, atom/firing_at, params, zone, bonus_spread_values)
	SIGNAL_HANDLER

	var/mob/living/carbon/human/owner = loc
	owner.alpha = max(owner.alpha, owner.alpha + alpha_increase) //the more you shoot, the more camo you lose

/obj/item/storage/belt/holster/bullsquid
	name = "gunslinger's shoulder holsters"
	desc = "Twelve shots... you've got twelve shots while wearing this."

/obj/item/storage/belt/holster/bullsquid/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL

/obj/item/storage/belt/holster/bullsquid/PopulateContents()
	generate_items_inside(list(
		/obj/item/gun/ballistic/revolver/coltpython/blued = 2,
	), src)

/obj/item/storage/belt/civilprotection/end/Initialize()
	. = ..()
	atom_storage.set_holdable(list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing/shotgun,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/flashlight/seclite,
		/obj/item/flashlight/flare,
		/obj/item/food/donut,
		/obj/item/grenade,
		/obj/item/holosign_creator/security,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/ammo_box/colta357,
		/obj/item/ammo_box/magazine/ar2,
		/obj/item/ammo_box/strilka310/a762,
		/obj/item/stack/medical/gauze,
		/obj/item/storage/box/lethalshot,
		/obj/item/halflife/combine_battery,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/reagent_containers/hypospray/medipen/healthpen,
	))

/obj/item/storage/belt/civilprotection/end/PopulateContents()
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762/tranq, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762/tranq, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762/tranq, src)
	SSwardrobe.provide_type(/obj/item/ammo_box/strilka310/a762/tranq, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	SSwardrobe.provide_type(/obj/item/reagent_containers/pill/patch/medkit/ration, src)
	update_appearance(UPDATE_ICON)


/obj/item/ammo_box/strilka310/a762/tranq
	name = "stripper clip (7.62mm tranq)"
	ammo_type = /obj/item/ammo_casing/n762/tranq

/obj/item/ammo_casing/n762/tranq
	name = "7.62x54mmR tranquilizer bullet casing"
	desc = "A 7.62x54mmR bullet casing filled with a tranquilizing drug."
	projectile_type = /obj/projectile/bullet/n762/tranq

/obj/projectile/bullet/n762/tranq
	damage = 0 //non-lethal
	sharpness = NONE
	embed_type = null
	icon_state = "rubber"
	projectile_piercing = NONE

/obj/projectile/bullet/n762/tranq/on_hit(atom/target, blocked = null, pierce_hit)
	. = ..()
	var/tranq_tiredness = 750 - (blocked*10) //guard armor will do 25%, so reduced tiredness gain by 250
	if(iscarbon(target))
		var/mob/living/carbon/C = target

		if(tranq_tiredness <= 50)
			C.visible_message(span_notice("The [src] fails to penetrate [target]'s thick armor and bounces off uselessly."))
			return

		if(HAS_TRAIT(C, TRAIT_THE_INTRUDER) && prob(40)) //x2 as effective against bosses and intruders
			return

		if(HAS_TRAIT(C, TRAIT_INTRUDER_OCELOT) && prob(40))
			return

		C.adjust_tiredness(tranq_tiredness)

		if(TIREDNESS_SLEEPY_THRESHOLD <= C.tiredness) //if after the tranq shot they are sleepy, they go sleep sleep
			C.SetSleeping(25 SECONDS)

/obj/item/ammo_box/magazine/internal/boltaction/mosin/tranq
	ammo_type = /obj/item/ammo_casing/n762/tranq

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/the_end
	name = "The Bine's mosin-nagant rifle"
	desc = "An incredibly well-maintained and scoped rifle. Will never jam on you. Unfortunately, it's been modified to only take tranq rounds." //im lying but they dont need to know that
	can_jam = FALSE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/boltaction/mosin/tranq

/obj/item/gun/ballistic/rifle/boltaction/mosin_nagant/the_end/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 3)

/obj/item/organ/tongue/bullsquid
	actions_types = list(/datum/action/item_action/prettygood, /datum/action/item_action/disappointed, /datum/action/item_action/draw, /datum/action/item_action/settlethis, /datum/action/item_action/ocelothiding)
	COOLDOWN_DECLARE(ocelot_cooldown)
	modifies_speech = TRUE
	var/list/ocelot_voicelines = list(
		"re pretty good" = 'hl13/sound/voice/solid/ocelotgood.ogg',
		"m disappointed" = 'hl13/sound/voice/solid/ocelotdisappointed.ogg',
		"Draw" = 'hl13/sound/voice/solid/ocelotdraw.ogg',
		"t you want to settle this" = 'hl13/sound/voice/solid/ocelotsettle.ogg',
		"Hiding won" = 'hl13/sound/voice/solid/ocelothiding.ogg', //i hate that i can't use '
	)

/obj/item/organ/tongue/bullsquid/solidus
	actions_types = list(/datum/action/item_action/laugh, /datum/action/item_action/best, /datum/action/item_action/giveup, /datum/action/item_action/playingaround, /datum/action/item_action/takethis)
	ocelot_voicelines = list(
		"haha" = 'hl13/sound/voice/solid/soliduslaugh.ogg',
		"Is that the best you can do" = 'hl13/sound/voice/solid/solidusbest.ogg',
		"ready to give up" = 'hl13/sound/voice/solid/solidusgiveup.ogg',
		"quit playing around" = 'hl13/sound/voice/solid/solidusplaying.ogg',
		"take this" = 'hl13/sound/voice/solid/solidustakethis.ogg',
	)

/obj/item/organ/tongue/bullsquid/liquid
	actions_types = list(/datum/action/item_action/die, /datum/action/item_action/splendid, /datum/action/item_action/fight, /datum/action/item_action/notover, /datum/action/item_action/takethis)
	ocelot_voicelines = list(
		"time to die" = 'hl13/sound/voice/solid/liquiddie.ogg',
		"splendid" = 'hl13/sound/voice/solid/liquidsplendid.ogg',
		"fight like a man" = 'hl13/sound/voice/solid/liquidfight.ogg',
		"not over yet" = 'hl13/sound/voice/solid/liquidnotover.ogg',
		"take this" = 'hl13/sound/voice/solid/liquidtakethis.ogg',
	)

/obj/item/organ/tongue/bullsquid/proc/can_use(mob/user)
	return istype(user) && !user.incapacitated

/obj/item/organ/tongue/bullsquid/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/settlethis))
		settlethis()
	if(istype(action, /datum/action/item_action/disappointed))
		disappointed()
	if(istype(action, /datum/action/item_action/draw))
		draw()
	if(istype(action, /datum/action/item_action/prettygood))
		prettygood()
	if(istype(action, /datum/action/item_action/ocelothiding))
		ocelothiding()
	if(istype(action, /datum/action/item_action/laugh))
		laugh()
	if(istype(action, /datum/action/item_action/best))
		best()
	if(istype(action, /datum/action/item_action/giveup))
		giveup()
	if(istype(action, /datum/action/item_action/playingaround))
		playingaround()
	if(istype(action, /datum/action/item_action/takethis))
		takethis()
	if(istype(action, /datum/action/item_action/die))
		die()
	if(istype(action, /datum/action/item_action/splendid))
		splendid()
	if(istype(action, /datum/action/item_action/fight))
		fight()
	if(istype(action, /datum/action/item_action/notover))
		notover()

/obj/item/organ/tongue/bullsquid/modify_speech(datum/source, list/speech_args)
	var/full_message = speech_args[SPEECH_MESSAGE]
	for(var/lines in ocelot_voicelines)
		if(findtext(full_message, lines))
			playsound(source, ocelot_voicelines[lines], 50, FALSE)
			return // only play the first.

/datum/action/item_action/settlethis
	name = "Don't you want to settle this?"

/obj/item/organ/tongue/bullsquid/verb/settlethis()
	set category = "Object"
	set name = "Don't you want to settle this?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Don't you want to settle this?", forced = src.name)

/datum/action/item_action/disappointed
	name = "I'm disappointed!"

/obj/item/organ/tongue/bullsquid/verb/disappointed()
	set category = "Object"
	set name = "I'm disappointed!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("I'm disappointed!", forced = src.name)

/datum/action/item_action/draw
	name = "Draw!!"

/obj/item/organ/tongue/bullsquid/verb/draw()
	set category = "Object"
	set name = "Draw!!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Draw!!", forced = src.name)

/datum/action/item_action/prettygood
	name = "You're pretty good!"

/obj/item/organ/tongue/bullsquid/verb/prettygood()
	set category = "Object"
	set name = "You're pretty good!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("You're pretty good!", forced = src.name)

/datum/action/item_action/ocelothiding
	name = "Hiding won't help you!"

/obj/item/organ/tongue/bullsquid/verb/ocelothiding()
	set category = "Object"
	set name = "Hiding won't help you!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Hiding won't help you!", forced = src.name)

/datum/action/item_action/laugh
	name = "Laugh"

/obj/item/organ/tongue/bullsquid/verb/laugh()
	set category = "Object"
	set name = "Laugh"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Hahahaha!", forced = src.name)

/datum/action/item_action/best
	name = "Is that the best you can do?"

/obj/item/organ/tongue/bullsquid/verb/best()
	set category = "Object"
	set name = "Is that the best you can do?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Is that the best you can do?", forced = src.name)

/datum/action/item_action/giveup
	name = "Ready to give up, Jack?"

/obj/item/organ/tongue/bullsquid/verb/giveup()
	set category = "Object"
	set name = "Ready to give up, Jack?"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Ready to give up, Jack?", forced = src.name)

/datum/action/item_action/playingaround
	name = "Quit playing around!"

/obj/item/organ/tongue/bullsquid/verb/playingaround()
	set category = "Object"
	set name = "Quit playing around!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Quit playing around!", forced = src.name)

/datum/action/item_action/takethis
	name = "Take this!"

/obj/item/organ/tongue/bullsquid/verb/takethis()
	set category = "Object"
	set name = "Take this!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Take this!", forced = src.name)

/datum/action/item_action/die
	name = "Time to die!"

/obj/item/organ/tongue/bullsquid/verb/die()
	set category = "Object"
	set name = "Time to die!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Time to die!", forced = src.name)

/datum/action/item_action/splendid
	name = "Splendid, brother!"

/obj/item/organ/tongue/bullsquid/verb/splendid()
	set category = "Object"
	set name = "Splendid, brother!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Splendid, brother!", forced = src.name)

/datum/action/item_action/fight
	name = "Fight like a man!"

/obj/item/organ/tongue/bullsquid/verb/fight()
	set category = "Object"
	set name = "Fight like a man!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("Fight like a man!", forced = src.name)

/datum/action/item_action/notover
	name = "It's not over yet!"

/obj/item/organ/tongue/bullsquid/verb/notover()
	set category = "Object"
	set name = "It's not over yet!"
	set src in usr
	if(!isliving(usr) || !can_use(usr) || !COOLDOWN_FINISHED(src, ocelot_cooldown))
		return

	COOLDOWN_START(src, ocelot_cooldown, PHRASE_COOLDOWN)

	usr.say("It's not over yet!", forced = src.name)

#undef PHRASE_COOLDOWN
