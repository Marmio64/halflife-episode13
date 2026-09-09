#define PHOBIA_FILE "phobia.json"

/// Phobia types that can be pulled randomly for brain traumas.
/// Also determines what phobias you can choose as your preference with the quirk.
GLOBAL_LIST_INIT(phobia_types, sort_list(list(
	"blood",
	"xen",
)))

GLOBAL_LIST_INIT(phobia_regexes, list(
	"blood" = construct_phobia_regex("blood"),
	"xen" = construct_phobia_regex("xen"),
	"the supernatural" = construct_phobia_regex("the supernatural"),
))

GLOBAL_LIST_INIT(phobia_mobs, list(
	"xen" = typecacheof(list(
		/mob/living/basic/halflife/zombie,
		/mob/living/basic/halflife/headcrab,
		/mob/living/basic/halflife/bullsquid,
		/mob/living/basic/halflife/antlion_guard,
		/mob/living/basic/halflife/antlion_worker,
		/mob/living/simple_animal/hostile/halflife/antlion,
		/mob/living/basic/halflife/chumtoad,
	)),
	"the supernatural" = typecacheof(list(
		/mob/dead/observer,
		/mob/living/basic/bat,
		/mob/living/basic/construct,
		/mob/living/basic/demon,
		/mob/living/basic/faithless,
		/mob/living/basic/ghost,
		/mob/living/basic/heretic_summon,
		/mob/living/basic/revenant,
		/mob/living/basic/shade,
		/mob/living/basic/skeleton,
		/mob/living/basic/wizard,
		/mob/living/simple_animal/bot/mulebot/paranormal,
		/mob/living/simple_animal/hostile/dark_wizard,
		/mob/living/simple_animal/hostile/zombie,
	)),
))

GLOBAL_LIST_INIT(phobia_objs, list(
	"blood" = typecacheof(list(
		/obj/effect/decal/cleanable/blood,
		/obj/item/reagent_containers/blood,
		/obj/item/reagent_containers/syringe,
		/obj/machinery/iv_drip,
	)),
	"the supernatural" = typecacheof(list(
		/obj/effect/floating_blade,
		/obj/effect/heretic_influence,
		/obj/effect/heretic_rune,
		/obj/effect/rune,
		/obj/effect/visible_heretic_influence,
		/obj/item/clothing/head/wizard,
		/obj/item/clothing/mask/madness_mask,
		/obj/item/clothing/neck/heretic_focus,
		/obj/item/clothing/neck/eldritch_amulet,
		/obj/item/clothing/suit/hooded/cultrobes,
		/obj/item/clothing/suit/wizrobe,
		/obj/item/clothing/under/rank/civilian/chaplain,
		/obj/item/codex_cicatrix,
		/obj/item/gun/magic,
		/obj/item/melee/cultblade,
		/obj/item/melee/rune_carver,
		/obj/item/melee/sickly_blade,
		/obj/item/necromantic_stone,
		/obj/item/nullrod,
		/obj/item/restraints/legcuffs/bola/cult,
		/obj/item/scrying,
		/obj/item/soulstone,
		/obj/item/spellbook,
		/obj/item/stack/sheet/hauntium,
		/obj/item/stack/sheet/runed_metal,
		/obj/item/staff,
		/obj/item/storage/toolbox/haunted,
		/obj/item/tome,
		/obj/item/toy/cards/deck/tarot,
		/obj/item/toy/eightball/haunted,
		/obj/item/toy/eldritch_book,
		/obj/item/toy/reality_pierce,
		/obj/item/warp_whistle,
		/obj/machinery/door/airlock/cult,
		/obj/narsie,
		/obj/structure/destructible/cult,
		/obj/structure/destructible/eldritch_crucible,
		/obj/structure/spirit_board,
	)),
))

GLOBAL_LIST_INIT(phobia_turfs, list(
	"aliens" = typecacheof(list(
		/turf/closed/wall/mineral/abductor,
		/turf/open/floor/mineral/abductor,
		/turf/open/floor/plating/abductor,
		/turf/open/floor/plating/abductor2,
	)),
	"falling" = typecacheof(list(
		/turf/open/chasm,
		/turf/open/floor/fakepit,
		/turf/open/openspace,
	)),
	"space" = typecacheof(list(
		/turf/open/floor/fakespace,
		/turf/open/floor/holofloor/space,
		/turf/open/space,
	)),
	"the supernatural" = typecacheof(list(
		/turf/closed/wall/mineral/cult,
		/turf/open/floor/cult,
	)),
))

GLOBAL_LIST_INIT(phobia_species, list(
	"xen" = typecacheof(list(
		/datum/species/vortigaunt
	)),
))

/// Creates a regular expression to match against the given phobia
/// Capture group 2 = the scary word
/// Capture group 3 = an optional suffix on the scary word
/proc/construct_phobia_regex(list/name)
	var/list/words = strings(PHOBIA_FILE, name)
	if(!length(words))
		CRASH("phobia [name] has no entries")
	var/words_match = ""
	for(var/word in words)
		words_match += "[REGEX_QUOTE(word)]|"
	words_match = copytext(words_match, 1, -1)
	return regex("(\\b|\\A)([words_match])('?s*)(\\b|\\|)", "ig")

#undef PHOBIA_FILE
