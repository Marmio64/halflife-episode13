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
	stun_projectile = /obj/projectile/bullet/pulse/turret
	lethal_projectile = /obj/projectile/bullet/pulse/turret
	lethal_projectile_sound = "hl13/sound/weapons/turret_shoot.ogg"
	stun_projectile_sound = "hl13/sound/weapons/turret_shoot.ogg"
	shot_delay = 5
	invisibility = 0
	density = TRUE
	drag_slowdown = 1
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
	max_integrity = 100 //80 effective health, since it breaks at 20 integrity
	integrity_failure = 0.2
	uses_stored = FALSE
	armor_type = /datum/armor/combine_porta_turret

/obj/machinery/porta_turret/combine/wrench_act(mob/living/user, obj/item/tool)
	if(atom_integrity == max_integrity)
		balloon_alert(user, "no repairs needed")
		return ITEM_INTERACT_BLOCKING

	if(machine_stat & (BROKEN|NOPOWER))
		balloon_alert(user, "too damaged for repair")
		return ITEM_INTERACT_BLOCKING

	tool.play_tool_sound(src)
	balloon_alert(user, "repairing turret...")
	if(!do_after(user, (5 SECONDS), target = src))
		return ITEM_INTERACT_BLOCKING

	if(machine_stat & (BROKEN|NOPOWER)) //sanity check
		balloon_alert(user, "too damaged for repair")
		return ITEM_INTERACT_BLOCKING

	balloon_alert(user, "repaired")
	atom_integrity = max_integrity
	return ITEM_INTERACT_SUCCESS

/datum/armor/combine_porta_turret
	melee = 30
	bullet = 40
	laser = 30
	energy = 30
	bomb = 20
	fire = 90
	acid = 90

/obj/machinery/porta_turret/combine/atom_break(damage_flag)
	. = ..()
	playsound(src, 'hl13/sound/machines/turret_die.ogg', 50, FALSE)

/obj/machinery/porta_turret/combine/off
	on = FALSE

/obj/machinery/porta_turret/combine/fast
	stun_projectile = /obj/projectile/bullet/pulse/weak/fast
	lethal_projectile = /obj/projectile/bullet/pulse/weak/fast

/obj/machinery/porta_turret/combine/mp7
	stun_projectile = /obj/projectile/bullet/c46x30mm
	lethal_projectile = /obj/projectile/bullet/c46x30mm
	lethal_projectile_sound = "hl13/sound/weapons/smgfire.ogg"
	stun_projectile_sound = "hl13/sound/weapons/smgfire.ogg"

/obj/machinery/porta_turret/combine/mp7/off
	on = FALSE

/obj/machinery/porta_turret/combine/target(atom/movable/target)
	if(target)
		setDir(get_dir(base, target))//even if you can't shoot, follow the target
		shootAt(target)
		addtimer(CALLBACK(src, PROC_REF(shootAt), target), 0.5 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(shootAt), target), 1 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(shootAt), target), 1.5 SECONDS)
		return TRUE

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
	stun_projectile = /obj/projectile/bullet/pulse/turret/weak
	lethal_projectile = /obj/projectile/bullet/pulse/turret/weak

/obj/machinery/porta_turret/combine/rebel
	name = "rebel turret"
	icon_state = "cmbpaint1_lethal"
	base_icon_state = "cmbpaint1"
	desc = "A hacked combine turret with a fresh coat of paint. Fires at bio signal authorised targets with a high power pulse gun."
	faction = list("Syndicate", FACTION_REFUGEE)
	locked = FALSE
	req_access = null

/obj/machinery/porta_turret/combine/rebel/fast
	stun_projectile = /obj/projectile/bullet/pulse/weak/fast
	lethal_projectile = /obj/projectile/bullet/pulse/weak/fast

/obj/machinery/porta_turret/combine/rebel/assess_perp(mob/living/carbon/human/perp) //shoot mindshielded people
	if (HAS_TRAIT(perp, TRAIT_MINDSHIELD))
		return 10
	else
		return 0

/obj/machinery/porta_turret/antlion_worker
	name = "stationary antlion worker"
	desc = "A stoic and unmoving antlion worker, which defends its hive with ranged acid blasts."
	icon_state = "worker_lethal"
	base_icon_state = "worker"
	installation = null
	stun_projectile = /obj/projectile/acidspray
	lethal_projectile = /obj/projectile/acidspray
	lethal_projectile_sound = 'hl13/sound/creatures/antlion_worker/antlion_prefire.ogg'
	stun_projectile_sound = 'hl13/sound/creatures/antlion_worker/antlion_prefire.ogg'
	invisibility = 0
	density = TRUE
	req_access = list(ACCESS_SECURITY)
	faction = list(FACTION_HEADCRAB)
	has_cover = FALSE
	always_up = TRUE
	use_power = NO_POWER_USE
	scan_range = 9
	integrity_failure = 0
	mode = TURRET_LETHAL
	raised = 1
	uses_stored = FALSE

/obj/machinery/porta_turret/antlion_worker/assess_perp(mob/living/carbon/human/perp)
	return 10 //shoot everything not in their faction

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
