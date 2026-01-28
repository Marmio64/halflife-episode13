/datum/antagonist/crab_cultist
	name = "Headcrab Cultist"
	roundend_category = "headcrab cultists"
	antagpanel_category = "Headcrab Cultist"
	antag_hud_name = "traitor"
	antag_moodlet = /datum/mood_event/crab_cultist
	preview_outfit = /datum/outfit/crabwalker_preview
	job_rank = ROLE_CULTIST
	show_in_antagpanel = TRUE

	var/sacrifices_done = 0
	var/drawing_rune = FALSE
	var/static/list/blacklisted_rune_turfs = typecacheof(list(/turf/open/space, /turf/open/openspace, /turf/open/lava, /turf/open/chasm))

	var/greater_strength = FALSE
	var/headcrab_summon_unlocked = FALSE
	var/crabwalker_form = FALSE

/datum/outfit/crabwalker_preview
	name = "Crabwalker (Preview only)"

	uniform = /obj/item/clothing/under/citizen/refugee
	suit = /obj/item/clothing/suit/armor/platearmor
	head = /obj/item/clothing/head/halflife/cosmetic_headcrab
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/combat

/datum/antagonist/crab_cultist/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/cultawakening.ogg',75,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are a Headcrab Cultist!"))
	to_chat(owner, span_boldnotice("You seek to free the minds of humanity through ascension, done so with the coupling between headcrabs and human heads."))
	to_chat(owner, span_notice("You have communed with horrors and studied them for long enough that they cannot distinguish you from their kin."))
	to_chat(owner, span_notice("Utilize your kinship with zombiekind and your increased strength to gather sacrifices at ritual circles."))
	to_chat(owner, span_notice("Freedom is waiting for those who are able to take it."))
	owner.announce_objectives()

/datum/antagonist/crab_cultist/on_gain()
	ADD_TRAIT(owner.current, TRAIT_ACT_AS_CULTIST, REF(src))
	ADD_TRAIT(owner.current, TRAIT_CANNIBAL, REF(src))
	ADD_TRAIT(owner.current, TRAIT_SURVIVALIST, REF(src))
	owner.current.faction = list(FACTION_HEADCRAB)

	owner.teach_crafting_recipe(/datum/crafting_recipe/halflife_spear_fine)
	owner.teach_crafting_recipe(/datum/crafting_recipe/bonedagger_fine)
	owner.teach_crafting_recipe(/datum/crafting_recipe/food/survivaliststew)
	owner.teach_crafting_recipe(/datum/crafting_recipe/healing_poultices)
	owner.teach_crafting_recipe(/datum/crafting_recipe/beartrap)

	owner.current.change_stat(STATKEY_DEX, 5)
	owner.current.change_stat(STATKEY_STR, 5)

	var/obj/item/organ/eyes/oldeyes = owner.current.get_organ_slot(ORGAN_SLOT_EYES)
	if(oldeyes)
		oldeyes.Remove(owner.current, special = TRUE)
		qdel(oldeyes)//eh
	var/obj/item/organ/eyes/night_vision/mushroom/neweyes = new
	neweyes.Insert(owner.current, special = TRUE)

	var/obj/item/organ/tongue/tongue = owner.current.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(tongue)
		tongue.liked_foodtypes |= GORE
		tongue.liked_foodtypes |= RAW
		tongue.liked_foodtypes |= HUMAN
		tongue.disliked_foodtypes &= ~GORE
		tongue.disliked_foodtypes &= ~RAW
		tongue.disliked_foodtypes &= ~HUMAN

	var/datum/action/cooldown/spell/crab_cultist/rune/scribe_rune = new(owner)
	scribe_rune.Grant(owner.current)

	var/datum/action/cooldown/spell/crab_cultist/ascend/ascension = new(owner)
	ascension.Grant(owner.current)

	//Give crab cultist Objective
	var/datum/objective/crab_cultist/crab_cultist_objective = new
	crab_cultist_objective.owner = owner

	objectives += crab_cultist_objective


	owner.current.cmode_music = 'hl13/sound/music/combat/disrupted.ogg'

	return ..()

/datum/antagonist/crab_cultist/on_removal()
	for(var/datum/action/cooldown/spell/crab_cultist/buttons in owner.current.actions)
		qdel(buttons)

	return ..()

/datum/objective/crab_cultist
	target_amount = 12

	explanation_text = "Appease your masters through the sacrifice of 6 live humans or 12 dead humans, or a mix thereof."


