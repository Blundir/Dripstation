// #### MISC ####

/obj/item/paper // overwrite to fix incorrect inhand icon, also to add stamp sounds
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	var/list/stamp_sounds = list('dripstation/sound/effects/stamp1.ogg','dripstation/sound/effects/stamp2.ogg','dripstation/sound/effects/stamp3.ogg')			

/obj/item/photo // overwrite to fix incorrect inhand icon
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'

/obj/item/stack/packageWrap
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'

/obj/item/camera
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	item_state = "camera"

/obj/item/storage/crayons
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	item_state = "crayonbox"

/obj/item/toy/crayon
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'

/obj/item/hand_labeler_refill
	item_state = null

