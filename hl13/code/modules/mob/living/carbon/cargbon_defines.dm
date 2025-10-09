/mob/living/carbon
	/// Cooldown for the next smell - imagine the smell
	var/next_smell = 0

	var/temporary_pain = 0 //temporary pain that will fade in time, capped to 100
	var/last_painstun = 0
	var/painstuncooldown = 350
	//how tired they are, for sleepytime
	var/tiredness = 0
	canparry = TRUE
	candodge = TRUE
	var/last_jump_time = 0
	var/jump_range = 1

	throw_range = 5

	/// Current combat deployment loadout tier for this mob
	var/combat_deployment_loadout_tier = 1

	var/loadout_upgrade_available = TRUE
