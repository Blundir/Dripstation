/obj/machinery/gulag_item_reclaimer
	name = "equipment reclaimer station"
	desc = "Used to reclaim your items after you finish your sentence at the labor camp."
	icon = 'icons/obj/terminals.dmi'
	icon_state = "gulag_off"
	req_access = list(ACCESS_SECURITY) //REQACCESS TO ACCESS ALL STORED ITEMS
	density = FALSE
	use_power = IDLE_POWER_USE
	light_system = STATIC_LIGHT
	light_range = 2
	light_power = 1
	light_on = TRUE
	light_color = LIGHT_COLOR_BLUE
	idle_power_usage = 100
	active_power_usage = 2500
	var/list/stored_items = list()
	var/obj/item/card/id/prisoner/inserted_id = null
	var/obj/machinery/gulag_teleporter/linked_teleporter = null
	///Icon of the current screen status
	var/screen_icon = "gulag_on"

/obj/machinery/gulag_item_reclaimer/update_icon()
	cut_overlays()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)	
	if(stat & (NOPOWER|BROKEN))
		return
	add_overlay(screen_icon)
	SSvis_overlays.add_vis_overlay(src, icon, screen_icon, layer, EMISSIVE_PLANE, dir)	

/obj/machinery/gulag_item_reclaimer/power_change()
	. = ..()
	if(!.)
		return // reduce unneeded light changes
	if(stat & NOPOWER)
		set_light(FALSE)
	else
		set_light(TRUE)

/obj/machinery/gulag_item_reclaimer/Destroy()
	for(var/i in contents)
		var/obj/item/I = i
		I.forceMove(get_turf(src))
	if(linked_teleporter)
		linked_teleporter.linked_reclaimer = null
	if(inserted_id)
		inserted_id.forceMove(get_turf(src))
		inserted_id = null
	return ..()

/obj/machinery/gulag_item_reclaimer/emag_act(mob/user)
	if(obj_flags & EMAGGED) // emagging lets anyone reclaim all the items
		return
	req_access = list()
	obj_flags |= EMAGGED
	screen_icon = "emagged_general"
	update_icon()

/obj/machinery/gulag_item_reclaimer/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/card/id/prisoner))
		if(!inserted_id)
			if(!user.transferItemToLoc(I, src))
				return
			inserted_id = I
			to_chat(user, span_notice("You insert [I]."))
			return
		else
			to_chat(user, span_notice("There's an ID inserted already."))
	return ..()

/obj/machinery/gulag_item_reclaimer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GulagItemReclaimer", name)
		ui.open()

/obj/machinery/gulag_item_reclaimer/ui_data(mob/user)
	var/list/data = list()
	var/can_reclaim = FALSE

	if(allowed(user))
		can_reclaim = TRUE

	if(inserted_id)
		data["id"] = inserted_id
		data["id_name"] = inserted_id.registered_name
		if(inserted_id.points >= inserted_id.goal)
			can_reclaim = TRUE

	var/list/mobs = list()
	for(var/i in stored_items)
		var/mob/thismob = i
		if(QDELETED(thismob))
			say("Alert! Unable to locate vital signals of a previously processed prisoner. Ejecting equipment!")
			drop_items(thismob)
			continue
		var/list/mob_info = list()
		mob_info["name"] = thismob.real_name
		mob_info["mob"] = "[REF(thismob)]"
		mobs += list(mob_info)

	data["mobs"] = mobs


	data["can_reclaim"] = can_reclaim

	return data

/obj/machinery/gulag_item_reclaimer/ui_act(action, params)
	if(..())
		return

	switch(action)
		if("release_items")
			var/mob/living/carbon/human/H = locate(params["mobref"]) in stored_items
			if(H != usr && !allowed(usr))
				to_chat(usr, span_warning("Access denied."))
				return
			drop_items(H)
			. = TRUE

/obj/machinery/gulag_item_reclaimer/proc/drop_items(mob/user)
	if(!stored_items[user])
		return
	for(var/i in stored_items[user])
		var/obj/item/W = i
		stored_items[user] -= W
		W.forceMove(get_turf(src))
	stored_items -= user
