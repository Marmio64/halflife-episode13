/obj/effect/landmark/mafia_game_area //locations where mafia will be loaded by the datum
	name = "Mafia Area Spawn"
	var/game_id = "mafia"

/obj/effect/landmark/mafia
	name = "Mafia Player Spawn"
	var/game_id = "mafia"

/obj/effect/landmark/mafia/town_center
	name = "Mafia Town Center"

//for ghosts/admins
/obj/mafia_game_board
	name = "Mafia Game Board"
	icon = 'icons/obj/mafia.dmi'
	icon_state = "board"
	anchored = TRUE
	var/game_id = "mafia"
	var/datum/mafia_controller/MF

/obj/mafia_game_board/attack_ghost(mob/user)
	. = ..()
	if(!MF)
		MF = GLOB.mafia_game
	if(!MF)
		MF = create_mafia_game()
	MF.ui_interact(user)

/datum/map_template/mafia
	should_place_on_top = FALSE
	///The map suffix to put onto the mappath.
	var/map_suffix
	///A brief background tidbit
	var/description = ""
	///What costume will this map force players to start with?
	var/custom_outfit

/datum/map_template/mafia/New(path = null, rename = null, cache = FALSE)
	path = "_maps/map_files/Mafia/" + map_suffix
	return ..()

//we only have one map in unit tests for consistency.
#ifdef UNIT_TESTS
/datum/map_template/mafia/unit_test
	name = "Mafia Unit Test"
	description = "A map designed specifically for Unit Testing to ensure the game runs properly."
	map_suffix = "mafia_unit_test.dmm"

#else

/datum/map_template/mafia/city13
	name = "City 13"
	description = "Simple city apartments, where absolutely nothing will go wrong. Or so it seems..."
	map_suffix = "mafia_city13.dmm"

#endif