/datum/action/cooldown/spell/crab_cultist/rune
	name = "Draw Sacrificial Circle"
	desc = "Draw a sacrificial circle, which will allow you to sacrifice humans. Additional sacrifices unlock additional strength."
	button_icon = 'hl13/icons/mob/actions/actions_misc.dmi'
	button_icon_state = "rune"
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"

	cooldown_time = 5 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = SPELL_REQUIRES_MIND
	antimagic_flags = 0
	spell_max_level = 1

/datum/action/cooldown/spell/crab_cultist/rune/Activate()
	var/datum/antagonist/crab_cultist/crab_cultist = usr.mind.has_antag_datum(/datum/antagonist/crab_cultist)
	crab_cultist.try_draw_rune(usr, usr.loc)
	StartCooldown()

/datum/action/cooldown/spell/crab_cultist/ascend
	name = "Ascend To Greatness"
	desc = "Upon fulfilling your sacrificial obligations, you may shed this form and enter greatness."
	button_icon = 'hl13/icons/mob/actions/actions_gonome.dmi'
	button_icon_state = "evolve"
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"

	cooldown_time = 5 SECONDS

	invocation_type = INVOCATION_NONE
	spell_requirements = SPELL_REQUIRES_MIND
	antimagic_flags = 0
	spell_max_level = 1

/datum/action/cooldown/spell/crab_cultist/ascend/Activate()
	var/datum/antagonist/crab_cultist/crab_cultist = usr.mind.has_antag_datum(/datum/antagonist/crab_cultist)
	if(12 <= crab_cultist.sacrifices_done)
		var/datum/mind/player_mind = usr.mind
		var/mob/living/basic/halflife/zombie/gonome/complete/cultist/S = new (usr.loc)
		player_mind.transfer_to(S)
		qdel(usr)
		qdel(src)
	else
		to_chat(usr, span_notice("You have not yet sacrificed enough people to shed this form. You have [crab_cultist.sacrifices_done] affinity out of the necssary 12. Live sacrifices are worth double affinity."))

/datum/action/cooldown/spell/conjure/crab_cultist/headcrabs
	name = "Summon Headcrabs"
	desc = "Plead to your masters for servants to fight for you."
	button_icon = 'hl13/icons/mob/actions/actions_gonome.dmi'
	button_icon_state = "headcrab"
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"

	sound = 'hl13/sound/creatures/headcrableap.ogg'

	invocation = "COME FORTH SERVANTS OF GOD"
	spell_requirements = NONE
	antimagic_flags = NONE
	cooldown_time = 150 SECONDS
	summon_radius = 1
	summon_type = list(/mob/living/basic/halflife/headcrab/armored)
	summon_amount = 2

/datum/objective/crab_cultist/check_completion()
	var/list/datum/mind/owners = get_owners()
	var/sacrifices_done = 0
	for(var/datum/mind/M in owners)
		if(!M)
			continue
		var/datum/antagonist/crab_cultist/crab_cultist = M.has_antag_datum(/datum/antagonist/crab_cultist)
		if(!crab_cultist)
			continue
		sacrifices_done += crab_cultist.sacrifices_done
	return sacrifices_done >= target_amount

/datum/antagonist/crab_cultist/proc/try_draw_rune(mob/living/user, turf/target_turf, drawing_time = 10 SECONDS, additional_checks)
	for(var/turf/nearby_turf as anything in RANGE_TURFS(1, target_turf))
		if(!isopenturf(nearby_turf) || is_type_in_typecache(nearby_turf, blacklisted_rune_turfs))
			target_turf.balloon_alert(user, "invalid placement for rune!")
			return

	if(locate(/obj/effect/rune/crab_cultist) in range(3, target_turf))
		target_turf.balloon_alert(user, "too close to another rune!")
		return

	if(drawing_rune)
		target_turf.balloon_alert(user, "already drawing a rune!")
		return

	INVOKE_ASYNC(src, PROC_REF(draw_rune), user, target_turf, drawing_time, additional_checks)

/datum/antagonist/crab_cultist/proc/draw_rune(mob/living/user, turf/target_turf, drawing_time = 10 SECONDS, additional_checks)
	drawing_rune = TRUE

	target_turf.balloon_alert(user, "drawing rune...")


	if(!do_after(user, drawing_time, target_turf, extra_checks = additional_checks, hidden = TRUE))
		target_turf.balloon_alert(user, "interrupted!")
		drawing_rune = FALSE
		return

	target_turf.balloon_alert(user, "rune created")
	new /obj/effect/rune/crab_cultist(target_turf)
	drawing_rune = FALSE

