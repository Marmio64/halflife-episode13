GLOBAL_LIST_EMPTY(chosen_station_templates)

#define EMPTY_SPAWN "empty_spawn"

//Care packages for rebels are dropped off here when sociostability reaches certain points.
/obj/effect/landmark/carepackage
	name = "carepackagespawn"
	//icon_state = "carp_spawn"

//Where random event destabilizers can spawn
/obj/effect/landmark/destabilizer
	name = "destabilizerspawn"
	//icon_state = "carp_spawn"

// START LANDMARKS FOLLOW. Don't change the names unless
// you are refactoring shitty landmark code.
/obj/effect/landmark/start/citizen
	name = JOB_ASSISTANT
	icon_state = "Assistant"

/obj/effect/landmark/start/citizen/override
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/civil_protection_officer
	name = JOB_SECURITY_OFFICER
	icon_state = "Security Officer"

/obj/effect/landmark/start/divisional_lead
	name = JOB_HEAD_OF_SECURITY
	icon_state = "Head of Security"

/obj/effect/landmark/start/overseer
	name = JOB_WARDEN
	icon_state = "Warden"

/obj/effect/landmark/start/city_administrator
	name = JOB_CAPTAIN
	icon_state = "Captain"

/obj/effect/landmark/start/labor_lead
	name = JOB_HEAD_OF_PERSONNEL
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/foreman
	name = JOB_QUARTERMASTER
	icon_state = "Quartermaster"

/obj/effect/landmark/start/engineer
	name = JOB_STATION_ENGINEER
	icon_state = "Station Engineer"

/obj/effect/landmark/start/cleanup_technician
	name = JOB_ATMOSPHERIC_TECHNICIAN
	icon_state = "Station Engineer"

/obj/effect/landmark/start/shaft_miner
	name = JOB_SHAFT_MINER
	icon_state = "Shaft Miner"

/obj/effect/landmark/start/vortigaunt_slave
	name = JOB_JANITOR
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/medical_doctor
	name = JOB_MEDICAL_DOCTOR
	icon_state = "Medical Doctor"

/obj/effect/landmark/start/scientist
	name = JOB_SCIENTIST
	icon_state = "Scientist"

/obj/effect/landmark/start/bartender
	name = JOB_BARTENDER
	icon_state = "Bartender"

/obj/effect/landmark/start/cook
	name = JOB_COOK
	icon_state = "Cook"

/obj/effect/landmark/start/botanist
	name = JOB_BOTANIST
	icon_state = "Botanist"

/obj/effect/landmark/start/clerk
	name = "Clerk"
	icon_state = "Clerk"

/obj/modular_map_root/citynorth
	config_file = "strings/modular_maps/sewercity.toml"
	key = "citynorth";
	name = "citynorth"

/obj/modular_map_root/citysouth
	config_file = "strings/modular_maps/sewercity.toml"
	key = "citysouth";
	name = "citysouth"

/obj/modular_map_root/sewerleft
	config_file = "strings/modular_maps/sewercity.toml"
	key = "sewerleft";
	name = "sewerleft"

/obj/modular_map_root/sewerright
	config_file = "strings/modular_maps/sewercity.toml"
	key = "sewerright";
	name = "sewerright"

/obj/modular_map_root/outlandsbunkerwest
	config_file = "strings/modular_maps/sewercity.toml"
	key = "outlandsbunkerwest";
	name = "outlandsbunkerwest"


/////////////////////////////////
/// NAVIGATE VERBS ///
/////////////////////////////////

/obj/effect/landmark/navigate_destination/halflife/townhall
	location = "Townhall"

/obj/effect/landmark/navigate_destination/halflife/hospital
	location = "Hospital"

/obj/effect/landmark/navigate_destination/halflife/science
	location = "Science Labs"

/obj/effect/landmark/navigate_destination/halflife/kitchen
	location = "Kitchen"

/obj/effect/landmark/navigate_destination/halflife/bar
	location = "Bar"

/obj/effect/landmark/navigate_destination/halflife/trainstation
	location = "Trainstation"

/obj/effect/landmark/navigate_destination/halflife/factory
	location = "Factory"

/obj/effect/landmark/navigate_destination/halflife/labor
	location = "Labor Union"

/obj/effect/landmark/navigate_destination/halflife/dispatch
	location = "Dispatch Core"

/obj/effect/landmark/navigate_destination/halflife/distributioncenter
	location = "Ration Distribution Center"

/obj/effect/landmark/navigate_destination/halflife/slums
	location = "Slums"

/obj/effect/landmark/navigate_destination/halflife/apartments/primary
	location = "Primary Apartments"
