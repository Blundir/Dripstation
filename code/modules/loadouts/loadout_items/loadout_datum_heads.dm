/*
*	LOADOUT ITEM DATUMS FOR THE HEAD SLOT
*/

/// Head Slot Items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_helmets, generate_loadout_items(/datum/loadout_item/head))

/datum/loadout_item/head
	category = LOADOUT_ITEM_HEAD

/datum/loadout_item/head/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(isplasmaman(equipper))
		if(!visuals_only)
			to_chat(equipper, "Your loadout helmet was not equipped directly due to your envirosuit helmet.")
			LAZYADD(outfit.backpack_contents, item_path)
	else if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.head)
			LAZYADD(outfit.backpack_contents, outfit.head)
		outfit.head = item_path
	else
		outfit.head = item_path

/*
*	BEANIES
*/

/datum/loadout_item/head/white_beanie
	name = "Recolorable Beanie"
	item_path = /obj/item/clothing/head/beanie

/*
*	BERETS
*/

/datum/loadout_item/head/greyscale_beret
	name = "Greyscale Beret"
	item_path = /obj/item/clothing/head/beret

/datum/loadout_item/head/black_beret
	name = "Black Beret"
	item_path = /obj/item/clothing/head/beret/black

/*
*	CAPS
*/

/datum/loadout_item/head/black_cap
	name = "Black Cap"
	item_path = /obj/item/clothing/head/soft/black


/*
*	FEDORAS
*/

/*
*	HARDHATS
*/

/*
*	MISC
*/


/*
*	CHRISTMAS
*/

/*
*	HALLOWEEN
*/


/datum/loadout_item/head/witch
	name = "Witch Hat"
	item_path = /obj/item/clothing/head/wizard/marisa/fake

/*
*	MISC
*/

/*
*	COWBOY
*/


/*
*	TREK HATS (JOB-LOCKED)
*/

/*
*	JOB-LOCKED
*/

/*
*	FAMILIES
*/

/*
*	DONATOR
*/

/datum/loadout_item/head/donator
	donator_only = TRUE

/*
*	FLOWERS
*/


/*
*	ENCLAVE
*/

/datum/loadout_item/head/donator/enclave
	name = "Enclave Cap"
	item_path = /obj/item/clothing/head/soft/red

