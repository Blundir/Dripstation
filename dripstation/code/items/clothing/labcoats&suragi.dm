/obj/item/clothing/suit/toggle/labcoat
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/toggle/bomber
	name = "bomber jacket"
	desc = "Aviators not included."
	icon_state = "bomber"
	item_state = "bomber"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/suits_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/suits_righthand.dmi'	
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/box/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/toggle/bomber/secbomber
	name = "security bomber jacket"
	desc = "A stylish and worn-in armoured black bomber jacket emblazoned with the NT Security crest on the left breast. Looks rugged."
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "bombersec"
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	heat_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	armor = list(MELEE = 35, BULLET = 35, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/suit/toggle/bomber/engibomber
	name = "engineering bomber jacket"
	desc = "A stylish and warm jacket adorned with the colors of the humble Station Engineer."
	icon_state = "bomberengi"
	item_state = "bomberengi"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 10, FIRE = 20, ACID = 40, WOUND = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/t_scanner, /obj/item/radio, /obj/item/extinguisher/mini)

/obj/item/clothing/suit/toggle/bomber/engibomber/atmosbomber
	name = "atmospherics bomber jacket"
	desc = "A stylish and warm jacket adorned with the colors of the magical Atmospherics Technician."
	icon_state = "bomberatmos"
	item_state = "bomberatmos"

/obj/item/clothing/suit/toggle/bomber/cargobomber
	name = "cargo bomber jacket"
	desc = "A stylish jacket to keep you warm in the warehouse."
	icon_state = "bombercargo"
	item_state = "bombercargo"
	allowed = list(/obj/item/clipboard, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/box/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)

/obj/item/clothing/suit/jacket/miningbomber
	name = "mining bomber jacket"
	desc = "A slightly armoured and stylish jacket for shaft miners."
	icon_state = "bombermining"
	item_state = "bombermining"
	allowed = list(/obj/item/pickaxe, /obj/item/t_scanner/adv_mining_scanner, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/box/fancy/cigarettes, /obj/item/lighter, /obj/item/gun/energy/kinetic_accelerator, /obj/item/shovel, /obj/item/storage/bag/ore)
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 10, ACID = 0, WOUND = 0)

/obj/item/clothing/suit/toggle/bomber/secbomber/soft
	name = "security soft bomber jacket"
	desc = "A cozy jacket in security's colors."
	icon_state = "sec_dep_jacket"
	item_state = "sec_dep_jacket"
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/suit/toggle/bomber/cargobomber/soft
	name = "cargo soft bomber jacket"
	desc = "A cozy jacket in cargo colors."
	icon_state = "supply_dep_jacket"
	item_state = "supply_dep_jacket"	

/obj/item/clothing/suit/toggle/bomber/engibomber/soft
	name = "engineering soft bomber jacket"
	desc = "A cozy jacket in engineering colors."
	icon_state = "engi_dep_jacket"
	item_state = "engi_dep_jacket"

/obj/item/clothing/suit/toggle/bomber/scibomber
	name = "science soft bomber jacket"
	desc = "A cozy jacket in science colors."
	icon_state = "sci_dep_jacket"
	item_state = "sci_dep_jacket"
	allowed = list(/obj/item/analyzer, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/toggle/bomber/medbomber
	name = "medical soft bomber jacket"
	desc = "A cozy jacket in medical colors."
	icon_state = "med_dep_jacket"
	item_state = "med_dep_jacket"
	allowed = list(/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/healthanalyzer, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)
