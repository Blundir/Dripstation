/*
*	LOADOUT ITEM DATUMS FOR BACKPACK/POCKET SLOTS
*/

/// Pocket items (Moved to backpack)
GLOBAL_LIST_INIT(loadout_pocket_items, generate_loadout_items(/datum/loadout_item/pocket_items))

/datum/loadout_item/pocket_items
	category = LOADOUT_ITEM_MISC

// The wallet loadout item is special, and puts the player's ID and other small items into it on initialize (fancy!)
/datum/loadout_item/pocket_items/wallet
	name = "Wallet"
	item_path = /obj/item/storage/wallet
	additional_tooltip_contents = list("FILLS AUTOMATICALLY - This item will populate itself with your ID card and other small items you may have on spawn.")

// We add our wallet manually, later, so no need to put it in any outfits.
/datum/loadout_item/pocket_items/wallet/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only)
	return FALSE

// We didn't spawn any item yet, so nothing to call here.
/datum/loadout_item/pocket_items/wallet/on_equip_item(datum/preferences/preference_source, mob/living/carbon/human/equipper, visuals_only)
	return FALSE

// We add our wallet at the very end of character initialization (after quirks, etc) to ensure the backpack / their ID is all set by now.
/datum/loadout_item/pocket_items/wallet/post_equip_item(datum/preferences/preference_source, mob/living/carbon/human/equipper)
	var/obj/item/card/id/id_card = equipper.get_item_by_slot(SLOT_WEAR_ID)
	if(istype(id_card, /obj/item/storage/wallet))
		return

	var/obj/item/storage/wallet/wallet = new(equipper)
	if(istype(id_card))
		equipper.temporarilyRemoveItemFromInventory(id_card, force = TRUE)
		equipper.equip_to_slot_if_possible(wallet, SLOT_WEAR_ID, initial = TRUE)
		id_card.forceMove(wallet)

		if(!equipper.equip_to_slot_if_possible(wallet, slot = SLOT_IN_BACKPACK, initial = TRUE))
			wallet.forceMove(equipper.drop_location())

/*
*	LIPSTICK
*/

/datum/loadout_item/pocket_items/lipstick_black
	name = "Black Lipstick"
	item_path = /obj/item/lipstick/black


