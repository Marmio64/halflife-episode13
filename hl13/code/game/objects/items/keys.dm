/obj/item/hl2key
	name = "key"
	desc = "A simple key of simple uses."
	icon_state = "brass"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	var/lockhash = 0
	var/lockid = null
	var/masterkey = FALSE

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

/obj/item/storage/halflife/keyring
	name = "keyring"
	desc = "A simple ring, so you may carry more keys."
	icon = 'hl13/icons/obj/keys.dmi'
	icon_state = "keyring"
	base_icon_state = "keyring"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/halflife/keyring/PopulateContents()
	. = ..()
	update_icon_state()

/obj/item/storage/halflife/keyring/Initialize(mapload)
	. = ..()

	atom_storage.max_slots = 5
	atom_storage.set_holdable(list(
		/obj/item/hl2key,
	))

/obj/item/storage/halflife/keyring/update_icon_state()
	var/amount = 0
	for(var/_key in contents)
		var/obj/item/hl2key/key = _key
		if (!istype(key))
			continue
		amount++

	icon_state = "[initial(icon_state)]_[amount]"
	return ..()


/obj/item/lockpick
	name = "lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key."
	icon_state = "lockpick"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	max_integrity = 12
	var/picklvl = 1

/obj/item/lockpick/ingested
	name = "slimey lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key. This one is covered in gooey guts and small pieces of entrails from some sort of beast."

/obj/item/lockpick/makeshift
	name = "makeshift lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key. This one is shoddily made, and will be less effective and durable."
	max_integrity = 8
	picklvl = 0.75

/obj/item/lockpick/combine
	name = "combine lockpick"
	desc = "A combine-grade lockpick, able to pick locks more easily than your standard lockpick."
	picklvl = 1.25

/obj/item/lockpick/combine/ic
	name = "infestation control lockpick"
	desc = "A combine-grade lockpick, able to pick locks more easily than your standard lockpick."

/obj/item/hl2key/master
	name = "master key"
	desc = "The warden's master key."
	lockid = "administrator"
	masterkey = TRUE

/obj/item/hl2key/townhall
	name = "townhall key"
	desc = "This key will open doors in the townhall."
	lockid = "townhall"

/obj/item/hl2key/prisoner_cells
	name = "prison cell keys"
	desc = "This key will open prisoner cell doors."
	lockid = "prison_cell"

/obj/item/hl2key/bar
	name = "bar key"
	desc = "This key will open doors in the bar."
	lockid = "bar"

/obj/item/hl2key/barapartments
	name = "bar apartments key"
	desc = "This key will open doors in the bar's attached apartment block."
	lockid = "barapartments"

/obj/item/hl2key/kitchen
	name = "kitchen key"
	desc = "This key will open doors in the restaurant."
	lockid = "kitchen"

/obj/item/hl2key/factory
	name = "factory key"
	desc = "This key will open doors in the factory and mines."
	lockid = "factory"

/obj/item/hl2key/foreman
	name = "foreman key"
	desc = "This key will open the foreman's office."
	lockid = "foreman"

/obj/item/hl2key/garden
	name = "garden key"
	desc = "This key will open doors in the garden."
	lockid = "garden"

/obj/item/hl2key/clerk
	name = "store key"
	desc = "This key will open doors in the store."
	lockid = "store"

/obj/item/hl2key/rebel
	name = "bunker key"
	desc = "This key seems to open some kind of bunker."
	lockid = "rebel"

/obj/item/hl2key/conscript
	name = "conscript key"
	desc = "This key opens doors in the conscript base."
	lockid = "conscript"

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
	desc = "A custom key. Use it inhand to rename it."

/obj/item/hl2key/custom/attack_self(mob/user)
	var/input = (input(user, "What would you name this key?", "", "") as text)
	if(input)
		name = input + " key"
		to_chat(user, "<span class='notice'>You rename the key to [name].</span>")

//custom key blank
/obj/item/customblank //i'd prefer not to make a seperate item for this honestly
	name = "blank custom key"
	desc = "A key without its teeth carved in. You can click it inhand to set the key ID, then right click to finish the key."
	icon_state = "brass"
	icon = 'hl13/icons/obj/keys.dmi'
	w_class = WEIGHT_CLASS_TINY

	custom_price = PAYCHECK_CREW

	var/lockhash = 0

/obj/item/customblank/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/hl2key))
		var/obj/item/hl2key/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You trace the teeth from [held] to [src].</span>")
	else if(istype(I, /obj/item/customlock))
		var/obj/item/customlock/held = I
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You fine-tune [src] to the lock's internals.</span>")

/obj/item/customblank/attack_self(mob/user)
	var/input = input(user, "What would you like to set the key ID to?", "", 0) as num
	input = max(0, input)
	to_chat(user, "<span class='notice'>You set the key ID to [input].</span>")
	lockhash = 10000 + input //having custom lock ids start at 10000 leaves it outside the range that opens normal doors

/obj/item/customblank/attack_self_secondary(mob/user)
	if(src.lockhash != 0)
		var/obj/item/hl2key/custom/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)

//custom lock unfinished
/obj/item/customlock
	name = "unfinished lock"
	desc = "A lock without its pins set. You can set the pins by left clicking it in hand, and finishing it by right clicking."
	icon_state = "brass"
	icon = 'hl13/icons/obj/locks.dmi'
	w_class = WEIGHT_CLASS_SMALL

	custom_price = PAYCHECK_CREW * 1.5

	var/lockhash = 0

/obj/item/customlock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/hl2key))
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
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/customlock/attack_self(mob/user)
	var/input = input(user, "What would you like to set the lock ID to?", "", 0) as num
	input = max(0, input)
	to_chat(user, "<span class='notice'>You set the lock ID to [input].</span>")
	lockhash = 10000 + input //same deal as the customkey

/obj/item/customlock/attack_self_secondary(mob/user)
	if(src.lockhash != 0)
		var/obj/item/customlock/finished/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)

//finished lock
/obj/item/customlock/finished
	name = "lock"
	desc = "A customized iron lock that is used by keys. Use it inhand to rename it."
	var/holdname = ""

/obj/item/customlock/finished/attack_self(mob/user)
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
