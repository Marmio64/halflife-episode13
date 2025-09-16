#define TURRET_STUN 0
#define TURRET_LETHAL 1

#define POPUP_ANIM_TIME 5
#define POPDOWN_ANIM_TIME 5 //Be sure to change the icon animation at the same time or it'll look bad

#define TURRET_FLAG_SHOOT_ALL_REACT (1<<0) // The turret gets pissed off and shoots at people nearby (unless they have sec access!)
#define TURRET_FLAG_AUTH_WEAPONS (1<<1) // Checks if it can shoot people that have a weapon they aren't authorized to have
#define TURRET_FLAG_SHOOT_CRIMINALS (1<<2) // Checks if it can shoot people that are wanted
#define TURRET_FLAG_SHOOT_ALL (1<<3)  // The turret gets pissed off and shoots at people nearby (unless they have sec access!)
#define TURRET_FLAG_SHOOT_ANOMALOUS (1<<4)  // Checks if it can shoot at unidentified lifeforms (ie xenos)
#define TURRET_FLAG_SHOOT_UNSHIELDED (1<<5) // Checks if it can shoot people that aren't mindshielded and who arent heads
#define TURRET_FLAG_SHOOT_BORGS (1<<6) // checks if it can shoot cyborgs
#define TURRET_FLAG_SHOOT_HEADS (1<<7) // checks if it can shoot at heads of staff
#define TURRET_FLAG_SHOOT_SHIELDED (1<<8) // Checks if it shoots mindshielded people

DEFINE_BITFIELD(turret_flags, list(
	"TURRET_FLAG_SHOOT_ALL_REACT" = TURRET_FLAG_SHOOT_ALL_REACT,
	"TURRET_FLAG_AUTH_WEAPONS" = TURRET_FLAG_AUTH_WEAPONS,
	"TURRET_FLAG_SHOOT_CRIMINALS" = TURRET_FLAG_SHOOT_CRIMINALS,
	"TURRET_FLAG_SHOOT_ALL" = TURRET_FLAG_SHOOT_ALL,
	"TURRET_FLAG_SHOOT_ANOMALOUS" = TURRET_FLAG_SHOOT_ANOMALOUS,
	"TURRET_FLAG_SHOOT_UNSHIELDED" = TURRET_FLAG_SHOOT_UNSHIELDED,
	"TURRET_FLAG_SHOOT_BORGS" = TURRET_FLAG_SHOOT_BORGS,
	"TURRET_FLAG_SHOOT_HEADS" = TURRET_FLAG_SHOOT_HEADS,
	"TURRET_FLAG_SHOOT_SHIELDED" = TURRET_FLAG_SHOOT_SHIELDED,
))

/obj/machinery/porta_turret
	///if you can move it regardless if it is raised or not
	var/alwaysmovable = 0

/obj/machinery/porta_turret/combine
	name = "combine turret"
	icon_state = "combine_lethal"
	base_icon_state = "combine"
	installation = null
	stun_projectile = /obj/projectile/bullet/pulse/ar2
	lethal_projectile = /obj/projectile/bullet/pulse/ar2
	lethal_projectile_sound = "hl13/sound/weapons/ar2fire.ogg"
	stun_projectile_sound = "hl13/sound/weapons/ar2fire.ogg"
	shot_delay = 10
	invisibility = 0
	density = TRUE
	desc = "A combine made turret which shoots at specified targets with a high power pulse gun."
	req_access = list(ACCESS_SECURITY)
	faction = list("combine")
	has_cover = FALSE
	always_up = TRUE
	use_power = NO_POWER_USE
	turret_flags = TURRET_FLAG_SHOOT_CRIMINALS | TURRET_FLAG_SHOOT_ANOMALOUS | TURRET_FLAG_SHOOT_BORGS
	scan_range = 9
	mode = TURRET_LETHAL
	anchored = 0
	raised = 1
	alwaysmovable = TRUE
	max_integrity = 180
	uses_stored = FALSE
	armor_type = /datum/armor/combine_porta_turret

/datum/armor/combine_porta_turret
	melee = 50
	bullet = 40
	laser = 30
	energy = 30
	bomb = 20
	fire = 90
	acid = 90

/obj/machinery/porta_turret/combine/off
	on = FALSE

/obj/machinery/porta_turret/combine/fast
	stun_projectile = /obj/projectile/bullet/pulse/ar2/fast
	lethal_projectile = /obj/projectile/bullet/pulse/ar2/fast

/obj/machinery/porta_turret/combine/mp7
	stun_projectile = /obj/projectile/bullet/c46x30mm
	lethal_projectile = /obj/projectile/bullet/c46x30mm
	lethal_projectile_sound = "hl13/sound/weapons/smgfire.ogg"
	stun_projectile_sound = "hl13/sound/weapons/smgfire.ogg"

/obj/machinery/porta_turret/combine/mp7/off
	on = FALSE

/obj/machinery/porta_turret/combine/setup()
	return

/obj/machinery/porta_turret/combine/assess_perp(mob/living/carbon/human/perp)
	return 10 //shoot everything not in their faction

/obj/machinery/porta_turret/combine/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	to_chat(user, span_warning("You modify [src]'s threat assessment circuits to shoot combine authorised individuals."))
	visible_message("[src] hums oddly...")
	obj_flags |= EMAGGED
	locked = FALSE
	req_access = null
	turret_flags = TURRET_FLAG_SHOOT_HEADS | TURRET_FLAG_SHOOT_SHIELDED
	faction += ROLE_SYNDICATE
	faction -= "combine"
	on = TRUE
	return TRUE

/obj/machinery/porta_turret/combine/old
	name = "old combine turret"
	shot_delay = 10
	stun_projectile = /obj/projectile/bullet/pulse/weak
	lethal_projectile = /obj/projectile/bullet/pulse/weak

/obj/machinery/porta_turret/combine/rebel
	name = "rebel turret"
	icon_state = "cmbpaint1_lethal"
	base_icon_state = "cmbpaint1"
	desc = "A hacked combine turret with a fresh coat of paint. Fires at bio signal authorised targets with a high power pulse gun."
	faction = list("Syndicate")
	locked = FALSE
	req_access = null

/obj/machinery/porta_turret/combine/rebel/fast
	stun_projectile = /obj/projectile/bullet/pulse/ar2/fast
	lethal_projectile = /obj/projectile/bullet/pulse/ar2/fast

/obj/machinery/porta_turret/combine/rebel/assess_perp(mob/living/carbon/human/perp) //shoot mindshielded people
	if (HAS_TRAIT(perp, TRAIT_MINDSHIELD))
		return 10
	else
		return 0

#undef TURRET_STUN
#undef TURRET_LETHAL
#undef POPUP_ANIM_TIME
#undef POPDOWN_ANIM_TIME
#undef TURRET_FLAG_SHOOT_ALL_REACT
#undef TURRET_FLAG_AUTH_WEAPONS
#undef TURRET_FLAG_SHOOT_CRIMINALS
#undef TURRET_FLAG_SHOOT_ALL
#undef TURRET_FLAG_SHOOT_ANOMALOUS
#undef TURRET_FLAG_SHOOT_UNSHIELDED
#undef TURRET_FLAG_SHOOT_BORGS
#undef TURRET_FLAG_SHOOT_HEADS
#undef TURRET_FLAG_SHOOT_SHIELDED // Checks if it shoots mindshielded people
