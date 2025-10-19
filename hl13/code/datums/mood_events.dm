//hydration

/datum/mood_event/too_wellhydrated
	description = "I drank a bit too much, my stomach is bursting at the seams..."
	mood_change = 0

/datum/mood_event/wellhydrated
	description = "I'm well hydrated."
	mood_change = 2

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
	mood_change = 1

/datum/mood_event/comfy_sleep
	description = "I slept on something decently comfortable."
	mood_change = 2
	timeout = 5 MINUTES

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

/datum/mood_event/hygiene/smelly/highborn
	description = "I smell terrible! This is in no way fit for someone such as myself, I need a washing."
	mood_change = -5

/datum/mood_event/hygiene/filthy/highborn
	description = "I smell absolutely disgusting, this is completely unfit for someone of my status! I need a shower right now!!"
	mood_change = -10

//tv

/datum/mood_event/tvbad
	description = "Watching that program was demoralizing, it made me feel worse."
	mood_change = -3
	timeout = 4 MINUTES //can only watch once per day

/datum/mood_event/tvboring
	description = "Watching that program wasn't interesting, it felt like a waste of time."
	mood_change = -1
	timeout = 4 MINUTES

/datum/mood_event/tvok
	description = "Watching that program was somewhat interesting, it made me feel okay."
	mood_change = 1
	timeout = 4 MINUTES

/datum/mood_event/tvgood
	description = "Watching that program was moralizing, it made me feel better."
	mood_change = 3
	timeout = 4 MINUTES

/datum/mood_event/rallied
	description = "I feel rallied towards a cause!"
	mood_change = 10
	timeout = 45 SECONDS
