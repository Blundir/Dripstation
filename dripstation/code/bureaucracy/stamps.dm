
// #### STAMPS ####
/obj/item/stamp // inhand icon states and stamp sounds
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	icon = 'dripstation/icons/obj/bureaucracy.dmi'		
	var/list/stamp_sounds = list('dripstation/sound/effects/stamp1.ogg','dripstation/sound/effects/stamp2.ogg','dripstation/sound/effects/stamp3.ogg')	

/obj/item/stamp/attack(mob/living/M, mob/living/user)
	. = ..()
	playsound(M, pick(stamp_sounds), 35, 1, -1)

/obj/item/stamp/mime
	item_state = "stamp-rd"

/obj/item/stamp/warden
	name = "warden's rubber stamp"
	icon_state = "stamp-ward"
	dye_color = DYE_WARD

/obj/item/stamp/chap
	name = "chaplain's seal"
	icon_state = "stamp-chap"
	dye_color = DYE_CHAP

/obj/item/stamp/blueshield
	name = "Blueshield's rubber stamp"
	icon_state = "stamp-blueshield"
	dye_color = DYE_BLUES

/obj/item/stamp/magistrate
	name = "Magistrate's rubber stamp"
	icon_state = "stamp-magistrate"
	dye_color = DYE_MAGI

/obj/item/stamp/ntrep
	name = "Nanotrasen Representative's rubber stamp"
	icon_state = "stamp-rep"
	dye_color = DYE_NTREP
