/obj/machinery/suit_storage_unit
// SUIT STORAGE UNIT /////////////////
/obj/machinery/suit_storage_unit
	name = "suit storage unit"
	desc = "An industrial unit made to hold and decontaminate irradiated equipment. It comes with a built-in UV cauterization mechanism. A small warning label advises that organic matter should not be placed into the unit."
	icon = 'dripstation/icons/obj/suit_storage.dmi'
	icon_state = "close"
	density = TRUE
	max_integrity = 250
	circuit = /obj/item/circuitboard/machine/suit_storage_unit

	var/obj/item/clothing/suit/space/suit = null
	var/obj/item/clothing/head/helmet/space/helmet = null
	var/obj/item/clothing/mask/mask = null
	var/obj/item/tank = null
	var/obj/item/clothing/shoes/magboots = null	
								// if you add more storage slots, update cook() to clear their radiation too.

	var/department = null
	var/image/openimage
	var/image/closeimage
	var/suit_type = null
	var/helmet_type = null
	var/mask_type = null
	var/tank_type = null
	var/magboots_type = null

	state_open = FALSE
	var/locked = FALSE
	panel_open = FALSE
	var/safeties = TRUE

	var/uv = FALSE
	var/uv_super = FALSE
	var/uv_cycles = 3
	var/message_cooldown
	var/breakout_time = 300

	var/datum/looping_sound/oven/decon   //im borrowing oven sound because it suits this

/obj/machinery/suit_storage_unit/standard_unit
	suit_type = /obj/item/clothing/suit/space
	helmet_type = /obj/item/clothing/head/helmet/space
	mask_type = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/captain
	suit_type = /obj/item/clothing/suit/space/hardsuit/swat/captain
	mask_type = /obj/item/clothing/mask/gas/captain
	tank_type = /obj/item/tank/jetpack/oxygen/captain
	magboots_type = /obj/item/clothing/shoes/magboots/security/captain
	department = "cap"

/obj/machinery/suit_storage_unit/engine
	suit_type = /obj/item/clothing/suit/space/hardsuit/engine
	mask_type = /obj/item/clothing/mask/breath
	magboots_type = /obj/item/clothing/shoes/magboots //yogs
	department = "engie"

/obj/machinery/suit_storage_unit/ce
	suit_type = /obj/item/clothing/suit/space/hardsuit/engine/elite
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/oxygen/yellow
	magboots_type = /obj/item/clothing/shoes/magboots/advance
	department = "ce"	

/obj/machinery/suit_storage_unit/security
	suit_type = /obj/item/clothing/suit/space/hardsuit/security
	mask_type = /obj/item/clothing/mask/gas/sechailer
	tank_type = /obj/item/tank/jetpack/oxygen/security
	magboots_type = /obj/item/clothing/shoes/magboots/security
	department = "sec"	

/obj/machinery/suit_storage_unit/hos
	suit_type = /obj/item/clothing/suit/space/hardsuit/security/hos
	mask_type = /obj/item/clothing/mask/gas/sechailer
	tank_type = /obj/item/tank/internals/oxygen/red	
	magboots_type = /obj/item/clothing/shoes/magboots/security
	department = "sec"	

/obj/machinery/suit_storage_unit/atmos
	suit_type = /obj/item/clothing/suit/space/hardsuit/engine/atmos
	mask_type = /obj/item/clothing/mask/gas
	department = "atmos"	

/obj/machinery/suit_storage_unit/mining
	suit_type = /obj/item/clothing/suit/hooded/explorer
	mask_type = /obj/item/clothing/mask/gas/explorer
	department = "mine"	

/obj/machinery/suit_storage_unit/mining/eva
	suit_type = /obj/item/clothing/suit/space/hardsuit/mining
	mask_type = /obj/item/clothing/mask/breath

/obj/machinery/suit_storage_unit/cmo
	suit_type = /obj/item/clothing/suit/space/hardsuit/medical
	mask_type = /obj/item/clothing/mask/breath
	department = "med"		

