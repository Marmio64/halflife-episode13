
// Skill levels
#define SKILL_LEVEL_NONE 1
#define SKILL_LEVEL_NOVICE 2
#define SKILL_LEVEL_APPRENTICE 3
#define SKILL_LEVEL_JOURNEYMAN 4
#define SKILL_LEVEL_EXPERT 5
#define SKILL_LEVEL_MASTER 6
#define SKILL_LEVEL_LEGENDARY 7

#define SKILL_LVL 1
#define SKILL_EXP 2

// Level experience requirements
#define SKILL_EXP_NONE 0
#define SKILL_EXP_NOVICE 100
#define SKILL_EXP_APPRENTICE 250
#define SKILL_EXP_JOURNEYMAN 500
#define SKILL_EXP_EXPERT 900
#define SKILL_EXP_MASTER 1500
#define SKILL_EXP_LEGENDARY 2500

//Allows us to get EXP from level, or level from EXP
#define SKILL_EXP_LIST list(SKILL_EXP_NONE, SKILL_EXP_NOVICE, SKILL_EXP_APPRENTICE, SKILL_EXP_JOURNEYMAN, SKILL_EXP_EXPERT, SKILL_EXP_MASTER, SKILL_EXP_LEGENDARY)

//Skill modifier types
///ideally added/subtracted in speed calculations to make you do stuff faster
#define SKILL_SPEED_MODIFIER "skill_speed_modifier"
///ideally added/subtracted where beneficial in prob(x) calls
#define SKILL_PROBS_MODIFIER "skill_probability_modifier"
///ideally added/subtracted where beneficial in rand(x,y) calls
#define SKILL_RANDS_MODIFIER "skill_randomness_modifier"
///ideally for addittive operations
#define SKILL_VALUE_MODIFIER "skill_value_modifier"

// Gets the reference for the skill type that was given
#define GetSkillRef(A) (SSskills.all_skills[A])

//number defines
#define CLEAN_SKILL_BEAUTY_ADJUSTMENT -15//It's a denominator so no 0. Higher number = less cleaning xp per cleanable. Negative value means cleanables with negative beauty give xp.
#define CLEAN_SKILL_GENERIC_WASH_XP 1.5//Value. Higher number = more XP when cleaning non-cleanables (walls/floors/lips)
///The multiplier of the extra experience given by the fishing minigame based on difficulty. At the default difficulty of 15, the bonus will be of 21%.
#define FISHING_SKILL_DIFFIULTY_EXP_MULT 0.015
///How much exp one would gain per spent playing the fishing minigame at minimum difficulty. the time is multiplied by 0.1 because deciseconds...
#define FISHING_SKILL_EXP_PER_SECOND (SKILL_EXP_LEGENDARY / (15 MINUTES * 0.1))

///The base modifier a boulder's size grants to the mining skill.
#define MINING_SKILL_BOULDER_SIZE_XP 10

// Skillchip categories
//Various skillchip categories. Use these when setting which categories a skillchip restricts being paired with
//while using the SKILLCHIP_RESTRICTED_CATEGORIES flag
#define SKILLCHIP_CATEGORY_GENERAL "general"
#define SKILLCHIP_CATEGORY_JOB "job"

// HL13 EDIT SKILLS ------

/// This person fires guns with more accuracy
#define TRAIT_GOOD_AIM	"good_aim"

//faster tool usage
#define TRAIT_ENGINEER	"engineer"

//faster surgical tool usage
#define TRAIT_DOCTOR	"doctor"

//Less stamina drain when running
#define TRAIT_ATHLETIC	"ATHLETIC"

#define TRAIT_LESSPAIN_MAJOR "lesspain_major"
#define TRAIT_LESSPAIN "lesspain"
#define TRAIT_LESSPAIN_MINOR "lesspain_minor"
#define TRAIT_MASOCHIST "masochist"

#define TRAIT_TDMCAPTAIN "tdmcaptain"

#define TRAIT_THE_HIDDEN "the_hidden"

#define TRAIT_SPARTAN "spartan"

#define TRAIT_FILTHBORN "filthborn"

#define TRAIT_HIGHBORN "highborn"

#define TRAIT_NOSLEEP "nosleep"

#define TRAIT_EAGLE_EYED "eagle_eyed"

#define TRAIT_BAD_AIM	"bad_aim"

#define TRAIT_TERRIBLE_AIM	"terrible_aim"
