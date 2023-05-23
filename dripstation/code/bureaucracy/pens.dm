// #### PENS ####

/obj/item/pen
	icon = 'dripstation/icons/obj/bureaucracy.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'

/obj/item/pen/fourcolor
	icon_state = "pen_multi"
	item_state = "pen"

/obj/item/pen/fourcolor/attack_self(mob/living/carbon/user) // overwrite to implement tip overlay
	cut_overlays()
	switch(colour)
		if("black")
			colour = "red"
			add_overlay("pen_tip_red")
		if("red")
			colour = "green"
			add_overlay("pen_tip_green")		
		if("green")
			colour = "blue"
			add_overlay("pen_tip_blue")
		else
			colour = "black"
	to_chat(user, span_notice("\The [src] will now write in [colour]."))
	desc = "It's a fancy four-color ink pen, set to [colour]."

/obj/item/pen/fountain/fancy
	name = "fancy fountain pen"
	desc = "It's a fancy silver fountain pen."
	icon_state = "pen_fountain-w"
	force = 3
	throwforce = 3
	throw_speed = 4	
	sharpness = SHARP_POINTY | UNACIDABLE | ACID_PROOF // only one per map, also silver is acidproof
	resistance_flags = FIRE_PROOF		
	materials = list(/datum/material/silver = 750)	

/obj/item/pen/fountain/captain
	icon_state = "pen_fountain_cap"
	desc = "It's an expensive fountain pen. The nib is quite sharp."
	colour = "#040463"	// red ink was cringe
	resistance_flags = LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF // only one per map, so why not	

/obj/item/pen/fountain/captain/fancy 
	name = "engraved fountain pen"
	desc = "Luxurious and robust fountain pen."	
	icon_state = "pen_fountain_gold"	

/obj/item/pen/fountain/captain/fancy/guilded
	name = "guilded fountain pen"
	desc = "A golden fountain pen that is gilded with a meager amount of gold material. The word 'Nanotrasen' is etched on the clip of the pen."
	icon_state = "pen_guilded"
	materials = list(/datum/material/gold = 1250)
	var/list/colour_choices = list(
		"black" = list(0.25, 0.25, 0.25),
		"red" = list(1, 0.25, 0.25),
		"green" = list(0, 1, 0),
		"blue" = list(0.5, 0.5, 1),
		"yellow" = list(1, 1, 0))
	var/pen_color_iconstate = "pencolor"
	var/pen_color_shift = 3	

/obj/item/pen/fountain/captain/fancy/guilded/proc/select_colour(mob/living/carbon/user)
	var/newcolour = input(user, "Which colour would you like to use?", name, colour) as null|anything in colour_choices
	if(newcolour)
		colour = newcolour
		playsound(loc, 'sound/effects/pop.ogg', 50, 1)
		update_icon()

/obj/item/pen/fountain/captain/fancy/guilded/attack_self(mob/living/carbon/user)
	select_colour(user)

/obj/item/pen/fountain/captain/fancy/guilded/update_icon()
	overlays.Cut()
	var/icon/o = new(icon, pen_color_iconstate)
	var/list/c = colour_choices[colour]
	o.SetIntensity(c[1], c[2], c[3])
	if(pen_color_shift)
		o.Shift(SOUTH, pen_color_shift)
	overlays += o

/obj/item/pen/edagger/fancy
	name = "fancy pen"
	desc = "Dark expensive gold plated pen, something feels evil about it."
	icon_state = "ofcommpen"
	item_state = "ofcommpen"

/obj/item/pen/edagger/fancy/update_icon()
	if(on)
		icon_state = "ofcommpen_active"
		item_state = "ofcommpen_active"
		lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
		righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	else
		icon_state = initial(icon_state) //looks like a normal pen when off.
		item_state = initial(item_state)
		lefthand_file = initial(lefthand_file)
		righthand_file = initial(righthand_file)