/obj/machinery/suit_storage_unit/rd
	suit_type = /obj/item/clothing/suit/space/hardsuit/rd
	mask_type = /obj/item/clothing/mask/breath
	department = "sci"	

/obj/machinery/suit_storage_unit/command
	suit_type = /obj/item/clothing/suit/space/heads
	helmet_type = /obj/item/clothing/head/helmet/space/heads
	mask_type = /obj/item/clothing/mask/breath
	department = "cap"	

/obj/machinery/suit_storage_unit/syndicate
	suit_type = /obj/item/clothing/suit/space/hardsuit/syndi
	mask_type = /obj/item/clothing/mask/gas/syndicate
	tank_type = /obj/item/tank/jetpack/oxygen/harness
	department = "synd"	

/obj/machinery/suit_storage_unit/ert/command
	suit_type = /obj/item/clothing/suit/space/hardsuit/ert
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/emergency_oxygen/double
	department = "cap"	

/obj/machinery/suit_storage_unit/ert/security
	suit_type = /obj/item/clothing/suit/space/hardsuit/ert/sec
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/emergency_oxygen/double
	department = "sec"	

/obj/machinery/suit_storage_unit/ert/engineer
	suit_type = /obj/item/clothing/suit/space/hardsuit/ert/engi
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/emergency_oxygen/double
	department = "engie"	

/obj/machinery/suit_storage_unit/ert/medical
	suit_type = /obj/item/clothing/suit/space/hardsuit/ert/med
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/emergency_oxygen/double
	department = "med"	

/obj/machinery/suit_storage_unit/pirate
	suit_type = /obj/item/clothing/suit/space
	helmet_type = /obj/item/clothing/head/helmet/space
	mask_type = /obj/item/clothing/mask/breath
	tank_type = /obj/item/tank/internals/oxygen

/obj/machinery/suit_storage_unit/infiltrator
	suit_type = /obj/item/clothing/suit/space/hardsuit/infiltration
	mask_type = /obj/item/clothing/mask/gas/syndicate
	tank_type = /obj/item/tank/jetpack/oxygen/harness
	department = "synd"	

/obj/machinery/suit_storage_unit/radsuit
	name = "radiation suit storage unit"
	suit_type = /obj/item/clothing/suit/radiation
	helmet_type = /obj/item/clothing/head/radiation

/obj/machinery/suit_storage_unit/Initialize(mapload)
	. = ..()
	openimage = image(icon,src, "[department]_open")
	closeimage = image(icon,src, "[department]_close")	
	decon = new(list(src), FALSE)
	wires = new /datum/wires/suit_storage_unit(src)
	if(suit_type)
		suit = new suit_type(src)
	if(helmet_type)
		helmet = new helmet_type(src)
	if(mask_type)
		mask = new mask_type(src)
	if(tank_type)
		tank = new tank_type(src)
	if(magboots_type)
		magboots = new magboots_type(src)		
	update_icon()

/obj/machinery/suit_storage_unit/Destroy()
	QDEL_NULL(suit)
	QDEL_NULL(helmet)
	QDEL_NULL(mask)
	QDEL_NULL(tank)
	QDEL_NULL(magboots)
	return ..()

/obj/machinery/suit_storage_unit/update_icon()
	cut_overlays()
	overlays.len = 0

	if(uv)
		if(uv_super)
			add_overlay("super")
		else if(occupant)
			add_overlay("uvhuman")
			overlays += closeimage	
		else
			add_overlay("uv")
			overlays += closeimage			
	else if(state_open)
		if(stat & BROKEN)
			add_overlay("broken")
			overlays += openimage			
		else
			add_overlay("open")
			overlays += openimage			
			if(suit)
				add_overlay("suit")
			if(helmet)
				add_overlay("helm")
			if(tank)
				add_overlay("storage")				
	else if(occupant)
		add_overlay("human")
		overlays += closeimage
	else if(!state_open)
		overlays += closeimage
	
/obj/machinery/suit_storage_unit/proc/dump_contents()
	dropContents()
	helmet = null
	suit = null
	mask = null
	tank = null
	magboots = null	
	occupant = null

/obj/machinery/suit_storage_unit/MouseDrop_T(atom/A, mob/living/user)
	if(!istype(user) || user.stat || !Adjacent(user) || !Adjacent(A) || !isliving(A))
		return
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_STAND))
			return
	var/mob/living/target = A
	if(!state_open)
		to_chat(user, span_warning("The unit's doors are shut!"))
		return
	if(!is_operational())
		to_chat(user, span_warning("The unit is not operational!"))
		return
	if(occupant || helmet || suit || tank || magboots)
		to_chat(user, span_warning("It's too cluttered inside to fit in!"))
		return

	if(target == user)
		user.visible_message(span_warning("[user] starts squeezing into [src]!"), span_notice("You start working your way into [src]..."))
	else
		target.visible_message(span_warning("[user] starts shoving [target] into [src]!"), span_userdanger("[user] starts shoving you into [src]!"))

	if(do_mob(user, target, 30))
		if(occupant || helmet || suit || tank || magboots)
			return
		if(target == user)
			user.visible_message(span_warning("[user] slips into [src] and closes the door behind [user.p_them()]!"), "<span class=notice'>You slip into [src]'s cramped space and shut its door.</span>")
		else
			target.visible_message("<span class='warning'>[user] pushes [target] into [src] and shuts its door!<span>", span_userdanger("[user] shoves you into [src] and shuts the door!"))
		close_machine(target)
		add_fingerprint(user)

/obj/machinery/suit_storage_unit/proc/cook()
	var/mob/living/mob_occupant = occupant
	if(uv_cycles)
		uv_cycles--
		uv = TRUE
		locked = TRUE
		update_icon()
		if(occupant)
			if(uv_super)
				mob_occupant.adjustFireLoss(rand(20, 36))
			else
				mob_occupant.adjustFireLoss(rand(2, 8))
			mob_occupant.emote("scream")
		decon.start()
		addtimer(CALLBACK(src, PROC_REF(cook)), 50)
	else
		uv_cycles = initial(uv_cycles)
		uv = FALSE
		locked = FALSE
		if(uv_super)
			visible_message(span_warning("[src]'s door creaks open with a loud whining noise."))
			playsound(src, 'sound/machines/airlock_alien_prying.ogg', 50, 1)
			helmet = null
			qdel(helmet)
			suit = null
			qdel(suit) // Delete everything but the occupant.
			mask = null
			qdel(mask)
			tank = null
			qdel(tank)
			magboots = null
			qdel(magboots)			
			// The wires get damaged too.
			wires.cut_all()
		else
			if(!occupant)
				visible_message(span_notice("[src]'s door slides open. The glowing yellow lights dim to a gentle green."))
			else
				visible_message(span_warning("[src]'s door slides open, barraging you with the nauseating smell of charred flesh."))
			playsound(src, 'sound/machines/airlockclose.ogg', 25, 1)
			var/list/things_to_clear = list() //Done this way since using GetAllContents on the SSU itself would include circuitry and such.
			if(suit)
				things_to_clear += suit
				things_to_clear += suit.GetAllContents()
			if(helmet)
				things_to_clear += helmet
				things_to_clear += helmet.GetAllContents()
			if(mask)
				things_to_clear += mask
				things_to_clear += mask.GetAllContents()
			if(tank)
				things_to_clear += tank
				things_to_clear += tank.GetAllContents()
			if(magboots)
				things_to_clear += magboots
				things_to_clear += magboots.GetAllContents()				
			if(occupant)
				things_to_clear += occupant
				things_to_clear += occupant.GetAllContents()
			for(var/am in things_to_clear) //Scorches away blood and forensic evidence, although the SSU itself is unaffected
				var/atom/movable/dirty_movable = am
				dirty_movable.wash(CLEAN_ALL)
		open_machine(FALSE)
		decon.stop()
		if(occupant)
			dump_contents()

