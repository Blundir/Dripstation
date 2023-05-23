
// #### PAPER BIN ####
/obj/item/paper_bin
	icon_state = "paper_bin1"
	icon = 'dripstation/icons/obj/bureaucracy.dmi'
	var/base_icon_state = "paper_bin"

/obj/item/paper_bin/update_icon() // needed to make new types of paper bins that actually work
	if(total_paper < 1)
		icon_state = "[base_icon_state]"
	else
		icon_state = "[base_icon_state]1"
	cut_overlays()
	if(bin_pen)
		add_overlay(mutable_appearance(bin_pen.icon, bin_pen.icon_state))

/obj/item/paper_bin/attack_hand(mob/user) // removal of ability to take carbon copies out of a normal paper bin, cause it's dumb
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(bin_pen)
		var/obj/item/pen/P = bin_pen
		P.add_fingerprint(user)
		P.forceMove(user.loc)
		user.put_in_hands(P)
		to_chat(user, span_notice("You take [P] out of \the [src]."))
		bin_pen = null
		update_icon()
	else if(total_paper >= 1)
		add_fingerprint(user)
		total_paper--
		update_icon()
		// If there's any custom paper on the stack, use that instead of creating a new paper.
		var/obj/item/paper/P
		if(papers.len > 0)
			P = papers[papers.len]
			papers.Remove(P)
		else
			P = new papertype(src)
			if(SSevents.holidays && SSevents.holidays[APRIL_FOOLS])
				if(prob(30))
					P.info = "<font face=\"[CRAYON_FONT]\" color=\"red\"><b>HONK HONK HONK HONK HONK HONK HONK<br>HOOOOOOOOOOOOOOOOOOOOOONK<br>APRIL FOOLS</b></font>"
					P.rigged = 1

		P.add_fingerprint(user)
		P.forceMove(user.loc)
		user.put_in_hands(P)
		to_chat(user, span_notice("You take [P] out of \the [src]."))
	else
		to_chat(user, span_warning("[src] is empty!"))
	add_fingerprint(user)
	return ..()

/obj/item/paper_bin/carbon
	name = "carbon paper bin"
	desc = "Contains all the paper you'll ever need, in duplicate!"
	icon_state = "paper_bin_carbon1"
	base_icon_state ="paper_bin_carbon"	
	papertype = /obj/item/paper/carbon

/obj/item/paper_bin/bundlenatural
	icon_state = "paper_bundle1"
	base_icon_state ="paper_bundle"

/obj/item/paper_bin/construction
	icon_state = "paper_binc1"
	base_icon_state ="paper_binc"	

/obj/item/paper_bin/blue
	icon_state = "paper_bin_blue1"
	base_icon_state ="paper_bin_blue"

/obj/item/paper_bin/red
	icon_state = "paper_bin_red1"
	base_icon_state ="paper_bin_red"	

/obj/item/paper_bin/sterile
	icon_state = "paper_bin_sterile1"
	base_icon_state ="paper_bin_sterile"	

/obj/item/paper_bin/yellow
	icon_state = "paper_bin_yellow1"
	base_icon_state ="paper_bin_yellow"	

/obj/item/paper_bin/purple
	icon_state = "paper_bin_purple1"
	base_icon_state ="paper_bin_purple"		

/obj/item/paper_bin/orange
	icon_state = "paper_bin_orange1"
	base_icon_state ="paper_bin_orange"		

/obj/item/paper_bin/green
	icon_state = "paper_bin_green1"
	base_icon_state ="paper_bin_green"		

/obj/item/paper_bin/rainbow
	icon_state = "paper_bin_rainbow1"
	base_icon_state ="paper_bin_rainbow"		

/obj/item/paper_bin/mime
	icon_state = "paper_bin_mime1"
	base_icon_state ="paper_bin_mime"	


// #### FOLDERS ####

/obj/item/folder
	icon = 'dripstation/icons/obj/bureaucracy.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/paperwork_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'
	drop_sound = 'sound/items/handling/paper_drop.ogg'
	pickup_sound =  'sound/items/handling/paper_pickup.ogg'	

/obj/item/folder/green
	icon_state = "folder_green"	

/obj/item/folder/purple
	icon_state = "folder_purple"

/obj/item/folder/black
	icon_state = "folder_syndie"

/obj/item/folder/rainbow
	icon_state = "folder_rainbow"

/obj/item/folder/mime
	icon_state = "folder_mime"

/obj/item/folder/captain
	icon_state = "folder_cap"

/obj/item/folder/syndicate/yellow
	icon_state = "folder_syellow"

/obj/item/folder/syndicate/yellow/Initialize()
	. = ..()
	new /obj/item/documents/syndicate/yellow(src)
	update_icon()

/obj/item/documents/syndicate/yellow
	name = "yellow secret documents"
	desc = "\"Top Secret\" documents detailing sensitive Syndicate operational intelligence. These documents are verified with a yellow wax seal."
	icon = 'dripstation/icons/obj/bureaucracy.dmi'	
	icon_state = "docs_yellow"

// #### CONTRACTS ####
/obj/item/paper/contract
	icon = 'dripstation/icons/obj/bureaucracy.dmi'	

/obj/item/paper/contract/employment
	icon_state = "good_contract"
	item_state = "good_contract"
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'	

/obj/item/paper/contract/infernal
	icon_state = "evil_contract"
	item_state = "evil_contract"
	righthand_file = 'dripstation/icons/mob/inhands/paperwork_righthand.dmi'		
