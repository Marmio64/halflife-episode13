/mob/living/carbon
	/// Cooldown for the next smell - imagine the smell
	var/next_smell = 0

	var/temporary_pain = 0 //temporary pain that will fade in time, capped to 100
	var/last_painstun = 0
	var/painstuncooldown = 300
	//how tired they are, for sleepytime
	var/tiredness = 0
	canparry = TRUE
	candodge = TRUE
