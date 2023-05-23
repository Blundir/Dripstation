/obj/item/clothing/shoes/magboots
	alternate_worn_layer = BELT_LAYER
	var/magpulse_name = "mag-pulse traction system"
	item_state = "magboots"
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/shoes_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/shoes_righthand.dmi'

/obj/item/clothing/shoes/magboots/security
	armor = list(MELEE = 15, BULLET = 10, LASER = 5, ENERGY = 10, BOMB = 15, BIO = 20, RAD = 0, FIRE = 20, ACID = 50)

/obj/item/clothing/shoes/magboots/security/captain
	desc = "A relic predating magboots, these ornate greaves have retractable spikes in the soles to maintain grip."
	name = "captain's greaves"
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'	
	icon_state = "capboots0"
	magboot_state = "capboots"
	magpulse_name = "anchoring spikes"
	slowdown_active = 2	
