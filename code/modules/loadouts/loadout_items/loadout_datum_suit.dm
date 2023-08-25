/*
*	LOADOUT ITEM DATUMS FOR THE (EXO/OUTER)SUIT SLOT
*/

/// Exosuit / Outersuit Slot Items (Moves items to backpack)
GLOBAL_LIST_INIT(loadout_exosuits, generate_loadout_items(/datum/loadout_item/suit))

/datum/loadout_item/suit
	category = LOADOUT_ITEM_SUIT

/datum/loadout_item/suit/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.suit)
			LAZYADD(outfit.backpack_contents, outfit.suit)
		outfit.suit = item_path
	else
		outfit.suit = item_path

/*
*	WINTER COATS
*/

/datum/loadout_item/suit/winter_coat
	name = "Winter Coat"
	item_path = /obj/item/clothing/suit/hooded/wintercoat
