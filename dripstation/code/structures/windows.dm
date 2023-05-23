/obj/structure/window/reinforced/fulltile
	canSmoothWith = list(/obj/structure/window/fulltile, /obj/structure/window/reinforced/fulltile, /obj/structure/window/reinforced/tinted/fulltile, /obj/structure/window/plasma/fulltile, /obj/structure/window/plasma/reinforced/fulltile, /obj/structure/window/reinforced/fulltile/security, /obj/structure/window/reinforced/fulltile/polarized)

/obj/structure/window/reinforced/fulltile/security
	color = "#ff0000"

/obj/effect/spawner/structure/window/reinforced/security
	name = "reinforced security window spawner"
	icon_state = "rwindow_spawner"
	color = "#ff0000"
	spawn_list = list(/obj/structure/grille, /obj/structure/window/reinforced/fulltile/security)

/obj/effect/spawner/structure/window/reinforced/security
	name = "reinforced security window spawner"
	icon_state = "rwindow_spawner"
	color = "#ff0000"
	spawn_list = list(/obj/structure/grille, /obj/structure/window/reinforced/fulltile/security)

/obj/effect/spawner/structure/window/reinforced/shutter/security
	name = "reinforced shutter security window spawner"
	icon_state = "shrwindow_spawner"
	color = "#ff0000"	
	spawn_list = list(/obj/machinery/door/firedoor/window, /obj/structure/grille, /obj/structure/window/reinforced/fulltile/security)

/obj/structure/window/reinforced/fulltile/polarized
	name = "electrochromic window"
	desc = "Adjusts its tint with voltage. Might take a few good hits to shatter it."
	var/tint_id
	var/original_color
	var/isused

/obj/structure/window/reinforced/fulltile/polarized/proc/toggle()
	if(!isused)
		isused++
		original_color = color
	if(opacity)
		animate(src, color="[original_color]", time=5)
		set_opacity(0)
	else
		animate(src, color="#222222", time=5)
		set_opacity(1)

/obj/machinery/button/windowtint
	name = "window tint control"
	icon_state = "light0"
	desc = "A remote control switch for polarized windows."
	icon = 'icons/obj/power.dmi'
	var/range = 7
	var/active = 0
	var/tint_id

/obj/machinery/button/windowtint/attack_hand(mob/user)
	if(..())
		return 1

	toggle_tint()

/obj/machinery/button/windowtint/proc/toggle_tint()
	use_power(5)

	active = !active
	update_icon()

	for(var/obj/structure/window/reinforced/fulltile/polarized/W in range(src,range))
		if(W.tint_id == src.tint_id || !W.tint_id)
			spawn(0)
				W.toggle()
				return
	for(var/obj/machinery/door/airlock/G in range(src,range))
		if(G.id_tag == src.tint_id)
			spawn(0)
				if(G.glass)
					G.airlock_material = null
					G.glass = FALSE
					G.update_icon()
					if(G.density)
						G.opacity = 1
				else
					G.airlock_material = "glass"
					G.glass = TRUE
					G.update_icon()
					G.opacity = 0
				return

/obj/machinery/button/windowtint/power_change()
	..()
	if(active && !powered(power_channel))
		toggle_tint()

/obj/machinery/button/windowtint/update_icon()
	icon_state = "light[active]"
