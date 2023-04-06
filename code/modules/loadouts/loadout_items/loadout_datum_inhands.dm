/*
*	LOADOUT ITEM DATUMS FOR BOTH HAND SLOTS
*/

/// Inhand items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_inhand_items, generate_loadout_items(/datum/loadout_item/inhand))

/datum/loadout_item/inhand
	category = LOADOUT_ITEM_INHAND

/datum/loadout_item/inhand/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(outfit.l_hand && !outfit.r_hand)
		outfit.r_hand = item_path
	else
		if(outfit.l_hand)
			LAZYADD(outfit.backpack_contents, outfit.l_hand)
		outfit.l_hand = item_path

/datum/loadout_item/inhand/cane
	name = "Cane"
	item_path = /obj/item/cane

