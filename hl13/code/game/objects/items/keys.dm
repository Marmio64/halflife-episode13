/obj/item/hl2key
	name = "key"
	desc = "A simple key of simple uses."
	icon_state = "brass"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	var/lockhash = 0
	var/lockid = null

/obj/item/hl2key/Initialize()
	. = ..()
	if(lockid)
		if(GLOB.lockids[lockid])
			lockhash = GLOB.lockids[lockid]
		else
			lockhash = rand(100,999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(100,999)
			GLOB.lockhashes += lockhash
			GLOB.lockids[lockid] = lockhash

/obj/item/lockpick
	name = "lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key."
	icon_state = "lockpick"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	max_integrity = 10
	var/picklvl = 1

/obj/item/lockpick/combine
	name = "combine lockpick"
	desc = "A combine-grade lockpick, able to pick locks more easily than your standard lockpick."
	picklvl = 1.25

/obj/item/hl2key/master
	name = "master key"
	desc = "The district administrator's master key."
	lockid = "administrator"

/obj/item/hl2key/master/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/machinery/door/unpowered/halflife))
		var/obj/machinery/door/unpowered/halflife/D = target
		if(D.masterkey)
			lockhash = D.lockhash

/obj/item/hl2key/master/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	lockhash = GLOB.lockids[lockid]

/obj/item/hl2key/townhall
	name = "townhall key"
	desc = "This key will open doors in the townhall."
	lockid = "townhall"

/obj/item/hl2key/bar
	name = "bar key"
	desc = "This key will open doors in the bar."
	lockid = "bar"

/obj/item/hl2key/kitchen
	name = "kitchen key"
	desc = "This key will open doors in the restaurant."
	lockid = "kitchen"

/obj/item/hl2key/factory
	name = "factory key"
	desc = "This key will open doors in the factory."
	lockid = "factory"

/obj/item/hl2key/clerk
	name = "store key"
	desc = "This key will open doors in the store."
	lockid = "store"

/obj/item/hl2key/rebel
	name = "bunker key"
	desc = "This key seems to open some kind of bunker."
	lockid = "rebel"

/obj/item/hl2key/labor
	name = "labor union key"
	desc = "This key will open doors in the labor union."
	lockid = "laborunion"

/obj/item/hl2key/hospital
	name = "hospital key"
	desc = "This key will open doors in the hospital."
	lockid = "hospital"

/obj/item/hl2key/lab
	name = "laboratory key"
	desc = "This key will open doors in the science lab."
	lockid = "lab"

/obj/item/hl2key/train
	name = "trainstation key"
	desc = "This key will open doors in the train station."
	lockid = "trainstation"

/obj/item/hl2key/overwatch_exchange
	name = "overwatch exchange key"
	desc = "This key will open doors in the Overwatch exchange station."
	lockid = "overwatch_exchange"

/obj/item/hl2key/rebel_outpost
	name = "rebel outpost key"
	desc = "This key will open doors in the Rebel train station."
	lockid = "rebel_trainstation"

//custom key
/obj/item/hl2key/custom
	name = "custom key"
	desc = "A custom key."

/obj/item/hl2key/custom/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/screwdriver))
		var/input = (input(user, "What would you name this key?", "", "") as text)
		if(input)
			name = name + " key"
			to_chat(user, "<span class='notice'>You rename the key to [name].</span>")

//custom key blank
/obj/item/customblank //i'd prefer not to make a seperate item for this honestly
	name = "blank custom key"
	desc = "A key without its teeth carved in. A screwdriver may be able to set the teeth by right clicking it, and then left clicking to finish it."
	icon_state = "brass"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY

	custom_price = 12

	var/lockhash = 0

/obj/item/customblank/attackby_secondary(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/screwdriver))
		var/input = input(user, "What would you like to set the key ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, "<span class='notice'>You set the key ID to [input].</span>")
		lockhash = 10000 + input //having custom lock ids start at 10000 leaves it outside the range that opens normal doors
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/customblank/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/hl2key))
		var/obj/item/hl2key/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You trace the teeth from [held] to [src].</span>")
	else if(istype(I, /obj/item/customlock))
		var/obj/item/customlock/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You fine-tune [src] to the lock's internals.</span>")
	else if(istype(I, /obj/item/screwdriver) && src.lockhash != 0)
		var/obj/item/hl2key/custom/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)

//custom lock unfinished
/obj/item/customlock
	name = "unfinished lock"
	desc = "A lock without its pins set. You may be able to set the pins with a screwdriver by leftclicking the lock, and finishing it by rightclicking."
	icon_state = "brass"
	icon = 'hl13/icons/obj/locks.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/lockhash = 0

/obj/item/customlock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/screwdriver))
		var/input = input(user, "What would you like to set the lock ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, "<span class='notice'>You set the lock ID to [input].</span>")
		lockhash = 10000 + input //same deal as the customkey
	else if(istype(I, /obj/item/hl2key))
		var/obj/item/hl2key/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, "<span class='notice'>[I] twists cleanly in [src].</span>")
		else
			to_chat(user, "<span class='warning'>[I] jams in [src],</span>")
	else if(istype(I, /obj/item/customblank))
		var/obj/item/customblank/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, "<span class='notice'>[I] twists cleanly in [src].</span>") //this makes no sense since the teeth aren't formed yet but i want people to be able to check whether the locks theyre making actually fit
		else
			to_chat(user, "<span class='warning'>[I] jams in [src].</span>")

/obj/item/customlock/attackby_secondary(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/hl2key))//i need to figure out how to avoid these massive if/then trees, this sucks
		var/obj/item/hl2key/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You align the lock's internals to [held].</span>") //locks for non-custom keys
	else if(istype(I, /obj/item/customblank))
		var/obj/item/customblank/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You align the lock's internals to [held].</span>")
	else if(istype(I, /obj/item/screwdriver) && src.lockhash != 0)
		var/obj/item/customlock/finished/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

//finished lock
/obj/item/customlock/finished
	name = "lock"
	desc = "A customized iron lock that is used by keys."
	var/holdname = ""

/obj/item/customlock/finished/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/screwdriver))
		src.holdname = input(user, "What would you like to name this?", "", "") as text
		if(holdname)
			to_chat(user, "<span class='notice'>You label the [name] with [holdname].</span>")

/obj/item/customlock/finished/attack_atom(obj/structure/K, mob/living/user)
	if(istype(K, /obj/machinery/door/unpowered/halflife))
		var/obj/machinery/door/unpowered/halflife/KE = K
		if(KE.keylock == TRUE)
			to_chat(user, "<span class='warning'>[K] already has a lock.</span>")
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			if(src.holdname)
				KE.name = src.holdname
			to_chat(user, "<span class='notice'>You add [src] to [K].</span>")
			qdel(src)
