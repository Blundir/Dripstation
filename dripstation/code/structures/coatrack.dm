/obj/structure/coatrack
	name = "coat rack"
	desc = "Rack that holds coats, or hats, if you're so inclined."
	icon = 'dripstation/icons/obj/coatrack.dmi'
	icon_state = "coatrack"
	anchored = 1
	layer = ABOVE_MOB_LAYER //Hide behind coat racks. Because funny.	
	max_integrity = 20
	var/obj/item/clothing/suit/suit = null
	var/obj/item/clothing/head/hat = null
	var/list/allowed_suits = list(
		/obj/item/clothing/suit/armor/vest/capcarapace/jacket,
		/obj/item/clothing/suit/hooded/wintercoat/captain,
		/obj/item/clothing/suit/det_suit,
		/obj/item/clothing/suit/toggle/labcoat,
		/obj/item/clothing/suit/armor/hos,
		/obj/item/clothing/suit/draculacoat,
		/obj/item/clothing/suit/dracula,
		/obj/item/clothing/suit/pirate,
		/obj/item/clothing/suit/hooded/wintercoat,
		/obj/item/clothing/suit/armor/vest/warden/winter,
		)
	var/list/allowed_hats = list(
		/obj/item/clothing/head/fedora/det_hat,
		/obj/item/clothing/head/caphat,
		/obj/item/clothing/head/HoS,
		/obj/item/clothing/head/warden,
		/obj/item/clothing/head/beret/sec,
		/obj/item/clothing/head/beret/rd,
		/obj/item/clothing/head/beret/captain,	
		)
	var/list/custom_sprites = list(
		/obj/item/clothing/head/beret/sec, 
		/obj/item/clothing/head/HoS/beret,
		/obj/item/clothing/head/beret/captain,
		/obj/item/clothing/head/beret/rd,
		)		

/obj/structure/coatrack/attack_hand(mob/user as mob)
	if(suit && hat)
		var/response = ""
		response = tgui_alert(user, "Do you want to remove the suit, or the hat?", "Coat Rack Selection",  list("Suit", "Hat", "Cancel"))
		if(response == "Suit" && in_range(src, user))
			remove_suit(user)
		if(response == "Hat" && in_range(src, user))
			remove_hat(user)
		if(response == "Cancel")
			return
		else
			return
	else	
		if(suit)
			remove_suit(user)
		if(hat)
			remove_hat(user)
	update_icon()			
	add_fingerprint(user)
	return	

/obj/structure/coatrack/proc/remove_hat(mob/user as mob)
	if(hat)
		to_chat(user, "<span class='notice'>You pick up \the [hat] from \the [src]</span>")
		playsound(src, "rustle", 50, 1, -5)
		hat.forceMove(get_turf(src))
		if(!user.put_in_active_hand(hat))
			hat.loc = get_turf(user)		
		hat = null	
		update_icon()
		return

/obj/structure/coatrack/proc/remove_suit(mob/user as mob)
	if(suit)
		to_chat(user, "<span class='notice'>You pick up \the [suit] from \the [src]</span>")
		playsound(src, "rustle", 50, 1, -5)
		suit.forceMove(get_turf(src))	
		if(!user.put_in_active_hand(suit))
			suit.loc = get_turf(user)
		suit = null								
		update_icon()
		return

/obj/structure/coatrack/attackby(obj/item/C, mob/user)
	if(istype(C, /obj/item/clothing/suit) && !suit && is_type_in_list(C, allowed_suits))
		to_chat(user, "<span class='notice'>You place your [C] on \the [src]</span>")
		playsound(src, "rustle", 50, 1, -5)	
		suit = C
		user.temporarilyRemoveItemFromInventory(suit, src)
		suit.loc = src		
		update_icon()
	else if (istype(C, /obj/item/clothing/head) && !hat && is_type_in_list(C, allowed_hats))
		to_chat(user, "<span class='notice'>You place your [C] on \the [src]</span>")
		playsound(src, "rustle", 50, 1, -5)	
		hat = C	
		user.temporarilyRemoveItemFromInventory(hat, src)	
		hat.loc = src
		update_icon()
	else if(istype(C, /obj/item/wrench))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		new /obj/item/stack/sheet/mineral/wood(get_turf(src), 2)
		qdel(src)//the hat and suit on the coat rack are automatically dropped by Destroy()
	else
		return ..()

/obj/structure/coatrack/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return
		if(3.0)
			if (prob(5))
				qdel(src)
				return

/obj/structure/coatrack/Destroy()
	if(loc)
		if(suit)
			suit.forceMove(loc)
		if(hat)
			hat.forceMove(loc)
	new /obj/item/stack/sheet/mineral/wood(loc,1)			
	..()

/obj/structure/coatrack/update_icon()
	overlays.len = 0
	if(suit)
		overlays += image(icon,"coat-[suit.icon_state]")
	if(hat)
		if(is_type_in_list(hat, custom_sprites))
			overlays += image(icon,"hat-[hat.icon_state]")		
		else
			var/image/I = image(hat.mob_overlay_icon, hat.icon_state, dir = SOUTH)
			var/matrix/M = matrix()
			M.Turn(90)
			M.Translate(-6,6)
			I.transform = M
			overlays += I

/obj/structure/coatrack/hos/New()
	..()
	suit = new/obj/item/clothing/suit/armor/hos/trenchcoat/winter(src)
	update_icon()

/obj/structure/coatrack/warden/New()
	..()
	suit = new/obj/item/clothing/suit/armor/vest/warden/winter(src)
	update_icon()
