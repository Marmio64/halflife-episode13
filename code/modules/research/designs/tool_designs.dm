
/////////////////////////////////////////
/////////////////Tools///////////////////
/////////////////////////////////////////

/datum/design/fire_extinguisher_advanced
	name = "Advanced Fire Extinguisher"
	id = "adv_fire_extinguisher"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/extinguisher/advanced/empty
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/handdrill
	name = "Hand Drill"
	desc = "A small electric hand drill with an interchangeable screwdriver and bolt bit"
	id = "handdrill"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*1.75, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/screwdriver/power
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/jawsoflife
	name = "Jaws of Life"
	desc = "A small, compact Jaws of Life with an interchangeable pry jaws and cutting jaws"
	id = "jawsoflife" // added one more requirment since the Jaws of Life are a bit OP
	build_path = /obj/item/crowbar/power
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*2.25, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.75)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING
	autolathe_exportable = FALSE

/datum/design/exwelder
	name = "Experimental Welding Tool"
	desc = "An experimental welder capable of self-fuel generation."
	id = "exwelder"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/uranium =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/weldingtool/experimental
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rangedanalyzer
	name = "Experimental Long-range Gas Analyzer"
	desc = "An experimental gas analyzer capable of operating at long distance"
	id = "rangedanalyzer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.2, /datum/material/gold =SMALL_MATERIAL_AMOUNT * 3, /datum/material/bluespace=SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/analyzer/ranged
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ATMOSPHERICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/rpd
	name = "Rapid Pipe Dispenser (RPD)"
	id = "rpd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*37.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*18.75)
	build_path = /obj/item/pipe_dispenser
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_loaded
	name = "Rapid Construction Device"
	desc = "A tool that can construct and deconstruct walls, airlocks and floors on the fly."
	id = "rcd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*30, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/construction/rcd/loaded
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rtd_loaded
	name = "Rapid Tiling Device"
	desc = "A tool that can lay & destroy floor tiles on the fly."
	id = "rtd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 15, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/construction/rtd/loaded
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_ammo
	name = "RCD Matter Cartridge"
	id = "rcd_ammo"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*6, /datum/material/glass =SHEET_MATERIAL_AMOUNT*4)
	build_path = /obj/item/rcd_ammo
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/frames
	name = "RCD frames designs upgrade"
	desc = "Adds computer and machine frame designs to the RCD."
	id = "rcd_upgrade_frames"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/frames
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/simple_circuits
	name = "RCD simple circuits designs upgrade"
	desc = "Adds the ability to produce simple circuits using the RCD."
	id = "rcd_upgrade_simple_circuits"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/simple_circuits
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/anti_interrupt
	name = "RCD anti disruption designs upgrade"
	desc = "Prevents interruption of RCD construction and deconstruction."
	id = "rcd_upgrade_anti_interrupt"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 1.25,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/rcd_upgrade/anti_interrupt
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/cooling
	name = "RCD cooling upgrade"
	desc = "Allows the RCD to more quickly perform multiple actions at once."
	id = "rcd_upgrade_cooling"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/rcd_upgrade/cooling
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/furnishing
	name = "RCD furnishing upgrade"
	desc = "Adds the ability to furnish areas using the RCD."
	id = "rcd_upgrade_furnishing"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/furnishing
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/silo_link
	name = "Advanced RCD silo link upgrade"
	desc = "Upgrades the RCD to be able to pull materials from the ore silo. The RCD must be linked to the silo using a multitool before it will function."
	id = "rcd_upgrade_silo_link"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/bluespace =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/rcd_upgrade/silo_link
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rpd_upgrade/unwrench
	name = "RPD unwrenching upgrade"
	desc = "Adds reverse wrench mode to the RPD. Attention, due to budget cuts, the mode is hard linked to the destroy mode control button."
	id = "rpd_upgrade_unwrench"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/rpd_upgrade/unwrench
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rld_mini
	name = "Mini Rapid Light Device (MRLD)"
	desc = "A tool that can deploy portable and standing lighting orbs and glowsticks."
	id = "rld_mini"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*10, /datum/material/glass =SHEET_MATERIAL_AMOUNT*5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT*4, /datum/material/gold =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/construction/rld/mini
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SERVICE

/datum/design/geneshears
	name = "Botanogenetic Plant Shears"
	desc = "A high tech, high fidelity pair of plant shears, capable of cutting genetic traits out of a plant."
	id = "gene_shears"
	build_path = /obj/item/geneshears
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*2, /datum/material/uranium=HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/silver=SMALL_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_BOTANY_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/plumbing_rcd_service
	name = "Service Plumbing Constructor"
	id = "plumbing_rcd_service"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*37.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*18.75, /datum/material/plastic =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/construction/plumbing/service
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_PLUMBING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/biopsy_tool
	name = "Biopsy Tool"
	id = "biopsy_tool"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*2, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.5)
	build_path = /obj/item/biopsy_tool
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_XENOBIOLOGY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/wirebrush
	name = "Wirebrush"
	desc = "A tool to remove rust from walls."
	id = "wirebrush"
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_TOOLS)
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 2, /datum/material/glass =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/wirebrush
	category = list(RND_CATEGORY_TOOLS)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)

/datum/design/bolter_wrench
	name = "Bolter Wrench"
	desc = "A wrench that can unbolt airlocks regardless of power status."
	id = "bolter_wrench"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/wrench/bolter
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING
