// #### HAND LABELER ####

/obj/item/hand_labeler
	icon = 'dripstation/icons/obj/bureaucracy.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	item_state = "labeler0"

/obj/item/hand_labeler/afterattack(atom/A, mob/user,proximity)
	. = ..()
	if(!proximity)
		return
	if(!mode)	//if it's off, give up.
		return

	if(!labels_left)
		to_chat(user, span_warning("No labels left!"))
		icon_state = "labeler_e"
		return
	if(!label || !length(label))
		to_chat(user, span_warning("No text set!"))
		return
	if(length(A.name) + length(label) > 64)
		to_chat(user, span_warning("Label too big!"))
		return
	if(ismob(A))
		to_chat(user, span_warning("You can't label creatures!")) // use a collar
		return

	user.visible_message("[user] labels [A] as [label].", \
						 span_notice("You label [A] as [label]."))
	A.name = "[A.name] ([label])"
	playsound(A, 'dripstation/sound/pickup/component_pickup.ogg', 20, TRUE)	
	labels_left--

/obj/item/hand_labeler/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/hand_labeler_refill))
		to_chat(user, span_notice("You insert [I] into [src]."))
		qdel(I)
		playsound(src, 'sound/machines/click.ogg', 30, 1)
		icon_state = "labeler0"
		labels_left = initial(labels_left)	//Yes, it's capped at its initial value
