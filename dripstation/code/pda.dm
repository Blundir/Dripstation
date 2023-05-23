/obj/item/modular_computer/proc/update_label()
	var/obj/item/card/id/stored_id = GetID()
	if(id_rename && stored_id)
		name = "[stored_id.registered_name]'s [initial(name)] ([stored_id.assignment])"
		var/obj/item/computer_hardware/hard_drive/hard_drive = all_components[MC_HDD]
		var/datum/computer_file/program/pdamessager/msgr = hard_drive.find_file_by_name("pda_client")
		if(istype(msgr))
			msgr.username = "[stored_id.registered_name] ([stored_id.assignment])"

/datum/outfit/job/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/datum/job/J = SSjob.GetJobType(jobtype)
	if(!J)
		J = SSjob.GetJob(H.job)

	var/obj/item/card/id/C = new id_type()
	if(istype(C))
		C.access = J.get_access()
		shuffle_inplace(C.access) // Shuffle access list to make NTNet passkeys less predictable
		C.registered_name = H.real_name
		if(H.mind?.role_alt_title)
			C.assignment = H.mind.role_alt_title
		else
			C.assignment = J.title
		C.originalassignment = J.title
		if(H.age)
			C.registered_age = H.age
		C.update_label()
		var/acc_id = "[H.account_id]"
		if(acc_id in SSeconomy.bank_accounts)
			var/datum/bank_account/B = SSeconomy.bank_accounts[acc_id]
			C.registered_account = B
			B.bank_cards += C
		H.sec_hud_set_ID()

	var/obj/item/modular_computer/PDA = new pda_type()
	if(istype(PDA))
		H.equip_to_slot_if_possible(C, SLOT_WEAR_ID)
		H.equip_to_slot_if_possible(PDA, SLOT_WEAR_PDA)

		PDA.name = "[C.registered_name]'s [initial(PDA.name)] ([C.assignment])"
		PDA.update_label()
		PDA.update_icon()
		PDA.update_filters()		
	else
		H.equip_to_slot_if_possible(C, SLOT_WEAR_ID)

	if(H.stat != DEAD)//if a job has a gps and it isn't a decorative corpse, rename the GPS to the owner's name
		for(var/obj/item/gps/G in H.GetAllContents())
			G.gpstag = H.real_name
			G.name = "global positioning system ([G.gpstag])"
			continue

/datum/outfit/servant_of_ratvar/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	var/obj/item/card/id/C = new id_type()
	if(istype(C))
		C.access += ACCESS_MAINT_TUNNELS
		shuffle_inplace(C.access) // Shuffle access list to make NTNet passkeys less predictable
		C.registered_name = H.real_name
		C.assignment = "Assistant"
		C.originalassignment = "Assistant"
		if(H.age)
			C.registered_age = H.age
		C.update_label()
		H.sec_hud_set_ID()

	var/obj/item/modular_computer/PDA = new pda_type()
	if(istype(PDA))
		H.equip_to_slot_if_possible(C, SLOT_WEAR_ID)
		H.equip_to_slot_if_possible(PDA, SLOT_WEAR_PDA)

		PDA.name = "[C.registered_name]'s [initial(PDA.name)] ([C.assignment])"

		PDA.update_label()
		PDA.update_icon()
		PDA.update_filters()

	if(plasmaman && !visualsOnly) //If we need to breathe from the plasma tank, we should probably start doing that
		H.open_internals(H.get_item_for_held_index(2))

/obj/item/modular_computer/tablet/phone
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_PDA

/obj/item/modular_computer/tablet/syndicate_contract_uplink
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_PDA

/obj/item/modular_computer/tablet/pda
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_PDA
