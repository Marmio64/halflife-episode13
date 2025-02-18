/mob/living/simple_animal/hostile/halflife
	ai_idles = FALSE
	wander = 0 //Might reduce costs associated with them

//Larry
/mob/living/simple_animal/halflife/larry
	name = "Larry"
	desc = "A supposedly debeaked headcrab. Unknown if approved by the combine, but it has been kept in the science lab for a while now."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 30
	health = 30
	attack_sound = 'hl13/sound/creatures/headcrabbite.ogg'
	minbodytemp = 0
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/headcrabdeath.ogg'

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!

//Harry
/mob/living/simple_animal/halflife/harry
	name = "Harry"
	desc = "A supposedly debeaked poison headcrab. Donated by the science lab to the factory."
	icon = 'hl13/icons/mob/halflife.dmi'
	icon_state = "poisonheadcrab"
	icon_living = "poisonheadcrab"
	icon_dead = "poisonheadcrab_dead"
	mob_biotypes = MOB_ORGANIC|MOB_XENIAN
	maxHealth = 45
	health = 45
	attack_sound = 'hl13/sound/creatures/poison/ph_poisonbite.ogg'
	minbodytemp = 0
	butcher_results = list(/obj/item/food/meat/slab/xen = 1, /obj/item/stack/sheet/sinew = 1, /obj/item/stack/sheet/bone = 1)
	death_sound = 'hl13/sound/creatures/poison/ph_death.ogg'

	cmode_music = 'hl13/sound/music/combat/disrupted.ogg' //spooky!
