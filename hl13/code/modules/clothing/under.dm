#define STIMULANT_INJECTION_DELAY (60 SECONDS)

/obj/item/clothing/under/combine
	max_integrity = 250
	strip_delay = 50
	can_adjust = FALSE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	worn_icon = 'hl13/icons/mob/clothing/uniform.dmi'
	icon = 'hl13/icons/obj/clothing/uniforms.dmi'

	powered_suit = TRUE
	suit_power = 50
	max_suit_power = 100
	unpoweredslowdown = 0.25

	var/mob/living/carbon/owner

	COOLDOWN_DECLARE(next_damage_notify)
	COOLDOWN_DECLARE(next_stimulant)

	var/static/list/funny_signals = list(
		COMSIG_CARBON_GAIN_WOUND = PROC_REF(handle_wound_add),
		COMSIG_MOB_APPLY_DAMAGE = PROC_REF(handle_damage)
	)

	armor_type = /datum/armor/combinesuit

/datum/armor/combinesuit
	melee = 15
	bullet = 15
	laser = 20
	energy = 20
	bomb = 20
	fire = 30
	acid = 30
	wound = 5

/obj/item/clothing/under/combine/equipped(mob/M, slot)
	. = ..()
	if(slot == ITEM_SLOT_ICLOTHING && iscarbon(M))
		for(var/k in funny_signals)
			RegisterSignal(M, k, funny_signals[k])
		owner = M
	else
		for(var/k in funny_signals)
			UnregisterSignal(M, k)

/obj/item/clothing/under/combine/Destroy()
	owner = null
	return ..()

/obj/item/clothing/under/combine/dropped(mob/M)
	. = ..()
	for(var/k in funny_signals)
		UnregisterSignal(M, k)

//Wounds
/obj/item/clothing/under/combine/proc/handle_wound_add(mob/living/carbon/C, datum/wound/W, obj/item/bodypart/L)

	SIGNAL_HANDLER

	if(W.severity >= WOUND_SEVERITY_MODERATE)
		administer_stimulant()

/obj/item/clothing/under/combine/proc/administer_stimulant()
	SIGNAL_HANDLER
	if(!owner.reagents)
		return
	if(!COOLDOWN_FINISHED(src, next_stimulant))
		return

	if(suit_power > 20)
		adjust_suitpower(80, TRUE)
		to_chat(owner, span_warning("Suit detects extreme user damage. Administering Class A-3 Stimulant Medication Supplements."))
		owner.reagents.add_reagent(/datum/reagent/medicine/morphine, 2)
		owner.reagents.add_reagent(/datum/reagent/medicine/c2/libital, 4)
	else
		to_chat(owner, span_warning("Suit power insufficient to administer stimulants."))

	COOLDOWN_START(src, next_stimulant, STIMULANT_INJECTION_DELAY)
	return TRUE

//General Damage
/obj/item/clothing/under/combine/proc/handle_damage(mob/living/carbon/C, damage, damagetype, def_zone)
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
		else
			COOLDOWN_START(src, next_damage_notify, 30 SECONDS)
			administer_stimulant()

/obj/item/clothing/under/combine/civilprotection
	name = "civil protection jumpsuit"
	desc = "Full-body suit which includes light kevlar weaving to provide extra protection."
	icon_state = "civilprotection"
	inhand_icon_state = "syndicate-black"
	has_sensor = LOCKED_SENSORS

/obj/item/clothing/under/combine/civilprotection/divisionallead
	name = "divisional lead jumpsuit"
	desc = "A version of the standard civil protection suit with slightly more protection, and red highlights."
	icon_state = "divisionallead"
	armor_type = /datum/armor/combinesuit_upgraded

/datum/armor/combinesuit_upgraded
	melee = 20
	bullet = 20
	laser = 25
	energy = 25
	bomb = 25
	fire = 30
	acid = 30
	wound = 10

