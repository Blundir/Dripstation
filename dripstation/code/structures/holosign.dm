////////////////////HOLOSIGN///////////////////////////////////////
/obj/machinery/holosign
	name = "holosign"
	desc = "Small wall-mounted holographic projector"
	icon = 'dripstation/icons/obj/holosign.dmi'
	icon_state = "sign_off"
	layer = 4
	var/lit = FALSE
	var/id = null
	var/on_icon = "sign_on"

/obj/machinery/holosign/proc/toggle()
	if(!is_operational())
		lit = FALSE
	else
		lit = !lit
	update_hologram()	

/obj/machinery/holosign/proc/update_hologram()
	cut_overlays()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)
	if(!lit)
		set_light(0)
		update_icon()
	else
		add_overlay(on_icon)
		SSvis_overlays.add_vis_overlay(src, icon, on_icon, layer, EMISSIVE_PLANE)
		set_light(1, 0.5, l_color = light_color)

/obj/machinery/holosign/power_change()
	if(!is_operational())
		lit = FALSE
	update_icon()

/obj/machinery/holosign/surgery
	name = "surgery holosign"
	desc = "Small wall-mounted holographic projector. This one reads SURGERY."
	on_icon = "surgery"
	light_color = COLOR_BLUE_LIGHT	

/obj/machinery/holosign/virology
	name = "virology holosign"
	desc = "Small wall-mounted holographic projector. This one reads BIOHAZARD."
	on_icon = "virology"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/holosign/morgue
	name = "morgue holosign"
	desc = "Small wall-mounted holographic projector. This one reads MORGUE."
	on_icon = "morgue"
	light_color = COLOR_BLUE_LIGHT
