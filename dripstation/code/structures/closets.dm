
// ###### HOS ######
/obj/structure/closet/secure_closet/hos/PopulateContents()
	..()
	new /obj/item/cartridge/hos(src)
	new /obj/item/radio/headset/heads/hos/alt(src)
	new /obj/item/radio/headset/heads/hos(src)
	new /obj/item/storage/lockbox/medal/sec(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/lockbox/loyalty(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/gun/energy/e_gun/hos(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/pinpointer/nuke(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/storage/belt/security/chief/full(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/hos(src)	
	new /obj/item/clothing/shoes/xeno_wraps/jackboots(src)
	new /obj/item/circuitboard/machine/techfab/department/armory(src)
	new /obj/item/storage/photo_album/HoS(src)
	new /obj/item/clipboard/yog/paperwork/hos(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/hos(src)

// ###### WARDEN ######
/obj/structure/closet/secure_closet/warden/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/storage/box/zipties(src)
	new /obj/item/megaphone/sec(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/gloves/krav_maga/sec(src)
	new /obj/item/door_remote/head_of_security(src)
	new /obj/item/gun/ballistic/shotgun/automatic/combat/compact(src)
	new /obj/item/clipboard/yog/paperwork/warden(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/warden(src)

// ###### SEC OFFICER ######
/obj/structure/closet/secure_closet/security/PopulateContents()
	..()
	new /obj/item/clothing/suit/armor/vest/alt(src)
	new /obj/item/clothing/head/helmet/sec(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/radio/headset/headset_sec/alt(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/radio/security(src)
	new /obj/item/clipboard/yog/paperwork/security(src)
	new /obj/item/barrier_taperoll/police(src)

// ###### HOP ######
/obj/structure/closet/secure_closet/hop/PopulateContents()
	..()
	new /obj/item/storage/lockbox/medal/service(src)
	new /obj/item/cartridge/hop(src)
	new /obj/item/radio/headset/heads/hop(src)
	new /obj/item/storage/box/ids(src)
	new /obj/item/storage/box/ids(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/glasses/hud/personnel(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/clothing/suit/armor/vest/alt(src)		
	new /obj/item/pet_carrier(src)
	new /obj/item/door_remote/civillian(src)
	new /obj/item/circuitboard/machine/techfab/department/service(src)
	new /obj/item/storage/photo_album/HoP(src)
	new /obj/item/clipboard/yog/paperwork/hop(src)
	new /obj/item/gun/energy/e_gun/mini(src) //hop doesn't get a proper gun
	new /obj/item/storage/bag/garment/hop(src)

// ###### CAPTAIN ######

/obj/structure/closet/secure_closet/captains/PopulateContents()
	..()
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/cartridge/captain(src)
	new /obj/item/storage/box/silver_ids(src)
	new /obj/item/radio/headset/heads/captain/alt(src)
	new /obj/item/radio/headset/heads/captain(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/storage/belt/sabre(src)
	new /obj/item/door_remote/captain(src)
	new /obj/item/storage/photo_album/Captain(src)
	new /obj/item/clipboard/yog/paperwork/captain(src)
	new /obj/item/radio/security(src)
	new /obj/item/storage/bag/garment/captain(src)

// ###### RD ######

/obj/structure/closet/secure_closet/RD/PopulateContents()
	..()
	new /obj/item/cartridge/rd(src)
	new /obj/item/radio/headset/heads/rd(src)
	new /obj/item/tank/internals/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/storage/lockbox/medal/sci(src)
	new /obj/item/clothing/suit/armor/reactive/teleport(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/laser_pointer(src)
	new /obj/item/door_remote/research_director(src)
	new /obj/item/circuitboard/machine/techfab/department/science(src)
	new /obj/item/storage/photo_album/RD(src)
	new /obj/item/clipboard/yog/paperwork/rd(src)
	new /obj/item/storage/bag/garment/research_director(src)
	new /obj/item/analyzer/ranged(src)

// ###### MIME ######
/obj/structure/closet/secure_closet/mime
	name = "mime's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_MIME)
	icon_state = "mime"

/obj/structure/closet/secure_closet/mime/PopulateContents()
	new /obj/item/cane(src)
	new /obj/item/reagent_containers/food/drinks/bottle/wine(src)
	new /obj/item/reagent_containers/food/snacks/baguette(src)
	new /obj/item/cartridge/virus/mime(src)
	new /obj/item/instrument/violin(src)
	// new /obj/item/food/grown/rose(src)
	new /obj/item/radio/headset/headset_srv(src)
	// new /obj/item/perfume/rose(src)
	new /obj/item/reagent_containers/food/drinks/bottle/bottleofnothing(src)
	new /obj/item/toy/crayon/spraycan/mimecan(src)
	new /obj/item/storage/crayons(src)
	new /obj/item/instrument/accordion(src)
	// new /obj/item/clothing/suit/hooded/wintercoat/mime(src)
	..()

// ###### CLOWN ######
/obj/structure/closet/secure_closet/clown
	name = "clown's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_CLOWN)
	icon_state = "clown"

/obj/structure/closet/secure_closet/clown/PopulateContents()
	new /obj/item/seeds/banana(src)
	// new /obj/item/reagent_containers/food/drinks/bottle/bananajug(src)
	new /obj/item/bikehorn(src)
	new /obj/item/radio/headset/headset_srv(src)
	new /obj/item/instrument/bikehorn(src)
	new /obj/item/reagent_containers/spray/waterflower(src)
	new /obj/item/megaphone/clown(src)
	new /obj/item/storage/box/donkpockets/donkpockethonk(src)
	new /obj/item/pneumatic_cannon/pie(src)
	new /obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter(src)
	new /obj/item/storage/crayons(src)
	// new /obj/item/clothing/suit/hooded/wintercoat/clown(src)
	..()

// ###### MEDICAL DOCTOR ######
/obj/structure/closet/secure_closet/medical3
	icon = 'dripstation/icons/obj/closet.dmi'

// ###### BRIG PHYSICIAN ######
/obj/structure/closet/secure_closet/physician
	icon = 'dripstation/icons/obj/closet.dmi'
	icon_state = "brigphys"

// ###### BRIG PHYSICIAN ######
/obj/structure/closet/secure_closet/physician
	icon = 'dripstation/icons/obj/closet.dmi'
	icon_state = "brigphys"

// ###### CHAPLAIN ######
/obj/structure/closet/secure_closet/chaplain
	name = "chaplain's locker"
	desc = "A lockable storage unit for Nanotrasen-approved religious attire."
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_CHAPEL_OFFICE)
	icon_state = "chaplain"

/obj/structure/closet/secure_closet/chaplain/PopulateContents()
	new /obj/item/choice_beacon/holy(src)
	new /obj/item/clothing/accessory/pocketprotector/cosmetology(src)
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/nun_hood(src)
	new /obj/item/clothing/suit/chaplainsuit/holidaypriest(src)
	new /obj/item/storage/backpack/cultpack(src)
	new /obj/item/storage/box/fancy/candle_box(src)
	new /obj/item/storage/box/fancy/candle_box(src)

// ###### POD PILOT ######
/obj/structure/closet/secure_closet/pod_pilot
	name = "pod pilot's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_POD_PILOT)
	icon_state = "pod_pilot"

/obj/structure/closet/secure_closet/pod_pilot/PopulateContents()
	new /obj/item/clothing/suit/toggle/bomber/secbomber(src)
	new /obj/item/clothing/head/beret/corpsec(src)
	new /obj/item/radio/headset/headset_sec(src)
	new /obj/item/radio/headset/headset_sec/alt(src)
	new /obj/item/storage/belt/security/full(src)
	new /obj/item/storage/firstaid/emergency(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/spacepod_key/sec(src)
	new /obj/item/spacepod_equipment/weaponry/laser(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/radio/security(src)
	new /obj/item/barrier_taperoll/police(src)
	new /obj/item/bodybag/environmental/prisoner(src)
	new /obj/item/bodybag/environmental/prisoner(src)

// ###### HAZARD TECHNICIAN ######
/obj/structure/closet/secure_closet/hazard_tech
	name = "hazard technician's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_HAZARD_TECH)
	icon_state = "haz_secure"

// ###### BLUESHIELD ######
/obj/structure/closet/secure_closet/blueshield
	name = "blueshield's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_BLUESHIELD)
	icon_state = "bs"

// ###### NT REPRESENTATIVE ######
/obj/structure/closet/secure_closet/ntrep
	name = "\improper Nanotrasen Representative's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_NTREP)
	icon_state = "cc"

// ###### MAGISTRATE ######
/obj/structure/closet/secure_closet/magistrate
	name = "\improper Magistrate's locker"
	icon = 'dripstation/icons/obj/closet.dmi'
	req_access = list(ACCESS_MAGISTRATE)
	icon_state = "cc"


