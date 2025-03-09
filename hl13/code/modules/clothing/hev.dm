#define SOUND_BEEP(sound) add_queue(##sound, 20)
#define MORPHINE_INJECTION_DELAY (30 SECONDS)

/obj/item/clothing/suit/armor/hev
	name = "Hazardous Environments Suit"
	desc = "An old suit, fully plated and insulated and topped with a tasteful orange coating of paint."
	icon_state = "hev"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT|HIDEGLOVES
	strip_delay = 100
	clothing_flags = THICKMATERIAL
	icon = 'hl13/icons/obj/clothing/suits.dmi'

	var/static/list/funny_signals = list(
		COMSIG_LIVING_DEATH = PROC_REF(handle_death),
		COMSIG_LIVING_IGNITED = PROC_REF(handle_ignite),
		COMSIG_LIVING_ELECTROCUTE_ACT = PROC_REF(handle_shock),
		COMSIG_CARBON_GAIN_WOUND = PROC_REF(handle_wound_add),
		COMSIG_MOB_APPLY_DAMAGE = PROC_REF(handle_damage)
	)

	var/static/list/wound_to_sound = list(
		/datum/wound/blunt/bone/severe = 'hl13/sound/voice/hev/minor_fracture.ogg',
		/datum/wound/blunt/bone/critical = 'hl13/sound/voice/hev/major_fracture.ogg',
		/datum/wound/loss = 'hl13/sound/voice/hev/major_lacerations.ogg',
		/datum/wound/slash/flesh/severe = 'hl13/sound/voice/hev/minor_lacerations.ogg',
		/datum/wound/slash/flesh/critical = 'hl13/sound/voice/hev/major_lacerations.ogg',
	)

	var/list/sound_queue = list()

	var/emag_doses_left = 5

	var/mob/living/carbon/owner

	var/obj/item/geiger_counter/GC

	COOLDOWN_DECLARE(next_damage_notify)
	COOLDOWN_DECLARE(next_morphine)

	armor_type = /datum/armor/hev

/datum/armor/hev
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 100
	fire = 100
	acid = 100
	wound = 20


/obj/item/clothing/suit/armor/hev/Initialize(mapload)
	. = ..()
	GC = new(src)
	GC.scanning = TRUE
	update_appearance(UPDATE_ICON)

/obj/item/clothing/suit/armor/hev/Destroy()
	QDEL_NULL(GC)
	owner = null
	return ..()

/obj/item/clothing/suit/armor/hev/proc/process_sound_queue()

	var/list/sound_data = sound_queue[1]
	var/sound_file = sound_data[1]
	var/sound_delay = sound_data[2]

	playsound(src, sound_file, 50)

	sound_queue.Cut(1,2)

	if(!length(sound_queue))
		return

	addtimer(CALLBACK(src, PROC_REF(process_sound_queue)), sound_delay)

/obj/item/clothing/suit/armor/hev/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	if(owner)
		to_chat(owner, span_warning("You need to take off \the [name] before emagging it."))
		return FALSE
	obj_flags |= EMAGGED
	do_sparks(8, FALSE, get_turf(src))
	return TRUE

/obj/item/clothing/suit/armor/hev/proc/add_queue(desired_file, desired_delay, purge_queue=FALSE)

	var/was_empty_sound_queue = !length(sound_queue)

	if(purge_queue)
		sound_queue.Cut()

	sound_queue += list(list(desired_file,desired_delay)) //BYOND is fucking weird so you have to do this bullshit if you want to add a list to a list.

	if(was_empty_sound_queue)
		addtimer(CALLBACK(src, PROC_REF(process_sound_queue)), 1 SECONDS)

	return TRUE

//Signal handling.
/obj/item/clothing/suit/armor/hev/equipped(mob/M, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING && iscarbon(M))
		for(var/k in funny_signals)
			RegisterSignal(M, k, funny_signals[k])
		add_queue('hl13/sound/voice/hev/bell.ogg',2 SECONDS,purge_queue=TRUE)
		owner = M
		if(prob(1))
			add_queue('hl13/sound/voice/hev/emag.ogg',27 SECONDS)
		else
			add_queue('hl13/sound/voice/hev/welcome.ogg',8 SECONDS)
	else
		for(var/k in funny_signals)
			UnregisterSignal(M, k)

