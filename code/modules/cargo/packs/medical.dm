/datum/supply_pack/medical
	group = "Medical"
	access_view = ACCESS_MEDICAL

/datum/supply_pack/medical/bloodpacks
	name = "Blood Pack Variety Crate"
	desc = "Contains ten different blood packs for reintroducing blood to patients."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/reagent_containers/blood = 2,
					/obj/item/reagent_containers/blood/a_plus,
					/obj/item/reagent_containers/blood/a_minus,
					/obj/item/reagent_containers/blood/b_plus,
					/obj/item/reagent_containers/blood/b_minus,
					/obj/item/reagent_containers/blood/o_plus,
					/obj/item/reagent_containers/blood/o_minus,
				)
	crate_name = "blood freezer"
	crate_type = /obj/structure/closet/crate/freezer/halflife

/datum/supply_pack/medical/coroner_crate
	name = "Autopsy Kit"
	desc = "Contains an autopsy scanner, when you lose your own and really \
		need to complete your dissection experiments."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(
		/obj/item/autopsy_scanner = 1,
		/obj/item/storage/medkit/coroner = 1,
	)
	crate_name = "autopsy kit crate"

/datum/supply_pack/medical/chemical
	name = "Chemical Starter Kit Crate"
	desc = "Contains thirteen different chemicals, for all the fun experiments you can make."
	cost = CARGO_CRATE_VALUE * 2.6
	contains = list(/obj/item/reagent_containers/cup/bottle/hydrogen,
					/obj/item/reagent_containers/cup/bottle/carbon,
					/obj/item/reagent_containers/cup/bottle/nitrogen,
					/obj/item/reagent_containers/cup/bottle/oxygen,
					/obj/item/reagent_containers/cup/bottle/fluorine,
					/obj/item/reagent_containers/cup/bottle/phosphorus,
					/obj/item/reagent_containers/cup/bottle/silicon,
					/obj/item/reagent_containers/cup/bottle/chlorine,
					/obj/item/reagent_containers/cup/bottle/radium,
					/obj/item/reagent_containers/cup/bottle/sacid,
					/obj/item/reagent_containers/cup/bottle/ethanol,
					/obj/item/reagent_containers/cup/bottle/potassium,
					/obj/item/reagent_containers/cup/bottle/sugar,
					/obj/item/clothing/glasses/science,
					/obj/item/reagent_containers/dropper,
					/obj/item/storage/box/beakers,
				)
	crate_name = "chemical crate"

/datum/supply_pack/medical/defibs
	name = "Defibrillator Crate"
	desc = "Contains two defibrillators for bringing the recently deceased back to life."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/defibrillator/loaded = 2)
	crate_name = "defibrillator crate"

/datum/supply_pack/medical/iv_drip
	name = "IV Drip Crate"
	desc = "Contains a single IV drip for administering blood to patients."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/machinery/iv_drip)
	crate_name = "iv drip crate"

/datum/supply_pack/medical/supplies
	name = "Medical Supplies Crate"
	desc = "Contains an assortment of medical supplies for extensive healthcare."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/storage/medkit/halflife_combine,
					/obj/item/storage/medkit/halflife_combine,
					/obj/item/stack/medical/gauze/twelve,
					/obj/item/reagent_containers/blood/o_minus,
					/obj/item/reagent_containers/pill/insulin,
					/obj/item/reagent_containers/pill/neurine,
					/obj/item/vending_refill/combine_wallmed = 1,
					/obj/item/stack/medical/bone_gel = 2,
					/obj/item/stack/sticky_tape/surgical,
				)
	crate_name = "medical supplies crate"

/datum/supply_pack/medical/surgery
	name = "Surgical Supplies Crate"
	desc = "Do you want to perform surgery, but don't have one of those fancy \
		shmancy degrees? Just get started with this crate containing a DeForest surgery tray, \
		Sterilizine spray and roller bed."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(
		/obj/item/surgery_tray/full,
		/obj/item/reagent_containers/medigel/sterilizine,
		/obj/structure/bed/medical,
	)
	crate_name = "surgical supplies crate"

/datum/supply_pack/medical/salglucanister
	name = "Heavy-Duty Saline Canister"
	desc = "Contains a bulk supply of saline-glucose condensed into a single canister that \
		should last several days, with a large pump to fill containers with. Direct injection \
		of saline should be left to medical professionals as the pump is capable of overdosing \
		patients."
	cost = CARGO_CRATE_VALUE * 6
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/iv_drip/saline)
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/medical/medvial
	name = "Medvials"
	desc = "Contains 5 biogel medvials for rapid healing. Heals less than a medkit, but is applied quicker, and is easier to carry."
	cost = CARGO_CRATE_VALUE * 2.1
	contains = list(/obj/item/reagent_containers/pill/patch/medkit/vial,
					/obj/item/reagent_containers/pill/patch/medkit/vial,
					/obj/item/reagent_containers/pill/patch/medkit/vial,
					/obj/item/reagent_containers/pill/patch/medkit/vial,
					/obj/item/reagent_containers/pill/patch/medkit/vial,
	)
	crate_name = "medvial crate"

/datum/supply_pack/medical/medkit
	name = "Medkits"
	desc = "Contains 5 biogel medkits for rapid healing."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/reagent_containers/pill/patch/medkit,
					/obj/item/reagent_containers/pill/patch/medkit,
					/obj/item/reagent_containers/pill/patch/medkit,
					/obj/item/reagent_containers/pill/patch/medkit,
					/obj/item/reagent_containers/pill/patch/medkit,
	)
	crate_name = "medkit crate"

/datum/supply_pack/medical/healthpen
	name = "Healthpens"
	desc = "Contains 5 biogel healthpens, which heal all damage types slowly over time."
	cost = CARGO_CRATE_VALUE * 2.1
	contains = list(/obj/item/reagent_containers/hypospray/medipen/healthpen,
					/obj/item/reagent_containers/hypospray/medipen/healthpen,
					/obj/item/reagent_containers/hypospray/medipen/healthpen,
					/obj/item/reagent_containers/hypospray/medipen/healthpen,
					/obj/item/reagent_containers/hypospray/medipen/healthpen,
	)
	crate_name = "healthpen crate"
