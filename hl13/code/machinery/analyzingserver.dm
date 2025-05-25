/obj/machinery/analyzing_server
	name = "combine data analyzing vault"
	desc = "A server terminal which accepts DNA samples and analyzes them in exchange for research points."
	icon = 'hl13/icons/obj/machines/machinery.dmi'
	icon_state = "analyzingserver"

	var/list/animal_dna = list()
	var/list/plant_dna = list()
	var/list/human_dna = list()

	density = TRUE
	use_power = IDLE_POWER_USE

	///Ref to global science techweb.
	var/datum/techweb/stored_research

/obj/machinery/analyzing_server/post_machine_initialize()
	. = ..()
	if(!CONFIG_GET(flag/no_default_techweb_link) && !stored_research)
		CONNECT_TO_RND_SERVER_ROUNDSTART(stored_research, src)
	if(stored_research)
		on_connected_techweb()

///Called when attempting to connect the machine to a techweb, forgetting the old.
/obj/machinery/analyzing_server/proc/connect_techweb(datum/techweb/new_techweb)
	if(stored_research)
		log_research("[src] disconnected from techweb [stored_research] when connected to [new_techweb].")
	stored_research = new_techweb
	if(!isnull(stored_research))
		on_connected_techweb()

///Called post-connection to a new techweb.
/obj/machinery/analyzing_server/proc/on_connected_techweb()
	SHOULD_CALL_PARENT(FALSE)

/obj/machinery/analyzing_server/multitool_act(mob/living/user, obj/item/multitool/tool)
	if(!QDELETED(tool.buffer) && istype(tool.buffer, /datum/techweb))
		connect_techweb(tool.buffer)
		return ITEM_INTERACT_SUCCESS
