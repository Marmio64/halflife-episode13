#define NIGHT_TURF_BRIGHTNESS 0.1

#define DAY_LENGTH 30 MINUTES //With 30 minutes, days are 18000 deciseconds long

#define MORNING_START (DAY_LENGTH / 8) //With 30 minutes, morning is at 2250 deciseconds

#define AFTERNOON_START (DAY_LENGTH * 0.4) //With 30 minutes, afternoon is at 7200 deciseconds

#define DUSK_START (DAY_LENGTH * 0.90) //With 30 minutes, dusk is at 16200 deciseconds. Dusk is effectively just the night curfew warning state

#define NIGHT_START (DAY_LENGTH * 0.94) //With 30 minutes, night is at 16920 deciseconds. Night is the shortest at around 6 minutes, because if curfews are enforced, you shouldnt be locked up for a very long time.

#define DAY_CYCLE_MORNING "Morning"

#define DAY_CYCLE_AFTERNOON "Afternoon"

#define DAY_CYCLE_DUSK "Dusk"

#define DAY_CYCLE_NIGHT "Night"

#define MAX_QUOTA_MULTIPLIER 1.2

SUBSYSTEM_DEF(daylight)
	name = "Daylight"
	wait = 2 SECONDS
	flags = SS_NO_INIT
	/// Time required to complete a full day-night cycle
	var/daylight_time = DAY_LENGTH

	/// What is the current time?
	var/current_day_time = 0

	/// Coefficient for setting area lights
	var/light_coefficient = 0

	/// Which part of the day cycle is currently active?
	var/day_cycle_active = DAY_CYCLE_NIGHT

	/// All areas that should update their lighting based on time of day
	var/list/area/daylight_areas = list()

	/// How many containers were filled during the afternoon
	var/factory_containers_filled = 0

	/// What was the ideal goal for containers filled. 100% of this means extra sociostability. Failure to get a certain amount subtracts sociostability.
	var/factory_container_goal = 15

	/// Multiplier applied to the goal, to allow for it to scale over time.
	var/factory_goal_multiplier = 0.6

	/// What is the day's tax the prison will face
	var/daily_tax = 0

/datum/controller/subsystem/daylight/proc/add_lit_area(area/new_area)
	daylight_areas.Add(new_area)

/datum/controller/subsystem/daylight/proc/remove_lit_area(area/old_area)
	daylight_areas.Remove(old_area)

