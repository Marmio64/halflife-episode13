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
	roles = list(/datum/antagonist/ert/riotpolice)
	leader_role = /datum/antagonist/ert/riotpolice/pistol
	rename_team = "Metropolice Riot Team"
	code = "Red"
	mission = "Stabilize the city, and detain or kill any malignant citizens."
	polldesc = "a metropolice riot team"
	opendoors = FALSE
