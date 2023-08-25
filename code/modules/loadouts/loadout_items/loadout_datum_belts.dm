/*
*	LOADOUT ITEM DATUMS FOR THE BELT SLOT
*/

/// Belt Slot Items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_belts, generate_loadout_items(/datum/loadout_item/belts))

/datum/loadout_item/belts
	category = LOADOUT_ITEM_BELT

/datum/loadout_item/belts/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	equipper.equip_to_slot_if_possible(new item_path(equipper), SLOT_BELT, FALSE, FALSE)

/datum/loadout_item/belts/fanny_pack_black
	name = "Black Fannypack"
	item_path = /obj/item/storage/belt/fannypack/black