/obj/item/clothing/under/combine/overwatch
	name = "overwatch jumpsuit"
	desc = "Full-body suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch"
	inhand_icon_state = "syndicate-black"
	has_sensor = LOCKED_SENSORS
	max_integrity = 400
	suit_power = 100
	armor_type = /datum/armor/combinesuit_upgraded


/obj/item/clothing/under/combine/overwatch/red
	desc = "Red full-body suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch_red"

/obj/item/clothing/under/combine/overwatch/elite
	name = "overwatch jumpsuit"
	desc = "Full-body reinforced suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch_white"
	armor_type = /datum/armor/combinesuit_elite

/datum/armor/combinesuit_elite
	melee = 25
	bullet = 25
	laser = 30
	energy = 30
	bomb = 30
	fire = 40
	acid = 30
	wound = 10

/datum/armor/gruntsuit
	melee = 30
	bullet = 15
	laser = 20
	energy = 20
	bomb = 20
	fire = 30
	acid = 30
	wound = 10
	bio = 100

/obj/item/clothing/under/combine/grunt
	name = "grunt jumpsuit"
	desc = "Full-body suit white armored suit. Designed to protect against slashes, blunt force trauma, and most of all biohazards. However, does not protect espescially well against bullets."
	icon_state = "grunt"
	inhand_icon_state = "syndicate-black"
	has_sensor = LOCKED_SENSORS
	max_integrity = 400
	suit_power = 100
	armor_type = /datum/armor/gruntsuit

/obj/item/clothing/under/citizen
	name = "citizen jumpsuit"
	desc = "Full-body blue suit for the common citizen, worn down and dirtied by time and use. Uses sensors to allow the combine to track you."
	icon_state = "citizenblue"
	inhand_icon_state = "r_suit"
	can_adjust = FALSE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_VITALS
	random_sensor = FALSE
	worn_icon = 'hl13/icons/mob/clothing/uniform.dmi'
	icon = 'hl13/icons/obj/clothing/uniforms.dmi'

/obj/item/clothing/under/citizen/refugee
	name = "refugee clothes"
	desc = "Dirty blue jeans with an accompanying light colored shirt, free of any suit sensors the combine may use to track you."
	icon_state = "refugee"
	inhand_icon_state = "r_suit"
	has_sensor = NO_SENSORS

/obj/item/clothing/under/citizen/refugee/green
	name = "refugee clothes"
	desc = "Dirty blue jeans with an accompanying green shirt, free of any suit sensors the combine may use to track you."
	icon_state = "green_refugee"

/obj/item/clothing/under/citizen/rebel
	name = "citizen jumpsuit"
	desc = "Full-body blue suit for the common citizen, worn down and dirtied by time and use. The scanners have been removed forcefully, and it has been moderately reinforced."
	icon_state = "rebelblue"
	has_sensor = NO_SENSORS
	armor_type = /datum/armor/rebelsuit

/datum/armor/rebelsuit
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	fire = 30
	acid = 30
	wound = 5

/obj/item/clothing/under/halflife
	worn_icon = 'hl13/icons/mob/clothing/uniform.dmi'
	icon = 'hl13/icons/obj/clothing/uniforms.dmi'

/obj/item/clothing/under/administrator
	name = "administrator suit"
	desc = "A well made, though aged, burgundy suit. Specially tailored for the district administrator."
	worn_icon = 'hl13/icons/mob/clothing/uniform.dmi'
	icon = 'hl13/icons/obj/clothing/uniforms.dmi'
	can_adjust = FALSE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	icon_state = "heeledsuit"
	inhand_icon_state = "red_stripe"

/obj/item/clothing/under/administrator/black
	name = "administrator suit"
	desc = "A well made black suit, specially tailored for the district administrator."
	icon_state = "formal"
	inhand_icon_state = "lawyer_black"

/obj/item/clothing/under/halflife/labor_lead
	name = "old suit"
	desc = "A pretty good, old and dusty suit. Often given to high ranking citizens."
	can_adjust = FALSE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	icon_state = "classysuit"

#undef STIMULANT_INJECTION_DELAY
