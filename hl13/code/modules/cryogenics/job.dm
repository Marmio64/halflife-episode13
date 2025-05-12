/datum/controller/subsystem/job/proc/FreeRole(rank)
	if(!rank)
		return
	job_debug("Freeing role: [rank]")
	var/datum/job/job = get_job_type(rank)
	if(!job)
		return FALSE
	job.current_positions = max(0, job.current_positions - 1)
