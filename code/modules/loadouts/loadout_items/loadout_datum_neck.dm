/*
*	LOADOUT ITEM DATUMS FOR THE NECK SLOT
*/

/// Neck Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_necks, generate_loadout_items(/datum/loadout_item/neck))

/datum/loadout_item/neck
	category = LOADOUT_ITEM_NECK

/datum/loadout_item/neck/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK)
		if(outfit.neck)
			LAZYADD(outfit.backpack_contents, outfit.neck && !visuals_only)
		outfit.neck = item_path
	else
		outfit.neck = item_path


/*
*	SCARVES
*/

/datum/loadout_item/neck/scarf_black
	name = "Black Scarf"
	item_path = /obj/item/clothing/neck/scarf/black
