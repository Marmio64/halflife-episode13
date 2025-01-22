///Lists related to quirk selection

///Types of glasses that can be selected at character selection with the Nearsighted quirk
GLOBAL_LIST_INIT(nearsighted_glasses, list(
	"Regular" = /obj/item/clothing/glasses/regular,
	"Circle" = /obj/item/clothing/glasses/regular/circle,
	"Hipster" = /obj/item/clothing/glasses/regular/hipster,
	"Thin" = /obj/item/clothing/glasses/regular/thin,
	"Jamjar" = /obj/item/clothing/glasses/regular/jamjar,
	"Binoclard" = /obj/item/clothing/glasses/regular/kim,
))

///Options for the prosthetic limb quirk to choose from
GLOBAL_LIST_INIT(prosthetic_limb_choice, list(
	"Left Arm" = /obj/item/bodypart/arm/left/robot/surplus,
	"Right Arm" = /obj/item/bodypart/arm/right/robot/surplus,
	"Left Leg" = /obj/item/bodypart/leg/left/robot/surplus,
	"Right Leg" = /obj/item/bodypart/leg/right/robot/surplus,
))


///Transhumanist quirk
GLOBAL_LIST_INIT(part_choice_transhuman, list(
	"Left Arm" = /obj/item/bodypart/arm/left/robot,
	"Right Arm" = /obj/item/bodypart/arm/right/robot,
	"Left Leg" = /obj/item/bodypart/leg/left/robot,
	"Right Leg" = /obj/item/bodypart/leg/right/robot,
	"Robotic Voice Box" = /obj/item/organ/tongue/robot,
))

///Hemiplegic Quirk
GLOBAL_LIST_INIT(side_choice_hemiplegic, list(
	"Left Side" = /datum/brain_trauma/severe/paralysis/hemiplegic/left,
	"Right Side" = /datum/brain_trauma/severe/paralysis/hemiplegic/right,
))

///Options for the Junkie quirk to choose from
GLOBAL_LIST_INIT(possible_junkie_addictions, setup_junkie_addictions(list(
	/datum/reagent/medicine/morphine,
	/datum/reagent/drug/happiness,
	/datum/reagent/drug/methamphetamine,
)))

///Options for the Smoker quirk to choose from
GLOBAL_LIST_INIT(possible_smoker_addictions, setup_smoker_addictions(list(
	/obj/item/storage/fancy/cigarettes/halflife,
	/obj/item/storage/fancy/cigarettes/cigars,
)))

///Options for the Alcoholic quirk to choose from
GLOBAL_LIST_INIT(possible_alcoholic_addictions, list(
	"Gin" = list("bottlepath" = /obj/item/reagent_containers/cup/glass/bottle/gin, "reagent" = /datum/reagent/consumable/ethanol/gin),
	"Beer" = list("bottlepath" = /obj/item/reagent_containers/cup/glass/bottle/beer, "reagent" = /datum/reagent/consumable/ethanol/beer),
	"Vodka" = list("bottlepath" = /obj/item/reagent_containers/cup/glass/bottle/vodka, "reagent" = /datum/reagent/consumable/ethanol/vodka),
	"Whiskey" = list("bottlepath" = /obj/item/reagent_containers/cup/glass/bottle/whiskey, "reagent" = /datum/reagent/consumable/ethanol/whiskey)
))

///Options for Prosthetic Organ
GLOBAL_LIST_INIT(organ_choice, list(
	"Heart" = ORGAN_SLOT_HEART,
	"Lungs" = ORGAN_SLOT_LUNGS,
	"Liver" = ORGAN_SLOT_LIVER,
	"Stomach" = ORGAN_SLOT_STOMACH,
))

///Paraplegic Quirk
GLOBAL_LIST_INIT(paraplegic_choice, list(
	"Default" = FALSE,
	"Amputee" = TRUE,
))

///Scarred Eye Quirk
GLOBAL_LIST_INIT(scarred_eye_choice, list(
	"Random",
	"Left Eye",
	"Right Eye",
	"Double",
))

///chipped Quirk
GLOBAL_LIST_INIT(quirk_chipped_choice, list(
	"Basketsoft 3000" = /obj/item/skillchip/basketweaving,
	"WINE" = /obj/item/skillchip/wine_taster,
	"Hedge 3" = /obj/item/skillchip/bonsai,
	"Skillchip adapter" = /obj/item/skillchip/useless_adapter,
	"N16H7M4R3" = /obj/item/skillchip/light_remover,
	"3NTR41LS" = /obj/item/skillchip/entrails_reader,
	"GENUINE ID Appraisal Now!" = /obj/item/skillchip/appraiser,
	"Le S48R4G3" = /obj/item/skillchip/sabrage,
	"Integrated Intuitive Thinking and Judging" = /obj/item/skillchip/intj,
	"\"Space Station 13: The Musical\"" = /obj/item/skillchip/musical,
	"Mast-Angl-Er" = /obj/item/skillchip/master_angler,
	"Kommand" = /obj/item/skillchip/big_pointer,
))
