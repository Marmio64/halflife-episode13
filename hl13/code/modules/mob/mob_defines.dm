/mob
///Image that is used to mask out the vapour on a persons screen.
	var/image/vapour_alpha_mask

	var/d_intent = INTENT_PARRY
	var/canparry = FALSE
	var/candodge = FALSE
	var/last_parry = 0
	var/last_dodge = 0
	var/dodge_cooldown = 50