/obj/machinery/suit_storage_unit/attackby(obj/item/I, mob/user, params)
	if(state_open && is_operational())
		if(istype(I, /obj/item/clothing/suit))
			if(suit)
				to_chat(user, span_warning("The unit already contains a suit!."))
				return
			if(!user.transferItemToLoc(I, src))
				return
			suit = I
		else if(istype(I, /obj/item/clothing/head))
			if(helmet)
				to_chat(user, span_warning("The unit already contains a helmet!"))
				return
			if(!user.transferItemToLoc(I, src))
				return
			helmet = I
		else if(istype(I, /obj/item/clothing/mask))
			if(mask)
				to_chat(user, span_warning("The unit already contains a mask!"))
				return
			if(!user.transferItemToLoc(I, src))
				return
			mask = I
		else if(istype(I, /obj/item/tank))
			if(tank)
				to_chat(user, span_warning("The tank compartment is full!"))
				return
			if(!user.transferItemToLoc(I, src))
				return
			tank = I
		else if(istype(I, /obj/item/clothing/shoes/magboots))
			if(magboots)
				to_chat(user, span_warning("The magboots compartment is full!"))
				return
			if(!user.transferItemToLoc(I, src))
				return
			magboots = I		

		visible_message(span_notice("[user] inserts [I] into [src]."), span_notice("You load [I] into [src]."))
		update_icon()
		return

	if(panel_open && is_wire_tool(I))
		wires.interact(user)
		return
	if(!state_open && !uv)
		if(default_deconstruction_screwdriver(user, "panel", "close", I))
			return
		if(default_deconstruction_crowbar(I))
			return
	if(default_pry_open(I))
		dump_contents()
		return

	return ..()

/obj/machinery/suit_storage_unit/ui_data()
	var/list/data = list()
	data["locked"] = locked
	data["open"] = state_open
	data["safeties"] = safeties
	data["uv_active"] = uv
	data["uv_super"] = uv_super
	if(helmet)
		data["helmet"] = helmet.name
	else
		data["helmet"] = null
	if(suit)
		data["suit"] = suit.name
	else
		data["suit"] = null
	if(mask)
		data["mask"] = mask.name
	else
		data["mask"] = null
	if(tank)
		data["tank"] = tank.name
	else
		data["tank"] = null
	if(magboots)
		data["magboots"] = magboots.name
	else
		data["magboots"] = null		
	if(occupant)
		data["occupied"] = TRUE
	else
		data["occupied"] = FALSE
	return data

/obj/machinery/suit_storage_unit/ui_act(action, params)
	if(..() || uv)
		return
	switch(action)
		if("door")
			if(state_open)
				close_machine()
				playsound(src, 'sound/machines/decon/decon-close.ogg', 25, TRUE)
			else
				open_machine(0)
				playsound(src, 'sound/machines/decon/decon-open.ogg', 25, TRUE)
				if(occupant)
					dump_contents() // Dump out contents if someone is in there.
			. = TRUE
		if("lock")
			if(state_open)
				return
			locked = !locked
			. = TRUE
		if("uv")
			var/mob/living/mob_occupant = occupant
			if(!helmet && !mask && !suit && !tank && !magboots && !occupant)
				return
			else 
				if(uv_super)
					say("Warning, high uv may destroy equipments!")
					uv_cycles = 7
				else
					say("Please wait while the [src] is cleaning equipments.")
					uv_cycles = initial(uv_cycles)
				if(occupant && uv_super)
					to_chat(mob_occupant, span_userdanger("[src]'s confines grow warm, then hot, then scorching. You're being cooked [!mob_occupant.stat ? "alive" : "away"]!"))
				else
					to_chat(mob_occupant, span_warning("[src]'s confines grow warm. You're being decontaminated."))
				cook()
				. = TRUE
		if("dispense")
			if(!state_open)
				return

			var/static/list/valid_items = list("helmet", "suit", "mask", "tank", "magboots")
			var/item_name = params["item"]
			if(item_name in valid_items)
				var/obj/item/I = vars[item_name]
				vars[item_name] = null
				if(I)
					I.forceMove(loc)
			. = TRUE
	update_icon()
