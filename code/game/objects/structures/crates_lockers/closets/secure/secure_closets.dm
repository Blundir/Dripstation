/obj/structure/closet/secure_closet
	name = "secure locker"
	desc = "It's a card-locked storage unit."
	locked = TRUE
	icon_state = "secure"
	max_integrity = 250
	armor = list(MELEE = 30, BULLET = 50, LASER = 50, ENERGY = 100, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 80)
	secure = TRUE
	can_be_emaged = TRUE
	var/obj/item/electronics/airlock/electronics

/obj/structure/closet/secure_closet/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == MELEE && damage_amount < 20)
		return 0
	. = ..()

/obj/structure/closet/secure_closet/CheckParts(list/parts_list)
	. = ..()
	electronics = locate(/obj/item/electronics/airlock) in parts_list
	if(electronics)
		req_access = electronics.accesses
		qdel(electronics)

/obj/structure/closet/secure_closet/attackby(obj/item/W, mob/user, params)
	switch(broken)
		if(0)
			if(W.tool_behaviour == TOOL_SCREWDRIVER && locked && user.a_intent != INTENT_HARM)
				if(INTERACTING_WITH(user, src))
					return
				W.play_tool_sound(src)
				to_chat(user, "<span class='notice'>You start unsrewing the lock panel from the [src]...</span>")
				if(W.use_tool(src, user, 160, volume = 10))
					to_chat(user, "<span class='notice'>You have successfully unscrewed and removed the panel from [src]!</span>")
					desc += " The control panel is removed."
					broken = 3
					add_overlay("broken")
				return
		if(3)
			if(W.tool_behaviour == TOOL_WIRECUTTER && locked && user.a_intent != INTENT_HARM)
				if(INTERACTING_WITH(user, src))
					return
				W.play_tool_sound(src)
				to_chat(user, "<span class='notice'>You start to prepare the panel wires...</span>")
				if(W.use_tool(src, user, 160, volume = 10))
					if(prob(80))
						to_chat(user, "<span class='notice'>You have successfully prepared the lock panel wires.</span>")
						desc += " The wires are disconnected and sticking out."
						broken = 2
					else 
						to_chat(user, "<span class='warning'>Shit. Wrong wire...</span>")
						do_sparks(5, 1, src)
						electrocute_mob(user, get_area(src), src, 0.5, TRUE)
				return
		if(2)
			if(W.tool_behaviour == TOOL_MULTITOOL && locked && user.a_intent != INTENT_HARM)
				if(INTERACTING_WITH(user, src))
					return
				to_chat(user, "<span class='notice'>You start connecting the wires of [src] lock panel to the [W]...</span>")
				if(W.use_tool(src, user, 160, volume = 10))
					if(prob(80))
						desc += " The lock is broken"
						broken = 0
						emag_act(user)
					else
						to_chat(user, "<span class='warning'>Shit. Wrong wire...</span>")
						do_sparks(5, 1, src)
						electrocute_mob(user, get_area(src), src, 0.5, TRUE)
				return
