//Note: Everything in modules/clothing/spacesuits should have the entire suit grouped together.
//      Meaning the the suit is defined directly after the corrisponding helmet. Just like below!
/obj/item/clothing/head/helmet/space
	name = "space helmet"
	icon_state = "space"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays."
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | HEADINTERNALS
	item_state = "space"
	permeability_coefficient = 0.01
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flash_protect = 2
	strip_delay = 50
	equip_delay_other = 50
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = NONE
	dog_fashion = null
	cryo_preserve = TRUE

/obj/item/clothing/suit/space
	name = "space suit"
	desc = "A suit that protects against low pressure environments. Has a big N on the back."
	icon_state = "space"
	item_state = "space"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals)
	slowdown = 1
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	strip_delay = 80
	equip_delay_other = 80
	resistance_flags = NONE
	item_flags = MEDRESIST
	cryo_preserve = TRUE
