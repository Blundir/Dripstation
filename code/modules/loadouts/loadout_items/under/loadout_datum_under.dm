
// --- Loadout item datums for under suits ---

/// Underslot - Jumpsuit Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_jumpsuits, generate_loadout_items(/datum/loadout_item/under/jumpsuit))

/// Underslot - Formal Suit Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_undersuits, generate_loadout_items(/datum/loadout_item/under/formal))

/// Underslot - Misc. Under Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_miscunders, generate_loadout_items(/datum/loadout_item/under/miscellaneous))

/datum/loadout_item/under
	category = LOADOUT_ITEM_UNIFORM

/datum/loadout_item/under/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout uniform was not equipped directly due to your envirosuit.")
			LAZYADD(outfit.backpack_contents, item_path)
	else if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.uniform)
			LAZYADD(outfit.backpack_contents, outfit.uniform)
		outfit.uniform = item_path
	else
		outfit.uniform = item_path
	outfit.modified_outfit_slots |= ITEM_SLOT_ICLOTHING

/*
*	JUMPSUITS
*/
/datum/loadout_item/under/jumpsuit

/datum/loadout_item/under/jumpsuit/rainbow
	name = "Rainbow Jumpsuit"
	item_path = /obj/item/clothing/under/color/rainbow


/datum/loadout_item/under/formal


/datum/loadout_item/under/miscellaneous