/obj/effect/rune/crab_cultist
	cultist_name = "Sacrificial Circle"
	cultist_desc = "sacrifices human corpses to greater forces, empowering you."
	invocation = "FEAST UPON THIS SUPPLE FLESH!!"
	icon = 'hl13/icons/mob/gonarch.dmi'
	icon_state = "gonarch_warning"
	pixel_x = -32 //So the big ol' 96x96 sprite shows up right
	pixel_y = 16
	pixel_z = -48
	scribe_delay = 6 SECONDS //how long the rune takes to create

/obj/effect/rune/crab_cultist/invoke(list/invokers)
	if(rune_in_use)
		return

	var/list/myriad_targets = list()
	for(var/mob/living/non_cultist in loc)
		if(!IS_CULTIST(non_cultist))
			myriad_targets += non_cultist

	if(!length(myriad_targets))
		fail_invoke()
		return

	rune_in_use = TRUE
	visible_message(span_warning("[src] pulses blood red!"))
	color = RUNE_COLOR_DARKRED

	if(length(myriad_targets))
		var/mob/living/new_convertee = pick(myriad_targets)

		invocation = "FEAST UPON THIS SUPPLE FLESH!!"
		do_sacrifice(new_convertee, invokers)


	else
		do_invoke_glow()

	animate(src, color = initial(color), time = 0.5 SECONDS)
	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_atom_colour)), 0.5 SECONDS)
	rune_in_use = FALSE
	return ..()

/obj/effect/rune/crab_cultist/proc/do_sacrifice(mob/living/sacrificial, list/invokers)
	if((((ishuman(sacrificial) || iscyborg(sacrificial)) && sacrificial.stat == CONSCIOUS)))
		for(var/invoker in invokers)
			to_chat(invoker, span_cult_italic("[sacrificial] is too greatly linked to the world! You must weaken them!"))
		return FALSE

	if(iscyborg(sacrificial))
		return FALSE

	new /obj/effect/temp_visual/cult/sac(loc)

	for(var/invoker in invokers)
		if(ishuman(sacrificial))
			to_chat(invoker, span_cult_large("\"I accept this sacrifice.\""))
		else
			to_chat(invoker, span_cult_large("\"I do not accept this meager sacrifice.\""))
			return FALSE

	var/mob/living/first_invoker = invokers[1]
	var/datum/antagonist/crab_cultist/first_invoker_datum = first_invoker.mind.has_antag_datum(/datum/antagonist/crab_cultist)

	if(sacrificial.stat == DEAD)
		first_invoker_datum.sacrifices_done += 1
	else
		first_invoker_datum.sacrifices_done += 2

	if(1 <= first_invoker_datum.sacrifices_done && first_invoker_datum.greater_strength == FALSE)
		first_invoker_datum.greater_strength = TRUE
		ADD_TRAIT(first_invoker, TRAIT_LESSPAIN_MINOR, CRABCULT_TRAIT)
		ADD_TRAIT(first_invoker, TRAIT_MASOCHIST, CRABCULT_TRAIT)
		first_invoker.AddComponent(/datum/component/unbreakable)
		first_invoker.change_stat(STATKEY_INT, 4)
		to_chat(first_invoker, span_cult_italic("With your first sacrifice, your master entrusts you with greater power and knowledge..."))

	if(4 <= first_invoker_datum.sacrifices_done && first_invoker_datum.headcrab_summon_unlocked == FALSE)
		first_invoker_datum.headcrab_summon_unlocked = TRUE
		var/datum/action/cooldown/spell/conjure/crab_cultist/headcrabs/summon_crabs = new(first_invoker)
		summon_crabs.Grant(first_invoker)
		to_chat(first_invoker, span_cult_italic("As your affinity grows with your master, they grant you the ability to plead for kin and aid!"))

	if(8 <= first_invoker_datum.sacrifices_done && first_invoker_datum.crabwalker_form == FALSE)
		first_invoker_datum.crabwalker_form = TRUE
		first_invoker.set_species(/datum/species/human/crabwalker/cultist)
		to_chat(first_invoker, span_cult_italic("As your affinity grows with your master, you shed your current form, arising as a mutated human!"))

	if (sacrificial)
		playsound(sacrificial, 'sound/effects/magic/disintegrate.ogg', 100, TRUE)
		sacrificial.investigate_log("has been sacrificially gibbed by the headcrab cult.", INVESTIGATE_DEATHS)
		sacrificial.gib(DROP_ALL_REMAINS)

	return TRUE
