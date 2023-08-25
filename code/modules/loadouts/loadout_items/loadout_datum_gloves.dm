/*
*	LOADOUT ITEM DATUMS FOR THE HAND SLOT
*/

/// Glove Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_gloves, generate_loadout_items(/datum/loadout_item/gloves))

/datum/loadout_item/gloves
	category = LOADOUT_ITEM_GLOVES

/datum/loadout_item/gloves/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout gloves were not equipped directly due to your envirosuit gloves.")
			LAZYADD(outfit.backpack_contents, item_path)
	else if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.gloves)
			LAZYADD(outfit.backpack_contents, outfit.gloves)
		outfit.gloves = item_path
	else
		outfit.gloves = item_path

/datum/loadout_item/gloves/fingerless
	name = "Fingerless Gloves"
	item_path = /obj/item/clothing/gloves/fingerless

/*
*	DONATOR
*/

/datum/loadout_item/gloves/donator
	donator_only = TRUE

/datum/loadout_item/gloves/donator/military
	name = "Military Gloves"
	item_path = /obj/item/clothing/gloves/fingerless
