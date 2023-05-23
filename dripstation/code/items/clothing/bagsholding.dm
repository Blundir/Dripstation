/obj/item/boh_shell/duffel
	name = "duffel bag of holding shell"
	desc = "An inert shell, it looks like you could activate it with an anomaly core."
	icon = 'dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "inertduffel"
	item_state = "brokenpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	insertion_output = /obj/item/storage/backpack/holding/duffel

/obj/item/storage/backpack/holding/duffel
	name = "duffel bag of holding"
	desc = "A duffel bag that opens into a localized pocket of bluespace."
	icon_state = "holdingduffel"
	icon = 'dripstation/icons/obj/storage/backpacks.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/backpacks.dmi'

/datum/design/duffel_holding
	name = "Duffel bag of Holding shell"
	desc = "A duffel bag that opens into a localized pocket of bluespace. Requires an anomaly core to function."
	id = "duffel_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/boh_shell/duffel
	category = list("Bluespace Designs")
	dangerous_construction = TRUE
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE		

/obj/item/boh_shell/satchel
	name = "satchel of holding shell"
	desc = "An inert shell, it looks like you could activate it with an anomaly core."
	icon = 'dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "inertsatchel"
	item_state = "brokenpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	insertion_output = /obj/item/storage/backpack/holding/satchel	

/obj/item/storage/backpack/holding/satchel
	name = "satchel of holding"
	desc = "A satchel that opens into a localized pocket of bluespace."
	icon_state = "holdingsatchel"
	icon = 'dripstation/icons/obj/storage/backpacks.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/backpacks.dmi'

/datum/design/satchel_holding
	name = "Satchel of Holding shell"
	desc = "A duffel bag that opens into a localized pocket of bluespace. Requires an anomaly core to function."
	id = "satchel_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/boh_shell/satchel
	category = list("Bluespace Designs")
	dangerous_construction = TRUE
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE		
