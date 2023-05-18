/datum/orbit_menu
	var/mob/dead/observer/owner
	var/auto_observe = FALSE

/datum/orbit_menu/New(mob/dead/observer/new_owner)
	if(!istype(new_owner))
		qdel(src)
	owner = new_owner

/datum/orbit_menu/ui_state(mob/user)
	return GLOB.observer_state

/datum/orbit_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Orbit")
		ui.open()

/datum/orbit_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	switch(action)
		if("orbit")
			var/ref = params["ref"]
			var/atom/movable/poi = (locate(ref) in GLOB.mob_list) || (locate(ref) in GLOB.poi_list)
			if(poi == null)
				. = TRUE
				return
			owner.ManualFollow(poi)
			owner.reset_perspective(null)
			if (auto_observe)
				owner.do_observe(poi)
			. = TRUE
		if("refresh")
			update_static_data(owner, ui)
			. = TRUE
		if("toggle_observe")
			auto_observe = !auto_observe
			if(auto_observe && owner.orbit_target)
				owner.do_observe(owner.orbit_target)
			else
				owner.reset_perspective(null)

/datum/orbit_menu/ui_data(mob/user)
	var/list/data = list()
	data["auto_observe"] = auto_observe
	return data

/datum/orbit_menu/ui_static_data(mob/user)
	var/list/data = list()
	var/list/alive = list()
	var/list/antagonists = list()
	var/list/dead = list()
	var/list/ghosts = list()
	var/list/misc = list()
	var/list/npcs = list()

	var/list/pois = getpois(skip_mindless = TRUE, specify_dead_role = FALSE)
	for(var/name in pois)
		var/list/serialized = list()
		serialized["name"] = name

		var/poi = pois[name]

		serialized["ref"] = REF(poi)

		var/mob/mob_poi = poi

		if(!istype(mob_poi))
			misc += list(serialized)
			continue
		if(isobserver(mob_poi))
			ghosts += list(serialized)
			continue
		if(mob_poi.stat == DEAD)
			dead += list(serialized)
			continue
		if(mob_poi.mind == null)
			npcs += list(serialized)
			continue

		var/number_of_orbiters = length(mob_poi.get_all_orbiters())
		if(number_of_orbiters)
			serialized["orbiters"] = number_of_orbiters

		var/datum/mind/mind = mob_poi.mind
		var/obj/item/card/id/identification_card = mob_poi.get_idcard()
		if(identification_card)
			serialized["role_icon"] = "hud[ckey(identification_card.GetJobName())]"
		else if(SSjob.name_occupations[mind.assigned_role])
			var/datum/job/located_job = SSjob.GetJob(mind.assigned_role)
			if(located_job)
				serialized["role_icon"] = "hud[ckey(located_job.title)]"

		var/was_antagonist = FALSE
		for(var/_A in mind.antag_datums)
			var/datum/antagonist/A = _A
			if(A.show_to_ghosts)
				was_antagonist = TRUE
				var/datum/team/antag_team = A.get_team()
				if(antag_team)
					serialized["antag"] = antag_team.get_team_name()
				else
					serialized["antag"] = A.get_antag_name()
				antagonists += list(serialized)
				break

		if(!was_antagonist)
			alive += list(serialized)
		else
			misc += list(serialized)

	data["alive"] = alive
	data["antagonists"] = antagonists
	data["dead"] = dead
	data["ghosts"] = ghosts
	data["misc"] = misc
	data["npcs"] = npcs
	return data
	
/datum/orbit_menu/ui_assets()
	. = ..() || list()
	. += get_asset_datum(/datum/asset/simple/orbit)
	. += get_asset_datum(/datum/asset/spritesheet/job_icons)

/datum/asset/spritesheet/job_icons
	name = "job-icon"


/datum/asset/spritesheet/job_icons/create_spritesheets()
	var/icon/I = icon('yogstation/icons/mob/hud.dmi')
	// Get the job hud part
	I.Crop(1, 25, 8, 32)
	// Scale it up
	I.Scale(16, 16)
	InsertAll("job-icon", I)