/obj/item/clothing/suit/armor/hev/dropped(mob/M)
	. = ..()
	for(var/k in funny_signals)
		UnregisterSignal(M, k)

//Death
/obj/item/clothing/suit/armor/hev/proc/handle_death(gibbed)

	SIGNAL_HANDLER

	add_queue('hl13/sound/voice/hev/death.ogg', 5 SECONDS, purge_queue=TRUE)

//Fire
/obj/item/clothing/suit/armor/hev/proc/handle_ignite(mob/living)

	SIGNAL_HANDLER

	SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
	add_queue('hl13/sound/voice/hev/heat.ogg',1 SECONDS)

//Shock
/obj/item/clothing/suit/armor/hev/proc/handle_shock(mob/living)

	SIGNAL_HANDLER

	SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
	add_queue('hl13/sound/voice/hev/shock.ogg',1 SECONDS)

//Wounds
/obj/item/clothing/suit/armor/hev/proc/handle_wound_add(mob/living/carbon/C, datum/wound/W, obj/item/bodypart/L)

	SIGNAL_HANDLER

	var/found_sound = wound_to_sound[W.type]
	if(found_sound)
		SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
		add_queue(found_sound,4 SECONDS)

	if(W.severity >= WOUND_SEVERITY_MODERATE)
		SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
		add_queue('hl13/sound/voice/hev/seek_medical.ogg',1 SECONDS)
		administer_morphine()

/obj/item/clothing/suit/armor/hev/proc/administer_morphine()
	SIGNAL_HANDLER
	if(!owner.reagents)
		return
	if(!COOLDOWN_FINISHED(src, next_morphine))
		return

	if((obj_flags & EMAGGED) && emag_doses_left < 0)
		owner.reagents.add_reagent(/datum/reagent/medicine/morphine, 3)
		owner.reagents.add_reagent(/datum/reagent/medicine/c2/libital, 3)
		owner.reagents.add_reagent(/datum/reagent/medicine/omnizine, 6)
		SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
		add_queue('hl13/sound/voice/hev/morphine.ogg',1 SECONDS)
	else
		owner.reagents.add_reagent(/datum/reagent/medicine/stimulants, 5)
		owner.reagents.add_reagent(/datum/reagent/medicine/c2/libital, 3)
		owner.reagents.add_reagent(/datum/reagent/medicine/omnizine, 6)
		SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
		add_queue('hl13/sound/voice/hev/stimulants.ogg',1 SECONDS)
		emag_doses_left--
		if(emag_doses_left <= 0)
			to_chat(owner, span_warning("\The [name] seems to have run out of stimulants..."))

	COOLDOWN_START(src, next_morphine, MORPHINE_INJECTION_DELAY)
	return TRUE

//General Damage
/obj/item/clothing/suit/armor/hev/proc/handle_damage(mob/living/carbon/C, damage, damagetype, def_zone)
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, next_damage_notify))
		return

	if(damage < 5 || owner.maxHealth <= 0)
		return

	var/health_percent = owner.health / owner.maxHealth
	if(health_percent > 0.50 && !prob(damage * 4))
		return

	switch(health_percent)
		if(0.76 to INFINITY)
			return
		if(0.51 to 0.75)
			SOUND_BEEP('hl13/sound/voice/hev/beep_2.ogg')
			add_queue('hl13/sound/voice/hev/vital_signs_dropping.ogg',1 SECONDS)
			COOLDOWN_START(src, next_damage_notify, 5 SECONDS)
		if(0.26 to 0.50)
			SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
			add_queue('hl13/sound/voice/hev/vital_signs_critical.ogg',1 SECONDS)
			COOLDOWN_START(src, next_damage_notify, 5 SECONDS)
		else
			SOUND_BEEP('hl13/sound/voice/hev/beep_3.ogg')
			add_queue('hl13/sound/voice/hev/vital_signs_death.ogg',1 SECONDS)
			COOLDOWN_START(src, next_damage_notify, 5 SECONDS)
			administer_morphine()


/obj/item/clothing/suit/armor/hev/deathmatch
	desc = "An old suit, fully plated and insulated and topped with a tasteful orange coating of paint. This one somehow protects your head too."
	body_parts_covered = HEAD|CHEST|GROIN|ARMS|LEGS

#undef MORPHINE_INJECTION_DELAY
#undef SOUND_BEEP
