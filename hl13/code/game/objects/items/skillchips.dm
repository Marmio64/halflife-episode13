/obj/item/skillchip/aiming
	name = "Aim Assist skillchip"
	auto_traits = list(TRAIT_GOOD_AIM)
	skill_name = "Aim Assist"
	skill_description = "This chip will tune your eyesight and brain to better hit targets with a firearm."
	skill_icon = "gun"
	complexity = 2
	activate_message = span_notice("You feel better able to line up a shot.")
	deactivate_message = span_notice("Your vision dims a bit, as targets look harder to hit.")

/obj/item/skillchip/fitness
	name = "Fitness skillchip"
	auto_traits = list(TRAIT_ATHLETIC)
	skill_name = "Physical Fitness"
	skill_description = "This chip will automatically tune your body to better be able to run."
	skill_icon = "person-running"
	activate_message = span_notice("You feel like running will be a bit easier now.")
	deactivate_message = span_notice("You lose confidence in your running ability.")

/obj/item/skillchip/painsuppress
	name = "Pain Suppressor skillchip"
	auto_traits = list(TRAIT_NOSOFTCRIT, TRAIT_LESSPAIN)
	skill_name = "Pain Suppression"
	skill_description = "This chip will supress your sense of pain, letting you power through it more easily."
	skill_icon = "skull"
	complexity = 2
	activate_message = span_notice("You feel your sense of pain numb.")
	deactivate_message = span_notice("Your sense of pain returns to normal.")

/obj/item/skillchip/antifatigue
	name = "Anti-Fatigue skillchip"
	auto_traits = list(TRAIT_NOSLEEP)
	skill_name = "Fatigue Suppressant"
	skill_description = "This chip will allow parts of your brain to cycle into rest modes while you're still awake, and use internal processors to keep mental capacity at standard levels while doing so, combating the need to sleep."
	skill_icon = "moon"
	activate_message = span_notice("You feel more energetic.")
	deactivate_message = span_notice("You feel a bit more sleepy.")

/obj/item/skillchip/overwatch
	name = "Overwatch skillchip package"
	auto_traits = list(TRAIT_NOSOFTCRIT, TRAIT_ATHLETIC, TRAIT_GOOD_AIM, TRAIT_LESSPAIN, TRAIT_NOSLEEP)
	skill_name = "OTA augmentation package"
	skill_description = "This chip will better your aim, suppress pain, and increase physical fitness all in one."
	skill_icon = "skull"
	complexity = 3
	activate_message = span_notice("You feel highly trained in combat functionality.")
	deactivate_message = span_notice("Your combat functionality seems to dim.")

/obj/item/skillchip/engineer
	name = "Engineering skillchip"
	auto_traits = list(TRAIT_ENGINEER)
	skill_name = "Tool Speed"
	skill_description = "This chip will implant engineering knowledge, and let you use tools faster."
	skill_icon = "toolbox"
	activate_message = span_notice("You feel you know how to use engineering tools.")
	deactivate_message = span_notice("You lose the knowledge of operating engineering tools correctly.")
