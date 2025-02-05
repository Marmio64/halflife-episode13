//hydration

/datum/mood_event/too_wellhydrated
	description = "I drank a bit too much, my stomach is bursting at the seams..."
	mood_change = 0

/datum/mood_event/wellhydrated
	description = "I'm well hydrated!"
	mood_change = 3

/datum/mood_event/hydrated
	description = "I've recently had a beverage."
	mood_change = 1

/datum/mood_event/thirsty
	description = "I'm getting pretty thirsty."
	mood_change = -2

/datum/mood_event/parched
	description = "My throat is parched."
	mood_change = -4

/datum/mood_event/dehydrated
	description = "I am so thirsty my mouth feels like cotton..."
	mood_change = -6

//sleepy
/datum/mood_event/sleepy/exhausted
	description = "I'm so exhausted, I feel like I could collapse any second now..."
	mood_change = -10

/datum/mood_event/sleepy/exhausted/spartan
	description = "I'm so exhausted, but sleep is for the weak...!"
	mood_change = -5

/datum/mood_event/sleepy
	description = "I'm very tired..."
	mood_change = -8

/datum/mood_event/sleepy/spartan
	description = "I tire, but I must go on."
	mood_change = -3

/datum/mood_event/sleepy/small
	description = "I'm a bit tired."
	mood_change = -4

/datum/mood_event/energized
	description = "I don't feel a bit tired, and have energy and focus."
	mood_change = 2


//pain
/datum/mood_event/seriouspain
	description = "Fuck, i'm hurting pretty bad right now."
	mood_change = -6

/datum/mood_event/maxpain
	description = "AGH, FUCK! THE PAIN HURTS SO MUCH!!."
	mood_change = -12

//hygiene

/datum/mood_event/hygiene/clean
	description = "I feel rather clean."
	mood_change = 2

/datum/mood_event/hygiene/smelly
	description = "I smell pretty bad. I should take a shower."
	mood_change = -2

/datum/mood_event/hygiene/filthy
	description = "I smell and feel like absolute shit. I desperately need to wash myself."
	mood_change = -5
