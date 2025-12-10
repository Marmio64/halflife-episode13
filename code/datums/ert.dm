/datum/ert
	///Antag datum team for this type of ERT.
	var/team = /datum/team/ert
	///Do we open the doors to the "high-impact" weapon/explosive cabinets? Used for combat-focused ERTs.
	var/opendoors = TRUE
	///Alternate antag datum given to the leader of the squad.
	var/leader_role = /datum/antagonist/ert/commander
	///Do we humanize all spawned players or keep them the species in their current character prefs?
	var/enforce_human = TRUE
	///A list of roles distributed to the selected candidates that are not the leader.
	var/roles = list(/datum/antagonist/ert/security, /datum/antagonist/ert/medic, /datum/antagonist/ert/engineer)
	///The custom name assigned to this team, for their antag datum/roundend reporting.
	var/rename_team
	///Defines the color/alert code of the response team. Unused if a polldesc is defined.
	var/code
	///The mission given to this ERT type in their flavor text.
	var/mission = "Assist the station."
	///The number of players for consideration.
	var/teamsize = 5
	///The "would you like to play as XXX" message used when polling for players.
	var/polldesc
	/// If TRUE, gives the team members "[role] [random last name]" style names
	var/random_names = TRUE
	/// If TRUE, the admin who created the response team will be spawned in the briefing room in their preferred briefing outfit (assuming they're a ghost)
	var/spawn_admin = FALSE
	/// If TRUE, we try and pick one of the most experienced players who volunteered to fill the leader slot
	var/leader_experience = TRUE
	/// A custom map template to spawn the ERT at. If this is null or use_custom_shuttle is FALSE, the ERT will spawn at Centcom.
	var/datum/map_template/ert_template
	/// If we should actually _use_ the ert_template custom shuttle
	var/use_custom_shuttle = TRUE
	/// Used for spawning bodies for your ERT. Unless customized in the Summon-ERT verb settings, will be overridden and should not be defined at the datum level.
	var/mob/living/carbon/human/mob_type

/datum/ert/New()
	if (!polldesc)
		polldesc = "a Code [code] Emergency Response Team"
