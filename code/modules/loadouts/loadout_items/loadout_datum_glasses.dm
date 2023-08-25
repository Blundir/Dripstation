/*
*	LOADOUT ITEM DATUMS FOR THE EYE SLOT
*/

/// Glasses Slot Items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_glasses, generate_loadout_items(/datum/loadout_item/glasses))

/datum/loadout_item/glasses
	category = LOADOUT_ITEM_GLASSES

/datum/loadout_item/glasses/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.glasses)
			LAZYADD(outfit.backpack_contents, outfit.glasses)
		outfit.glasses = item_path
	else
		outfit.glasses = item_path

/datum/loadout_item/glasses/post_equip_item(datum/preferences/preference_source, mob/living/carbon/human/equipper)
	var/obj/item/clothing/glasses/equipped_glasses = locate(item_path) in equipper.get_equipped_items()
	if (!equipped_glasses)
		return
	if(equipped_glasses.glass_colour_type)
		equipper.update_glasses_color(equipped_glasses, TRUE)
	if(equipped_glasses.tint)
		equipper.update_tint()
	if(equipped_glasses.vision_correction)
		equipper.clear_fullscreen("nearsighted")
	if(equipped_glasses.vision_flags \
		|| equipped_glasses.darkness_view \
		|| equipped_glasses.invis_override \
		|| equipped_glasses.invis_view \
		|| !isnull(equipped_glasses.lighting_alpha))
		equipper.update_sight()
/*
*	PRESCRIPTION GLASSES
*/

/datum/loadout_item/glasses/prescription_glasses
	name = "Glasses"
	item_path = /obj/item/clothing/glasses/regular
	additional_tooltip_contents = list("PRESCRIPTION - This item functions with the 'nearsighted' quirk.")

/*
*	COSMETIC GLASSES
*/

/datum/loadout_item/glasses/orange_glasses
	name = "Orange Glasses"
	item_path = /obj/item/clothing/glasses/orange

/*
*	MISC
*/

/datum/loadout_item/glasses/eyepatch
	name = "Eyepatch"
	item_path = /obj/item/clothing/glasses/eyepatch

/*
*	JOB-LOCKED
*/


/datum/loadout_item/glasses/sechud
	name = "Security HUD"
	item_path = /obj/item/clothing/glasses/hud/security
	restricted_roles = list("Security Officer")

/datum/loadout_item/glasses/secpatch
	name = "Security Eyepatch HUD"
	item_path = /obj/item/clothing/glasses/hud/security/sunglasses/eyepatch


/*
*	DONATOR
*/

/datum/loadout_item/glasses/donator
	donator_only = TRUE

/datum/loadout_item/glasses/donator/meson
	name = "Meson Sunglasses"
	item_path = /obj/item/clothing/glasses/meson