/datum/controller/subsystem/daylight/fire(resumed = FALSE)
	current_day_time += 2 SECONDS

	if(current_day_time >= DAY_LENGTH)
		current_day_time = 0
		day_cycle_active = DAY_CYCLE_NIGHT

	if(current_day_time >= NIGHT_START || current_day_time <= MORNING_START)
		if(day_cycle_active != DAY_CYCLE_NIGHT)
			day_cycle_active = DAY_CYCLE_NIGHT

			var/message = "Attention inmates, it is now night time. Inmates are to return to their cells for the nightly lockup."

			if(factory_goal_multiplier < MAX_QUOTA_MULTIPLIER) // easier first day, standard second day, max value fourth day and on
				factory_goal_multiplier += 0.2

			if(factory_containers_filled >= factory_container_goal)
				SSsociostability.modifystability(10) //full completion. This is in addition to the sociostability bonuses from simply completing containers.

				message += " The factory quota was completed entirely, and the warden may redeem a reward at the box vendor."

			else if(factory_containers_filled < factory_container_goal/2) //Failed to meet at least half the goal, disappointing...
				SSsociostability.modifystability(-75) //-7.5%

				message += " The factory quota was a failure. Sociostability has been adjusted accordingly."

			for(var/obj/machinery/box_vendor/vendor as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/box_vendor))
				vendor.boxes_stored = 0
				if(factory_containers_filled >= factory_container_goal)
					vendor.cashprize += factory_container_goal

			if(SSmapping.current_map.minetype != "combat_deployment")
				var/datum/bank_account/bank_account = SSeconomy.get_dep_account(ACCOUNT_CAR)
				if (bank_account.account_balance < daily_tax)
					message += " The daily tax was failed. Sociostability has been adjusted accordingly."
					SSsociostability.modifystability(-50) //-5%. Smallish, cause cargo also onloads debt now
					bank_account.account_debt += daily_tax
				else
					bank_account.adjust_money(-daily_tax)

				priority_announce(message, "Lockup Notice.", sender_override = "Prison Automated Scheduler")

			//curfew zombies dont really make enough sense for the prison
			/*
				curfew_zombies() //spawn zombies for curfew, encourages going indoors

				if(prob(75))
					curfew_zombies()
				if(prob(50))
					curfew_zombies()
				if(prob(25))
					curfew_zombies()
			*/

		if(light_coefficient > 0)
			light_coefficient -= 0.025

	if(current_day_time > MORNING_START && current_day_time <= AFTERNOON_START)
		if(day_cycle_active != DAY_CYCLE_MORNING)
			day_cycle_active = DAY_CYCLE_MORNING
			daily_tax = (get_factory_goal() * 30) //10 people would be 330 credits with standard multiplier
			if(SSmapping.current_map.minetype != "combat_deployment")
				priority_announce("Attention occupants, night has concluded, and Curfew is over. Your morning ration cycle will begin in thirty seconds. The daily tax is set at [daily_tax] credits.", "Curfew Notice.", sender_override = "Prison Automated Scheduler")
		if(light_coefficient < 0.5)
			light_coefficient += 0.025

	if(current_day_time > AFTERNOON_START && current_day_time <= DUSK_START )
		if(day_cycle_active != DAY_CYCLE_AFTERNOON)
			factory_container_goal = get_factory_goal()

			day_cycle_active = DAY_CYCLE_AFTERNOON
			if(SSmapping.current_map.minetype != "combat_deployment")
				priority_announce("Attention occupants, it is now afternoon. The previous ration cycle has ended. All inmates are to begin productive efforts, and to inquire security personnel for work if unemployed. Today's factory container fill goal is [factory_container_goal], compliance is mandatory.", "Work Notice.", sender_override = "Prison Automated Scheduler")

			factory_containers_filled = 0

			for(var/obj/machinery/box_vendor/vendor as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/box_vendor))
				vendor.boxes_stored = factory_container_goal

		if(light_coefficient < 1)
			light_coefficient += 0.025

	if(current_day_time > DUSK_START  && current_day_time <= NIGHT_START)
		if(day_cycle_active != DAY_CYCLE_DUSK && day_cycle_active != DAY_CYCLE_NIGHT)
			day_cycle_active = DAY_CYCLE_DUSK
			if(SSmapping.current_map.minetype != "combat_deployment")
				priority_announce("Attention occupants, night will be approaching shortly, and lockup will begin soon. Inmates are to get ready for lockup.", "Curfew Notice.", sender_override = "Prison Automated Scheduler")
		if(light_coefficient > 0.5)
			light_coefficient -= 0.025

	//							 	Converts into minutes	Converts into minutes
	//var/light_coefficient = ((255 / (DAY_LENGTH / 600)) * (current_day_time/600))
	var/light_alpha = round(255 * light_coefficient)
	var/light_color = rgb(255, 130 + 125 * light_coefficient, 130 + 125 * light_coefficient)
	for(var/area/lit_area as anything in daylight_areas)
		lit_area.set_base_lighting(light_color, light_alpha * lit_area.daylight_multiplier)

/datum/controller/subsystem/daylight/proc/twentyfourhourstamp()
	return daylight_time * 48 //a close approximate, assuming the day length is still 30 minutes.

/datum/controller/subsystem/daylight/proc/get_factory_goal()
	var/goal_amount = 0
	goal_amount = (get_active_player_count(alive_check = TRUE, afk_check = TRUE, human_check = TRUE)+1) //The goal is equal to all currently playing players, plus one as a baseline.
	goal_amount *= factory_goal_multiplier
	goal_amount = ROUND_UP(goal_amount)
	return goal_amount

/datum/controller/subsystem/daylight/proc/curfew_zombies(amount)
	var/datum/round_event_control/sentient_zombie/ZombieControl = new /datum/round_event_control/sentient_zombie()
	var/datum/round_event/ghost_role/sentient_zombie/zombie = ZombieControl.run_event()
	zombie.setup()

#undef MAX_QUOTA_MULTIPLIER
