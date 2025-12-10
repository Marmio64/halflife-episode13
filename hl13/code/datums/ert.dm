/datum/ert/overwatch
	leader_role = /datum/antagonist/ert/overwatch/ar2/elite
	roles = list(/datum/antagonist/ert/overwatch/ar2, /datum/antagonist/ert/overwatch/mp7, /datum/antagonist/ert/overwatch/spas12)
	rename_team = "Standard Overwatch Strike Team"
	code = "Delta"
	mission = "Stabilize the city, detain city officials, kill all citizens who do not comply."
	polldesc = "a standard Overwatch Strike Team"

/datum/ert/overwatch/light
	roles = list(/datum/antagonist/ert/overwatch/mp7, /datum/antagonist/ert/overwatch/spas12)
	leader_role = /datum/antagonist/ert/overwatch/ar2
	rename_team = "Overwatch Light Strike Team"
	code = "Delta"
	mission = "Stabilize the city, detain city officials, kill all citizens who do not comply."
	polldesc = "a light Overwatch Strike Team"

/datum/ert/overwatch/elite
	roles = list(/datum/antagonist/ert/overwatch/ar2/elite)
	leader_role = /datum/antagonist/ert/overwatch/ar2/elite
	rename_team = "Overwatch Elite Strike Team"
	code = "Delta"
	mission = "Stabilize the city, detain city officials, kill all citizens who do not comply."
	polldesc = "an ultra elite Overwatch Strike Team"

///with default squad size of 5, this is 2 grunts, a wallhammer, a suppressor, and an elite
/datum/ert/overwatch/specialty_commandos
	roles = list(/datum/antagonist/ert/overwatch/wallhammer, /datum/antagonist/ert/overwatch/grunt, /datum/antagonist/ert/overwatch/suppressor, /datum/antagonist/ert/overwatch/grunt)
	leader_role = /datum/antagonist/ert/overwatch/ar2/elite
	rename_team = "Overwatch Specialty Commando Strike Team"
	code = "Delta"
	mission = "Stabilize the city, detain city officials, kill all citizens who do not comply."
	polldesc = "an ultra elite Overwatch Commando Strike Team"

/datum/ert/conscripts
	roles = list(/datum/antagonist/ert/conscript)
	leader_role = /datum/antagonist/ert/conscript/officer
	rename_team = "Conscript Strike Team"
	code = "Delta"
	mission = "Stabilize the city, detain city officials, kill all citizens who do not comply."
	polldesc = "a Conscript Strike Team"

/datum/ert/containment_team
	leader_role = /datum/antagonist/ert/overwatch/grunt
	roles = list(/datum/antagonist/ert/overwatch/grunt)
	rename_team = "Overwatch Xen Containment Team"
	code = "Delta"
	mission = "Take care of biological threats located inside the city district."
	polldesc = "an Overwatch Xen Containment Team"

/datum/ert/riotpolice
	roles = list(/datum/antagonist/ert/police/riot)
	leader_role = /datum/antagonist/ert/police/riot/pistol
	rename_team = "Metropolice Riot Team"
	code = "Red"
	mission = "Stabilize the city, and detain or kill any malignant citizens."
	polldesc = "a metropolice riot team"
	opendoors = FALSE

/datum/ert/police
	roles = list(/datum/antagonist/ert/police)
	leader_role = /datum/antagonist/ert/police/mp7
	rename_team = "Metropolice Team"
	code = "Red"
	mission = "Stabilize the city, and detain or kill any malignant citizens."
	polldesc = "an armed metropolice team"
	opendoors = FALSE

/datum/ert/administrative
	roles = list(/datum/antagonist/ert/administrative)
	leader_role = /datum/antagonist/ert/administrative
	rename_team = "Administrative Investigation Team"
	code = "Blue"
	mission = "Investigate anything that may be happening in the district."
	polldesc = "a administrative investigation team"
	opendoors = FALSE
	teamsize = 1

/datum/ert/administrative/nogun
	roles = list(/datum/antagonist/ert/administrative/nogun)
	leader_role = /datum/antagonist/ert/administrative/nogun
	rename_team = "Unarmed Administrative Investigation Team"
