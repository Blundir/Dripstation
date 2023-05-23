// #### PAPER SHREDDER ####
/obj/machinery/papershredder
	icon = 'dripstation/icons/obj/bureaucracy.dmi'

/obj/machinery/papershredder/update_icon() // turn icon_state change into an overlay
	cut_overlays()
	switch(paperamount)
		if(1 to 3)
			add_overlay("papershredder1")
		if(4 to 5)
			add_overlay("papershredder2")
		if(6 to 7)
			add_overlay("papershredder3")
		if(8 to 9)
			add_overlay("papershredder4")
		if(10)
			add_overlay("papershredder5")

/obj/machinery/papershredder/attackby(obj/item/W, mob/user) //overwrite in order to implement item insertion icons
	if(default_unfasten_wrench(user, W))
		return
	var/shred_amount = 0
	if (istype(W, /obj/item/paper))
		shred_amount = 1
		if(W.icon_state == "scrap")
			flick("papershredder_s_on", src)
		else if(W.icon_state == "paper_words")
			flick("papershredder_w_on", src)
		else
			flick("papershredder_on", src)	
	else if(istype(W, /obj/item/photo))
		shred_amount = 1
		flick("papershredder_on", src)
	else if(istype(W, /obj/item/newspaper))
		shred_amount = 3
		flick("papershredder_on", src)
	else if(istype(W, /obj/item/card/id))
		shred_amount = 3
		flick("papershredder_on", src)
	else if(istype(W, /obj/item/station_charter))
		shred_amount = 3
		flick("papershredder_on", src)
	else if(istype(W, /obj/item/paperplane))
		shred_amount = 1	
		flick("papershredder_p_on", src)
	else if(istype(W, /obj/item/card/emag))	
		qdel(W)
		explosion(src, -1, 0, 1,)
		visible_message(("<span class='danger'>The [src] short-circuits and explodes! </span>"))
	else if(istype(W, /obj/item/paper_bundle))
		shred_amount = 3
		flick("papershredder_on", src)		
	else if(istype(W, /obj/item/book))
		shred_amount = 5
		flick("papershredder_on", src)		
	else if(istype(W, /obj/item/storage/bag/trash))
		var/datum/component/storage/STR = W.GetComponent(/datum/component/storage)
		var/curpaper = paperamount
		var/i
		for(i=1; i<=curpaper; i++)
			if(W.contents.len < 21)
				var/obj/item/shreddedpaper/SP = new /obj/item/shreddedpaper
				var/ran = rand(1,3)
				if(ran == 1)
					SP.color = "#BABABA"
				if(ran == 2)
					SP.color = "#7F7F7F"
				if(ran == 3)
					SP.color = null
				STR.handle_item_insertion(SP)
				paperamount -=1
				update_icon()
			else
				to_chat(user, span_warning("The [W] is full."))
				return
	else if(istype(W, /obj/item/shreddedpaper))
		if(paperamount == max_paper)
			to_chat(user, span_warning("The [src] is full please empty it before you continue."))
			return
		if(paperamount < max_paper)
			qdel(W)
			paperamount += 1
			update_icon()
			return
	
	if(shred_amount && try_insert(user, shred_amount))
		qdel(W)