/obj/item/clothing/suit/poncho
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/suits_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/suits_righthand.dmi'

/obj/item/clothing/suit/poncho/purple
	name = "purple poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is purple."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is blue."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'		
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/suit/poncho/sec
	name = "security poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is black and red, standard NanoTrasen Security colors."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "secponcho"
	item_state = "secponcho"	
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)

/obj/item/clothing/suit/poncho/eng
	name = "engineering poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is yellow and orange, standard Engineering colors."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "engiponcho"
	item_state = "engiponcho"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 10, FIRE = 20, ACID = 40, WOUND = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/t_scanner, /obj/item/radio, /obj/item/extinguisher/mini)

/obj/item/clothing/suit/poncho/med
	name = "medical poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with green and blue tint, standard Medical colors."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "medponcho"
	item_state = "medponcho"
	allowed = list(/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/healthanalyzer, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/sci
	name = "science poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is white with purple trim, standard NanoTrasen Science colors."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "sciponcho"
	item_state = "sciponcho"
	allowed = list(/obj/item/analyzer, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/poncho/cargo
	name = "cargo poncho"
	desc = "A simple, comfortable cloak without sleeves. This one is tan and grey, the colors of Cargo."
	icon = 'dripstation/icons/obj/clothing/suits.dmi'	
	icon_state = "cargoponcho"
	item_state = "cargoponcho"
	allowed = list(/obj/item/clipboard, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/box/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)

