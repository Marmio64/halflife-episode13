SUBSYSTEM_DEF(respawns)
	name = "Respawns"
	wait = 2 SECONDS
	init_order = INIT_ORDER_RESPAWNS
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT

	var/combine_wave_timer = 35 SECONDS
	var/rebel_wave_timer = 35 SECONDS
	var/xen_wave_timer = 20 SECONDS

/datum/controller/subsystem/respawns/fire(resumed = 0)
	combine_wave_timer -= 2 SECONDS
	rebel_wave_timer -= 2 SECONDS
	xen_wave_timer -= 2 SECONDS

	if(combine_wave_timer <= 5 SECONDS) //Not zero because people shouldn't be able to get lucky and instantly respawn after dying.
		combine_wave_timer = GLOB.deployment_respawn_rate_combine
	if(rebel_wave_timer <= 5 SECONDS)
		rebel_wave_timer = GLOB.deployment_respawn_rate_rebels
	if(xen_wave_timer <= 2 SECONDS )
		xen_wave_timer = GLOB.deployment_respawn_rate_xen
