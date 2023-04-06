/*
*	LOADOUT ITEM DATUMS FOR THE ACCESSORY SLOT
*/

/// Accessory Items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_accessory, generate_loadout_items(/datum/loadout_item/accessory))

/datum/loadout_item/accessory
	category = LOADOUT_ITEM_ACCESSORY

/datum/loadout_item/accessory/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.accessory)
			LAZYADD(outfit.backpack_contents, outfit.accessory)
		outfit.accessory = item_path
	else
		outfit.accessory = item_path

/datum/loadout_item/accessory/maid_apron
	name = "Maid Apron"
	item_path = /obj/item/clothing/accessory/maidapron
/*
*	ARMBANDS
*/

/datum/loadout_item/accessory/armband_medblue
	name = "Medical Armband (blue stripe)"
	item_path = /obj/item/clothing/accessory/armband/medblue
	restricted_roles = list("Chief Medical Officer")

/datum/loadout_item/accessory/armband_science
	name = "Science Armband"
	item_path = /obj/item/clothing/accessory/armband/science

/*
*	ARMOURLESS
*/

/datum/loadout_item/accessory/bone_codpiece
	name = "Heirloom Skull Codpiece"
	item_path = /obj/item/clothing/accessory/skullcodpiece
	additional_tooltip_contents = list(TOOLTIP_NO_ARMOR)
